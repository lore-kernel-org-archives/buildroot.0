From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Sat, 22 Oct 2016 16:27:15 +0300
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
	"--http-url" option for submition URL
Message-ID: <1477142835-17843-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces "--http-url" option.
Described option is used to pass URL of the resourse to submit the
results of the script.

Default value refers to standard buildroot sumbition URL:
http://autobuild.buildroot.org/submit/

Such update allows users to submit ther results not only to
standard buildroot autobuild resource but also somewhere
else.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 scripts/autobuild-run | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 33a0481..7ba10bd 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -66,6 +66,7 @@ defaults = {
     '--make-opts': '',
     '--nice': 0,
     '--pid-file': '/tmp/buildroot-autobuild.pid',
+    '--http-url': 'http://autobuild.buildroot.org/submit/',
 }
 
 doc = """autobuild-run - run Buildroot autobuilder
@@ -83,6 +84,8 @@ Options:
                                  Defaults to %(--nice)s.
   -s, --submitter SUBMITTER      name/machine of submitter
                                  Defaults to %(--submitter)s.
+  --http-url URL                 URL of resource to submit your results.
+                                 Defaults to $(--http-url)s.
   --http-login LOGIN             username to send results with
                                  Not set by default.
   --http-password PASSWORD       password to send results with (for security
@@ -755,7 +758,7 @@ def send_results(result, **kwargs):
                                "-H", "Expect:",
                                "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
                                "-F", "uploadsubmit=1",
-                               "http://autobuild.buildroot.org/submit/"],
+                               kwargs['http_url']],
                               stdout=log, stderr=log)
         if ret != 0:
             log_write(log, "INFO: results could not be submitted, %d" % ret)
@@ -900,6 +903,7 @@ def main():
                 instance = i,
                 njobs = args['--njobs'],
                 sysinfo = sysinfo,
+                http_url = args['--http-url'],
                 http_login = args['--http-login'],
                 http_password = args['--http-password'],
                 submitter = args['--submitter'],
-- 
2.5.5
