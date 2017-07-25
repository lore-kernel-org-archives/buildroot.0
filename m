From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:42:45 +0200
Subject: [Buildroot] [git commit] genrandconfig: replace kwargs with
	explicit arguments
Message-ID: <20170725210434.352F97FC08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22978c7399ee7cd76dbb3d57cdc6f018a68c326c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kwargs is a left-over from the use of docopt, it's better to use
argparse's Namespace object directly.

In addition, most functions use just one or two fields of args, so
these can just as well be passed directly as arguments to the function.
Particularly for outputdir it doesn't make sense to reconstruct it all
the time.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 44 ++++++++++++++++----------------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index fad60cd..a9519b5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -125,13 +125,12 @@ class SystemInfo:
         return not missing_requirements
 
 
-def get_toolchain_configs(**kwargs):
+def get_toolchain_configs(toolchains_url):
     """Fetch and return the possible toolchain configurations
 
     This function returns an array of toolchain configurations. Each
     toolchain configuration is itself an array of lines of the defconfig.
     """
-    toolchains_url = kwargs['toolchains_url']
 
     with urlopen_closing(toolchains_url) as r:
         toolchains_csv = decode_byte_list(r.readlines())
@@ -172,19 +171,14 @@ def get_toolchain_configs(**kwargs):
     return configs
 
 
-def is_toolchain_usable(**kwargs):
+def is_toolchain_usable(outputdir, config):
     """Check if the toolchain is actually usable."""
 
-    idir = "instance-%d" % kwargs['instance']
-    sysinfo = kwargs['sysinfo']
-    log = kwargs['log']
-
-    outputdir = os.path.join(idir, "output")
     with open(os.path.join(outputdir, ".config")) as configf:
         configlines = configf.readlines()
 
     # Check that the toolchain configuration is still present
-    for toolchainline in kwargs['config']:
+    for toolchainline in config:
         if toolchainline not in configlines:
             return False
 
@@ -203,7 +197,7 @@ def is_toolchain_usable(**kwargs):
     return True
 
 
-def fixup_config(**kwargs):
+def fixup_config(outputdir, sysinfo):
     """Finalize the configuration and reject any problematic combinations
 
     This function returns 'True' when the configuration has been
@@ -212,10 +206,6 @@ def fixup_config(**kwargs):
     generated).
     """
 
-    idir = "instance-%d" % kwargs['instance']
-    sysinfo = kwargs['sysinfo']
-
-    outputdir = os.path.join(idir, "output")
     with open(os.path.join(outputdir, ".config")) as configf:
         configlines = configf.readlines()
 
@@ -334,7 +324,7 @@ def fixup_config(**kwargs):
     return True
 
 
-def gen_config(**kwargs):
+def gen_config(args):
     """Generate a new random configuration
 
     This function generates the configuration, by choosing a random
@@ -342,8 +332,7 @@ def gen_config(**kwargs):
     packages.
     """
 
-    idir = "instance-%d" % kwargs['instance']
-    log = kwargs['log']
+    idir = "instance-%d" % args.instance
 
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
@@ -352,11 +341,11 @@ def gen_config(**kwargs):
     outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
 
-    log_write(log, "INFO: generate the configuration")
+    log_write(args.log, "INFO: generate the configuration")
 
     # Select a random toolchain configuration
     try:
-        configs = get_toolchain_configs(**kwargs)
+        configs = get_toolchain_configs(args.toolchains_url)
     except Exception:
         return -1
 
@@ -390,10 +379,10 @@ def gen_config(**kwargs):
                            "olddefconfig"],
                           stdout=devnull, stderr=devnull)
     if ret != 0:
-        log_write(log, "ERROR: cannot oldconfig")
+        log_write(args.log, "ERROR: cannot oldconfig")
         return -1
 
-    if not is_toolchain_usable(config=config, **kwargs):
+    if not is_toolchain_usable(outputdir, config):
         return -1
 
     # Now, generate the random selection of packages, and fixup
@@ -403,7 +392,7 @@ def gen_config(**kwargs):
     bounded_loop = 100
     while True:
         if bounded_loop == 0:
-            log_write(log, "ERROR: cannot generate random configuration after 100 iterations")
+            log_write(args.log, "ERROR: cannot generate random configuration after 100 iterations")
             return -1
         bounded_loop -= 1
         ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
@@ -411,23 +400,23 @@ def gen_config(**kwargs):
                                "randpackageconfig"],
                               stdout=devnull, stderr=devnull)
         if ret != 0:
-            log_write(log, "ERROR: cannot generate random configuration")
+            log_write(args.log, "ERROR: cannot generate random configuration")
             return -1
-        if fixup_config(**kwargs):
+        if fixup_config(outputdir, args.sysinfo):
             break
 
     ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
                            "olddefconfig"],
                           stdout=devnull, stderr=devnull)
     if ret != 0:
-        log_write(log, "ERROR: cannot oldconfig")
+        log_write(args.log, "ERROR: cannot oldconfig")
         return -1
 
     ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
                            "savedefconfig"],
                           stdout=devnull, stderr=devnull)
     if ret != 0:
-        log_write(log, "ERROR: cannot savedefconfig")
+        log_write(args.log, "ERROR: cannot savedefconfig")
         return -1
 
     return 0
@@ -457,8 +446,7 @@ if __name__ == '__main__':
         # gen_config expects "buildroot" directory under idir
         os.symlink("..", os.path.join(idir, "buildroot"))
 
-    # gen_config expects a dict, but args is a class object
-    ret = gen_config(**args.__dict__)
+    ret = gen_config(args)
 
     if ret != 0:
         parser.exit(1)
