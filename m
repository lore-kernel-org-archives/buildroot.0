From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:19 +0100
Subject: [Buildroot] [PATCH 02/13] autobuild-run,
	python3: urllib.request<>urllib2
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-3-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

urllib2 has been split into several modules,
urlopen() is now part of urllib.request.

Py2k compatibility: import urllib2 if python version < 3

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2354893..be2f482 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -59,7 +59,6 @@
 
 from __future__ import print_function
 
-import urllib2
 import csv
 from random import randint
 import subprocess
@@ -73,6 +72,13 @@ import hashlib
 import argparse
 import ConfigParser
 
+if sys.hexversion >= 0x3000000:
+    import urllib.request as _urllib
+else:
+    import urllib2 as _urllib
+
+urlopen = _urllib.urlopen
+
 MAX_DURATION = 60 * 60 * 4
 VERSION = 1
 
@@ -81,7 +87,7 @@ def log_write(logf, msg):
     logf.flush()
 
 def check_version():
-    r = urllib2.urlopen('http://autobuild.buildroot.org/version')
+    r = urlopen('http://autobuild.buildroot.org/version')
     version = int(r.readline().strip())
     if version > VERSION:
         print("ERROR: script version too old, please upgrade.")
@@ -136,7 +142,7 @@ def get_toolchain_configs():
         - contents: an array of lines of the defconfig
     """
 
-    r = urllib2.urlopen('http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv')
+    r = urlopen('http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv')
     l = r.readlines()
     configs = []
     for row in csv.reader(l):
@@ -151,7 +157,7 @@ def get_toolchain_configs():
         if hostarch != config["hostarch"]:
             continue
         config["libc"] = row[2]
-        r = urllib2.urlopen(config["url"])
+        r = urlopen(config["url"])
         config["contents"] = r.readlines()
         configs.append(config)
     return configs
-- 
2.3.0
