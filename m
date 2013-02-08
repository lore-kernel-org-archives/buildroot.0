From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 08 Feb 2013 18:20:33 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: new package
In-Reply-To: <1360340189-4409-1-git-send-email-laurent.cans@gmail.com>
References: <1360340189-4409-1-git-send-email-laurent.cans@gmail.com>
Message-ID: <511525D1.8010305@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Laurent

You mean 1.1 did not compile with latest buildroot ?

Here's mine from 2012.05 days but ofcourse it needs fixing and cleanup ....

#############################################################
#
# aircrack-ng
#
#############################################################

AIRCRACK_NG_VERSION = 1.1
AIRCRACK_NG_SOURCE = aircrack-ng-$(AIRCRACK_NG_VERSION).tar.gz
AIRCRACK_NG_SITE = http://download.aircrack-ng.org
AIRCRACK_NG_DEPENDENCIES = openssl sqlite

define AIRCRACK_NG_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE)
CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" -C $(@D)
sqlite=true unstable=true strip
endef

define AIRCRACK_NG_INSTALL_TARGET_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)
sqlite=true unstable=true install
endef

$(eval $(call GENTARGETS))



8.2.2013 18:16, Laurent Cans kirjoitti:
> Aircrack-ng is a set of tools for auditing wireless security.
>
> Although the last version is 1.1, I choose to package last svn version due to a fixed bug which fix a failed compilation.
>
> Signed-off-by: Laurent Cans <laurent.cans@gmail.com>
> ---
>  package/Config.in                  |    1 +
>  package/aircrack-ng/Config.in      |    9 +++++++++
>  package/aircrack-ng/aircrack-ng.mk |   34 ++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 package/aircrack-ng/Config.in
>  create mode 100644 package/aircrack-ng/aircrack-ng.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 8588951..c820d68 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -612,6 +612,7 @@ source "package/sound-theme-freedesktop/Config.in"
>  endmenu
>  
>  menu "Networking applications"
> +source "package/aircrack-ng/Config.in"
>  source "package/argus/Config.in"
>  source "package/arptables/Config.in"
>  source "package/avahi/Config.in"
> diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
> new file mode 100644
> index 0000000..1efa8e6
> --- /dev/null
> +++ b/package/aircrack-ng/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_AIRCRACK_NG
> +	bool "aircrack-ng"
> +	depends on BR2_LARGEFILE
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_WI
> +	help
> +	  A set of tools for auditing wireless networks
> +
> +	  http://www.aircrack-ng.org/
> diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
> new file mode 100644
> index 0000000..29f638c
> --- /dev/null
> +++ b/package/aircrack-ng/aircrack-ng.mk
> @@ -0,0 +1,34 @@
> +#############################################################
> +#
> +# Aircrack-ng
> +#
> +#############################################################
> +AIRCRACK_NG_VERSION = 2245
> +AIRCRACK_NG_SITE = http://trac.aircrack-ng.org/svn/trunk
> +AIRCRACK_NG_SITE_METHOD = svn
> +AIRCRACK_NG_LICENSE = GPLv2
> +AIRCRACK_NG_LICENSE_FILES = LICENSE
> +AIRCRACK_NG_DEPENDENCIES = openssl
> +
> +ifeq($(BR2_PACKAGE_SQLITE),y)
> +      AIRCRACK_NG_OPTS = sqlite=true
> +      AIRCRACK_NG_DEPENDENCIES += sqlite
> +endif
> +
> +define AIRCRACK_NG_BUILD_CMDS
> +      $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) $(AIRCRACK_NG_OPTS) all
> +endef
> +
> +define AIRCRACK_NG_CLEAN_CMDS
> +      $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) $(AIRCRACK_NG_OPTS) clean
> +endef
> +
> +define AIRCRACK_NG_INSTALL_TARGET_CMDS
> +      $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) $(AIRCRACK_NG_OPTS) install
> +endef
> +
> +define AIRCRACK_NG_UNINSTALL_TARGET_CMDS
> +      $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) $(AIRCRACK_NG_OPTS) uninstall
> +endef
> +
> +$(eval $(generic-package))
