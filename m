From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jul 2014 20:03:04 +0200
Subject: [Buildroot] [PATCH 05/10] package: remove references to uClibc
	0.9.32
In-Reply-To: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1404237789-15563-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit removes all remaining references to uClibc 0.9.32.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/Config.in      | 3 +--
 package/connman/Config.in    | 4 +---
 package/fio/Config.in        | 7 +++----
 package/iputils/Config.in    | 3 +--
 package/libglib2/libglib2.mk | 2 +-
 package/mpd/Config.in        | 1 -
 package/mtr/Config.in        | 2 +-
 7 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index a6933b6..51e5fb7 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -5,8 +5,7 @@ config BR2_PACKAGE_AICCU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# Uses dn_skipname(), only available since 0.9.33
-	depends on !BR2_UCLIBC_VERSION_0_9_31 && \
-		!BR2_UCLIBC_VERSION_0_9_32
+	depends on !BR2_UCLIBC_VERSION_0_9_31
 	# AVR32 only has uClibc 0.9.31, so there's no way it can build
 	# due to the lack of dn_skipname(), even with external
 	# toolchains.
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 7160905..a42de17 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
 	depends on !BR2_avr32 # no inotify_init1
-	depends on !BR2_UCLIBC_VERSION_0_9_32
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
@@ -67,5 +66,4 @@ endif # BR2_PACKAGE_CONNMAN
 
 comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver"
 	depends on BR2_USE_MMU && !BR2_avr32
-	depends on BR2_UCLIBC_VERSION_0_9_32 || \
-		!BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/fio/Config.in b/package/fio/Config.in
index 3f0599d..6c1b6cb 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -7,11 +7,10 @@ config BR2_PACKAGE_FIO
 	# release of uClibc, but is part of uClibc Git, and backported
 	# in Buildroot patch set of uClibc 0.9.33. Therefore, we
 	# disable the build of fio for external uClibc toolchains
-	# (which use an unknown uClibc version) and for 0.9.31 and
-	# 0.9.32 which don't have posix_madvise().
+	# (which use an unknown uClibc version) and for 0.9.31 which
+	# don't have posix_madvise().
 	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC && \
-		!BR2_UCLIBC_VERSION_0_9_31 && \
-		!BR2_UCLIBC_VERSION_0_9_32
+		!BR2_UCLIBC_VERSION_0_9_31
 	# fio uses fallocate() which becomes fallocate64() while compiling
 	# with BR2_LARGEFILE but fallocate64() is not available on nios2
 	depends on !BR2_nios2
diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index e7bb3d9..456fddf 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_IPUTILS
 	depends on BR2_USE_MMU # fork()
 	# requires dn_comp (only available in since uclibc 0.9.33)
 	depends on !BR2_avr32
-	depends on !BR2_UCLIBC_VERSION_0_9_31 && \
-		!BR2_UCLIBC_VERSION_0_9_32
+	depends on !BR2_UCLIBC_VERSION_0_9_31
 	help
 	  This package is set of small useful utilities for Linux networking.
 	  It includes complete versions of ping, traceroute, etc.
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 8df7c55..122c6c9 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -50,7 +50,7 @@ LIBGLIB2_CONF_ENV = \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
-ifeq ($(BR2_UCLIBC_VERSION_0_9_31)$(BR2_UCLIBC_VERSION_0_9_32)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
+ifeq ($(BR2_UCLIBC_VERSION_0_9_31)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=no
 else
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1bf7ad1..856263b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -7,7 +7,6 @@ menuconfig BR2_PACKAGE_MPD
 	# avr32, sparc & CS powerpc gcc are too old
 	depends on !(BR2_avr32 || BR2_sparc)
 	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
-	depends on !BR2_UCLIBC_VERSION_0_9_32 # lacks signalfd
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
diff --git a/package/mtr/Config.in b/package/mtr/Config.in
index 7e5ad90..4e529d6 100644
--- a/package/mtr/Config.in
+++ b/package/mtr/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MTR
 	bool "mtr"
 	# res_mkquery() only available in 0.9.33+
-	depends on !BR2_UCLIBC_VERSION_0_9_31 && !BR2_UCLIBC_VERSION_0_9_32
+	depends on !BR2_UCLIBC_VERSION_0_9_31
 	depends on !BR2_avr32
 	help
 	  mtr combines the functionality of the 'traceroute' and 'ping'
-- 
2.0.0
