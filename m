From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Jul 2016 18:08:18 +0200
Subject: [Buildroot] [PATCH] package/pppd: disable for musl toolchains
Message-ID: <1468685298-29083-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the same reason as for ipsec-tools [1], disable pppd for musl
toolchains.
It also include <sys/cdefs.h> which is not provided by musl [2].

This fixes a compilation error with musl libc because of undeclared
__P and missing sys/cdefs.h include.

Propagate the dependency to network-manager and rp-pppoe
packages.

[1] 33499484e457018203023cdfdd5286478f2ae381
[2] http://wiki.musl-libc.org/wiki/FAQ#Q:_I.27m_trying_to_compile_something_against_musl_and_I_get_error_messages_about_sys.2Fcdefs.h

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/network-manager/Config.in | 1 +
 package/pppd/Config.in            | 5 +++--
 package/rp-pppoe/Config.in        | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 0636415..b1bca7c 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -47,6 +47,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 
 config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	bool "pppd support"
+	depends on !BR2_TOOLCHAIN_USES_MUSL # pppd
 	select BR2_PACKAGE_PPPD
 	help
 	  This option enables support for PPPD daemon
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index b77d7b0..b56b623 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PPPD
 	bool "pppd"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree
 	depends on BR2_USE_MMU
 	help
 	  An implementation of the Point-to-point protocol.
@@ -24,6 +25,6 @@ config BR2_PACKAGE_PPPD_RADIUS
 
 endif
 
-comment "pppd needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "pppd needs a uClibc or glibc toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 7f6afe2..a41de33 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -1,10 +1,11 @@
-comment "rp-pppoe needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "rp-pppoe needs a uClibc or glibc toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_RP_PPPOE
 	bool "rp-pppoe"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # pppd
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_PPPD
 	help
-- 
2.5.5
