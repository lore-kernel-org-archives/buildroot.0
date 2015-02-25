From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:18 +0100
Subject: [Buildroot] [PATCH 01/13] autobuild-run,
	python3: print is a function
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-2-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commands used for editing:
  2to ./scripts/autobuild-run -f print -w

Py2k compatibility: via __future__ import

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a75006f..2354893 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -57,6 +57,8 @@
 #   BR2_PACKAGE_CLASSPATH=y, improve the script to detect whether the
 #   necessary host machine requirements are there to build classpath.
 
+from __future__ import print_function
+
 import urllib2
 import csv
 from random import randint
@@ -82,7 +84,7 @@ def check_version():
     r = urllib2.urlopen('http://autobuild.buildroot.org/version')
     version = int(r.readline().strip())
     if version > VERSION:
-        print "ERROR: script version too old, please upgrade."
+        print("ERROR: script version too old, please upgrade.")
         sys.exit(1)
 
 def check_requirements(http_login, http_password):
@@ -96,7 +98,7 @@ def check_requirements(http_login, http_password):
     for prog in needed_progs:
         ret = subprocess.call(["which", prog], stdout=devnull, stderr=devnull)
         if ret != 0:
-            print "ERROR: your system lacks the '%s' program" % prog
+            print("ERROR: your system lacks the '%s' program" % prog)
             missing_requirements = True
 
     if missing_requirements:
@@ -576,11 +578,11 @@ Format of the configuration file:
 
     if args.config:
         if not os.path.exists(args.config):
-            print "ERROR: configuration file %s does not exist" % args.config
+            print("ERROR: configuration file %s does not exist" % args.config)
             sys.exit(1)
         parser = ConfigParser.RawConfigParser()
         if not parser.read([args.config]):
-            print "ERROR: cannot parse configuration file %s" % args.config
+            print("ERROR: cannot parse configuration file %s" % args.config)
             sys.exit(1)
         if parser.has_option('main', 'ninstances'):
             ninstances = parser.getint('main', 'ninstances')
@@ -608,8 +610,8 @@ def main():
     (ninstances, njobs, http_login, http_password, submitter) = config_get()
     check_requirements(http_login, http_password)
     if http_login is None or http_password is None:
-        print "WARN: due to the lack of http login/password details, results will not be submitted"
-        print "WARN: tarballs of results will be kept locally only"
+        print("WARN: due to the lack of http login/password details, results will not be submitted")
+        print("WARN: tarballs of results will be kept locally only")
     def sigterm_handler(signum, frame):
         os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
         sys.exit(1)
-- 
2.3.0
