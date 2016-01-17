From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 17 Jan 2016 14:55:21 +0100
Subject: [Buildroot] [PATCHv2] moarvm: disable for sparc64
Message-ID: <20160117135521.GA11259@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Missing implementation of AO_fetch_compare_and_swap in
libatomic_ops library for sparcv9.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  * added comment dependency suggested by Baruch Siach
    it was not possible to use a new dependency line.

---
 package/moarvm/Config.in |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 95f3752..038fe6b 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_MOARVM
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic_ops
+	# needs AO_fetch_compare_and_swap, not implemented for sparcv9
+	depends on !BR2_sparc64
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
@@ -12,8 +14,8 @@ config BR2_PACKAGE_MOARVM
 
 	  http://moarvm.com
 
-comment "moarvm needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "moarvm needs a toolchain w/ threads, dynamic library and complete atomic ops"
+	depends on BR2_sparc64 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 
-- 
1.7.10.4
