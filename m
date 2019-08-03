From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 18:16:44 +0200
Subject: [Buildroot] [PATCH v2] boot/syslinux: Add host installer
In-Reply-To: <20181114222431.10194-1-alexander.sverdlin@gmail.com>
References: <20181114222431.10194-1-alexander.sverdlin@gmail.com>
Message-ID: <1eab0c4e-aaaa-6455-4ea8-100ae8595fb3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alexander,

 Sorry that we haven't reacted on this patch any earlier. We have a long patch
backlog, and somewhat more difficult patches like this one tend to get left
behind...

On 14/11/2018 23:24, Alexander Sverdlin wrote:
> Add host installer for syslinux bootloader which allows to pre-install
> syslinux in the generated firmware images. BR2_ROOTFS_POST_IMAGE_SCRIPT
> can do something like this:
> 
> 	${HOST_DIR}/usr/bin/syslinux -d /syslinux/ -i ${IMGFILE}
> 
> if the rest of syslinux is installed under /syslinux inside the firmware
> image.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> 
> Changelog:
> v2:
> - host package variant inside boot/syslinux instead of separate
>   package/syslinux-installer
> - reworked commit title
> 
>  boot/syslinux/Config.in   |  5 +++++
>  boot/syslinux/syslinux.mk | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
> index e969d53fd0..caec66d767 100644
> --- a/boot/syslinux/Config.in
> +++ b/boot/syslinux/Config.in
> @@ -56,6 +56,11 @@ config BR2_TARGET_SYSLINUX_C32
>  	  Enter a space-separated list of .c32 modules to install.
>  	  Leave empty to install no module.
>  
> +config BR2_TARGET_HOST_SYSLINUX
> +	bool "host syslinux installer"
> +	help
> +	  Host installer for syslinux bootloader

 We normally put host configuration options in Config.in.host. However, for
this, I think it's better to always build it when syslinux is built. See below
however.

> +
>  endif # BR2_TARGET_SYSLINUX_LEGACY_BIOS
>  
>  endif # BR2_TARGET_SYSLINUX
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index 67bc69254e..72d7f62672 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -102,4 +102,17 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
>  	done
>  endef
>  
> +# See SYSLINUX_POST_INSTALL_CLEANUP
> +HOST_SYSLINUX_DEPENDENCIES = syslinux
> +
> +define HOST_SYSLINUX_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) \
> +		-C $(@D) installer
> +endef
> +
> +define HOST_SYSLINUX_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bios/mtools/syslinux $(HOST_DIR)/usr/bin/syslinux
> +endef

 The logic here is difficult to understand and not logical: during the target
build, we build and install most of the host tools, except for syslinux itself,
which is built and installed during the host build. But syslinux is *also* built
and installed during the target build (and then removed again because it is
built for the target), so we need that additional dependency.

 It would be much more appropriate to do the right thing, and build *only*
target things during the target build, and *only* host things during the host
build. In fact, this mixing of host and target build is only possible because
we're adding patches to support it:
0004-utils-Use-the-host-toolchain-to-build.patch
0011-extlinux-Use-the-host-toolchain-to-build.patch

Note that we still need some of those patches because there are tools that are
used to generate code during the build.

 Then, the syslinux package can install just to STAGING_DIR (because it now
contains only executables for the target), and we can have a completely separate
host-syslinux. And then the dependency can be turned around, i.e.
SYSLINUX_DEPENDENCIES += host-syslinux.

 This has the additional advantage that it is possible to install the installers
(syslinux, extlinux, ...) in TARGET_DIR (by copying from STAGING_DIR). Not
something to be done right away, but an interesting option.

 Therefore, I've marked your patch as Changes Requested in patchwork.

 Sorry it took so long!

 Regards,
 Arnout


> +
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> 
