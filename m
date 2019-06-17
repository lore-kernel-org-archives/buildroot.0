From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:22:35 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/2] scripts/autobuild-run: make
 the HTTP URL really configurable
Message-ID: <20190617182236.23918-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --http-url option allowed to customize the URL at which build
results are submitted. However, there were two other places in the
script where autobuild.buildroot.org was hardcoded: when checking the
script version, and when getting the list of branches to build.

This commit changes the --http-url to be the base URL of the autobuild
server, and it is used everywhere instead of hardcoding
autobuild.buildroot.org.

Note: users of autobuild-run that were passing a custom --http-url
option such as http://foo.com/submit/ should change it to just
http://foo.com/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 scripts/autobuild-run | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 601fb31..6fea389 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -66,7 +66,7 @@ defaults = {
     '--make-opts': '',
     '--nice': 0,
     '--pid-file': '/tmp/buildroot-autobuild.pid',
-    '--http-url': 'http://autobuild.buildroot.org/submit/',
+    '--http-url': 'http://autobuild.buildroot.org/',
     '--toolchains-csv': 'support/config-fragments/autobuild/toolchain-configs.csv',
     '--repo': 'https://github.com/buildroot/buildroot.git',
 }
@@ -145,6 +145,7 @@ from distutils.version import StrictVersion
 import platform
 from threading import Thread, Event
 import datetime
+import urlparse
 
 if sys.hexversion >= 0x3000000:
     import configparser
@@ -178,23 +179,23 @@ def log_write(logf, msg):
     logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()), msg))
     logf.flush()
 
-def check_version():
-    with urlopen_closing('http://autobuild.buildroot.org/version') as r:
+def check_version(**kwargs):
+    with urlopen_closing(urlparse.urljoin(kwargs['http_url'], 'version')) as r:
         version = int(decode_bytes(r.readline()).strip())
     if version > VERSION:
         print("ERROR: script version too old, please upgrade.")
         sys.exit(1)
 
-def get_branch():
+def get_branch(**kwargs):
     """Returns the branch that should be built. It fetches a CSV file from
-    autobuild.buildroot.org that provides the list of branches to test
+    the autobuild server that provides the list of branches to test
     (first field) and their weight (second field). We build a list of
     branches, where the branch name is repeated N times, with N being
     the weight of the branch. We then pick a random branch in this
     list. This way, branches with a higher weight are more likely to
     be selected.
     """
-    with urlopen_closing('http://autobuild.buildroot.org/branches') as r:
+    with urlopen_closing(urlparse.urljoin(kwargs['http_url'], 'branches')) as r:
         csv_branches = r.readlines()
     branches = []
     for branch in csv.reader(csv_branches):
@@ -314,7 +315,7 @@ def prepare_build(**kwargs):
                   os.path.relpath(f, dldir))
         os.remove(f)
 
-    branch = get_branch()
+    branch = get_branch(**kwargs)
     log_write(log, "INFO: testing branch '%s'" % branch)
 
     # Clone Buildroot. This only happens if the source directory
@@ -679,7 +680,7 @@ def send_results(result, **kwargs):
                                "-H", "Expect:",
                                "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
                                "-F", "uploadsubmit=1",
-                               kwargs['http_url']],
+                               urlparse.urljoin(kwargs['http_url'], 'submit/')],
                               stdout=log, stderr=log)
         if ret != 0:
             log_write(log, "INFO: results could not be submitted, %d" % ret)
@@ -713,7 +714,7 @@ def run_instance(**kwargs):
     log_write(kwargs['log'], "INFO: instance started")
 
     while True:
-        check_version()
+        check_version(**kwargs)
 
         ret = prepare_build(**kwargs)
         if ret != 0:
@@ -774,7 +775,6 @@ def main():
     # showing error messages in another language.
     os.environ['LC_ALL'] = 'C'
 
-    check_version()
     sysinfo = SystemInfo()
 
     args = docopt.docopt(doc, version=VERSION)
-- 
2.21.0
