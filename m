From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue,  8 Sep 2020 16:13:13 -0500
Subject: [Buildroot] [PATCH 2020.02.x 4/4] package/systemd: Backport fix for
 makefs
In-Reply-To: <20200908211313.107946-1-brandon.maier@rockwellcollins.com>
References: <20200908211313.107946-1-brandon.maier@rockwellcollins.com>
Message-ID: <20200908211313.107946-4-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The systemd fstab option "x-systemd.makefs" will fail to work, and throw
an error that it can't find a device named "" (an empty string).
Backport this fix from systemd v245.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 ...0004-makefs-strdup-arguments-to-mkfs.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch

diff --git a/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch b/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch
new file mode 100644
index 0000000000..5134941a71
--- /dev/null
+++ b/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch
@@ -0,0 +1,45 @@
+From c315b79fb43a4d921a533ba0c2cb303324887993 Mon Sep 17 00:00:00 2001
+From: Oliver Giles <ohw.giles@gmail.com>
+Date: Thu, 13 Feb 2020 08:55:57 +0200
+Subject: [PATCH] makefs: strdup arguments to mkfs
+
+Don't pass values from argv[] directly to child process forked using
+safe_fork, because it clears argv[]. strdup them first.
+---
+ src/partition/makefs.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/src/partition/makefs.c b/src/partition/makefs.c
+index 951989cbb6..d73d67c4e8 100644
+--- a/src/partition/makefs.c
++++ b/src/partition/makefs.c
+@@ -41,8 +41,7 @@ static int makefs(const char *type, const char *device) {
+ }
+ 
+ static int run(int argc, char *argv[]) {
+-        const char *device, *type;
+-        _cleanup_free_ char *detected = NULL;
++        _cleanup_free_ char *device = NULL, *type = NULL, *detected = NULL;
+         struct stat st;
+         int r;
+ 
+@@ -52,8 +51,14 @@ static int run(int argc, char *argv[]) {
+                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
+                                        "This program expects two arguments.");
+ 
+-        type = argv[1];
+-        device = argv[2];
++        /* type and device must be copied because makefs calls safe_fork, which clears argv[] */
++        type = strdup(argv[1]);
++        if (!type)
++                return -ENOMEM;
++
++        device = strdup(argv[2]);
++        if (!device)
++                return -ENOMEM;
+ 
+         if (stat(device, &st) < 0)
+                 return log_error_errno(errno, "Failed to stat \"%s\": %m", device);
+-- 
+2.23.0
+
-- 
2.28.0
