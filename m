From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  6 Aug 2014 09:58:27 +0200
Subject: [Buildroot] [autobuild PATCH] autobuild-run: do not set BR2_JLEVEL
	and BR2_DL_DIR in the configuration
Message-ID: <1407311907-3878-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of setting BR2_JLEVEL and BR2_DL_DIR in the configuration file
pass those variable as options on the command line, so that the
configuration files can be re-used on other machines with no change.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 scripts/autobuild-run | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 95d84a9..c248473 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -44,10 +44,6 @@
 #
 # TODO:
 #
-# - Do not set BR2_JLEVEL and BR2_DL_DIR in the configuration file,
-#   but through the environment, so that the configuration files can
-#   be re-used on other machines with no change.
-#
 # - Improve the logic that generates the 'build-end.log' file. Instead
 #   of just using the last 500 lines of the build log, search the
 #   start of the build of the failing package.
@@ -257,7 +253,7 @@ def fixup_config(instance):
 # This function generates the configuration, by choosing a random
 # toolchain configuration and then generating a random selection of
 # packages.
-def gen_config(instance, njobs, log):
+def gen_config(instance, log):
     idir = "instance-%d" % instance
     dldir = os.path.join(idir, "dl")
     # We need the absolute path to use with O=, because the relative
@@ -277,8 +273,6 @@ def gen_config(instance, njobs, log):
     configlines = config["contents"]
 
     # Amend the configuration with a few things.
-    configlines.append("BR2_DL_DIR=\"%s\"\n" % os.path.abspath(dldir))
-    configlines.append("BR2_JLEVEL=%d\n" % njobs)
     configlines.append("BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y\n")
     configlines.append("# BR2_TARGET_ROOTFS_TAR is not set\n")
     if randint(0, 20) == 0:
@@ -329,18 +323,19 @@ def gen_config(instance, njobs, log):
     return 0
 
 # Run the build itself
-def do_build(instance, log):
+def do_build(instance, njobs, log):
     idir = "instance-%d" % instance
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
     # Buildroot sources, but to the location of the autobuilder
     # script.
+    dldir = os.path.abspath(os.path.join(idir, "dl"))
     outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
     f = open(os.path.join(outputdir, "logfile"), "w+")
     log_write(log, "INFO: build started")
-    ret = subprocess.call(["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir, "-C", srcdir],
-                          stdout=f, stderr=f)
+    ret = subprocess.call(["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir, "-C", srcdir,
+                           "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs], stdout=f, stderr=f)
     # 124 is a special error code that indicates we have reached the
     # timeout
     if ret == 124:
@@ -446,11 +441,11 @@ def run_instance(instance, njobs, http_login, http_password, submitter):
         if ret != 0:
             continue
 
-        ret = gen_config(instance, njobs, instance_log)
+        ret = gen_config(instance, instance_log)
         if ret != 0:
             continue
 
-        ret = do_build(instance, instance_log)
+        ret = do_build(instance, njobs, instance_log)
         send_results(instance, http_login, http_password, submitter, instance_log, ret)
 
 # Function to get the configuration parameters, either from the
-- 
2.0.4
