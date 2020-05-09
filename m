From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 May 2020 18:21:16 +0200
Subject: [Buildroot] [PATCH v1 3/4] package/exfatprogs: fix compile failure
 missing braces around initializer
In-Reply-To: <20200509162117.8728-1-ps.report@gmx.net>
References: <20200509162117.8728-1-ps.report@gmx.net>
Message-ID: <20200509162117.8728-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream commit to fix host package compile failure.

Fixes:

  http://autobuild.buildroot.net/results/d9c5d17de03f5d0316d5f54f9cd579b79d311d03

  fsck.c:1213:9: error: missing braces around initializer [-Werror=missing-braces]
    struct fsck_user_input ui = {0,};
           ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0004-fsck-Zero-init-using-memset.patch    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/exfatprogs/0004-fsck-Zero-init-using-memset.patch

diff --git a/package/exfatprogs/0004-fsck-Zero-init-using-memset.patch b/package/exfatprogs/0004-fsck-Zero-init-using-memset.patch
new file mode 100644
index 0000000000..0ba15149c9
--- /dev/null
+++ b/package/exfatprogs/0004-fsck-Zero-init-using-memset.patch
@@ -0,0 +1,37 @@
+From 2a60e32258e6eb34a68d29202855d98661c78abb Mon Sep 17 00:00:00 2001
+From: Luca Stefani <luca.stefani.ge1@gmail.com>
+Date: Sun, 26 Apr 2020 15:28:21 +0200
+Subject: [PATCH] fsck: Zero-init using memset
+
+* Clang 9.0 incorrectly issues the -Wmissing-braces warning
+
+[Upstream: https://github.com/exfatprogs/exfatprogs/commit/b0519f4fa7ce513d65d0f94c4d5a05be42730e7d.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ fsck/fsck.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/fsck/fsck.c b/fsck/fsck.c
+index 6b48a17..67d7946 100644
+--- a/fsck/fsck.c
++++ b/fsck/fsck.c
+@@ -1211,11 +1211,14 @@ void exfat_show_stat(void)
+ int main(int argc, char * const argv[])
+ {
+ 	int c, ret;
+-	struct fsck_user_input ui = {0,};
+-	struct exfat_blk_dev bd = {0,};
++	struct fsck_user_input ui;
++	struct exfat_blk_dev bd;
+ 	struct exfat *exfat = NULL;
+ 	bool version_only = false;
+ 
++	memset(&ui, 0, sizeof(ui));
++	memset(&bd, 0, sizeof(bd));
++
+ 	print_level = EXFAT_ERROR;
+ 
+ 	if (!setlocale(LC_CTYPE, ""))
+-- 
+2.26.2
+
-- 
2.26.2
