From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Jan 2013 21:25:04 +0100
Subject: [Buildroot] [PATCH 1/1] infozip: new package
In-Reply-To: <1357897555-9196-1-git-send-email-jp@jp-embedded.com>
References: <1357897555-9196-1-git-send-email-jp@jp-embedded.com>
Message-ID: <50F07520.6070002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/13 10:45, Jan Pedersen wrote:
> This commit adds a package for infozip, compression and file
> packaging/archive utility.
>
> Signed-off-by: Jan Pedersen<jp@jp-embedded.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(as a reminder to Peter)

  Two small remarks below.

> ---
>   package/Config.in          |    1 +
>   package/infozip/Config.in  |   10 ++++++++++
>   package/infozip/infozip.mk |   21 +++++++++++++++++++++
>   3 files changed, 32 insertions(+)
>   create mode 100644 package/infozip/Config.in
>   create mode 100644 package/infozip/infozip.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index bd1db6b..1c2b228 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -14,6 +14,7 @@ endif
>   source "package/lzop/Config.in"
>   source "package/lzma/Config.in"
>   source "package/xz/Config.in"
> +source "package/infozip/Config.in"

  Packages should be sorted alpabetically, so before lzop.

>   endmenu
>
>   menu "Debugging, profiling and benchmark"
> diff --git a/package/infozip/Config.in b/package/infozip/Config.in
> new file mode 100644
> index 0000000..1a4b756
> --- /dev/null
> +++ b/package/infozip/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_INFOZIP
> +	bool "infozip"
> +	help
> +	  Zip is a compression and file packaging/archive utility.
> +	  Although highly compatible both with PKWARE's PKZIP and
> +	  PKUNZIP utilities for MS-DOS and with Info-ZIP's own UnZip,
> + 	  our primary objectives have been portability and other-than-MSDOS
> +	  functionality.
> +
> +	  http://infozip.sourceforge.net/Zip.html
> diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
> new file mode 100644
> index 0000000..5258a7a
> --- /dev/null
> +++ b/package/infozip/infozip.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# infozip
> +#
> +#############################################################
> +INFOZIP_VERSION = 30
> +INFOZIP_SOURCE = zip$(INFOZIP_VERSION).tgz
> +INFOZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
> +INFOZIP_LICENSE = Info-ZIP
> +INFOZIP_LICENSE_FILES = LICENSE
> +
> +define INFOZIP_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile generic
> +endef
> +
> +define INFOZIP_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install prefix=$(TARGET_DIR)/usr
> +endef
> +
> +$(eval $(generic-package))
> +

  Redundant empty line at end of file.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
