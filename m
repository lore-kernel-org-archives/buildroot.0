From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:22 +0100
Subject: [Buildroot] [PATCH 05/13] autobuild-run: remove unneeded vars
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-6-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And use cwd=abssrcdir (instead of srcdir) in the "Update the Buildroot sources"
git pull command as that seems the intended purpose of $abssrcdir.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 236597d..5db21b1 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -205,8 +205,6 @@ def prepare_build(instance, log):
         log_write(log, "INFO: removing %s from downloads" % f)
         os.remove(os.path.join(dldir, f))
 
-    devnull = open(os.devnull, "w")
-
     # Clone Buildroot. This only happens if the source directory
     # didn't exist already.
     srcdir = os.path.join(idir, "buildroot")
@@ -219,7 +217,7 @@ def prepare_build(instance, log):
 
     # Update the Buildroot sources.
     abssrcdir = os.path.abspath(srcdir)
-    ret = subprocess.call(["git", "pull"], cwd=srcdir, stdout=log, stderr=log)
+    ret = subprocess.call(["git", "pull"], cwd=abssrcdir, stdout=log, stderr=log)
     if ret != 0:
         log_write(log, "ERROR: could not pull Buildroot sources")
         return -1
@@ -361,7 +359,6 @@ def gen_config(instance, log, sysinfo):
     """
 
     idir = "instance-%d" % instance
-    dldir = os.path.join(idir, "dl")
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
     # Buildroot sources, but to the location of the autobuilder
-- 
2.3.0
