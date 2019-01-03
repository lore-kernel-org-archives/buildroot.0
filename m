From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  3 Jan 2019 11:56:56 +0100
Subject: [Buildroot] [PATCH 2/2] utils/get-developers: really make it
 callable from elsewhere than the toplevel directory
In-Reply-To: <20190103105657.23751-1-peter@korsgaard.com>
References: <20190103105657.23751-1-peter@korsgaard.com>
Message-ID: <20190103105657.23751-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 62d5558f76a (utils/get-developers: make it callable from elsewhere
than the toplevel directory) tried to fix this by passing in the toplevel
directory when the DEVELOPERS file is parsed.

Unfortunately this is not enough, as E.G.  also the paths listed in the
patches are relative to the toplevel directory, causing it to not match the
entries in the DEVELOPERS file.

In concept this can be fixed by also passing the toplevel directory to the
Developers class, but the simplest solution is just to chdir to the toplevel
Buildroot directory before calling any of the getdeveloperlib functions.

This does require us to finish parsing command line arguments (which opens
the provided patch files) to not get into trouble with relative paths to
patches before chdir'ing / initializing getdeveloperlib.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/get-developers | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index ce882e6699..750fc556dc 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -24,9 +24,6 @@ def parse_args():
 
 
 def __main__():
-    devs = getdeveloperlib.parse_developers()
-    if devs is None:
-        sys.exit(1)
     args = parse_args()
 
     # Check that only one action is given
@@ -48,6 +45,14 @@ def __main__():
         print("No action specified")
         return
 
+    # getdeveloperlib expects to be executed from the toplevel buildroot
+    # directory, which is one level up from this script
+    os.chdir(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
+
+    devs = getdeveloperlib.parse_developers()
+    if devs is None:
+        sys.exit(1)
+
     # Handle the check action
     if args.check:
         files = getdeveloperlib.check_developers(devs)
-- 
2.11.0
