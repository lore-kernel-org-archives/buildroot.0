From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Sun, 26 Apr 2015 23:47:53 +0200
Subject: [Buildroot] [PATCH v3 4/4] autobuild-run: set locale to en_US or C
In-Reply-To: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
References: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
Message-ID: <1430084873-19977-5-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

some python scripts break if the locale is set to C, try en_US first

Additionally, drop all locale env vars (LC_*, LANG[GUAGE]) when
setting the new locale.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 47 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index feb8a04..d1b1008 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -168,6 +168,12 @@ class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
     DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
 
+    # list of default locales (in lowercase, without "-", descending order)
+    #  some python scripts break if the locale is set to C, try en_US first
+    TRY_LOCALES = ['en_us.utf8', 'en_us', 'c']
+    # list of locale environment variables that should be (re-)set by set_locale()
+    LOCALE_KEYS = ['LANG']
+
     def __init__(self):
         self.needed_progs = list(self.__class__.DEFAULT_NEEDED_PROGS)
         self.optional_progs = list(self.__class__.DEFAULT_OPTIONAL_PROGS)
@@ -231,6 +237,40 @@ class SystemInfo:
 
         return not missing_requirements
 
+    def set_locale(self):
+        def is_locale_env_varname(w):
+            return w.startswith('LC_') or w in ['LANG', 'LANGUAGE']
+
+        ret, locales_str = self.run_cmd_get_stdout(["locale", "-a"])
+        if ret != os.EX_OK:
+            return False
+
+        # create a dict
+        #   <locale identifier> (as listed in TRY_LOCALES) => <locale env name>
+        locales = dict((
+            (k.lower().replace("-", ""), k) for k in locales_str.split()
+        ))
+
+        for loc_key in filter(lambda x: x in locales, self.TRY_LOCALES):
+            # cannot modify self.env while iterating over it,
+            #  create intermediate list
+            env_old_locale_keys = [
+                k for k in self.env.keys() if is_locale_env_varname(k)
+            ]
+            for k in env_old_locale_keys:
+                del self.env[k]
+
+            # set new locale once
+            for vname in self.LOCALE_KEYS:
+                self.env[vname] = locales[loc_key]
+            return True
+        # -- end for
+        # practically impossible to reach this return if 'c' is in TRY_LOCALES:
+        return None
+
+    def sanitize_env(self):
+        self.set_locale()
+
     def popen(self, cmdv, **kwargs):
         """subprocess.Popen() wrapper that redirects stdin, stdout and
         stderr to /dev/null unless specified otherwise (via kwargs).
@@ -830,12 +870,11 @@ def merge(dict_1, dict_2):
 
 def main():
 
-    # Avoid locale settings of autobuilder machine leaking in, for example
-    # showing error messages in another language.
-    os.environ['LC_ALL'] = 'C'
-
     check_version()
     sysinfo = SystemInfo()
+    # Avoid locale settings of autobuilder machine leaking in, for example
+    # showing error messages in another language.
+    sysinfo.sanitize_env()
 
     args = docopt.docopt(doc, version=VERSION)
 
-- 
2.3.6
