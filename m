From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 Jan 2017 14:57:49 +0100
Subject: [Buildroot] [PATCH v2,1/1] hiredis: new package
In-Reply-To: <1482534365-79003-1-git-send-email-fabrice.fontaine@orange.com>
References: <1482534365-79003-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <835b48e1-9fea-1dd8-2ac3-fb9662b80a9d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 24/12/2016 ? 00:06, Fabrice Fontaine a ?crit :
> Minimalistic C client for Redis >= 1.2
> 
> It is minimalistic because it just adds minimal support for
> the protocol, but at the same time it uses a high level
> printf-alike API in order to make it much higher level than
> otherwise suggested by its minimal code base and the lack of
> explicit bindings for every Redis command.
> 
> https://github.com/redis/hiredis
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> 
> Changes v1 -> v2:
>  - Do not use make install as it will always build static and shared
>    version of the library (which will fail if BR2_STATIC_LIBS is set)
> 
>  package/Config.in            |  1 +
>  package/hiredis/Config.in    | 12 +++++++++++
>  package/hiredis/hiredis.hash |  2 ++
>  package/hiredis/hiredis.mk   | 47 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 package/hiredis/Config.in
>  create mode 100644 package/hiredis/hiredis.hash
>  create mode 100644 package/hiredis/hiredis.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index b6b409c..df17dd6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -925,6 +925,7 @@ menu "Database"
>  	source "package/berkeleydb/Config.in"
>  	source "package/cppdb/Config.in"
>  	source "package/gdbm/Config.in"
> +	source "package/hiredis/Config.in"
>  	source "package/kompexsqlite/Config.in"
>  	source "package/leveldb/Config.in"
>  	source "package/libpqxx/Config.in"
> diff --git a/package/hiredis/Config.in b/package/hiredis/Config.in
> new file mode 100644
> index 0000000..1656355
> --- /dev/null
> +++ b/package/hiredis/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HIREDIS
> +	bool "hiredis"
> +	help
> +	  Minimalistic C client for Redis >= 1.2
> +
> +	  It is minimalistic because it just adds minimal support for
> +	  the protocol, but at the same time it uses a high level
> +	  printf-alike API in order to make it much higher level than
> +	  otherwise suggested by its minimal code base and the lack of
> +	  explicit bindings for every Redis command.
> +
> +	  https://github.com/redis/hiredis
> diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
> new file mode 100644
> index 0000000..2c788a6
> --- /dev/null
> +++ b/package/hiredis/hiredis.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	717e6fc8dc2819bef522deaca516de9e51b9dfa68fe393b7db5c3b6079196f78	hiredis-v0.13.3.tar.gz
> diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
> new file mode 100644
> index 0000000..7360467
> --- /dev/null
> +++ b/package/hiredis/hiredis.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# hiredis
> +#
> +################################################################################
> +
> +HIREDIS_VERSION = v0.13.3
> +HIREDIS_SITE = $(call github,redis,hiredis,$(HIREDIS_VERSION))
> +HIREDIS_LICENSE = BSD-3c
> +HIREDIS_LICENSE_FILES = COPYING
> +HIREDIS_INSTALL_STAGING = YES
> +
> +HIREDIS_MAKE_OPTS = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	PREFIX=/usr
> +
> +HIREDIS_TARGETS = hiredis.pc
> +ifeq ($(BR2_STATIC_LIBS),y)
> +HIREDIS_TARGETS += static
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +HIREDIS_TARGETS += dynamic
> +else ifeq $(BR2_SHARED_STATIC_LIBS),y)
> +HIREDIS_TARGETS += dynamic static
> +endif
> +
> +define HIREDIS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(HIREDIS_MAKE_OPTS) -C $(@D) \
> +		$(HIREDIS_TARGETS)
> +endef
> +
> +HIREDIS_INCLUDE_DIR = $(STAGING_DIR)/usr/include/hiredis
> +
> +# Do not call make install as this target will build shared and static libraries
> +define HIREDIS_INSTALL_STAGING_CMDS
> +	mkdir -p $(HIREDIS_INCLUDE_DIR)
> +	cp -dpfr $(@D)/hiredis.h $(@D)/async.h $(@D)/read.h $(@D)/sds.h \
> +		$(@D)/adapters $(HIREDIS_INCLUDE_DIR)
> +	$(INSTALL) -m 0644 $(@D)/libhiredis* $(STAGING_DIR)/usr/lib

Add -D for consistency ($(TARGET_DIR)/usr/lib is likely created before building
hiredis)

> +	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
> +	$(INSTALL) -m 0644 $(@D)/hiredis.pc $(STAGING_DIR)/usr/lib/pkgconfig

Instead of using mkdir -p, add -D option to INSTALL command.

> +endef
> +
> +define HIREDIS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0644 $(@D)/libhiredis* $(TARGET_DIR)/usr/lib

Same here.

With that fixed:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> +endef
> +
> +$(eval $(generic-package))
> 
