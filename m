From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 23:10:27 +0200
Subject: [Buildroot] [PATCH 05/10] lshw: fix build with no LOCALE support
In-Reply-To: <20121014210734.17845.64519.stgit@localhost>
References: <20121014210734.17845.64519.stgit@localhost>
Message-ID: <20121014211020.17845.20483.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lshw doesn't need libintl if -DNONLS is defined.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lshw/Config.in |    2 +-
 package/lshw/lshw.mk   |   12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 98beacd..afefa6c 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the machine.
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 68daa0d..b3c2214 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -6,10 +6,16 @@
 
 LSHW_VERSION = B.02.16
 LSHW_SITE = http://ezix.org/software/files
+
+LSHW_CFLAGS = $(TARGET_CFLAGS)
+ifeq ($(BR2_ENABLE_LOCALE),)
+LSHW_CFLAGS += -DNONLS
+endif
+
 LSHW_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
-	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
-LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT),-lintl)"
-LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),gettext)
+	RPM_OPT_FLAGS="$(LSHW_CFLAGS)" all
+LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPT)
