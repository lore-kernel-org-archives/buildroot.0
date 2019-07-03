From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  4 Jul 2019 00:01:36 +0530
Subject: [Buildroot] [PATCH v2 04/27] autobuild-run: move sysinfo from
 kwargs to Builder class
In-Reply-To: <20190703183159.3415-1-itsatharva@gmail.com>
References: <20190703183159.3415-1-itsatharva@gmail.com>
Message-ID: <20190703183159.3415-4-itsatharva@gmail.com>
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
 scripts/autobuild-run | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 4d730ce..ca2dd83 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -271,9 +271,10 @@ class SystemInfo:
         return not missing_requirements
 
 class Builder:
-    def __init__(self, instance, njobs):
+    def __init__(self, instance, njobs, sysinfo):
         self.instance = instance
         self.njobs = njobs
+        self.sysinfo = sysinfo
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -416,7 +417,7 @@ class Builder:
         build_2_image = os.path.join(outputdir, "images", "rootfs.tar")
 
         with open(reproducible_results, 'w') as diff:
-            if kwargs['sysinfo'].has("diffoscope"):
+            if self.sysinfo.has("diffoscope"):
                 # Prefix to point diffoscope towards cross-tools
                 prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
                 # Remove TARGET_CROSS= and \n from the string
@@ -846,9 +847,9 @@ def main():
     for i in range(0, int(args['--ninstances'])):
         builder = Builder(
             instance = i,
-            njobs = args['--njobs'])
+            njobs = args['--njobs'],
+            sysinfo = sysinfo)
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                sysinfo = sysinfo,
                 http_url = args['--http-url'],
                 http_login = args['--http-login'],
                 http_password = args['--http-password'],
-- 
2.22.0
