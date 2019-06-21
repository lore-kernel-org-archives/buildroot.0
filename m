From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:13 +0530
Subject: [Buildroot] [PATCH 02/19] autobuild-run: move instance variable
 from kwargs to Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-2-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed in the previous patch, these common variables are needed
in many functions, and it'll be better to have them as part of the class.
This will make the code cleaner and make it easier to introduce variability
for reproducibility testing. Succeeding patches will move all variables from
kwargs to the Builder constructor.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 254d1b6..291cd9f 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -271,6 +271,9 @@ class SystemInfo:
         return not missing_requirements
 
 class Builder:
+    def __init__(self, instance):
+        self.instance = instance
+
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
 
@@ -279,7 +282,7 @@ class Builder:
         code, and cleaning up remaining stuff from previous builds.
         """
 
-        idir = "instance-%d" % kwargs['instance']
+        idir = "instance-%d" % self.instance
         log = kwargs['log']
 
         log_write(log, "INFO: preparing a new build")
@@ -353,7 +356,7 @@ class Builder:
 
     def gen_config(self, **kwargs):
         """Generate a new random configuration."""
-        idir = "instance-%d" % kwargs['instance']
+        idir = "instance-%d" % self.instance
         log = kwargs['log']
         outputdir = os.path.abspath(os.path.join(idir, "output"))
         srcdir = os.path.join(idir, "buildroot")
@@ -403,7 +406,7 @@ class Builder:
         """
 
         log = kwargs['log']
-        idir = "instance-%d" % kwargs['instance']
+        idir = "instance-%d" % self.instance
         outputdir = os.path.join(idir, "output")
         srcdir = os.path.join(idir, "buildroot")
         reproducible_results = os.path.join(outputdir, "results", "reproducible_results")
@@ -435,7 +438,7 @@ class Builder:
     def do_build(self, **kwargs):
         """Run the build itself"""
 
-        idir = "instance-%d" % kwargs['instance']
+        idir = "instance-%d" % self.instance
         log = kwargs['log']
         nice = kwargs['nice']
 
@@ -466,9 +469,9 @@ class Builder:
         build_monitor.daemon = True
         build_monitor.start()
 
-        kwargs['buildpid'][kwargs['instance']] = sub.pid
+        kwargs['buildpid'][self.instance] = sub.pid
         ret = sub.wait()
-        kwargs['buildpid'][kwargs['instance']] = 0
+        kwargs['buildpid'][self.instance] = 0
 
         # If build failed, monitor thread would have exited at this point
         if monitor_thread_hung_build_flag.is_set():
@@ -500,7 +503,7 @@ class Builder:
         perform the actual build.
         """
 
-        idir = "instance-%d" % kwargs['instance']
+        idir = "instance-%d" % self.instance
         outputdir = os.path.abspath(os.path.join(idir, "output"))
         srcdir = os.path.join(idir, "buildroot")
         log = kwargs['log']
@@ -538,7 +541,7 @@ class Builder:
         are available) or stores them locally as tarballs.
         """
 
-        idir = "instance-%d" % kwargs['instance']
+        idir = "instance-%d" % self.instance
         log = kwargs['log']
 
         outputdir = os.path.abspath(os.path.join(idir, "output"))
@@ -690,7 +693,7 @@ class Builder:
             # No http login/password, keep tarballs locally
             with open(os.path.join(outputdir, "results.tar.bz2"), 'rb') as f:
                 sha1 = hashlib.sha1(f.read()).hexdigest()
-            resultfilename = "instance-%d-%s.tar.bz2" % (kwargs['instance'], sha1)
+            resultfilename = "instance-%d-%s.tar.bz2" % (self.instance, sha1)
             os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
             log_write(log, "INFO: results saved as %s" % resultfilename)
 
@@ -701,7 +704,7 @@ class Builder:
         results.
         """
 
-        idir = "instance-%d" % kwargs['instance']
+        idir = "instance-%d" % self.instance
 
         # If it doesn't exist, create the instance directory
         if not os.path.exists(idir):
@@ -840,9 +843,8 @@ def main():
     buildpid = multiprocessing.Array('i', int(args['--ninstances']))
     processes = []
     for i in range(0, int(args['--ninstances'])):
-        builder = Builder()
+        builder = Builder(i)
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                instance = i,
                 njobs = args['--njobs'],
                 sysinfo = sysinfo,
                 http_url = args['--http-url'],
-- 
2.20.1
