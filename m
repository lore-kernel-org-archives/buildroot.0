From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:27 +0100
Subject: [Buildroot] [PATCH 10/13] autobuild-run: use a built-in has_prog()
	implementation
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-11-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to call subprocess.call(["which",name]).

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 9c3e36c..29d1bbb 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -109,9 +109,20 @@ def check_version():
         print("ERROR: script version too old, please upgrade.")
         sys.exit(1)
 
-def has_prog(name):
-    with open(os.devnull, "w") as devnull:
-        return subprocess.call(["which", name], stdout=devnull, stderr=devnull) == os.EX_OK
+def has_prog(name, flags=os.X_OK, env=os.environ):
+    if not name or name[0] == os.sep: raise ValueError(name)
+
+    prog_path = env.get("PATH", None)
+    # for windows compatibility, we'd need to take PATHEXT into account
+
+    if prog_path:
+        for prog_dir in filter(None, prog_path.split(os.pathsep)):
+            # os.join() not necessary: non-empty prog_dir and name[0] != os.sep
+            prog = prog_dir + os.sep + name
+            if os.access(prog, flags):
+                return True
+    # --
+    return False
 
 def check_requirements(http_login, http_password):
     needed_progs = ["make", "git", "gcc", "timeout"]
-- 
2.3.0
