From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 15 Mar 2020 17:18:46 +0100
Subject: [Buildroot] [PATCH] package/gcc: bump to version 9.3.0
Message-ID: <20200315161846.5827-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patch [1]
Rebase and rename 0002-xtensa-fix-PR-target-91880.patch
and 0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch

Tested using gitlab with Qemu runtime testing series [2] [3].

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=2e1e7ad18e121663082525a872f0d6fb32db4535
[2] https://gitlab.com/kubu93/buildroot/pipelines/125828238
[3] http://patchwork.ozlabs.org/project/buildroot/list/?series=159088

See:
https://gcc.gnu.org/pipermail/gcc-announce/2020/000161.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Ignore csky issues already fixed by [4] [5].
Ignore optee-os issue [6]

[4] https://git.buildroot.net/buildroot/commit/?id=a85b464b9440ae97dabb961086d9285947c7b283
[5] https://git.buildroot.net/buildroot/commit/?id=7542a596010e538ceff56b57dc2c6797c63d73ba
[6] http://patchwork.ozlabs.org/patch/1251093/
---
 ...nsa-backport-fix-for-PR-target-90922.patch | 43 -------------------
 .../0001-xtensa-fix-PR-target-91880.patch}    |  9 ++--
 ...issue-with-set_got-clobbering-LR-r9.patch} |  4 +-
 package/gcc/Config.in.host                    |  2 +-
 package/gcc/gcc.hash                          |  4 +-
 5 files changed, 10 insertions(+), 52 deletions(-)
 delete mode 100644 package/gcc/9.2.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
 rename package/gcc/{9.2.0/0002-xtensa-fix-PR-target-91880.patch => 9.3.0/0001-xtensa-fix-PR-target-91880.patch} (88%)
 rename package/gcc/{9.2.0/0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch => 9.3.0/0002-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch} (98%)

diff --git a/package/gcc/9.2.0/0001-xtensa-backport-fix-for-PR-target-90922.patch b/package/gcc/9.2.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
deleted file mode 100644
index bc1d13a9e4..0000000000
--- a/package/gcc/9.2.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
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
-@@ -2865,7 +2865,8 @@ xtensa_expand_prologue (void)
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
diff --git a/package/gcc/9.2.0/0002-xtensa-fix-PR-target-91880.patch b/package/gcc/9.3.0/0001-xtensa-fix-PR-target-91880.patch
similarity index 88%
rename from package/gcc/9.2.0/0002-xtensa-fix-PR-target-91880.patch
rename to package/gcc/9.3.0/0001-xtensa-fix-PR-target-91880.patch
index 0dbf1124a3..4e5aea2c7b 100644
--- a/package/gcc/9.2.0/0002-xtensa-fix-PR-target-91880.patch
+++ b/package/gcc/9.3.0/0001-xtensa-fix-PR-target-91880.patch
@@ -1,4 +1,4 @@
-From 7c11710230921246156aecc20eb4b6ccaeaaa473 Mon Sep 17 00:00:00 2001
+From 0a59aa440a4c125b81504c777b066ae4eb1f09f0 Mon Sep 17 00:00:00 2001
 From: Max Filippov <jcmvbkbc@gmail.com>
 Date: Tue, 24 Sep 2019 04:15:17 -0700
 Subject: [PATCH] xtensa: fix PR target/91880
@@ -15,14 +15,15 @@ gcc/
 	block that precedes the loop is empty.
 
 Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
 Backported from: r276166
 
- gcc/config/xtensa/xtensa.c                 |  5 ++--
+ gcc/config/xtensa/xtensa.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
-index ee5612441e25..2527468d57db 100644
+index ee5612441e2..2527468d57d 100644
 --- a/gcc/config/xtensa/xtensa.c
 +++ b/gcc/config/xtensa/xtensa.c
 @@ -4235,7 +4235,9 @@ hwloop_optimize (hwloop_info loop)
@@ -45,5 +46,5 @@ index ee5612441e25..2527468d57db 100644
               || (NOTE_P (entry_after)
  		 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
 -- 
-2.11.0
+2.24.1
 
diff --git a/package/gcc/9.2.0/0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch b/package/gcc/9.3.0/0002-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
similarity index 98%
rename from package/gcc/9.2.0/0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
rename to package/gcc/9.3.0/0002-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
index bdde2ce762..e40b96fe0f 100644
--- a/package/gcc/9.2.0/0003-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
+++ b/package/gcc/9.3.0/0002-or1k-Fix-issue-with-set_got-clobbering-LR-r9.patch
@@ -1,4 +1,4 @@
-From 94c7d630348671b781368d9270514dcf6c34e0c9 Mon Sep 17 00:00:00 2001
+From 1383012ae409ed91903b2b76ee15137bc1f89900 Mon Sep 17 00:00:00 2001
 From: shorne <shorne@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 31 Aug 2019 06:00:56 +0000
 Subject: [PATCH] or1k: Fix issue with set_got clobbering LR (r9)
@@ -101,5 +101,5 @@ index 2dad51cd46b..88f3f02630f 100644
     (clobber (reg:SI LR_REGNUM))]
    ""
 -- 
-2.23.0
+2.24.1
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bdfa1b5916..243310f61e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -88,7 +88,7 @@ config BR2_GCC_VERSION
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "7.5.0"     if BR2_GCC_VERSION_7_X
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
-	default "9.2.0"     if BR2_GCC_VERSION_9_X
+	default "9.3.0"     if BR2_GCC_VERSION_9_X
 	default "arc-2019.09-release" if BR2_GCC_VERSION_ARC
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index ba63db1563..d9df3408d4 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe7
 sha512  fe716cc19f2e3255d3a8b1b8290777bf769c6d98e6e0b07b81a3d6ad43f8af74cb170dfa18b1555dbfcd3f55ae582b91a286ccef496b9b65c1579902f96a1f60  gcc-7.5.0.tar.xz
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-#  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.2.0/sha512.sum
-sha512  a12dff52af876aee0fd89a8d09cdc455f35ec46845e154023202392adc164848faf8ee881b59b681b696e27c69fd143a214014db4214db62f9891a1c8365c040  gcc-9.2.0.tar.xz
+#  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.3.0/sha512.sum
+sha512  4b9e3639eef6e623747a22c37a904b4750c93b6da77cf3958d5047e9b5ebddb7eebe091cc16ca0a227c0ecbd2bf3b984b221130f269a97ee4cc18f9cf6c444de  gcc-9.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  84648d13f174102733e06ccdf7b351150babe06af0f2b99b8dfb2b2d3c3f13e424547349939806fe19932ad347977cad79cd8b37be9cbb03e6a4d03cdf95a72e  gcc-arc-2019.09-release.tar.gz
-- 
2.24.1
