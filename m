From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Jan 2013 13:06:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/dvb-apps: requires iconv
In-Reply-To: <cover.1357646760.git.yann.morin.1998@free.fr>
References: <cover.1357646760.git.yann.morin.1998@free.fr>
Message-ID: <c5989a20e1b37841caf7b1b1f64b7c8ddd20eeae.1357646760.git.yann.morin.1998@free.fr>
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
 package/dvb-apps/dvb-apps.mk |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
index f914799..bf88c69 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -20,10 +20,11 @@ DVB_APPS_LICENSE        = unknown (probably public domain)
 
 ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
 # Utilitiess are selected, build and install everything
+DVB_APPS_DEPENDENCIES    = libiconv
 DVB_APPS_INSTALL_STAGING = YES
 
 define DVB_APPS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) V=1
+	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS) -liconv" $(MAKE) -C $(@D) V=1
 endef
 
 define DVB_APPS_INSTALL_STAGING_CMDS
-- 
1.7.2.5
