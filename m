From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jan 2013 13:53:35 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: requires iconv
Message-ID: <1357995215-26554-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use libiconv if the toolchain does not have locales.

Fixes (for example):
    http://autobuild.buildroot.net/results/c5776c95ac128f7c7eadc2fe746ad89f8c1ef49a

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/Config.in   |    1 +
 package/dvb-apps/dvb-apps.mk |    8 +++++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
index ca8dc54..7f76330 100644
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -14,6 +14,7 @@ comment "dvb-apps utils needs LARGEFILE support in the toolchain"
 config BR2_PACKAGE_DVB_APPS_UTILS
 	bool "dvb-apps utilities"
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  A small number of DVB test and utility programs,
 	  including szap and dvbscan.
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index f914799..0f32af5 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -20,10 +20,16 @@ DVB_APPS_LICENSE        = unknown (probably public domain)
 
 ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
 # Utilitiess are selected, build and install everything
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+DVB_APPS_DEPENDENCIES    = libiconv
+DVB_APPS_LDFLAGS         = $(TARGET_LDFLAGS) -liconv
+endif
+
 DVB_APPS_INSTALL_STAGING = YES
 
 define DVB_APPS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) V=1
+	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(DVB_APPS_LDFLAGS)" $(MAKE) -C $(@D) V=1
 endef
 
 define DVB_APPS_INSTALL_STAGING_CMDS
-- 
1.7.2.5
