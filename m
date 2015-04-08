From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  8 Apr 2015 22:34:43 +0200
Subject: [Buildroot] [PATCH UNTESTED] autobuild-run: handle failed network
	connection
Message-ID: <1428525283-8015-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Due to a network failure, checking of the autobuild-run version or
obtaining the toolchain configurations could fail, causing the instance to
stop with an exception (and not restarting automatically).

Fix this scenario by catching such errors and continuing with a new build.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: UNTESTED!
---
 scripts/autobuild-run | 62 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0e12080..350a137 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -158,11 +158,15 @@ def log_write(logf, msg):
     logf.flush()
 
 def check_version():
-    with urlopen_closing('http://autobuild.buildroot.org/version') as r:
-        version = int(decode_bytes(r.readline()).strip())
-    if version > VERSION:
-        print("ERROR: script version too old, please upgrade.")
-        sys.exit(1)
+    try:
+        with urlopen_closing('http://autobuild.buildroot.org/version') as r:
+            version = int(decode_bytes(r.readline()).strip())
+        if version > VERSION:
+            print("ERROR: script version too old, please upgrade.")
+            sys.exit(1)
+    except _urllib.URLError:
+        # couldn't check version, assume it's OK
+        pass
 
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
@@ -242,27 +246,30 @@ def get_toolchain_configs():
     """
     tc_cfg_uri = 'http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
 
-    with urlopen_closing(tc_cfg_uri) as r:
-        l = decode_byte_list(r.readlines())
-    configs = []
-
-    (_, _, _, _, hostarch) = os.uname()
-    if hostarch == 'i686' or hostarch == 'x86_64':
-        hostarch = 'x86'
-
-    for row in csv.reader(l):
-        config = {}
-        config["url"] = row[0]
-        config["hostarch"] = row[1]
-        # Ignore toolchains that are not built for the appropriate
-        # host architecture
-        if hostarch != config["hostarch"]:
-            continue
-        config["libc"] = row[2]
-        with urlopen_closing(config["url"]) as r:
-            config["contents"] = decode_byte_list(r.readlines())
-        configs.append(config)
-    return configs
+    try:
+        with urlopen_closing(tc_cfg_uri) as r:
+            l = decode_byte_list(r.readlines())
+        configs = []
+
+        (_, _, _, _, hostarch) = os.uname()
+        if hostarch == 'i686' or hostarch == 'x86_64':
+            hostarch = 'x86'
+
+        for row in csv.reader(l):
+            config = {}
+            config["url"] = row[0]
+            config["hostarch"] = row[1]
+            # Ignore toolchains that are not built for the appropriate
+            # host architecture
+            if hostarch != config["hostarch"]:
+                continue
+            config["libc"] = row[2]
+            with urlopen_closing(config["url"]) as r:
+                config["contents"] = decode_byte_list(r.readlines())
+            configs.append(config)
+        return configs
+    except _urllib.URLError:
+        return []
 
 def prepare_build(**kwargs):
     """Prepare for the next build of the specified instance
@@ -471,6 +478,9 @@ def gen_config(**kwargs):
 
     # Select a random toolchain configuration
     configs = get_toolchain_configs()
+    if not configs:
+        log_write(log, "WARNING: no toolchain configurations could be retrieved. Network issue?")
+        return -1
     i = randint(0, len(configs) - 1)
     config = configs[i]
 
-- 
1.8.5.1
