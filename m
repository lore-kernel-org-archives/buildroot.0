From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 Jun 2021 20:47:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/dc3dd: disable on riscv32
Message-ID: <20210604184706.5069-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable dc3dd on riscv32 to avoid the following build failure:

In file included from getdate.y:40:
verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
  132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/267151dec9d2328a5f8c61ddf224219a4f617e5c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dc3dd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
index 0383897cd5..715451beb7 100644
--- a/package/dc3dd/Config.in
+++ b/package/dc3dd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DC3DD
 	bool "dc3dd"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
@@ -11,5 +12,6 @@ config BR2_PACKAGE_DC3DD
 	  https://sourceforge.net/projects/dc3dd/
 
 comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
+	depends on !BR2_RISCV_32
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_MUSL
-- 
2.30.2
