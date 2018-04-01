From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  1 Apr 2018 22:05:16 +0200
Subject: [Buildroot] [PATCH] check-package: support symlinks to the script
Message-ID: <20180401200516.21064-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script finds base_dir (= the Buildroot directory) and
cd's into it. To be able to support relative paths as arguments, it
first recalculates the arguments relative to base_dir.

However, if there is a symlink anywhere on the path to the
check-package script, the relative paths will be wrong. To solve this,
use realpath() instead of abspath(), so symlinks are resolved before
calculating the relative path.

Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/check-package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index d9b719783d..3dbc28b0a2 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -143,7 +143,7 @@ def __main__():
 
     if flags.intree_only:
         # change all paths received to be relative to the base dir
-        base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
+        base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
         files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in flags.files]
         # move current dir so the script find the files
         os.chdir(base_dir)
-- 
2.16.3
