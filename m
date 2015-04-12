From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Apr 2015 16:34:45 +0200
Subject: [Buildroot] [autobuild 4/4] autobuild-run: allow to change default
	git uri and branch through env. vars.
In-Reply-To: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
References: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1428849285-21092-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is useful when hacking the autobuild-run script on some specific
Buildroot tree.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 scripts/autobuild-run | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index dbfc33e..e1c6c5d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -102,6 +102,16 @@ Format of the configuration file:
 Default values for the arguments are:
 
   %s
+
+Environment variables:
+
+  BUILDROOT_GIT_REPO_URI
+    This environment variable allows to fetch the given Buildroot git repository
+    instead of the official one.
+
+  BUILDROOT_GIT_BRANCH
+    This environment variable allows to change the Buildroot git branch instead
+    of master.
 """ % '\n  '.join(
     ['%s = %s' % (key, val) for (key, val) in defaults.items()])
 
@@ -297,8 +307,10 @@ def prepare_build(**kwargs):
     # Clone Buildroot. This only happens if the source directory
     # didn't exist already.
     srcdir = os.path.join(idir, "buildroot")
+    br_repo = os.environ.get("BUILDROOT_GIT_REPO_URI", "git://git.busybox.net/buildroot")
+    br_branch = os.environ.get("BUILDROOT_GIT_BRANCH", "master")
     if not os.path.exists(srcdir):
-        ret = subprocess.call(["git", "clone", "git://git.busybox.net/buildroot", srcdir],
+        ret = subprocess.call(["git", "clone", "-b", br_branch, br_repo, srcdir],
                               stdout=log, stderr=log)
         if ret != 0:
             log_write(log, "ERROR: could not clone Buildroot sources")
-- 
2.3.5
