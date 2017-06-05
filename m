From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 12:06:58 +0200
Subject: [Buildroot] [git commit] gcc: allow gcc 7.1 for microblaze
	architecture
Message-ID: <20170605100709.65B977FBDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64da4fa9f14ca2adf8d12c627b240187c7097072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch from gcc upstream master to fix an issue.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/7.1.0/0892-microblaze-Revert.patch | 40 ++++++++++++++++++++++++++
 package/gcc/Config.in.host                     |  1 -
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/package/gcc/7.1.0/0892-microblaze-Revert.patch b/package/gcc/7.1.0/0892-microblaze-Revert.patch
new file mode 100644
index 0000000..7026d0e
--- /dev/null
+++ b/package/gcc/7.1.0/0892-microblaze-Revert.patch
@@ -0,0 +1,40 @@
+From 707a69dfb56a2976e2b5c010f0e5cb2ac9905a07 Mon Sep 17 00:00:00 2001
+From: eager <eager@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 27 May 2017 18:29:40 +0000
+Subject: [PATCH] 	Revert: 	2016-01-21  Ajit Agarwal 
+ <ajitkum@xilinx.com>
+
+	See https://gcc.gnu.org/ml/gcc/2017-05/msg00221.html.
+
+	* config/microblaze/microblaze.h
+	(FIXED_REGISTERS): Update in macro.
+	(CALL_USED_REGISTERS): Update in macro.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 248540 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 66e4ef5..2c9ece1 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -269,14 +269,14 @@ extern enum pipeline_type microblaze_pipe;
+ #define FIXED_REGISTERS							\
+ {									\
+   1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,			\
+-  1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
++  1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
+   1, 1, 1, 1 								\
+ }
+ 
+ #define CALL_USED_REGISTERS						\
+ {									\
+   1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,			\
+-  1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
++  1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,			\
+   1, 1, 1, 1								\
+ }
+ #define GP_REG_FIRST    0
+-- 
+2.1.4
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b78b29..5dcaa03 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -67,7 +67,6 @@ config BR2_GCC_VERSION_7_X
 	bool "gcc 7.x"
 	# Broken or unsupported architectures
 	depends on !BR2_arc
-	depends on !BR2_microblaze
 	depends on !BR2_or1k
 	# Unsupported MIPS cores
 	depends on !BR2_mips_m6250 && !BR2_mips_p6600
