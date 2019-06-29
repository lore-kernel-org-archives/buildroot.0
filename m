From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 29 Jun 2019 10:31:53 +0530
Subject: [Buildroot] [PATCH 06/27] autobuild-run: move submitter from kwargs
 to Builder class
In-Reply-To: <20190629050214.17852-1-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
Message-ID: <20190629050214.17852-6-itsatharva@gmail.com>
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
index 2c3da00..e695275 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -272,13 +272,15 @@ class SystemInfo:
 
 class Builder:
     def __init__(self, instance, njobs, sysinfo,
-                 http_url, http_login, http_password):
+                 http_url, http_login, http_password,
+                 submitter):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
         self.http_url = http_url
         self.http_login = http_login
         self.http_password = http_password
+        self.submitter = submitter
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -670,7 +672,7 @@ class Builder:
         resultf.close()
 
         with open(os.path.join(resultdir, "submitter"), "w+") as submitterf:
-            submitterf.write(kwargs['submitter'])
+            submitterf.write(self.submitter)
 
         # Yes, shutil.make_archive() would be nice, but it doesn't exist
         # in Python 2.6.
@@ -855,9 +857,9 @@ def main():
             sysinfo = sysinfo,
             http_url = args['--http-url'],
             http_login = args['--http-login'],
-            http_password = args['--http-password'])
+            http_password = args['--http-password'],
+            submitter = args['--submitter'])
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                submitter = args['--submitter'],
                 make_opts = (args['--make-opts'] or ''),
                 nice = (args['--nice'] or 0),
                 toolchains_csv = args['--toolchains-csv'],
-- 
2.20.1
