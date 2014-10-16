From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 16 Oct 2014 21:15:59 +0200
Subject: [Buildroot] [PATCH buildroot-test 3/8] autobuild-run: use docopt
	for argument parsing
In-Reply-To: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413486964-5183-3-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Using docopt, argument parsing becomes trivial. Adding a new argument is
a matter of updating the usage text.
This commit removes the original cumbersome argument handling and uses
docopt instead. A method is added to import the settings from the
configuration file in a similar dictionary as the one created by docopt,
so that both can be merged (giving priority to the configuration file,
as before).

With these changes, each option can be passed as argument and in the
configuration file. This means that http-user and http-password can now
also be added as argument (even though passing the password on the
command-line is not recommended).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 131 ++++++++++++++++++++++++++------------------------
 1 file changed, 69 insertions(+), 62 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2ead1f2..8c1918c 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -57,6 +57,37 @@
 #   BR2_PACKAGE_CLASSPATH=y, improve the script to detect whether the
 #   necessary host machine requirements are there to build classpath.
 
+"""autobuild-run - run Buildroot autobuilder
+
+Usage: autobuild-run [options]
+
+Options:
+  -h, --help                     show this help message and exit
+  -V, --version                  show version
+  -n, --ninstances NINSTANCES    number of parallel instances [default: 1]
+  -j, --njobs NJOBS              number of parallel jobs [default: 1]
+  -s, --submitter SUBMITTER      name/machine of submitter [default: N/A]
+  --http-login LOGIN             username to send results with
+  --http-password PASSWORD       password to send results with (for security
+                                 reasons it is recommended to define this in the
+                                 config file instead, with user-read permissions
+                                 only)
+  -c, --config CONFIG            path to configuration file
+
+Format of the configuration file:
+
+  All arguments can also be specified in the configuration file specified with
+  --config, using 'key = value' format (not including the leading --
+  characters). For example:
+
+   [main]
+   ninstances = <value>
+   njobs = <value>
+   http-login = <value>
+   http-password = <value>
+   submitter = <value>
+"""
+
 import urllib2
 import csv
 from random import randint
@@ -70,6 +101,7 @@ import sys
 import hashlib
 import argparse
 import ConfigParser
+from docopt import docopt
 
 MAX_DURATION = 60 * 60 * 4
 VERSION = 1
@@ -488,72 +520,45 @@ def run_instance(instance, njobs, http_login, http_password, submitter, sysinfo)
         ret = do_build(instance, njobs, instance_log)
         send_results(instance, http_login, http_password, submitter, instance_log, ret)
 
-# Function to get the configuration parameters, either from the
-# command line, or through a configuration file.
-def config_get():
-    epilog_text = """
-Format of the configuration file:
+# args / config file merging inspired by:
+# https://github.com/docopt/docopt/blob/master/examples/config_file_example.py
+def load_ini_config(configfile):
+    if not os.path.exists(configfile):
+        print "ERROR: configuration file %s does not exist" % configfile
+        sys.exit(1)
 
-   [main]
-   ninstances = <value>
-   njobs = <value>
-   http-login = <value>
-   http-password = <value>
-   submitter = <value>
-"""
+    config = ConfigParser.RawConfigParser()
+    if not config.read(configfile):
+        print "ERROR: cannot parse configuration file %s" % configfile
+        sys.exit(1)
 
-    parser = argparse.ArgumentParser(description='Run Buildroot autobuilder',
-                                     formatter_class=argparse.RawDescriptionHelpFormatter,
-                                     epilog=epilog_text)
-    parser.add_argument("--ninstances", '-n', metavar="NINSTANCES",
-                        help="Number of parallel instances", default=None)
-    parser.add_argument("--njobs", '-j', metavar="NJOBS",
-                        help="Number of parallel jobs", default=None)
-    parser.add_argument("--submitter", '-s', metavar="SUBMITTER",
-                        help="Name/machine of submitter")
-    parser.add_argument("--config", '-c', metavar="CONFIG",
-                        help="Path to configuration file")
-    args = parser.parse_args()
-
-    ninstances = 1
-    njobs = 1
-    http_login = None
-    http_password = None
-    submitter = "N/A"
-
-    if args.config:
-        if not os.path.exists(args.config):
-            print "ERROR: configuration file %s does not exist" % args.config
-            sys.exit(1)
-        parser = ConfigParser.RawConfigParser()
-        if not parser.read([args.config]):
-            print "ERROR: cannot parse configuration file %s" % args.config
-            sys.exit(1)
-        if parser.has_option('main', 'ninstances'):
-            ninstances = parser.getint('main', 'ninstances')
-        if parser.has_option('main', 'njobs'):
-            njobs = parser.getint('main', 'njobs')
-        if parser.has_option('main', 'http-login'):
-            http_login = parser.get('main', 'http-login')
-        if parser.has_option('main', 'http-password'):
-            http_password = parser.get('main', 'http-password')
-        if parser.has_option('main', 'submitter'):
-            submitter = parser.get('main', 'submitter')
-
-    if args.njobs:
-        njobs = int(args.njobs)
-    if args.ninstances:
-        ninstances = int(args.ninstances)
-    if args.submitter:
-        submitter = args.submitter
-
-    return (ninstances, njobs, http_login, http_password, submitter)
+    # Prepend '--' to options specified in the config file, so they can be
+    # merged with those given on the command-line
+    return dict(('--%s' % key, value) for key, value in config.items('main'))
+
+
+def merge(dict_1, dict_2):
+    """Merge two dictionaries.
+
+    Values that evaluate to true take priority over falsy values.
+    `dict_1` takes priority over `dict_2`.
+
+    """
+    return dict((str(key), dict_1.get(key) or dict_2.get(key))
+                for key in set(dict_2) | set(dict_1))
 
 if __name__ == '__main__':
     check_version()
     sysinfo = SystemInfo()
-    (ninstances, njobs, http_login, http_password, submitter) = config_get()
-    do_send_results = http_login and http_password
+
+    args = docopt.docopt(__doc__, version=VERSION)
+
+    if args['--config']:
+        ini_config = load_ini_config(args['--config'])
+        # merge config/args, priority given to config
+        args = merge(ini_config, args)
+
+    do_send_results = args['--http-login'] and args['--http-password']
     check_requirements(do_send_results)
     if not do_send_results:
         print "WARN: due to the lack of http login/password details, results will not be submitted"
@@ -562,8 +567,10 @@ if __name__ == '__main__':
         os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
         sys.exit(1)
     processes = []
-    for i in range(0, ninstances):
-        p = Process(target=run_instance, args=(i, njobs, http_login, http_password, submitter, sysinfo))
+    for i in range(0, int(args['--ninstances'])):
+        p = Process(target=run_instance, args=(i, int(args['--njobs']),
+                args['--http-login'], args['--http-password'],
+                args['--submitter'], sysinfo))
         p.start()
         processes.append(p)
     signal.signal(signal.SIGTERM, sigterm_handler)
-- 
1.8.5.1
