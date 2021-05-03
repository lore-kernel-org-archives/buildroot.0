From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 May 2021 22:23:11 +0200
Subject: [Buildroot] [git commit] Config.in: enable FORTIFY_SOURCE, PIC/PIE,
 RELRO, SSP by default
Message-ID: <20210503200404.01E4B869CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=810ba387bec3c5b6904e8893fb4cb6f9d3717466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enhance security by enabling FORTIFY_SOURCE, PIC/PIE, RELRO and SSP by
default.

For SSP, SSP-all can have a significant impact on performance, so we do
not want to enable that unconditionally; instead we use SSP-strong if
available (since gcc-4.9), and resort to SSP-regular otherwise. People
who really, like really-really want to use SSP-all will still have to
enable it explicitly.

For FORTIFY, level 2 may change the behaviour of some glibc functions,
so may crash conforming programs, so may have adverse effects. As such,
we choose level 1 as the default, as it does not change the behaviour
of any function.

This could help making IoT more secure and fight against the assumption
that buildroot does not support binary hardening (see
https://cyber-itl.org/2019/08/26/iot-data-writeup.html)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - relax SSP to strong when available, regular otherwise
  - extend commit log to explain why SSP-all is not used
  - extend commit log to explain why FORTIFY level 2 is not used
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index e35a78fb71..51fd9dfcd7 100644
--- a/Config.in
+++ b/Config.in
@@ -715,6 +715,7 @@ comment "Security Hardening Options"
 
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
+	default y
 	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	help
@@ -727,7 +728,9 @@ comment "PIC/PIE needs a toolchain w/ PIE"
 
 choice
 	bool "Stack Smashing Protection"
-	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
+	default BR2_SSP_ALL if BR2_ENABLE_SSP
+	default BR2_SSP_STRONG if BR2_TOOLCHAIN_HAS_SSP_STRONG
+	default BR2_SSP_REGULAR
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	help
 	  Enable stack smashing protection support using GCC's
@@ -789,6 +792,8 @@ comment "Stack Smashing Protection needs a toolchain w/ SSP"
 
 choice
 	bool "RELRO Protection"
+	default BR2_RELRO_FULL if BR2_TOOLCHAIN_SUPPORTS_PIE
+	default BR2_RELRO_PARTIAL
 	depends on BR2_SHARED_LIBS
 	help
 	  Enable a link-time protection know as RELRO (RELocation Read
@@ -825,6 +830,7 @@ comment "RELocation Read Only (RELRO) needs shared libraries"
 
 choice
 	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
+	default BR2_FORTIFY_SOURCE_1
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_OPTIMIZE_0
 	help
