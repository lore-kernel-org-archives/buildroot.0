From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:58:24 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] Revert
 "utils/get-developers: make it callable from elsewhere than the toplevel
 directory"
Message-ID: <20190124105900.8710B8E37D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4402e082db02b4400471aacef9e6268e9bf0f1dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

This reverts commit 62d5558f76a790d1c1b3a1834f1736dc86b6e34f.

This actually does not work, as patches contain paths relative to the
toplevel directory as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 74fbc205048f949477dfb85d24e9c8a3a8390be2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/get-developers     | 6 ++----
 utils/getdeveloperlib.py | 2 --
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index c887938859..ce882e6699 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -24,9 +24,7 @@ def parse_args():
 
 
 def __main__():
-    # DEVELOPERS is one level up from here
-    devs_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..')
-    devs = getdeveloperlib.parse_developers(devs_dir)
+    devs = getdeveloperlib.parse_developers()
     if devs is None:
         sys.exit(1)
     args = parse_args()
@@ -52,7 +50,7 @@ def __main__():
 
     # Handle the check action
     if args.check:
-        files = getdeveloperlib.check_developers(devs, devs_dir)
+        files = getdeveloperlib.check_developers(devs)
         for f in files:
             print(f)
 
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 84665520c6..2c8d477583 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -158,8 +158,6 @@ def parse_developers(basepath=None):
     linen = 0
     if basepath is None:
         basepath = os.getcwd()
-    else:
-        basepath = os.path.abspath(basepath)
     with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
         files = []
         name = None
