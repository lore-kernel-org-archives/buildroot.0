From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:17:51 -0400
Subject: [Buildroot] [PATCH v2 05/25] fix ordering on configs starting with
	'd'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-5-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter d in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter d.
  
 package/ding-libs/Config.in     | 2 +-
 package/directfb/Config.in      | 6 +++---
 package/docker-engine/Config.in | 2 +-
 package/dos2unix/Config.in      | 2 +-
 package/dovecot/Config.in       | 2 +-
 package/dropwatch/Config.in     | 4 ++--
 package/dvblast/Config.in       | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
index 7af75b7..d397f29 100644
--- a/package/ding-libs/Config.in
+++ b/package/ding-libs/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_DING_LIBS
 	bool "ding-libs"
+	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT
 	help
 	  The ding-libs packages contain a set of libraries used by
 	  the System Security Services Daemon (SSSD) and other
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 6a3d718..e3b53e0 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -21,9 +21,9 @@ if BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
-	select BR2_PACKAGE_LINUX_FUSION
 	depends on BR2_USE_MMU # madvise()
 	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_LINUX_FUSION
 	help
 	  Enable use of multiple concurrent DirectFB applications
 
@@ -113,8 +113,8 @@ config BR2_PACKAGE_DIRECTFB_SERIALMOUSE
 
 config BR2_PACKAGE_DIRECTFB_TSLIB
 	bool "enable touchscreen support"
-	depends on !BR2_STATIC_LIBS # tslib
 	default y
+	depends on !BR2_STATIC_LIBS # tslib
 	select BR2_PACKAGE_TSLIB
 
 comment "touchscreen support needs a toolchain w/ dynamic library"
@@ -130,8 +130,8 @@ config BR2_PACKAGE_DIRECTFB_TIFF
 
 config BR2_PACKAGE_DIRECTFB_IMLIB2
 	bool "enable IMLIB2 support"
-	select BR2_PACKAGE_IMLIB2
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_IMLIB2
 
 comment "imlib2 support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 8cde4a4..caaf639 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -13,11 +13,11 @@ if BR2_PACKAGE_DOCKER_ENGINE
 
 config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 	bool "docker daemon"
+	default y
 	depends on BR2_USE_MMU # docker-containerd
 	select BR2_PACKAGE_DOCKER_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	select BR2_PACKAGE_SQLITE # runtime dependency
-	default y
 	help
 	  Build the Docker system daemon.
 	  If not selected, will build client only.
diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index 0a4f5e2..6945f52 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DOS2UNIX
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool "dos2unix"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index d1ff7bc..b93e09f 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -17,9 +17,9 @@ if BR2_PACKAGE_DOVECOT
 
 config BR2_PACKAGE_DOVECOT_MYSQL
 	bool "mysql support"
-	select BR2_PACKAGE_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	select BR2_PACKAGE_MYSQL
 	help
 	  Enable MySQL support.
 
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index 6f04c85..127b698 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_DROPWATCH
 	bool "dropwatch"
-	select BR2_PACKAGE_BINUTILS
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	help
 	  Dropwatch is an interactive utility for monitoring and
 	  recording packets that are dropped by the kernel
diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index b7f0c06..c358531 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_DVBLAST
 	bool "dvblast"
+	depends on !BR2_bfin  # libev
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	select BR2_PACKAGE_BITSTREAM
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on !BR2_bfin  # libev
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	help
 	  DVBlast is a simple and powerful MPEG-2/TS demux and
 	  streaming application.
-- 
2.9.3
