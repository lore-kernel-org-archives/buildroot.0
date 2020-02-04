From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 23:13:07 +0100
Subject: [Buildroot] [git commit] package/ntfs-3g: add upstream security fix
 for CVE-2019-9755
Message-ID: <20200204220807.B9C458B85F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fb3c69854b01fd8f6483a8dbbb73d05ef26e96a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2019-9755: An integer underflow issue exists in ntfs-3g 2017.3.23.
A local attacker could potentially exploit this by running /bin/ntfs-3g with
specially crafted arguments from a specially crafted directory to cause a
heap buffer overflow, resulting in a crash or the ability to execute
arbitrary code.  In installations where /bin/ntfs-3g is a setuid-root
binary, this could lead to a local escalation of privileges.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ting-an-error-when-failed-to-build-the-mo.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch b/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
new file mode 100644
index 0000000000..9ba8aae50c
--- /dev/null
+++ b/package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch
@@ -0,0 +1,72 @@
+From 85c1634a26faa572d3c558d4cf8aaaca5202d4e9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jean-Pierre=20Andr=C3=A9?= <jean-pierre.andre@wanadoo.fr>
+Date: Wed, 19 Dec 2018 15:57:50 +0100
+Subject: [PATCH] Fixed reporting an error when failed to build the mountpoint
+
+The size check was inefficient because getcwd() uses an unsigned int
+argument.
+
+Fixes CVE-2019-9755: An integer underflow issue exists in ntfs-3g 2017.3.23.
+A local attacker could potentially exploit this by running /bin/ntfs-3g with
+specially crafted arguments from a specially crafted directory to cause a
+heap buffer overflow, resulting in a crash or the ability to execute
+arbitrary code.  In installations where /bin/ntfs-3g is a setuid-root
+binary, this could lead to a local escalation of privileges.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/lowntfs-3g.c | 6 +++++-
+ src/ntfs-3g.c    | 6 +++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/lowntfs-3g.c b/src/lowntfs-3g.c
+index 993867fa..0660439b 100644
+--- a/src/lowntfs-3g.c
++++ b/src/lowntfs-3g.c
+@@ -4411,7 +4411,8 @@ int main(int argc, char *argv[])
+ 	else {
+ 		ctx->abs_mnt_point = (char*)ntfs_malloc(PATH_MAX);
+ 		if (ctx->abs_mnt_point) {
+-			if (getcwd(ctx->abs_mnt_point,
++			if ((strlen(opts.mnt_point) < PATH_MAX)
++			    && getcwd(ctx->abs_mnt_point,
+ 				     PATH_MAX - strlen(opts.mnt_point) - 1)) {
+ 				strcat(ctx->abs_mnt_point, "/");
+ 				strcat(ctx->abs_mnt_point, opts.mnt_point);
+@@ -4419,6 +4420,9 @@ int main(int argc, char *argv[])
+ 			/* Solaris also wants the absolute mount point */
+ 				opts.mnt_point = ctx->abs_mnt_point;
+ #endif /* defined(__sun) && defined (__SVR4) */
++			} else {
++				free(ctx->abs_mnt_point);
++				ctx->abs_mnt_point = (char*)NULL;
+ 			}
+ 		}
+ 	}
+diff --git a/src/ntfs-3g.c b/src/ntfs-3g.c
+index 6ce89fef..4e0912ae 100644
+--- a/src/ntfs-3g.c
++++ b/src/ntfs-3g.c
+@@ -4148,7 +4148,8 @@ int main(int argc, char *argv[])
+ 	else {
+ 		ctx->abs_mnt_point = (char*)ntfs_malloc(PATH_MAX);
+ 		if (ctx->abs_mnt_point) {
+-			if (getcwd(ctx->abs_mnt_point,
++			if ((strlen(opts.mnt_point) < PATH_MAX)
++			    && getcwd(ctx->abs_mnt_point,
+ 				     PATH_MAX - strlen(opts.mnt_point) - 1)) {
+ 				strcat(ctx->abs_mnt_point, "/");
+ 				strcat(ctx->abs_mnt_point, opts.mnt_point);
+@@ -4156,6 +4157,9 @@ int main(int argc, char *argv[])
+ 			/* Solaris also wants the absolute mount point */
+ 				opts.mnt_point = ctx->abs_mnt_point;
+ #endif /* defined(__sun) && defined (__SVR4) */
++			} else {
++				free(ctx->abs_mnt_point);
++				ctx->abs_mnt_point = (char*)NULL;
+ 			}
+ 		}
+ 	}
+-- 
+2.20.1
+
