From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 14:43:45 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] utils/get-developers:
 make it callable from elsewhere than the toplevel directory
Message-ID: <20181021124226.846A388107@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17f798d47840f2ede91f3b1bd73ceeab2341872a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

get-developers tries to open DEVELOPERS in the current directory, so it
breaks when calling it from elsewhere than the toplevel Buildroot directory.

Traceback (most recent call last):
  File "../utils/get-developers", line 107, in <module>
    __main__()
  File "../utils/get-developers", line 26, in __main__
    devs = getdeveloperlib.parse_developers(os.path.dirname()
  File "/home/peko/source/buildroot/utils/getdeveloperlib.py", line 161, in parse_developers
    with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
IOError: [Errno 2] No such file or directory: '/home/peko/source/buildroot/output-foo/DEVELOPERS'

Fix it by instead figuring out where the DEVELOPERS file is relative to the
location of get-developers (E.G. one level up).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout:
  - add realpath to support a symlinked get-developers script;
  - pass devs_dir argument to check_developers() to support -c in subdir;
  - convert basepath to absolute path to support -f option.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit 62d5558f76a790d1c1b3a1834f1736dc86b6e34f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/get-developers     | 6 ++++--
 utils/getdeveloperlib.py | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index ce882e6699..c887938859 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -24,7 +24,9 @@ def parse_args():
 
 
 def __main__():
-    devs = getdeveloperlib.parse_developers()
+    # DEVELOPERS is one level up from here
+    devs_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..')
+    devs = getdeveloperlib.parse_developers(devs_dir)
     if devs is None:
         sys.exit(1)
     args = parse_args()
@@ -50,7 +52,7 @@ def __main__():
 
     # Handle the check action
     if args.check:
-        files = getdeveloperlib.check_developers(devs)
+        files = getdeveloperlib.check_developers(devs, devs_dir)
         for f in files:
             print(f)
 
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 2c8d477583..84665520c6 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -158,6 +158,8 @@ def parse_developers(basepath=None):
     linen = 0
     if basepath is None:
         basepath = os.getcwd()
+    else:
+        basepath = os.path.abspath(basepath)
     with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
         files = []
         name = None
