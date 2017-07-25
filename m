From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:43:30 +0200
Subject: [Buildroot] [git commit] genrandconfig: verbose output and use
	stderr
Message-ID: <20170725210434.647B87FE6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7b05d5b7d433e14860613e38ac8ab5a7040bb4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The output of genrandconfig is currently very terse, which is annoying
for debugging the script or generally seeing what is going on. Also the
timing information added by log_write isn't very useful when the script
is used stand-alone.

In the new setup, (verbose) output goes to stdout and error output goes
to stderr. Also the "INFO: generate the configuration" message is
eliminated - it should go in the autobuild-run script.

We also add an explicit message when a toolchain can't be used after
the first defconfig, otherwise autobuild-run will just silently
restart.

Note that, since the output of make is no longer redirected to
/dev/null, we get one more message on stderr that will be recorded in
the autobuilder's log file: KCONFIG_SEED=0xXXXXXXXX.

This approach allows us to optimise the error handling to use
exceptions, where appropriate, which can be caught at the top level and
converted to an error message to stderr. This, in turn, allows us to use
subprocess.check_call, which eliminates a lot of conditions.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 71 +++++++++++++++++------------------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 79916fe..a35c86f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -26,7 +26,6 @@ import os
 from random import randint
 import subprocess
 import sys
-from time import localtime, strftime
 from distutils.version import StrictVersion
 import platform
 
@@ -48,12 +47,6 @@ else:
         return e
 
 
-def log_write(logf, msg):
-    logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()),
-                              msg))
-    logf.flush()
-
-
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
     DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
@@ -180,6 +173,8 @@ def is_toolchain_usable(outputdir, config):
     # Check that the toolchain configuration is still present
     for toolchainline in config:
         if toolchainline not in configlines:
+            print("WARN: toolchain can't be used", file=sys.stderr)
+            print("      Missing: %s" % toolchainline.strip(), file=sys.stderr)
             return False
 
     # The latest Linaro toolchains on x86-64 hosts requires glibc
@@ -191,7 +186,7 @@ def is_toolchain_usable(outputdir, config):
             ldd_version_output = subprocess.check_output(['ldd', '--version'])
             glibc_version = ldd_version_output.splitlines()[0].split()[-1]
             if StrictVersion('2.14') > StrictVersion(glibc_version):
-                log_write(log, "WARN: ignoring the Linaro ARM toolchains because too old host glibc")
+                print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
                 return False
 
     return True
@@ -342,13 +337,8 @@ def gen_config(args):
     outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
 
-    log_write(args.log, "INFO: generate the configuration")
-
     # Select a random toolchain configuration
-    try:
-        configs = get_toolchain_configs(args.toolchains_url)
-    except Exception:
-        return -1
+    configs = get_toolchain_configs(args.toolchains_url)
 
     i = randint(0, len(configs) - 1)
     config = configs[i]
@@ -374,17 +364,11 @@ def gen_config(args):
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
 
-    devnull = open(os.devnull, "w")
-
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
-                           "olddefconfig"],
-                          stdout=devnull, stderr=devnull)
-    if ret != 0:
-        log_write(args.log, "ERROR: cannot oldconfig")
-        return -1
+    subprocess.check_call(["make", "O=%s" % outputdir, "-C", srcdir,
+                           "olddefconfig"])
 
     if not is_toolchain_usable(outputdir, config):
-        return -1
+        return 2
 
     # Now, generate the random selection of packages, and fixup
     # things if needed.
@@ -393,32 +377,22 @@ def gen_config(args):
     bounded_loop = 100
     while True:
         if bounded_loop == 0:
-            log_write(args.log, "ERROR: cannot generate random configuration after 100 iterations")
-            return -1
+            print("ERROR: cannot generate random configuration after 100 iterations",
+                  file=sys.stderr)
+            return 1
         bounded_loop -= 1
-        ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
+        subprocess.check_call(["make", "O=%s" % outputdir, "-C", srcdir,
                                "KCONFIG_PROBABILITY=%d" % randint(1, 30),
-                               "randpackageconfig"],
-                              stdout=devnull, stderr=devnull)
-        if ret != 0:
-            log_write(args.log, "ERROR: cannot generate random configuration")
-            return -1
+                               "randpackageconfig"])
+
         if fixup_config(outputdir):
             break
 
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
-                           "olddefconfig"],
-                          stdout=devnull, stderr=devnull)
-    if ret != 0:
-        log_write(args.log, "ERROR: cannot oldconfig")
-        return -1
+    subprocess.check_call(["make", "O=%s" % outputdir, "-C", srcdir,
+                           "olddefconfig"])
 
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
-                           "savedefconfig"],
-                          stdout=devnull, stderr=devnull)
-    if ret != 0:
-        log_write(args.log, "ERROR: cannot savedefconfig")
-        return -1
+    subprocess.check_call(["make", "O=%s" % outputdir, "-C", srcdir,
+                           "savedefconfig"])
 
     return 0
 
@@ -435,9 +409,6 @@ if __name__ == '__main__':
                         default="http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv")
     args = parser.parse_args()
 
-    # Arguments expected by gen_config for which we just set a default here
-    args.log = sys.stdout
-
     # Output directory is already created by autobuild-run so emulate it here
     idir = "instance-%d" % args.instance
     if not os.path.exists(idir):
@@ -446,7 +417,9 @@ if __name__ == '__main__':
         # gen_config expects "buildroot" directory under idir
         os.symlink("..", os.path.join(idir, "buildroot"))
 
-    ret = gen_config(args)
-
-    if ret != 0:
+    try:
+        ret = gen_config(args)
+    except Exception as e:
+        print(str(e), file=sys.stderr)
         parser.exit(1)
+    parser.exit(ret)
