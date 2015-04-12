From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Apr 2015 16:34:42 +0200
Subject: [Buildroot] [autobuild 1/4] autobuild-run: prevent send_result from
	failing when gathering config files
Message-ID: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Make sure using absolute paths in os.path.relpath();
- os.makedirs() can fail if the directory already exists, so only create it
  when needed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 scripts/autobuild-run | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0e12080..a19d51b 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -653,15 +653,16 @@ def send_results(result, **kwargs):
         if not reason:
             return
 
-        srcroot = os.path.join(outputdir, "build", '-'.join(reason))
-        destroot = os.path.join(resultdir, '-'.join(reason))
+        srcroot = os.path.abspath(os.path.join(outputdir, "build", '-'.join(reason)))
+        destroot = os.path.abspath(os.path.join(resultdir, '-'.join(reason)))
 
         for root, dirs, files in os.walk(srcroot):
             dest = os.path.join(destroot, os.path.relpath(root, srcroot))
 
             for fname in files:
                 if fname == 'config.log':
-                    os.makedirs(dest)
+                    if not os.path.exists(dest):
+                        os.makedirs(dest)
                     shutil.copy(os.path.join(root, fname), os.path.join(dest, fname))
 
     copy_config_log_files()
-- 
2.3.5
