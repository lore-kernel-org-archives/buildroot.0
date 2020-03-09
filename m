From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 10 Mar 2020 00:50:30 +0100
Subject: [Buildroot] [PATCH] package/gcc: bump to version 8.4.0
Message-ID: <20200309235030.12587-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patch [1].
Rebase and rename 0002-xtensa-fix-PR-target-91880.patch

Tested using gitlab w/ Qemu runtime testing series [2] [3].

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=fba5d9b4c0f4488281efbeef56c100bb52e55165
[2] https://gitlab.com/kubu93/buildroot/pipelines/124684030
[3] http://patchwork.ozlabs.org/project/buildroot/list/?series=159088

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...nsa-backport-fix-for-PR-target-90922.patch | 43 -------------------
 .../0001-xtensa-fix-PR-target-91880.patch}    | 10 +++--
 package/gcc/Config.in.host                    |  2 +-
 package/gcc/gcc.hash                          |  4 +-
 4 files changed, 9 insertions(+), 50 deletions(-)
 delete mode 100644 package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
 rename package/gcc/{8.3.0/0002-xtensa-fix-PR-target-91880.patch => 8.4.0/0001-xtensa-fix-PR-target-91880.patch} (86%)

diff --git a/package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch b/package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
deleted file mode 100644
index c961ce5d24..0000000000
--- a/package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a592242578e573778241cae6d3928c064dcdfda4 Mon Sep 17 00:00:00 2001
-From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 18 Jun 2019 22:19:12 +0000
-Subject: [PATCH] xtensa: fix for PR target/90922
-
-Stack pointer adjustment code in prologue missed a case of no
-callee-saved registers and a stack frame size bigger than 128 bytes.
-Handle that case.
-
-This fixes the following gcc tests with call0 ABI:
-  gcc.c-torture/execute/stdarg-2.c
-  gcc.dg/torture/pr55882.c
-  gcc.dg/torture/pr57569.c
-
-gcc/
-2019-06-18  Max Filippov  <jcmvbkbc@gmail.com>
-
-	* config/xtensa/xtensa.c (xtensa_expand_prologue): Add stack
-	pointer adjustment for the case of no callee-saved registers and
-	stack frame bigger than 128 bytes.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- gcc/config/xtensa/xtensa.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index 19bd616d67f6..ee5612441e25 100644
---- a/gcc/config/xtensa/xtensa.c
-+++ b/gcc/config/xtensa/xtensa.c
-@@ -2862,7 +2862,8 @@ xtensa_expand_prologue (void)
- 			    gen_rtx_SET (mem, reg));
- 	    }
- 	}
--      if (total_size > 1024)
-+      if (total_size > 1024
-+	  || (!callee_save_size && total_size > 128))
- 	{
- 	  rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
- 	  emit_move_insn (tmp_reg, GEN_INT (total_size -
--- 
-2.11.0
-
diff --git a/package/gcc/8.3.0/0002-xtensa-fix-PR-target-91880.patch b/package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch
similarity index 86%
rename from package/gcc/8.3.0/0002-xtensa-fix-PR-target-91880.patch
rename to package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch
index e653525011..119826b516 100644
--- a/package/gcc/8.3.0/0002-xtensa-fix-PR-target-91880.patch
+++ b/package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch
@@ -1,4 +1,4 @@
-From 7c11710230921246156aecc20eb4b6ccaeaaa473 Mon Sep 17 00:00:00 2001
+From 28623c81b50663e946790649352cb1b3ed23954d Mon Sep 17 00:00:00 2001
 From: Max Filippov <jcmvbkbc@gmail.com>
 Date: Tue, 24 Sep 2019 04:15:17 -0700
 Subject: [PATCH] xtensa: fix PR target/91880
@@ -15,14 +15,16 @@ gcc/
 	block that precedes the loop is empty.
 
 Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+[Romain: rebase on gcc 8.4.0]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
 ---
 Backported from: r276166
 
- gcc/config/xtensa/xtensa.c                 |  5 ++--
+ gcc/config/xtensa/xtensa.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index ee5612441e25..2527468d57db 100644
+index 08f9f7c7a8f..de206527810 100644
 --- a/gcc/config/xtensa/xtensa.c
 +++ b/gcc/config/xtensa/xtensa.c
 @@ -4232,7 +4232,9 @@ hwloop_optimize (hwloop_info loop)
@@ -45,5 +47,5 @@ index ee5612441e25..2527468d57db 100644
               || (NOTE_P (entry_after)
  		 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
 -- 
-2.11.0
+2.24.1
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8f9b167ca4..e3a418ef5a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -86,7 +86,7 @@ config BR2_GCC_VERSION
 	string
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "7.5.0"     if BR2_GCC_VERSION_7_X
-	default "8.3.0"     if BR2_GCC_VERSION_8_X
+	default "8.4.0"     if BR2_GCC_VERSION_8_X
 	default "9.2.0"     if BR2_GCC_VERSION_9_X
 	default "arc-2019.09-release" if BR2_GCC_VERSION_ARC
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 65c8c0d794..ba63db1563 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,8 @@
 sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1  gcc-5.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.5.0/sha512.sum
 sha512  fe716cc19f2e3255d3a8b1b8290777bf769c6d98e6e0b07b81a3d6ad43f8af74cb170dfa18b1555dbfcd3f55ae582b91a286ccef496b9b65c1579902f96a1f60  gcc-7.5.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.3.0/sha512.sum
-sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8dfe7e10be2276b4f62c357659ce2902f239f60a8648548231b4b5802  gcc-8.3.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
+sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 #  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.2.0/sha512.sum
 sha512  a12dff52af876aee0fd89a8d09cdc455f35ec46845e154023202392adc164848faf8ee881b59b681b696e27c69fd143a214014db4214db62f9891a1c8365c040  gcc-9.2.0.tar.xz
 
-- 
2.24.1
