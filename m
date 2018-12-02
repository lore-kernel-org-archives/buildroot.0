From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Dec 2018 10:08:38 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: security bump to version 3.0.3
Message-ID: <20181202090838.15776-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump also includes the fix for CVE-2018-6556 released in 3.0.2 via
commit "CVE 2018-6556: verify netns fd in lxc-user-nic": lxc-user-nic
when asked to delete a network interface will unconditionally open a
user provided path:
https://github.com/lxc/lxc/commit/c1cf54ebf251fdbad1e971679614e81649f1c032

This code path may be used by an unprivileged user to check for the
existence of a path which they wouldn't otherwise be able to reach. It
may also be used to trigger side effects by causing a (read-only) open
of special kernel files (ptmx, proc, sys).

Also add a dependency on gcc >= 4.7
(https://github.com/lxc/lxc/issues/2592)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/Config.in | 4 +++-
 package/lxc/lxc.hash  | 2 +-
 package/lxc/lxc.mk    | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index d90e78857a..d8d8f50c8e 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LXC
 	depends on BR2_USE_MMU # fork()
 	# build system forcefully builds a shared library
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # setns() system call
 	help
 	  Linux Containers (LXC), provides the ability to group and
@@ -13,8 +14,9 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library"
+comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library, gcc >= 4.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 		|| BR2_STATIC_LIBS
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index f46b1e1f5e..c741a5baba 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	45986c49be1c048fa127bd3e7ea1bd3347e25765c008a09a2e4c233151a2d5db	lxc-3.0.1.tar.gz
+sha256	620cb832cc02c63bf4d330657bf6176544e145da281ee384a34d689635a19841	lxc-3.0.3.tar.gz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index d1487e0e59..48d5b20329 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 3.0.1
+LXC_VERSION = 3.0.3
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
-- 
2.17.1
