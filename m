From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:14 +0530
Subject: [Buildroot] [PATCH 03/19] autobuild-run: move njobs from kwargs to
 Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-3-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 291cd9f..82b8f45 100755
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
-                "BR2_JLEVEL=%s" % kwargs['njobs']] \
+                "BR2_JLEVEL=%s" % self.njobs] \
             + kwargs['make_opts'].split()
         sub = subprocess.Popen(cmd, stdout=f, stderr=f)
 
@@ -843,9 +844,8 @@ def main():
     buildpid = multiprocessing.Array('i', int(args['--ninstances']))
     processes = []
     for i in range(0, int(args['--ninstances'])):
-        builder = Builder(i)
+        builder = Builder(i, args['--njobs'])
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                njobs = args['--njobs'],
                 sysinfo = sysinfo,
                 http_url = args['--http-url'],
                 http_login = args['--http-login'],
-- 
2.20.1
