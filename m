From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 May 2021 10:02:25 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/dhcp: add host-gawk to
 global dependencies and build environment
In-Reply-To: <20210520215224.2749900-1-geomatsi@gmail.com>
References: <20210520215224.2749900-1-geomatsi@gmail.com>
Message-ID: <dd2dd7a7-bcd3-6a9a-9208-ff73bc839823@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Sergey,

 Thanks for following up on this!

On 20/05/2021 23:52, Sergey Matyukevich wrote:
> DHCP package may silently fail to install binaries to the target image.
> The problem occurs when buildroot output/host and build server provide
> different flavors of awk. For instance, mawk on build server and gawk
> in buildroot output/host. In this case isc-dhcp configure script detects
> gawk in output/host and generates Makefiles specifying gawk without
> absolute path. During Buildroot installation phase, those Makefiles
> are used to install dhcp binaries. They attempt to use gawk without
> absolute path. However build host does not have gawk.
> 
> To resolve the issue add host-gawk to dependencies and specify absolute
> path to host-gawk in dhcp configure script using DHCP_CONF_ENV.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
> 
> Changes v1 -> v2 (after review and tests by Thomas Petazzoni):
>  - suggested change is the same
>  - root cause is figured out and commit message updated
> 
> Changes v2 -> v3 (after patch by Heiko Thiery)
>  - keep host-gawk in global dependencies
> 
> The root cause is explained in the commit message. Here are the
> steps to reproduce the issue on the up-to-date master branch in
> Buildroot Docker image from support/docker/Dockerfile:
> 
> - start from default qemu_x86_defconfig
> - enable isc-dhcp server and client
> 
> As a result, neither dhclient nor dhcpd are installed to the target.
> 
> Note that Buildroot Docker image provides mawk. On the other hand,
> dhcp package (with server enabled) pulls host-gawk as a dependency.
> So build host awk (mawk) differs from buildroot host awk (gawk).
> To reproduce the same issue only for dhclient, uclibc can be
> replaced by glibc, which also pulls host-gawk as a dependency.
> 
> Regards,
> Sergey
> 
>  package/dhcp/dhcp.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 8d7157f357..db58870f88 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -9,7 +9,7 @@ DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>  DHCP_INSTALL_STAGING = YES
>  DHCP_LICENSE = MPL-2.0
>  DHCP_LICENSE_FILES = LICENSE
> -DHCP_DEPENDENCIES = bind
> +DHCP_DEPENDENCIES = bind host-gawk
>  DHCP_CPE_ID_VENDOR = isc
>  
>  # use libtool-enabled configure.ac
> @@ -22,6 +22,8 @@ DHCP_CONF_ENV = \
>  		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
>  	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
>  
> +DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
> +
>  DHCP_CONF_OPTS = \
>  	--with-libbind=$(STAGING_DIR)/usr \
>  	--with-randomdev=/dev/random \
> @@ -55,7 +57,6 @@ define DHCP_INSTALL_LIBS
>  endef
>  
>  ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
> -DHCP_DEPENDENCIES += host-gawk
>  define DHCP_INSTALL_CTL_LIBS
>  	$(MAKE) -C $(@D)/dhcpctl install-exec DESTDIR=$(TARGET_DIR)

 This was so weird that I investigated further. Turns out the problem is here
(well, actually not here because dhcpctl doesn't need gawk, but this one was
conveniently in the diff :-)).

 Configure is smart enough to detect that gawk is ${HOST_DIR}/bin/gawk but that
this is in PATH so it doesn't need to store the full path. So it saves it as
just "gawk". However, in the installation commands we don't pass
$(TARGET_MAKE_ENV), so PATH isn't set the same as during configure. Therefore,
it fails to find gawk at installation time...

 So I thought to change this to put TARGET_MAKE_ENV everywhere. But then I
thought, your solution is actually a lot simpler, and safer in case we later
forget a TARGET_MAKE_ENV somewhere.

 Therefore, applied to master as-is.  Thanks!

 And sorry for trusting Heiko more than you :-)

 Regards,
 Arnout

>  endef
> 
