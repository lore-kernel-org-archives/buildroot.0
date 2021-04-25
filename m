From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Apr 2021 09:36:34 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/genext2fs: add
 upstream patch to fix permission handling of the root node
Message-ID: <20210425071716.2704885FCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4822f31ca985192595cf04246e4d6c1f88f168f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes https://bugs.buildroot.org/show_bug.cgi?id=13741

Patch from upstream repo:
https://github.com/bestouff/genext2fs/pull/14/commits/8e4b9ae6f051454953a80b8e64443bcea6c9cc46

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ing-ownership-and-permission-of-the-root-.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/genext2fs/0002-allow-changing-ownership-and-permission-of-the-root-.patch b/package/genext2fs/0002-allow-changing-ownership-and-permission-of-the-root-.patch
new file mode 100644
index 0000000000..f0ac242578
--- /dev/null
+++ b/package/genext2fs/0002-allow-changing-ownership-and-permission-of-the-root-.patch
@@ -0,0 +1,36 @@
+From 8e4b9ae6f051454953a80b8e64443bcea6c9cc46 Mon Sep 17 00:00:00 2001
+From: Johannes 'josch' Schauer <josch@mister-muffin.de>
+Date: Mon, 23 Mar 2020 11:59:25 +0100
+Subject: [PATCH] allow changing ownership and permission of the root node
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ genext2fs.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/genext2fs.c b/genext2fs.c
+index db936e4..af6f519 100644
+--- a/genext2fs.c
++++ b/genext2fs.c
+@@ -2193,6 +2193,18 @@ add2fs_from_file(filesystem *fs, uint32 this_nod, FILE * fh, uint32 fs_timestamp
+ 			continue;
+ 		}
+ 		mode &= FM_IMASK;
++		if (fs && strcmp(path, "/") == 0) {
++			// if the entry modifies the root node, don't call
++			// basename and dirname but chmod the root node
++			// directly
++			if (type != 'd') {
++				error_msg("device table line %d skipped: root node must be directory", lineno);
++				continue;
++			}
++			mode |= FM_IFDIR;
++			chmod_fs(fs, this_nod, mode, uid, gid);
++			continue;
++		}
+ 		path2 = strdup(path);
+ 		name = basename(path);
+ 		dir = dirname(path2);
+-- 
+2.20.1
+
