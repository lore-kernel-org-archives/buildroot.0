From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 18 May 2017 10:08:13 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/avrdude: add linux gpio kconfig
	option
Message-ID: <1495120094-44581-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <samuel.voss@rockwellcollins.com>

Add the option to enable linux sysfs gpio framework
configure option in menuconfig.

Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---

Change Log

v1 -> v2
 - upstream accepted linux gpio fix, removed patch
---
 package/avrdude/Config.in  | 10 ++++++++++
 package/avrdude/avrdude.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 3757f17..ac982e1 100644
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
