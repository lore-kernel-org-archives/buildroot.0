From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:19 +0530
Subject: [Buildroot] [PATCH 08/19] autobuild-run: move toolchains_csv from
 kwargs to Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-8-itsatharva@gmail.com>
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
index a435570..f737b27 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -273,7 +273,7 @@ class SystemInfo:
 class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
-                 submitter, make_opts, nice):
+                 submitter, make_opts, nice, toolchains_csv):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -283,6 +283,7 @@ class Builder:
         self.submitter = submitter
         self.make_opts = make_opts
         self.nice = nice
+        self.toolchains_csv = toolchains_csv
 
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
@@ -381,7 +382,7 @@ class Builder:
         args = [os.path.join(srcdir, "utils/genrandconfig"),
                 "-o", outputdir, "-b", srcdir]
 
-        toolchains_csv = kwargs['toolchains_csv']
+        toolchains_csv = self.toolchains_csv
         if toolchains_csv:
             if not os.path.isabs(toolchains_csv):
                 toolchains_csv = os.path.join(srcdir, toolchains_csv)
@@ -855,9 +856,8 @@ def main():
         builder = Builder(i, args['--njobs'], sysinfo, args['--http-url'],
                           args['--http-login'], args['--http-password'],
                           args['--submitter'], (args['--make-opts'] or ''),
-                          (args['--nice'] or 0))
+                          (args['--nice'] or 0), args['--toolchains-csv'])
         p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
-                toolchains_csv = args['--toolchains-csv'],
                 repo = args['--repo'],
                 upload = upload,
                 buildpid = buildpid,
-- 
2.20.1
