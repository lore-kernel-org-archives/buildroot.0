From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 29 Jun 2019 10:31:50 +0530
Subject: [Buildroot] [PATCH 03/27] autobuild-run: move njobs from kwargs to
 Builder class
In-Reply-To: <20190629050214.17852-1-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
Message-ID: <20190629050214.17852-3-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - Explicitly state class constructor argument
---
 scripts/autobuild-run | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 10d61c0..b6da642 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -271,8 +271,9 @@ class SystemInfo:
         return not missing_requirements
 
 class Builder:
-    def __init__(self, instance):
+    def __init__(self, instance, njobs):
         self.instance = instance
+        self.njobs = njobs
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -455,7 +456,7 @@ class Builder:
         cmd = ["nice", "-n", str(nice),
                "make", "O=%s" % outputdir,
                "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
-               "BR2_JLEVEL=%s" % kwargs['njobs']] \
+               "BR2_JLEVEL=%s" % self.njobs] \
             + kwargs['make_opts'].split()
         sub = subprocess.Popen(cmd, stdout=f, stderr=f)
 
@@ -843,9 +844,10 @@ def main():
     buildpid = multiprocessing.Array('i', int(args['--ninstances']))
     processes = []
     for i in range(0, int(args['--ninstances'])):
-        builder = Builder(instance = i)
+        builder = Builder(
+            instance = i,
+            njobs = args['--njobs'])
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                njobs = args['--njobs'],
                 sysinfo = sysinfo,
                 http_url = args['--http-url'],
                 http_login = args['--http-login'],
-- 
2.20.1
