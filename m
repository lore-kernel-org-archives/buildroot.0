From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  1 May 2016 09:14:05 +0200
Subject: [Buildroot] [PATCH] libgee: disable for external CS PowerPC
	toolchain
Message-ID: <1462086845-3820-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The external CodeSourcery PowerPC toolchain is unable to build libgee
successfully resuling in an internal compiler error:

hazardpointer.c: In function 'gee_hazard_pointer_release_policy_ensure_start':
hazardpointer.c:845:1: error: insn does not satisfy its constraints:
(insn 151 150 152 8 hazardpointer.c:838 (set (reg:SI 11 11)
        (plus:SI (reg:SI 0 0 [orig:128 D.16455 ] [128])
            (const_int -2147483648 [0xffffffff80000000]))) 82 {*addsi3_internal1} (nil))
hazardpointer.c:845:1: internal compiler error: in copyprop_hardreg_forward_1, at regcprop.c:768

Fixes:
http://autobuild.buildroot.net/results/935/935ac42c30ed893939c06c077534f060aed80e9a/
http://autobuild.buildroot.net/results/df2/df2bf31f84ad6f852b1bb53a5005d72c44984f0b/
http://autobuild.buildroot.net/results/df2/df2bf31f84ad6f852b1bb53a5005d72c44984f0b/
http://autobuild.buildroot.net/results/df2/df2bf31f84ad6f852b1bb53a5005d72c44984f0b/
.. and many more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libgee/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgee/Config.in b/package/libgee/Config.in
index 07c387c..ba46631 100644
--- a/package/libgee/Config.in
+++ b/package/libgee/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBGEE
 	bool "libgee"
+	# These result in internal compiler error
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-- 
2.8.2
