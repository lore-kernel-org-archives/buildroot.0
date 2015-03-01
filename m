From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun,  1 Mar 2015 22:09:46 +0100
Subject: [Buildroot] [PATCH 1/2] autobuild-run: correctly handle default
	argument values
Message-ID: <1425244187-21189-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

In the original code sent on the mailing list, priority for arguments was
given to the config file, followed by arguments passed on the command-line.
In this order, the defaults specified to docopt would indeed be treated as
lowest priority, as expected.

However, the arguments specified on the command-line should have priority
over those from the config file, so the expected priority is:
    command-line > config file > defaults

By switching the order of argument dictionaries when calling the merge
method, the defaults are no longer handled correctly. To fix this, we must
not tell docopt about the defaults, but keep them in a separate dictionary.
Then, using a two-step merge we can obtain the right priority for arguments.

For some reason, docopt does not like us passing __doc__ directly if it is
constructed dynamically with %s specifiers. Work around this via an
intermediate variable doc.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 442531f..246a032 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -59,16 +59,25 @@
 #   message 'directory not empty' which suggests that someone is writing to the
 #   directory at the time of removal.
 
-"""autobuild-run - run Buildroot autobuilder
+# Don't tell docopt about the defaults, as it would not allow the following
+# priority hierarchy for arguments: command-line > config file > defaults
+defaults = {
+    '--ninstances': '1',
+    '--njobs': '1',
+    '--submitter': 'N/A',
+    '--make-opts': '',
+}
+
+doc = """autobuild-run - run Buildroot autobuilder
 
 Usage: autobuild-run [options]
 
 Options:
   -h, --help                     show this help message and exit
   -V, --version                  show version
-  -n, --ninstances NINSTANCES    number of parallel instances [default: 1]
-  -j, --njobs NJOBS              number of parallel jobs [default: 1]
-  -s, --submitter SUBMITTER      name/machine of submitter [default: N/A]
+  -n, --ninstances NINSTANCES    number of parallel instances
+  -j, --njobs NJOBS              number of parallel jobs
+  -s, --submitter SUBMITTER      name/machine of submitter
   --http-login LOGIN             username to send results with
   --http-password PASSWORD       password to send results with (for security
                                  reasons it is recommended to define this in the
@@ -91,7 +100,14 @@ Format of the configuration file:
    http-login = <value>
    http-password = <value>
    submitter = <value>
-"""
+
+Default values for the arguments are:
+
+  %s
+""" % '\n  '.join(
+    ['%s = %s' % (key, val) for (key, val) in defaults.iteritems()])
+
+__doc__ = doc
 
 import urllib2
 import csv
@@ -700,13 +716,16 @@ def main():
     check_version()
     sysinfo = SystemInfo()
 
-    args = docopt.docopt(__doc__, version=VERSION)
+    args = docopt.docopt(doc, version=VERSION)
 
     if args['--config']:
         ini_config = load_ini_config(args['--config'])
         # merge config/args, priority given to args
         args = merge(args, ini_config)
 
+    # load in defaults at lowest priority
+    args = merge(args, defaults)
+
     # http_login/password could theoretically be allowed as empty, so check
     # explicitly on None.
     upload = (args['--http-login'] is not None) \
-- 
1.8.5.1
