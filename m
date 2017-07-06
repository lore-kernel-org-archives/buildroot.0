From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  6 Jul 2017 11:23:45 -0400
Subject: [Buildroot] [PATCH 1/1] Add BR2_TOOLCHAIN_HAS_FTS config option
Message-ID: <20170706152346.30242-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently there are a few packages in buildroot that are set to not
be selectable unless the user wishes to use glibc specifically because
the package uses fts.h.

uClibc actually does have a fts implimentation, and it's selectable in
uclib-menuconfig.  However; this has two issues with it:

1) Most users wouldn't know that there is even a uClibc-menuconfig
2) Even if the user does select fts support in uClibc-menuconfig, the
   packages that would now compile and work would still not be selectable
   because they explicitly require BR2_TOOLCHAIN_USES_GLIBC.

This patch does the following:

- Create a BR2_TOOLCHAIN_HAS_FTS configuration option in uclibc/Config.in
  and automatically set the kconfig during the configure stage.
- when glibc is selected, BR2_TOOLCHAIN_HAS_FTS is now selected.

This will allow for packages that require glibc only because of fts.h to now
depend on BR2_TOOLCHAIN_HAS_FTS instead of BR2_TOOLCHAIN_USES_GLIBC.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/glibc/Config.in  |  1 +
 package/uclibc/Config.in |  8 ++++++++
 package/uclibc/uclibc.mk | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 57a2e83..a20244f 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,5 +5,6 @@ config BR2_PACKAGE_GLIBC
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
 	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_FTS
 
 endif
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index b0b0b01..21a7ff0 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -79,6 +79,12 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
 	  for details.
 
+config BR2_TOOLCHAIN_HAS_FTS
+	bool "Support the fts interface."
+	help
+	  The fts functions are provided for traversing UNIX file
+	  hierarchies. This adds around 7.5k to the build.
+
 config BR2_UCLIBC_INSTALL_UTILS
 	bool "Compile and install uClibc utilities"
 	default y
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index f22d078..c7e5bc9 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -356,6 +356,15 @@ endef
 endif
 
 #
+# fts
+#
+ifeq ($(BR2_TOOLCHAIN_HAS_FTS),y)
+UCLIBC_FTS_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_FTS,$(@D)/.config)
+else
+UCLIBC_FTS_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_FTS,$(@D)/.config)
+endif
+
+#
 # wchar
 #
 
@@ -419,6 +428,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
 	$(UCLIBC_SHARED_LIBS_CONFIG)
+	$(UCLIBC_FTS_CONFIG)
 endef
 
 define UCLIBC_BUILD_CMDS
-- 
2.9.4
