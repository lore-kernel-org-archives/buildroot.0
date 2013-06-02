From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Jun 2013 23:17:46 +0200
Subject: [Buildroot] [PATCH v2] ecryptfs-utils: new package
In-Reply-To: <1370031175-31230-1-git-send-email-marcin@bis.org.pl> (Marcin
 Bis's message of "Fri, 31 May 2013 22:12:55 +0200")
References: <20130531202622.6576897d@skate>
 <1370031175-31230-1-git-send-email-marcin@bis.org.pl>
Message-ID: <877gicw6th.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Bis <marcin@bis.org.pl> writes:

 Marcin> The following patch adds support for ecryptfs-utils.
 Marcin> http://ecryptfs.org/

 Marcin> Signed-off-by: Marcin Bis <marcin@bis.org.pl>
 Marcin> ---
 Marcin>  package/Config.in                        |    1 +
 Marcin>  package/ecryptfs-utils/Config.in         |   22 ++++++++++++++++++++++
 Marcin>  package/ecryptfs-utils/ecryptfs-utils.mk |   28 ++++++++++++++++++++++++++++
 Marcin>  3 files changed, 51 insertions(+), 0 deletions(-)
 Marcin>  create mode 100644 package/ecryptfs-utils/Config.in
 Marcin>  create mode 100644 package/ecryptfs-utils/ecryptfs-utils.mk

 Marcin> diff --git a/package/Config.in b/package/Config.in
 Marcin> index d980871..54711c8 100644
 Marcin> --- a/package/Config.in
 Marcin> +++ b/package/Config.in
 Marcin> @@ -194,6 +194,7 @@ source "package/cramfs/Config.in"
 Marcin>  source "package/curlftpfs/Config.in"
 Marcin>  source "package/dosfstools/Config.in"
 Marcin>  source "package/e2fsprogs/Config.in"
 Marcin> +source "package/ecryptfs-utils/Config.in"
 Marcin>  source "package/exfat/Config.in"
 Marcin>  source "package/exfat-utils/Config.in"
 Marcin>  source "package/f2fs-tools/Config.in"
 Marcin> diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
 Marcin> new file mode 100644
 Marcin> index 0000000..8f89e75
 Marcin> --- /dev/null
 Marcin> +++ b/package/ecryptfs-utils/Config.in
 Marcin> @@ -0,0 +1,22 @@
 Marcin> +config BR2_PACKAGE_ECRYPTFS_UTILS
 Marcin> +	bool "ecryptfs-utils"
 Marcin> +	select BR2_PACKAGE_KEYUTILS
 Marcin> +	select BR2_PACKAGE_LIBNSS
 Marcin> +	depends on BR2_USE_MMU # keyutils
 Marcin> +	depends on !BR2_avr32 && !BR2_microblaze # keyutils
 Marcin> +	depends on BR2_LARGEFILE # libnss
 Marcin> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr
 Marcin> +	help
 Marcin> +	  eCryptfs is a POSIX-compliant enterprise cryptographic
 Marcin> +	  filesystem for Linux. It is stacked on top of any other
 Marcin> +	  Linux filesystem, it stores cryptographic metadata in the header
 Marcin> +	  of each file written.
 Marcin> +	  
 Marcin> +	  The eCryptfs kernel module is available in all Linux kernels
 Marcin> +	  since version 2.6.19. This package provides userspace utilities
 Marcin> +	  needed to mount eCryptfs.
 Marcin> +	  
 Marcin> +	  Files are encrypted using a passpthase. Consider building openssl

s/passthase/passphrase/

 Marcin> +	  for another method.
 Marcin> +	  
 Marcin> +	  http://ecryptfs.org
 Marcin> diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
 Marcin> new file mode 100644
 Marcin> index 0000000..32b509f
 Marcin> --- /dev/null
 Marcin> +++ b/package/ecryptfs-utils/ecryptfs-utils.mk
 Marcin> @@ -0,0 +1,28 @@
 Marcin> +#############################################################
 Marcin> +#
 Marcin> +# ecryptfs-utils
 Marcin> +#
 Marcin> +##############################################################
 Marcin> +
 Marcin> +ECRYPTFS_UTILS_VERSION         = 103
 Marcin> +ECRYPTFS_UTILS_SOURCE          = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
 Marcin> +ECRYPTFS_UTILS_SITE            = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
 Marcin> +ECRYPTFS_UTILS_LICENSE         = GPLv2+
 Marcin> +ECRYPTFS_UTILS_LICENSE_FILES   = COPYING
 Marcin> +
 Marcin> +ECRYPTFS_UTILS_DEPENDENCIES    = keyutils libnss

It also needs host-intltool, and >= 0.41, so I had to bump our intltool
package.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
