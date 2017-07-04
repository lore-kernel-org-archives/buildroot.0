From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:45 +0200
Subject: [Buildroot] [git commit] lshw: use the new gettext logic
Message-ID: <20170704233516.F1F2681D81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3acd9f845de0489071719d52d774aab48d7f9c33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

 - using BR2_SYSTEM_ENABLE_NLS instead of BR2_ENABLE_LOCALE to decide
   whether NLS support is enabled or not

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lshw/Config.in | 1 -
 package/lshw/lshw.mk   | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 8cc935a..83b7ffb 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LSHW
 	bool "lshw"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the machine.
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index eb39611..43b937b 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -10,7 +10,7 @@ LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
 LSHW_CFLAGS = $(TARGET_CFLAGS)
-ifeq ($(BR2_ENABLE_LOCALE),)
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 LSHW_CFLAGS += -DNONLS
 endif
 
@@ -18,8 +18,8 @@ LSHW_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
 	RPM_OPT_FLAGS="$(LSHW_CFLAGS)" all
 LSHW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
-	LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
-LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	LIBS=$(TARGET_NLS_LIBS)
+LSHW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPTS)
