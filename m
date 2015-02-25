From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:20 +0100
Subject: [Buildroot] [PATCH 03/13] autobuild-run, python3: bytes<>str,
	decode()
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-4-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

urlopen.read[lines]() returns bytes in py3 and text in py2.
Decode the bytes if necessary.

Py2k compatibility: no-op decode_bytes(), decode_byte_list() functions

Note: The Py2k variant of the decode_byte_list() function returns the
      input list, whereas the python3 variant creates a new list.

Note2: This commit does not add encode() functions, which could be necessary
       when writing non-ascii chars to files -- in Python3 only.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index be2f482..3a3b8de 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -79,6 +79,19 @@ else:
 
 urlopen = _urllib.urlopen
 
+if sys.hexversion >= 0x3000000:
+    def decode_bytes(b):
+        return b.decode()
+
+    def decode_byte_list(bl):
+        return [b.decode() for b in bl]
+else:
+    def _identity(e):
+        return e
+
+    decode_bytes = _identity
+    decode_byte_list = _identity
+
 MAX_DURATION = 60 * 60 * 4
 VERSION = 1
 
@@ -88,7 +101,7 @@ def log_write(logf, msg):
 
 def check_version():
     r = urlopen('http://autobuild.buildroot.org/version')
-    version = int(r.readline().strip())
+    version = int(decode_bytes(r.readline()).strip())
     if version > VERSION:
         print("ERROR: script version too old, please upgrade.")
         sys.exit(1)
@@ -143,7 +156,7 @@ def get_toolchain_configs():
     """
 
     r = urlopen('http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv')
-    l = r.readlines()
+    l = decode_byte_list(r.readlines())
     configs = []
     for row in csv.reader(l):
         config = {}
@@ -158,7 +171,7 @@ def get_toolchain_configs():
             continue
         config["libc"] = row[2]
         r = urlopen(config["url"])
-        config["contents"] = r.readlines()
+        config["contents"] = decode_byte_list(r.readlines())
         configs.append(config)
     return configs
 
-- 
2.3.0
