From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Apr 2021 14:41:56 +0200
Subject: [Buildroot] [PATCH v2, 1/1] Config.in: enable FORTIFY_SOURCE,
 PIC/PIE, RELRO, SSP by default
Message-ID: <20210425124156.2394741-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enhance security by enabling FORTIFY_SOURCE, PIC/PIE, RELRO and SSP by
default.

This could help making IoT more secure and fight against the assumption
that buildroot does not support binary hardening (see
https://cyber-itl.org/2019/08/26/iot-data-writeup.html)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Use RELRO_PARTIAL if toolchain does not support PIE
 - Enable BR2_FORTIFY_SOURCE_2 by default

 Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index e35a78fb71..db6d4f01b4 100644
--- a/Config.in
+++ b/Config.in
@@ -715,6 +715,7 @@ comment "Security Hardening Options"
 
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
+	default y
 	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	help
@@ -727,7 +728,7 @@ comment "PIC/PIE needs a toolchain w/ PIE"
 
 choice
 	bool "Stack Smashing Protection"
-	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
+	default BR2_SSP_ALL
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	help
 	  Enable stack smashing protection support using GCC's
@@ -789,6 +790,8 @@ comment "Stack Smashing Protection needs a toolchain w/ SSP"
 
 choice
 	bool "RELRO Protection"
+	default BR2_RELRO_FULL if BR2_TOOLCHAIN_SUPPORTS_PIE
+	default BR2_RELRO_PARTIAL if !BR2_TOOLCHAIN_SUPPORTS_PIE
 	depends on BR2_SHARED_LIBS
 	help
 	  Enable a link-time protection know as RELRO (RELocation Read
@@ -825,6 +828,7 @@ comment "RELocation Read Only (RELRO) needs shared libraries"
 
 choice
 	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
+	default BR2_FORTIFY_SOURCE_2
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_OPTIMIZE_0
 	help
-- 
2.30.2
