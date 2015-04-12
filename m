From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Apr 2015 16:34:43 +0200
Subject: [Buildroot] [autobuild 2/4] autobuild-run: also save CMake config
	log files on package failure
In-Reply-To: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
References: <1428849285-21092-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1428849285-21092-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 scripts/autobuild-run | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a19d51b..a7cdc12 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -655,12 +655,14 @@ def send_results(result, **kwargs):
 
         srcroot = os.path.abspath(os.path.join(outputdir, "build", '-'.join(reason)))
         destroot = os.path.abspath(os.path.join(resultdir, '-'.join(reason)))
+        config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
+            'CMakeOutput.log')
 
         for root, dirs, files in os.walk(srcroot):
             dest = os.path.join(destroot, os.path.relpath(root, srcroot))
 
             for fname in files:
-                if fname == 'config.log':
+                if fname in config_files:
                     if not os.path.exists(dest):
                         os.makedirs(dest)
                     shutil.copy(os.path.join(root, fname), os.path.join(dest, fname))
-- 
2.3.5
