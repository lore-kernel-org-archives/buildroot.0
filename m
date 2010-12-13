From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 13 Dec 2010 12:48:51 +0000
Subject: [Buildroot] host-ncurses: cannot find -lstdc++
In-Reply-To: <AANLkTinbFX4PnSW5KsJ+Nog2y9jenymiUU7X-t7gQmcB@mail.gmail.com>
References: <1292003086.27164.12.camel@dubciaranr0.verifone.com>
	<AANLkTinbFX4PnSW5KsJ+Nog2y9jenymiUU7X-t7gQmcB@mail.gmail.com>
Message-ID: <1292244531.6496.9.camel@dubciaranr0.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

Ar Aoine, 2010-12-10 ag 13:29 -0500, scr?obh Mike Frysinger:
> i see no value in building the demos for the host.  if you're after
> the helper binaries (like `tic`), then build only the few tools you
> actually need.

It took me a second reading of your message to understand what you were
getting at.  I made the mistake of forgetting that NCURSES_CONF_OPT is
not used in host builds so I added HOST_NCURSES_CONF_OPT and set it to
generate tic, etc.

I don't imagine it will ignite much interest but for any RHEL5
developers experiencing problems building ncurses 5.7 with the host
ncurses 5.5 RPM, this patch should help.  Those without such problems
will curse it [see what I did there ;-) ].


diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 0a49887..499e2af 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -27,6 +27,7 @@ NCURSES_VERSION = 5.7
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_SOURCE = ncurses-$(NCURSES_VERSION).tar.gz
 NCURSES_INSTALL_STAGING = YES
+NCURSES_DEPENDENCIES = host-ncurses
 
 NCURSES_CONF_OPT = \
        --with-shared \
@@ -43,13 +44,23 @@ NCURSES_CONF_OPT = \
        --enable-broken_linker \
        --disable-static
 
+HOST_NCURSES_CONF_OPT = \
+       --with-shared \
+       --disable-static \
+       --without-cxx-binding \
+
+
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPT += --without-debug
 endif
 
 
 define NCURSES_BUILD_CMDS
-       $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
+       PATH=$(HOST_DIR)/usr/bin:$(PATH) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
+endef
+
+define HOST_NCURSES_BUILD_CMDS
+       $(MAKE1) -C $(@D) DESTDIR=$(HOST_DIR)
 endef
 
 define NCURSES_PATCH_NCURSES_CONFIG
@@ -57,7 +68,12 @@ define NCURSES_PATCH_NCURSES_CONFIG
                $(STAGING_DIR)/usr/bin/ncurses5-config
 endef
 
-NCURSES_POST_STAGING_INSTALL_HOOKS += NCURSES_PATCH_NCURSES_CONFIG
+define HOST_NCURSES_PATCH_NCURSES_CONFIG
+       $(SED) 's^prefix="^prefix="$(HOST_DIR)^' \
+               $(HOST_DIR)/usr/bin/ncurses5-config
+endef
+
+HOST_NCURSES_POST_STAGING_INSTALL_HOOKS += HOST_NCURSES_PATCH_NCURSES_CONFIG
 
 ifeq ($(BR2_HAVE_DEVFILES),y)
 define NCURSES_INSTALL_TARGET_DEVFILES
@@ -121,3 +137,4 @@ define NCURSES_INSTALL_TARGET_CMDS
 endef # NCURSES_INSTALL_TARGET_CMDS
 
 $(eval $(call AUTOTARGETS,package,ncurses))
+$(eval $(call AUTOTARGETS,package,ncurses,host))
