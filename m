From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 19 Oct 2014 21:29:58 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 02/11] autobuild-run: convert
	regular function comments into docstrings
In-Reply-To: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413747007-24990-3-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Documenting a function in Python is done with docstrings, rather than
with comments above the function. The conventions are described in
PEP257: http://legacy.python.org/dev/peps/pep-0257/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
v2: rebase after reordering

 scripts/autobuild-run | 76 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 28 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 282f15d..66f6e1b 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -124,13 +124,16 @@ class SystemInfo:
         self.has_jar = \
           subprocess.call(["which", "jar"], stdout=devnull, stderr=devnull) == 0
 
-# This function fetches the possible toolchain configurations, and
-# returns an array of dictionaries, with for each toolchain:
-#  - url: the URL of the toolchain defconfig
-#  - libc: the C library used by the toolchain
-#  - hostarch: the host architecture for which the toolchain is built
-#  - contents: an array of lines of the defconfig
 def get_toolchain_configs():
+    """Fetch and return the possible toolchain configurations
+
+    This function returns an array of dictionaries, with for each toolchain:
+        - url: the URL of the toolchain defconfig
+        - libc: the C library used by the toolchain
+        - hostarch: the host architecture for which the toolchain is built
+        - contents: an array of lines of the defconfig
+    """
+
     r = urllib2.urlopen('http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv')
     l = r.readlines()
     configs = []
@@ -151,10 +154,14 @@ def get_toolchain_configs():
         configs.append(config)
     return configs
 
-# This function prepares the build by making sure all the needed
-# directories are created, cloning or updating the Buildroot source
-# code, and cleaning up remaining stuff from previous builds.
 def prepare_build(instance, log):
+    """Prepare for the next build of the specified instance
+
+    This function prepares the build by making sure all the needed
+    directories are created, cloning or updating the Buildroot source
+    code, and cleaning up remaining stuff from previous builds.
+    """
+
     idir = "instance-%d" % instance
 
     log_write(log, "INFO: preparing a new build")
@@ -204,14 +211,15 @@ def prepare_build(instance, log):
 
     return 0
 
-# This function makes adjustments to the configuration, as well as
-# additional validation to avoid cases that are known not to work.
-#
-# This function returns 'True' when the configuration has been
-# accepted, and 'False' when the configuration has not been accepted
-# (in which case another random configuration will be generated).
-
 def fixup_config(instance, sysinfo):
+    """Finalize the configuration and reject any problematic combinations
+
+    This function returns 'True' when the configuration has been
+    accepted, and 'False' when the configuration has not been accepted because
+    it is known to fail (in which case another random configuration will be
+    generated).
+    """
+
     idir = "instance-%d" % instance
     outputdir = os.path.join(idir, "output")
 
@@ -290,10 +298,14 @@ def fixup_config(instance, sysinfo):
 
     return True
 
-# This function generates the configuration, by choosing a random
-# toolchain configuration and then generating a random selection of
-# packages.
 def gen_config(instance, log, sysinfo):
+    """Generate a new random configuration
+
+    This function generates the configuration, by choosing a random
+    toolchain configuration and then generating a random selection of
+    packages.
+    """
+
     idir = "instance-%d" % instance
     dldir = os.path.join(idir, "dl")
     # We need the absolute path to use with O=, because the relative
@@ -362,8 +374,9 @@ def gen_config(instance, log, sysinfo):
 
     return 0
 
-# Run the build itself
 def do_build(instance, njobs, log):
+    """Run the build itself"""
+
     idir = "instance-%d" % instance
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
@@ -391,10 +404,14 @@ def do_build(instance, njobs, log):
     log_write(log, "INFO: build successful")
     return 0
 
-# This function prepares the tarball with the results, and either
-# submits them to the official server (if the appropriate credentials
-# are available) or stores them locally as tarballs.
 def send_results(instance, http_login, http_password, submitter, log, result):
+    """Prepare and store/send tarball with results
+
+    This function prepares the tarball with the results, and either
+    submits them to the official server (if the appropriate credentials
+    are available) or stores them locally as tarballs.
+    """
+
     idir = "instance-%d" % instance
     outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
@@ -462,10 +479,13 @@ def send_results(instance, http_login, http_password, submitter, log, result):
         os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
         log_write(log, "INFO: results saved as %s" % resultfilename)
 
-# This function implements the main per-instance loop, which prepares
-# the build, generate a configuration, runs the build, and submits the
-# results.
 def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo):
+    """Main per-instance loop
+
+    Prepare the build, generate a configuration, run the build, and submit the
+    results.
+    """
+
     idir = "instance-%d" % instance
 
     # If it doesn't exist, create the instance directory
@@ -488,9 +508,9 @@ def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo)
         ret = do_build(instance, njobs, instance_log)
         send_results(instance, http_login, http_password, submitter, instance_log, ret)
 
-# Function to get the configuration parameters, either from the
-# command line, or through a configuration file.
 def config_get():
+    """Get configuration parameters, either from the command line or the config file"""
+
     epilog_text = """
 Format of the configuration file:
 
-- 
1.8.5.1
