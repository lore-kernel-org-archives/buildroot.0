From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 15:00:15 +0100
Subject: [Buildroot] [PATCH v2] drbd-utils: bump version to 8.9.4
In-Reply-To: <1443101800-12027-1-git-send-email-cvubrugier@fastmail.fm>
References: <1443101800-12027-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <560401EF.5060600@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On 09/24/2015 02:36 PM, Christophe Vu-Brugier wrote:
> Version 8.9.4 of drbd-utils contains fixes for the musl C library.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/4e0/4e0ed65b2e06f4ccadcad5b4302e6334667ecbdb
> 
> Moreover, this commit adds the --without-manual option to ./configure
> and drops the hook used to disable the documentation.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test and also check that it fixes the problem with the musl C library:

$ grep BR2_TOOLCHAIN_USES_MUSL .config
BR2_TOOLCHAIN_USES_MUSL=y

$ ls output/build/drbd-utils-8.9.4/.stamp_target_installed
output/build/drbd-utils-8.9.4/.stamp_target_installed

Regards,

Vincent.

> 
> ---
> Changes v1 -> v2:
>  * fix commit message for Autobuild (comment from Vicente)
>  * fix checksum (comment from Vicente)
>  * pass --without-manual to configure
> ---
>  package/drbd-utils/drbd-utils.hash |  2 +-
>  package/drbd-utils/drbd-utils.mk   | 10 ++--------
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
> index c9894cd..ebd13ef 100644
> --- a/package/drbd-utils/drbd-utils.hash
> +++ b/package/drbd-utils/drbd-utils.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256	2c531655d0d198a6af055edbc90f232538c2a3d2ce3fe137d03d06de4c1166d7	drbd-utils-8.9.1.tar.gz
> +sha256	38929279d1bf549fd1ade4ce6773a6fe209db51bbb0efe7bf6d2b7871ba0afbc	drbd-utils-8.9.4.tar.gz
> diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
> index 5df5b81..75bc854 100644
> --- a/package/drbd-utils/drbd-utils.mk
> +++ b/package/drbd-utils/drbd-utils.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>  
> -DRBD_UTILS_VERSION = 8.9.1
> +DRBD_UTILS_VERSION = 8.9.4
>  DRBD_UTILS_SITE = http://oss.linbit.com/drbd/
>  DRBD_UTILS_LICENSE = GPLv2+
>  DRBD_UTILS_LICENSE_FILES = COPYING
>  DRBD_UTILS_DEPENDENCIES = host-flex
>  
> -DRBD_UTILS_CONF_OPTS = --with-distro=generic
> +DRBD_UTILS_CONF_OPTS = --with-distro=generic --without-manual
>  
>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  DRBD_UTILS_CONF_OPTS += --with-initscripttype=systemd
> @@ -26,10 +26,4 @@ else
>  DRBD_UTILS_CONF_OPTS += --with-udev=no
>  endif
>  
> -# Do not build the documentation because it requires docbook
> -define DRBD_UTILS_DISABLE_DOCS
> -	$(SED) 's/user scripts documentation/user scripts/' $(@D)/Makefile.in
> -endef
> -DRBD_UTILS_POST_PATCH_HOOKS += DRBD_UTILS_DISABLE_DOCS
> -
>  $(eval $(autotools-package))
> 
