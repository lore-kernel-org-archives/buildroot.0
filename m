From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:17:48 -0400
Subject: [Buildroot] [PATCH v2 02/25] fix ordering on configs starting with
	'a'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter a in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter a.
  
 package/agentpp/Config.in       |  2 +-
 package/aircrack-ng/Config.in   |  2 +-
 package/alsa-lib/Config.in      | 10 +++++-----
 package/alsa-utils/Config.in    |  4 ++--
 package/alsamixergui/Config.in  |  4 ++--
 package/android-tools/Config.in |  4 ++--
 package/apache/Config.in        |  4 ++--
 package/apr-util/Config.in      |  4 ++--
 package/atk/Config.in           |  2 +-
 package/atkmm/Config.in         |  6 +++---
 package/avrdude/Config.in       |  8 ++++----
 package/axel/Config.in          |  2 +-
 12 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index 4b70a1a..e591fb5 100644
--- a/package/agentpp/Config.in
+++ b/package/agentpp/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_AGENTPP
 	bool "agent++"
-	select BR2_PACKAGE_SNMPPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # snmp++
 	depends on !BR2_STATIC_LIBS # snmp++
+	select BR2_PACKAGE_SNMPPP
 	help
 	  AGENT++ is a set of C++ classes which provides a complete protocol
 	  engine and dispatch table for the development of SNMP agents.
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 00ce4e4..b6572dc 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_AIRCRACK_NG
 	bool "aircrack-ng"
 	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libnl has issues when linking statically
 	# they need fixing in libnl itself
 	select BR2_PACKAGE_LIBNL if !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A set of tools for auditing wireless networks
 
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 97e8489..c355b2c 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -3,15 +3,15 @@ comment "alsa-lib needs a toolchain w/ threads"
 
 menuconfig BR2_PACKAGE_ALSA_LIB
 	bool "alsa-lib"
-	# Temporary until
-	# https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913
-	# is fixed
-	select BR2_PACKAGE_ALSA_LIB_PCM
 	# Even though some parts of alsa-lib use threads only when
 	# available, some PCM plugins use them unconditionally. Since
 	# the usage of alsa-lib on no-thread systems is pretty
 	# unlikely, just require thread support globally for alsa-lib.
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# Temporary until
+	# https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4913
+	# is fixed
+	select BR2_PACKAGE_ALSA_LIB_PCM
 	help
 	  The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
 	  functionality to the Linux operating system.
@@ -68,8 +68,8 @@ config BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_LIB_ALISP
 	bool "alisp"
-	depends on BR2_USE_MMU
 	default y
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
 	bool "old-symbols"
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index adc0aab..1d42f2e 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -33,10 +33,10 @@ config BR2_PACKAGE_ALSA_UTILS_ALSALOOP
 
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
+	default y
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ALSA_LIB_MIXER
-	depends on BR2_USE_WCHAR
-	default y
 
 comment "alsamixer needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 5b61f38..2016a28 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_ALSAMIXERGUI
+	bool "alsamixergui"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fltk fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
-	bool "alsamixergui"
 	help
 	  A nice GUI mixer for Alsa using fltk
 
diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 19772ad..96e36e6 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -34,13 +34,13 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 
 config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_ZLIB
 	help
 	  This option will build and install the fastboot utility for
 	  the target, which can be used to reflash other target devices
diff --git a/package/apache/Config.in b/package/apache/Config.in
index 511876d..5916d30 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_APACHE
 	bool "apache"
-	select BR2_PACKAGE_APR_UTIL
-	select BR2_PACKAGE_PCRE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR_UTIL
+	select BR2_PACKAGE_PCRE
 	help
 	  The Apache HTTP Server Project is an effort to develop and maintain an
 	  open-source HTTP server for modern operating systems including UNIX
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 1d7db2b..6c5e3bb 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_APR_UTIL
 	bool "apr-util"
-	select BR2_PACKAGE_APR
-	select BR2_PACKAGE_EXPAT
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR
+	select BR2_PACKAGE_EXPAT
 	help
 	  The utility library for the apache runtime project
 
diff --git a/package/atk/Config.in b/package/atk/Config.in
index 1120a94..c980614 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_ATK
 	bool "atk"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index 2091eab..edc8383 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_ATKMM
 	bool "atkmm"
-	select BR2_PACKAGE_ATK
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_LIBSIGC
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
 	depends on BR2_USE_MMU # atk/glibmm -> libglib2
 	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_LIBSIGC
 
 	help
 	  The atkmm package is a set of C++ bindings for Atk.
diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 8aca841..3757f17 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_AVRDUDE
 	bool "avrdude"
-	select BR2_PACKAGE_ELFUTILS
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
-	select BR2_PACKAGE_NCURSES
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on !BR2_bfin # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	select BR2_PACKAGE_NCURSES
 	help
 	  avrdude is a programmer for Atmel AVR microcontrollers
 	  this package provides a version with new linuxspi driver
diff --git a/package/axel/Config.in b/package/axel/Config.in
index aa93f2a..aea85bf 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  HTTP/FTP download accelerator.
 
-- 
2.9.3
