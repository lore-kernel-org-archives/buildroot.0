From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 16 Oct 2014 21:16:00 +0200
Subject: [Buildroot] [PATCH buildroot-test 4/8] autobuild-run: convert
	regular function comments into docstrings
In-Reply-To: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413486964-5183-4-git-send-email-patrickdepinguin@gmail.com>
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
 scripts/autobuild-run | 75 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 26 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 8c1918c..170cfe3 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -156,13 +156,16 @@ class SystemInfo:
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
@@ -183,10 +186,14 @@ def get_toolchain_configs():
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
@@ -236,14 +243,15 @@ def prepare_build(instance, log):
 
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
 
@@ -322,10 +330,14 @@ def fixup_config(instance, sysinfo):
 
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
@@ -394,8 +406,9 @@ def gen_config(instance, log, sysinfo):
 
     return 0
 
-# Run the build itself
 def do_build(instance, njobs, log):
+    """Run the build itself"""
+
     idir = "instance-%d" % instance
     # We need the absolute path to use with O=, because the relative
     # path to the output directory here is not relative to the
@@ -423,10 +436,14 @@ def do_build(instance, njobs, log):
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
@@ -494,10 +511,13 @@ def send_results(instance, http_login, http_password, submitter, log, result):
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
@@ -522,7 +542,10 @@ def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo)
 
 # args / config file merging inspired by:
 # https://github.com/docopt/docopt/blob/master/examples/config_file_example.py
+
 def load_ini_config(configfile):
+    """Load configuration from file, returning a docopt-like dictionary"""
+
     if not os.path.exists(configfile):
         print "ERROR: configuration file %s does not exist" % configfile
         sys.exit(1)
-- 
1.8.5.1
