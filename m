From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  8 Sep 2014 15:16:36 +0200
Subject: [Buildroot] [PATCH-AUTOBUILD] autobuild-run: introduce SystemInfo
	class and use it to disable packages needing unavailable system deps
Message-ID: <1410182196-19849-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some autobuilders don't have all optional system dependencies available
(E.G.  bzr), and some _do_ have java/javac/jar, so it would be interesting
to build the packages requiring these if possible.

Handle this variability by detecting these dependencies at startup adjust
fixup_config based on availability.

Also cleanup fixup_config to look for the BR2_NEEDS_HOST_* config lines
instead of the specific packages that (today) needs them.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 scripts/autobuild-run | 45 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 8f16139..ddae72e 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -99,6 +99,28 @@ def check_requirements():
     if missing_requirements:
         sys.exit(1)
 
+class SystemInfo:
+    def __init__(self):
+        devnull = open(os.devnull, "w")
+
+        self.has_bzr = \
+          subprocess.call(["which", "bzr"], stdout=devnull, stderr=devnull) == 0
+
+        self.has_java = False
+        if subprocess.call(["which", "java"], stdout=devnull, stderr=devnull) == 0:
+            if subprocess.call("java -version | grep gcj", shell=True,
+                               stdout=devnull, stderr=devnull) == 1:
+                self.has_java = True
+
+        self.has_java = False
+        if subprocess.call(["which", "javac"], stdout=devnull, stderr=devnull) == 0:
+            if subprocess.call("javac -version | grep gcj", shell=True,
+                               stdout=devnull, stderr=devnull) == 1:
+                self.has_javac = True
+
+        self.has_jar = \
+          subprocess.call(["which", "jar"], stdout=devnull, stderr=devnull) == 0
+
 # This function fetches the possible toolchain configurations, and
 # returns an array of dictionaries, with for each toolchain:
 #  - url: the URL of the toolchain defconfig
@@ -186,7 +208,7 @@ def prepare_build(instance, log):
 # accepted, and 'False' when the configuration has not been accepted
 # (in which case another random configuration will be generated).
 
-def fixup_config(instance):
+def fixup_config(instance, sysinfo):
     idir = "instance-%d" % instance
     outputdir = os.path.join(idir, "output")
 
@@ -214,10 +236,14 @@ def fixup_config(instance):
     if "BR2_PACKAGE_MROUTED=y\n" in configlines and \
        "BR2_TOOLCHAIN_USES_UCLIBC=y\n" in configlines:
         configlines.remove("BR2_PACKAGE_MROUTED=y\n")
-    if 'BR2_PACKAGE_CLASSPATH=y\n' in configlines:
+    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has_java:
+        return False
+    if "BR2_NEEDS_HOST_JAVAC=y\n" in configlines and not sysinfo.has_javac:
+        return False
+    if "BR2_NEEDS_HOST_JAR=y\n" in configlines and not sysinfo.has_jar:
         return False
-    # We don't have Java installed on the build machine
-    if 'BR2_PACKAGE_XBMC=y\n' in configlines:
+    # python-nfc needs bzr
+    if 'BR2_PACKAGE_PYTHON_NFC=y' in configlines and not sysinfo.has_bzr:
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
@@ -264,7 +290,7 @@ def fixup_config(instance):
 # This function generates the configuration, by choosing a random
 # toolchain configuration and then generating a random selection of
 # packages.
-def gen_config(instance, log):
+def gen_config(instance, log, sysinfo):
     idir = "instance-%d" % instance
     dldir = os.path.join(idir, "dl")
     # We need the absolute path to use with O=, because the relative
@@ -316,7 +342,7 @@ def gen_config(instance, log):
         if ret != 0:
             log_write(log, "ERROR: cannot generate random configuration")
             return -1
-        if fixup_config(instance):
+        if fixup_config(instance, sysinfo):
             break
 
     ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
@@ -436,7 +462,7 @@ def send_results(instance, http_login, http_password, submitter, log, result):
 # This function implements the main per-instance loop, which prepares
 # the build, generate a configuration, runs the build, and submits the
 # results.
-def run_instance(instance, njobs, http_login, http_password, submitter):
+def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo):
     idir = "instance-%d" % instance
 
     # If it doesn't exist, create the instance directory
@@ -452,7 +478,7 @@ def run_instance(instance, njobs, http_login, http_password, submitter):
         if ret != 0:
             continue
 
-        ret = gen_config(instance, instance_log)
+        ret = gen_config(instance, instance_log, sysinfo)
         if ret != 0:
             continue
 
@@ -523,6 +549,7 @@ Format of the configuration file:
 if __name__ == '__main__':
     check_version()
     check_requirements()
+    sysinfo = SystemInfo()
     (ninstances, njobs, http_login, http_password, submitter) = config_get()
     if http_login is None or http_password is None:
         print "WARN: due to the lack of http login/password details, results will not be submitted"
@@ -532,7 +559,7 @@ if __name__ == '__main__':
         sys.exit(1)
     processes = []
     for i in range(0, ninstances):
-        p = Process(target=run_instance, args=(i, njobs, http_login, http_password, submitter))
+        p = Process(target=run_instance, args=(i, njobs, http_login, http_password, submitter, sysinfo))
         p.start()
         processes.append(p)
     signal.signal(signal.SIGTERM, sigterm_handler)
-- 
2.0.0
