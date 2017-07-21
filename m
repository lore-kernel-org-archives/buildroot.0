From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:14 +0200
Subject: [Buildroot] [PATCH v7 07/23] genrandconfig: calculate outputdir in
	__main__
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This prepares for passing outputdir as an argument.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v7: new patch
---
 utils/genrandconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a35c86f65e..3770b16018 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -329,12 +329,6 @@ def gen_config(args):
     """
 
     idir = "instance-%d" % args.instance
-
-    # We need the absolute path to use with O=, because the relative
-    # path to the output directory here is not relative to the
-    # Buildroot sources, but to the location of the autobuilder
-    # script.
-    outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
 
     # Select a random toolchain configuration
@@ -361,13 +355,13 @@ def gen_config(args):
         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
 
     # Write out the configuration file
-    with open(os.path.join(outputdir, ".config"), "w+") as configf:
+    with open(os.path.join(args.outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
 
-    subprocess.check_call(["make", "O=%s" % outputdir, "-C", srcdir,
+    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", srcdir,
                            "olddefconfig"])
 
-    if not is_toolchain_usable(outputdir, config):
+    if not is_toolchain_usable(args.outputdir, config):
         return 2
 
     # Now, generate the random selection of packages, and fixup
@@ -381,17 +375,17 @@ def gen_config(args):
                   file=sys.stderr)
             return 1
         bounded_loop -= 1
-        subprocess.check_call(["make", "O=%s" % outputdir, "-C", srcdir,
+        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", srcdir,
                                "KCONFIG_PROBABILITY=%d" % randint(1, 30),
                                "randpackageconfig"])
 
-        if fixup_config(outputdir):
+        if fixup_config(args.outputdir):
             break
 
-    subprocess.check_call(["make", "O=%s" % outputdir, "-C", srcdir,
+    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", srcdir,
                            "olddefconfig"])
 
-    subprocess.check_call(["make", "O=%s" % outputdir, "-C", srcdir,
+    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", srcdir,
                            "savedefconfig"])
 
     return 0
@@ -411,9 +405,15 @@ if __name__ == '__main__':
 
     # Output directory is already created by autobuild-run so emulate it here
     idir = "instance-%d" % args.instance
+    # We need the absolute path to use with O=, because the relative
+    # path to the output directory here is not relative to the
+    # Buildroot sources, but to the location of the autobuilder
+    # script.
+    args.outputdir = os.path.abspath(os.path.join(idir, "output"))
+
     if not os.path.exists(idir):
         os.mkdir(idir)
-        os.mkdir(os.path.join(idir, "output"))
+        os.mkdir(args.outputdir)
         # gen_config expects "buildroot" directory under idir
         os.symlink("..", os.path.join(idir, "buildroot"))
 
-- 
2.13.2
