From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 10:44:28 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.4.3
Message-ID: <20140204095053.4C97A9C79B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50f0f9d63c7252d1d46e901be24caef581b1e547
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And exclude for avr32 since the toolchain is too old, fixes:
http://autobuild.buildroot.net/results/c6a/c6a686885a6c845b527c58c3f2075f82bcf120e2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/Config.in                            |    1 +
 package/squid/squid-02-atomic-cross.patch          |   17 -----------------
 ...patch => squid-02-missing-include-time_h.patch} |    0
 package/squid/squid.mk                             |    3 ++-
 4 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 33776ca..ad9fab5 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,5 +1,6 @@
 comment "squid needs a toolchain w/ C++, IPv6"
 	depends on BR2_USE_MMU
+	depends on !BR2_avr32 # toolchain too old
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
 
 config BR2_PACKAGE_SQUID
diff --git a/package/squid/squid-02-atomic-cross.patch b/package/squid/squid-02-atomic-cross.patch
deleted file mode 100644
index c1b59dc..0000000
--- a/package/squid/squid-02-atomic-cross.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-AC_RUN_IFELSE is bad for cross compiling, switch to AC_COMPILE_IFELSE
-since it's enough for this test.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura squid-3.3.9.orig/configure.ac squid-3.3.9/configure.ac
---- squid-3.3.9.orig/configure.ac	2013-09-13 09:15:32.473365627 -0300
-+++ squid-3.3.9/configure.ac	2013-09-13 13:27:06.829711487 -0300
-@@ -392,7 +392,7 @@
- dnl Check for atomic operations support in the compiler
- dnl
- AC_MSG_CHECKING([for GNU atomic operations support])
--AC_RUN_IFELSE([AC_LANG_PROGRAM([[
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-     int n = 0;
- ]],[[
-     __sync_add_and_fetch(&n, 10); // n becomes 10
diff --git a/package/squid/squid-03-missing-include-time_h.patch b/package/squid/squid-02-missing-include-time_h.patch
similarity index 100%
rename from package/squid/squid-03-missing-include-time_h.patch
rename to package/squid/squid-02-missing-include-time_h.patch
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7f1f0f5..529c5df 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,11 +5,12 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).2
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).3
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
+# For squid-01-assume-get-certificate-ok.patch
 SQUID_AUTORECONF = YES
 SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
