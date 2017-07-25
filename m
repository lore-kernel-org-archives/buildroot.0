From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:44:07 +0200
Subject: [Buildroot] [git commit] genrandconfig: calculate buildrootdir in
	__main__
Message-ID: <20170725210434.8C65F80020@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9633b6ddd20a787303a9b7da357fe74448e190d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This prepares for passing buildrootdir as an argument.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 3770b16..880f1f6 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -328,9 +328,6 @@ def gen_config(args):
     packages.
     """
 
-    idir = "instance-%d" % args.instance
-    srcdir = os.path.join(idir, "buildroot")
-
     # Select a random toolchain configuration
     configs = get_toolchain_configs(args.toolchains_url)
 
@@ -358,7 +355,7 @@ def gen_config(args):
     with open(os.path.join(args.outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", srcdir,
+    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                            "olddefconfig"])
 
     if not is_toolchain_usable(args.outputdir, config):
@@ -375,17 +372,17 @@ def gen_config(args):
                   file=sys.stderr)
             return 1
         bounded_loop -= 1
-        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", srcdir,
+        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                                "KCONFIG_PROBABILITY=%d" % randint(1, 30),
                                "randpackageconfig"])
 
         if fixup_config(args.outputdir):
             break
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", srcdir,
+    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                            "olddefconfig"])
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", srcdir,
+    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                            "savedefconfig"])
 
     return 0
@@ -410,12 +407,13 @@ if __name__ == '__main__':
     # Buildroot sources, but to the location of the autobuilder
     # script.
     args.outputdir = os.path.abspath(os.path.join(idir, "output"))
+    args.buildrootdir = os.path.join(idir, "buildroot")
 
     if not os.path.exists(idir):
         os.mkdir(idir)
         os.mkdir(args.outputdir)
         # gen_config expects "buildroot" directory under idir
-        os.symlink("..", os.path.join(idir, "buildroot"))
+        os.symlink("..", args.buildrootdir)
 
     try:
         ret = gen_config(args)
