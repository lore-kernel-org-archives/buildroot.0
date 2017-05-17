From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 17 May 2017 17:58:54 -0500
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix gpio definition,
	add kconfig option
Message-ID: <1495061934-57465-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <samuel.voss@rockwellcollins.com>

Fix bug causing '--enable-linuxgpio' to not work
due to a misnamed definition. This patch has been
submitted upstream at https://github.com/kcuzner/avrdude/pull/15.

Add the option to enable linux gpio configure option
in menuconfig.

Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 .../0001-Avrdude-Fix-HAVE_LINUX_GPIO-def.patch     | 29 ++++++++++++++++++++++
 package/avrdude/Config.in                          | 10 ++++++++
 package/avrdude/avrdude.mk                         |  6 +++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/avrdude/0001-Avrdude-Fix-HAVE_LINUX_GPIO-def.patch

diff --git a/package/avrdude/0001-Avrdude-Fix-HAVE_LINUX_GPIO-def.patch b/package/avrdude/0001-Avrdude-Fix-HAVE_LINUX_GPIO-def.patch
new file mode 100644
index 0000000..6ed6ea8
--- /dev/null
+++ b/package/avrdude/0001-Avrdude-Fix-HAVE_LINUX_GPIO-def.patch
@@ -0,0 +1,29 @@
+From edeab3f6b5295fa795aa6f841d30831729a181d8 Mon Sep 17 00:00:00 2001
+From: Sam Voss <samuel.voss@rockwellcollins.com>
+Date: Fri, 17 Mar 2017 09:36:53 -0500
+Subject: [PATCH 1/1] Avrdude: Fix HAVE_LINUX_GPIO def
+
+This patch has been submitted upstream at
+    https://github.com/kcuzner/avrdude/pull/15.
+
+Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
+---
+ avrdude/pindefs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/avrdude/pindefs.h b/avrdude/pindefs.h
+index c060708..a227b68 100644
+--- a/avrdude/pindefs.h
++++ b/avrdude/pindefs.h
+@@ -59,7 +59,7 @@ enum {
+ #define PIN_MIN     0   /* smallest allowed pin number */
+ #define PIN_MAX     31  /* largest allowed pin number */
+ 
+-#ifdef HAVE_LINUX_GPIO
++#ifdef HAVE_LINUXGPIO
+ /* Embedded systems might have a lot more gpio than only 0-31 */
+ #undef PIN_MAX
+ #define PIN_MAX     255 /* largest allowed pin number */
+-- 
+1.9.1
+
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 3757f17..4c51e8d 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -15,6 +15,16 @@ config BR2_PACKAGE_AVRDUDE
 
 	  https://github.com/kcuzner/avrdude
 
+if BR2_PACKAGE_AVRDUDE
+
+config BR2_PACKAGE_AVRDUDE_LINUXGPIO
+	bool "linux gpio"
+	depends on BR2_PACKAGE_AVRDUDE
+	help
+	  Enables the tool to use the Linux Sysfs based GPIO framework for GPIO 
+	  access by configuring AVRDude with '--enable-linuxgpio'. 
+endif
+
 comment "avrdude needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index f914ed7..19ffdfa 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -23,6 +23,12 @@ else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
+ifeq ($(BR2_PACKAGE_AVRDUDE_LINUXGPIO),y)
+AVRDUDE_CONF_OPTS = --enable-linuxgpio
+else
+AVRDUDE_CONF_OPTS = --disable-linuxgpio
+endif
+
 # if /etc/avrdude.conf exists, the installation process creates a
 # backup file, which we do not want in the context of Buildroot.
 define AVRDUDE_REMOVE_BACKUP_FILE
-- 
1.9.1
