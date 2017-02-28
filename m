From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 22:59:33 +0100
Subject: [Buildroot] [PATCH] libsidplay2: disable on powerpc64le
Message-ID: <1488319173-18452-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libsidplay2 package build system is completely broken. It is made
of a top-level configure script, which calls into sub-configure
scripts in sub-directories. However, since it doesn't use the autoconf
provided AC_CONFIG_SUBDIRS() mechanism, an "autoreconf" doesn't
recurse into the subdirectories.

Due to this, the aclocal.m4 in the libsidplay/ subdirectory doesn't
get re-generated when Buildroot autoreconfs the package. However,
since we patch one of the .m4 files in this subdirectory, when build
time comes, the package notices its aclocal.m4 is older than one of
the .m4 file, and triggers an automatic autoreconf.

Since <pkg>_AUTORECONF = YES is enabled, this automatic autoreconf
works fine: host-autoconf and host-automake are available.

Expect that on powerpc64le, we patch the configure script itself to
make it recognize powerpc64le. But this patching of the configure
script itself gets overwritten by the automatic autoreconf at the
beginning of the build step, causing the build to fail on powerpc64le.

Switching to AC_CONFIG_SUBDIRS() would allow to fix this, but
libsidplay2 needs to pass custom configure options to each of the
sub-configure scripts, something that AC_CONFIG_SUBDIRS() doesn't
support. And since libsidplay2 upstream looks completely dead, the
incentive to fix the whole thing is very limited.

Hence, even though powerpc64le is not to blame here, we take the
simple solution of disabling this package on powerpc64le.

Fixes:

  http://autobuild.buildroot.net/results/1f6a42bfece24e09c9c7f4078d549ec5c099c89d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-sidplay/Config.in | 1 +
 package/libsidplay2/Config.in               | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/kodi-audiodecoder-sidplay/Config.in b/package/kodi-audiodecoder-sidplay/Config.in
index ae99afa..618e815 100644
--- a/package/kodi-audiodecoder-sidplay/Config.in
+++ b/package/kodi-audiodecoder-sidplay/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KODI_AUDIODECODER_SIDPLAY
 	bool "kodi-audiodecoder-sidplay"
 	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_LIBSIDPLAY2
+	depends on !BR2_powerpc64le # libsidplay2
 	help
 	  Sidplay decoder addon for Kodi
 
diff --git a/package/libsidplay2/Config.in b/package/libsidplay2/Config.in
index 5698367..1e9ff4c 100644
--- a/package/libsidplay2/Config.in
+++ b/package/libsidplay2/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBSIDPLAY2
 	bool "libsidplay2"
 	depends on BR2_INSTALL_LIBSTDCPP
+	# The configure patching logic needed for powerpc64le gets
+	# overwritten by the auto-autoreconf done by the package at
+	# the beginning of its build step, causing a build failure.
+	depends on !BR2_powerpc64le
 	help
 	  Sidplay 2 is the second in the Sidplay series originally developed by
 	  Michael Schwendt. This version is written by Simon White and is cycle
@@ -11,3 +15,4 @@ config BR2_PACKAGE_LIBSIDPLAY2
 
 comment "libsidplay2 needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_powerpc64le
-- 
2.7.4
