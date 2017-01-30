From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:09:43 +0100
Subject: [Buildroot] [PATCH v3,1/1] hiredis: new package
In-Reply-To: <1485635045-86074-1-git-send-email-fabrice.fontaine@orange.com>
 (Fabrice Fontaine's message of "Sat, 28 Jan 2017 21:24:05 +0100")
References: <1485635045-86074-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <87tw8g71iw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Minimalistic C client for Redis >= 1.2
 > It is minimalistic because it just adds minimal support for
 > the protocol, but at the same time it uses a high level
 > printf-alike API in order to make it much higher level than
 > otherwise suggested by its minimal code base and the lack of
 > explicit bindings for every Redis command.

 > https://github.com/redis/hiredis

 > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
 > ---
 > Changes v2 -> v3 (after review of Romain Naour):
 >  - Add -D option to INSTALL instead of calling mkdir -p

 > Changes v1 -> v2:
 >  - Do not use make install as it will always build static and shared
 >    version of the library (which will fail if BR2_STATIC_LIBS is set)

> +++ b/package/hiredis/hiredis.mk
 > @@ -0,0 +1,46 @@
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
 > +	$(INSTALL) -D -m 0644 $(@D)/libhiredis* $(STAGING_DIR)/usr/lib

install -t has to be used when multiple source files are (can be)
present. Notice that it doesn't create the destination, so I swapped
this line with the one below.

> +	$(INSTALL) -D -m 0644 $(@D)/hiredis.pc $(STAGING_DIR)/usr/lib/pkgconfig

When the -D option is present then you need to specify the destination
file name, not just the directory.

> +endef
 > +
 > +define HIREDIS_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -D -m 0644 $(@D)/libhiredis* $(TARGET_DIR)/usr/lib

Again, -t has to be used, and mkdir -p $(TARGET)/usr/lib to ensure the
destination directory exists.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
