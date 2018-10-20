From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:02:31 +0200
Subject: [Buildroot] [PATCH] utils/get-developers: make it callable from
 elsewhere than the toplevel directory
Message-ID: <20181020160231.11895-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 utils/get-developers | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/get-developers b/utils/get-developers
index ce882e6699..8725afb914 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -24,7 +24,9 @@ def parse_args():
 
 
 def __main__():
-    devs = getdeveloperlib.parse_developers()
+    # DEVELOPERS is one level up from here
+    devs_dir = os.path.join(os.path.dirname(__file__), '..')
+    devs = getdeveloperlib.parse_developers(devs_dir)
     if devs is None:
         sys.exit(1)
     args = parse_args()
-- 
2.11.0
