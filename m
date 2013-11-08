From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri,  8 Nov 2013 15:09:19 +0200
Subject: [Buildroot] [PATCH 1/1] openpgm: disable for AVR32,
	not its Buildroot-built toolchain
Message-ID: <1383916159-1551-1-git-send-email-alexander.lukichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenPGM builds incorrectly on AVR32 with gcc-4.2.2-avr32-2.1.5.
Since it is presumed to be the only GCC version used by Buildroot
for AVR32, this patch disables openpgm for all cases when AVR32
is selected as the target architecture, including when a toolchain
is downloaded or preinstalled (this is what Buildroot autobuilders
do).

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
---
 package/openpgm/Config.in | 4 ++--
 package/zeromq/Config.in  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index e34740c..8d67639 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_OPENPGM
 	bool "openpgm"
-	depends on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 # lacks required builtins
+	depends on !BR2_avr32 # toolchain lacks required intrinsics
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INET_IPV6
 	depends on BR2_USE_WCHAR
@@ -15,4 +15,4 @@ config BR2_PACKAGE_OPENPGM
 
 comment "openpgm needs a toolchain w/ wchar, threads, IPv6"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6 && BR2_USE_WCHAR)
-	depends on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+	depends on !BR2_avr32
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index dad1dd4..a74ce88 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_ZEROMQ
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
 	depends on BR2_PACKAGE_ZEROMQ
-	depends on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 # openpgm
+	depends on !BR2_avr32 # openpgm
 	select BR2_PACKAGE_OPENPGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
-- 
1.8.0.1
