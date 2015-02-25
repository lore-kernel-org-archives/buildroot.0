From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:26 +0100
Subject: [Buildroot] [PATCH 09/13] autobuild-run: unify "which <prog>" code
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-10-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 52577e7..9c3e36c 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -109,8 +109,11 @@ def check_version():
         print("ERROR: script version too old, please upgrade.")
         sys.exit(1)
 
+def has_prog(name):
+    with open(os.devnull, "w") as devnull:
+        return subprocess.call(["which", name], stdout=devnull, stderr=devnull) == os.EX_OK
+
 def check_requirements(http_login, http_password):
-    devnull = open(os.devnull, "w")
     needed_progs = ["make", "git", "gcc", "timeout"]
     missing_requirements = False
 
@@ -118,8 +121,7 @@ def check_requirements(http_login, http_password):
         needed_progs.append("curl")
 
     for prog in needed_progs:
-        ret = subprocess.call(["which", prog], stdout=devnull, stderr=devnull)
-        if ret != 0:
+        if not has_prog(prog):
             print("ERROR: your system lacks the '%s' program" % prog)
             missing_requirements = True
 
@@ -129,24 +131,18 @@ def check_requirements(http_login, http_password):
 class SystemInfo:
     def __init__(self):
         devnull = open(os.devnull, "w")
+        # _grep_gcj :: str -> int
+        _grep_gcj = lambda prog: \
+            subprocess.call("%s -version | grep gcj" % prog, shell=True,
+                            stdout=devnull, stderr=devnull)
 
-        self.has_bzr = \
-          subprocess.call(["which", "bzr"], stdout=devnull, stderr=devnull) == 0
+        self.has_bzr = has_prog("bzr")
 
-        self.has_java = False
-        if subprocess.call(["which", "java"], stdout=devnull, stderr=devnull) == 0:
-            if subprocess.call("java -version | grep gcj", shell=True,
-                               stdout=devnull, stderr=devnull) == 1:
-                self.has_java = True
+        self.has_java = has_prog("java") and _grep_gcj("java") == 1
 
-        self.has_javac = False
-        if subprocess.call(["which", "javac"], stdout=devnull, stderr=devnull) == 0:
-            if subprocess.call("javac -version | grep gcj", shell=True,
-                               stdout=devnull, stderr=devnull) == 1:
-                self.has_javac = True
+        self.has_javac = has_prog("javac") and _grep_gcj("javac") == 1
 
-        self.has_jar = \
-          subprocess.call(["which", "jar"], stdout=devnull, stderr=devnull) == 0
+        self.has_jar = has_prog("jar")
 
 def get_toolchain_configs():
     """Fetch and return the possible toolchain configurations
-- 
2.3.0
