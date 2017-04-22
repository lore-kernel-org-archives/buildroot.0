From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:17:49 -0400
Subject: [Buildroot] [PATCH v2 03/25] fix ordering on configs starting with
	'b'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-3-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter b in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter b.
 package/bandwidthd/Config.in    | 2 +-
 package/bash/Config.in          | 4 ++--
 package/binutils/Config.in      | 2 +-
 package/binutils/Config.in.host | 2 +-
 package/bluez5_utils/Config.in  | 2 +-
 package/boost/Config.in         | 4 ++--
 package/bustle/Config.in        | 4 ++--
 package/busybox/Config.in       | 4 ++--
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index b4a47f2..a503da4 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -32,8 +32,8 @@ if BR2_PACKAGE_BANDWIDTHD
 
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
-	select BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Enable support for logging the bandwidthd data to a remote
 	  (or local) postgresql server. This data can then be viewed
diff --git a/package/bash/Config.in b/package/bash/Config.in
index 783e4b3..5a9ebb8 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_BASH
 	bool "bash"
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_READLINE
 	# uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
 	help
 	  The standard GNU Bourne again shell.
 
diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index fdfdfe9..360dd5e 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on !BR2_nios2
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Install binutils on the target
 
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index cca71fb..aa24fd7 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,8 +2,8 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	depends on !BR2_arc
 	default BR2_BINUTILS_VERSION_2_27_X
+	depends on !BR2_arc
 	help
 	  Select the version of binutils you wish to use.
 
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index a7c0ee4..3611c69 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -29,8 +29,8 @@ if BR2_PACKAGE_BLUEZ5_UTILS
 
 config BR2_PACKAGE_BLUEZ5_UTILS_OBEX
 	bool "build OBEX support"
-	select BR2_PACKAGE_LIBICAL
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBICAL
 	help
 	  Enable the OBEX support in Bluez 5.x.
 
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 403bbf3..9825c09 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -115,9 +115,9 @@ config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 
 config BR2_PACKAGE_BOOST_METAPARSE
+	bool "boost-metaparse"
 	depends on BR2_USE_MMU # boost-test
 	select BR2_PACKAGE_BOOST_TEST
-	bool "boost-metaparse"
 
 config BR2_PACKAGE_BOOST_MPI
 	bool "boost-mpi"
@@ -126,8 +126,8 @@ config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
 
 config BR2_PACKAGE_BOOST_PYTHON
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	bool "boost-python"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 
 config BR2_PACKAGE_BOOST_RANDOM
 	bool "boost-random"
diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index f213da5..109ebde 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_BUSTLE
 	bool "bustle"
-	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Bustle is a better dbus-monitor! It records and draws
 	  sequence diagrams of D-Bus activity, showing signal
diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 504cd8a..7eb7eb9 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -35,12 +35,12 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  by busybox.
 
 config BR2_PACKAGE_BUSYBOX_SELINUX
-	select BR2_PACKAGE_LIBSELINUX
+	bool "Enable SELinux support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
-	bool "Enable SELinux support"
+	select BR2_PACKAGE_LIBSELINUX
 	help
 	  Enable SELinux support in BusyBox. Please note that
 	  depending on your BusyBox configuration and the SELinux
-- 
2.9.3
