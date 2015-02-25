From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:28 +0100
Subject: [Buildroot] [PATCH 11/13] autobuild-run: move check_requirements()
	to SystemInfo
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-12-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* build up the list of (additional) essential programs in main()
  rather than passing the http credentials to check_requirements()

* can check for optional progs in fixup_config() without
  having to list them in sysinfo

* it'd be quite easy to dump the prog list to the logfile
  (for name, have_prog in sysinfo.progs.items(): ...)

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 120 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 48 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 29d1bbb..9c78cc5 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -109,51 +109,69 @@ def check_version():
         print("ERROR: script version too old, please upgrade.")
         sys.exit(1)
 
-def has_prog(name, flags=os.X_OK, env=os.environ):
-    if not name or name[0] == os.sep: raise ValueError(name)
-
-    prog_path = env.get("PATH", None)
-    # for windows compatibility, we'd need to take PATHEXT into account
-
-    if prog_path:
-        for prog_dir in filter(None, prog_path.split(os.pathsep)):
-            # os.join() not necessary: non-empty prog_dir and name[0] != os.sep
-            prog = prog_dir + os.sep + name
-            if os.access(prog, flags):
-                return True
-    # --
-    return False
-
-def check_requirements(http_login, http_password):
-    needed_progs = ["make", "git", "gcc", "timeout"]
-    missing_requirements = False
-
-    if http_login and http_password:
-        needed_progs.append("curl")
-
-    for prog in needed_progs:
-        if not has_prog(prog):
-            print("ERROR: your system lacks the '%s' program" % prog)
-            missing_requirements = True
-
-    if missing_requirements:
-        sys.exit(1)
-
 class SystemInfo:
-    def __init__(self):
-        devnull = open(os.devnull, "w")
-        # _grep_gcj :: str -> int
-        _grep_gcj = lambda prog: \
-            subprocess.call("%s -version | grep gcj" % prog, shell=True,
-                            stdout=devnull, stderr=devnull)
+    DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
+    DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
 
-        self.has_bzr = has_prog("bzr")
-
-        self.has_java = has_prog("java") and _grep_gcj("java") == 1
-
-        self.has_javac = has_prog("javac") and _grep_gcj("javac") == 1
+    def __init__(self):
+        self.needed_progs = list(self.__class__.DEFAULT_NEEDED_PROGS)
+        self.optional_progs = list(self.__class__.DEFAULT_OPTIONAL_PROGS)
+        self.progs = {}
+
+    def find_prog(self, name, flags=os.X_OK, env=os.environ):
+        if not name or name[0] == os.sep: raise ValueError(name)
+
+        prog_path = env.get("PATH", None)
+        # for windows compatibility, we'd need to take PATHEXT into account
+
+        if prog_path:
+            for prog_dir in filter(None, prog_path.split(os.pathsep)):
+                # os.join() not necessary: non-empty prog_dir
+                # and name[0] != os.sep
+                prog = prog_dir + os.sep + name
+                if os.access(prog, flags):
+                    return prog
+        # --
+        return None
+
+    def has(self, prog):
+        """Checks whether a program is available.
+        Lazily evaluates missing entries.
+
+        Returns: None if prog not found, else path to the program [evaluates to True]
+        """
+        try:
+            return self.progs[prog]
+        except KeyError:
+            pass
+
+        have_it = self.find_prog(prog)
+        # java[c] needs special care
+        if have_it and prog in ('java', 'javac'):
+            with open(os.devnull, "w") as devnull:
+                if subprocess.call("%s -version | grep gcj" % prog, shell=True,
+                                   stdout=devnull, stderr=devnull) != 1:
+                    have_it = False
+        # --
+        self.progs[prog] = have_it
+        return have_it
+
+    def check_requirements(self):
+        do_check_has_prog = self.has
+
+        missing_requirements = False
+        for prog in self.needed_progs:
+            if not do_check_has_prog(prog):
+                print("ERROR: your system lacks the '%s' program" % prog)
+                missing_requirements = True
+
+        # check optional programs here,
+        # else they'd get checked by each worker instance
+        for prog in self.optional_progs:
+            do_check_has_prog(prog)
+
+        return not missing_requirements
 
-        self.has_jar = has_prog("jar")
 
 def get_toolchain_configs():
     """Fetch and return the possible toolchain configurations
@@ -279,14 +297,14 @@ def fixup_config(instance, sysinfo):
     if "BR2_PACKAGE_MROUTED=y\n" in configlines and \
        "BR2_TOOLCHAIN_USES_UCLIBC=y\n" in configlines:
         configlines.remove("BR2_PACKAGE_MROUTED=y\n")
-    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has_java:
+    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
         return False
-    if "BR2_NEEDS_HOST_JAVAC=y\n" in configlines and not sysinfo.has_javac:
+    if "BR2_NEEDS_HOST_JAVAC=y\n" in configlines and not sysinfo.has("javac"):
         return False
-    if "BR2_NEEDS_HOST_JAR=y\n" in configlines and not sysinfo.has_jar:
+    if "BR2_NEEDS_HOST_JAR=y\n" in configlines and not sysinfo.has("jar"):
         return False
     # python-nfc needs bzr
-    if 'BR2_PACKAGE_PYTHON_NFC=y\n' in configlines and not sysinfo.has_bzr:
+    if 'BR2_PACKAGE_PYTHON_NFC=y\n' in configlines and not sysinfo.has("bzr"):
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
@@ -637,10 +655,16 @@ def main():
     check_version()
     sysinfo = SystemInfo()
     (ninstances, njobs, http_login, http_password, submitter) = config_get()
-    check_requirements(http_login, http_password)
-    if http_login is None or http_password is None:
+
+    if http_login and http_password:
+        sysinfo.needed_progs.append("curl")
+    else:
         print("WARN: due to the lack of http login/password details, results will not be submitted")
         print("WARN: tarballs of results will be kept locally only")
+
+    if not sysinfo.check_requirements():
+        sys.exit(1)
+
     def sigterm_handler(signum, frame):
         os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
         sys.exit(1)
-- 
2.3.0
