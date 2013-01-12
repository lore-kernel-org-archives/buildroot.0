From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 19:54:10 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: requires iconv
Message-ID: <20130112185703.5C16C99848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6abd7864fbcdaeb82074f46b23ad6d7fc7321852
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use libiconv if the toolchain does not have locales.

Fixes (for example):
    http://autobuild.buildroot.net/results/c5776c95ac128f7c7eadc2fe746ad89f8c1ef49a

[Peter: fixup LDFLAGS for BR2_ENABLE_LOCALE=y builds]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dvb-apps/Config.in   |    1 +
 package/dvb-apps/dvb-apps.mk |   10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletions(-)

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
index f914799..ee4aadb 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -20,10 +20,18 @@ DVB_APPS_LICENSE        = unknown (probably public domain)
 
 ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
 # Utilitiess are selected, build and install everything
+
+DVB_APPS_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+DVB_APPS_DEPENDENCIES    = libiconv
+DVB_APPS_LDFLAGS        += -liconv
+endif
+
 DVB_APPS_INSTALL_STAGING = YES
 
 define DVB_APPS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) V=1
+	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(DVB_APPS_LDFLAGS)" $(MAKE) -C $(@D) V=1
 endef
 
 define DVB_APPS_INSTALL_STAGING_CMDS
