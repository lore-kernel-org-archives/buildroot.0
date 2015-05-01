From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Fri,  1 May 2015 17:58:51 +0200
Subject: [Buildroot] [PATCH 1/1] autobuild-run: show options along with
	their defaults
Message-ID: <1430495931-20779-1-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the default values for options are printed at the end of the help
message, so there is a visual distance between the "--<option>" help and its
default value that increases with every newly introduced option.

Move them closer together by means of str-dict formatting, "%(key)s".

"[default: ]" cannot be used as it gets parsed by docopt,
using "Defaults to ...", "Not set by default", ... phrases instead.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0e12080..6d029b5 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -74,17 +74,23 @@ Options:
   -h, --help                     show this help message and exit
   -V, --version                  show version
   -n, --ninstances NINSTANCES    number of parallel instances
+                                 Defaults to %(--ninstances)s.
   -j, --njobs NJOBS              number of parallel jobs
+                                 Defaults to %(--njobs)s.
   -s, --submitter SUBMITTER      name/machine of submitter
+                                 Defaults to %(--submitter)s.
   --http-login LOGIN             username to send results with
+                                 Not set by default.
   --http-password PASSWORD       password to send results with (for security
                                  reasons it is recommended to define this in the
                                  config file instead, with user-read permissions
                                  only)
+                                 Not set by default.
   --make-opts OPTSTRING          string of extra options to pass to Buildroot
                                  make, such as specific command wrappers
-                                 [default: ]
+                                 Empty by default.
   -c, --config CONFIG            path to configuration file
+                                 Not set by default.
 
 Format of the configuration file:
 
@@ -99,11 +105,8 @@ Format of the configuration file:
    http-password = <value>
    submitter = <value>
 
-Default values for the arguments are:
 
-  %s
-""" % '\n  '.join(
-    ['%s = %s' % (key, val) for (key, val) in defaults.items()])
+""" % defaults
 
 __doc__ = doc
 
@@ -839,7 +842,7 @@ def main():
                 http_login = args['--http-login'],
                 http_password = args['--http-password'],
                 submitter = args['--submitter'],
-                make_opts = args['--make-opts'],
+                make_opts = (args['--make-opts'] or ''),
                 upload = upload,
                 buildpid = buildpid
             ))
-- 
2.3.6
