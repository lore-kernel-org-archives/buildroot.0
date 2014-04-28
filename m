From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 08:03:17 +0200
Subject: [Buildroot] [PATCH 6/9] package/upx: new package
In-Reply-To: <d2b063c77023df58acb96852a8dfe0b812750355.1398378217.git.yann.morin.1998@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <d2b063c77023df58acb96852a8dfe0b812750355.1398378217.git.yann.morin.1998@free.fr>
Message-ID: <535DEF25.4050701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/04/14 00:30, Yann E. MORIN wrote:
> From: Frank Hunleth <fhunleth@troodon-software.com>
> 
> UPX is a free, portable, extendable, high-performance executable packer
> for several executable formats.

 Just for my understanding: this builds a self-extractor, right? So my
guess is that it won't be able to build a cross-self-extractor... Since
we don't have a Config.in, there's no way to encode that information, but
perhaps it's worth to add a comment that this tool will only work if
target-arch == host-arch.

> 
> This is needed for syslinux 6.x.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> [yann.morin.1998 at free.fr: builds fine in parallel; fix build to
>  locate libucl; fix installation; don't add a menuconfig entry]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/upx/upx.mk | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/upx/upx.mk
> 
> diff --git a/package/upx/upx.mk b/package/upx/upx.mk
> new file mode 100644
> index 0000000..a039376
> --- /dev/null
> +++ b/package/upx/upx.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# upx
> +#
> +################################################################################
> +
> +UPX_VERSION = 3.91
> +UPX_SITE = http://upx.sourceforge.net/download/
> +UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.bz2
> +UPX_LICENSE = GPLv2+
> +UPX_LICENSE_FILES = COPYING
> +
> +HOST_UPX_DEPENDENCIES = host-ucl
> +
> +# We need to specify all, otherwise the default target only prints a message
> +# stating to "please choose a target for 'make'"... :-(

 This comment is entirely redundant IMHO.

> +define HOST_UPX_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) CPPFLAGS="$(HOST_CPPFLAGS)" \

 Is there something wrong with $(HOST_CONFIGURE_OPTS) ?

> +	    LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR)/usr \
> +	    -C $(@D) all
> +endef
> +
> +# UPX has no install procedure, so install it manually.

 We also usually don't have this type of comment. It's kind of obvious
that if we install it manually, it's because there is no install procedure.


 Regards,
 Arnout

> +define HOST_UPX_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/src/upx.out $(HOST_DIR)/usr/bin/upx
> +endef
> +
> +$(eval $(host-generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
