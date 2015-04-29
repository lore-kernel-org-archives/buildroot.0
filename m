From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 29 Apr 2015 22:10:16 +0200
Subject: [Buildroot] [autobuild v2 2/3] autobuild-run: also save CMake
	config log files on package failure
In-Reply-To: <1430338217-25518-1-git-send-email-s.martin49@gmail.com>
References: <1430338217-25518-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1430338217-25518-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2
- none
---
 scripts/autobuild-run | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 6e83de9..01e3265 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -655,12 +655,14 @@ def send_results(result, **kwargs):
 
         srcroot = os.path.join(outputdir, "build", '-'.join(reason))
         destroot = os.path.join(resultdir, '-'.join(reason))
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
2.3.7
