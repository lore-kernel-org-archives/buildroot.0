From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:23 +0100
Subject: [Buildroot] [PATCH 06/13] autobuild-run: explicitly close web file
	handles
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-7-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Close urlopen() file handles as soon as possible
rather than waiting until their refcount drops to zero.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 5db21b1..fee68b7 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -59,6 +59,7 @@
 
 from __future__ import print_function
 
+import contextlib
 import csv
 from random import randint
 import subprocess
@@ -79,6 +80,7 @@ else:
     import urllib2 as _urllib
 
 urlopen = _urllib.urlopen
+urlopen_closing = lambda uri: contextlib.closing(urlopen(uri))
 
 if sys.hexversion >= 0x3000000:
     def decode_bytes(b):
@@ -101,8 +103,8 @@ def log_write(logf, msg):
     logf.flush()
 
 def check_version():
-    r = urlopen('http://autobuild.buildroot.org/version')
-    version = int(decode_bytes(r.readline()).strip())
+    with urlopen_closing('http://autobuild.buildroot.org/version') as r:
+        version = int(decode_bytes(r.readline()).strip())
     if version > VERSION:
         print("ERROR: script version too old, please upgrade.")
         sys.exit(1)
@@ -155,9 +157,10 @@ def get_toolchain_configs():
         - hostarch: the host architecture for which the toolchain is built
         - contents: an array of lines of the defconfig
     """
+    tc_cfg_uri = 'http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
 
-    r = urlopen('http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv')
-    l = decode_byte_list(r.readlines())
+    with urlopen_closing(tc_cfg_uri) as r:
+        l = decode_byte_list(r.readlines())
     configs = []
     for row in csv.reader(l):
         config = {}
@@ -171,8 +174,8 @@ def get_toolchain_configs():
         if hostarch != config["hostarch"]:
             continue
         config["libc"] = row[2]
-        r = urlopen(config["url"])
-        config["contents"] = decode_byte_list(r.readlines())
+        with urlopen_closing(config["url"]) as r:
+            config["contents"] = decode_byte_list(r.readlines())
         configs.append(config)
     return configs
 
-- 
2.3.0
