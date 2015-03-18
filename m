From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:43 +0100
Subject: [Buildroot] [PATCH v2 10/10] autobuild-run: set locale to en_US or C
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <1426693843-28792-11-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

some python scripts break if the locale is set to C, try en_US{.UTF-8,} first

Additionally, drop all locale env vars (LC_*, LANG[GUAGE]) when
setting the new locale.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---

Just for reference, a small python example that breaks if LANG is set to C:

  $ LANG=C python -c "print(u'Andr\xe9')"
  UnicodeEncodeError: 'ascii' codec can't encode character u'\xe9' in position 4: ordinal not in range(128)

---
 scripts/autobuild-run | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index e1a3398..a1e947d 100755
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
@@ -231,6 +237,41 @@ class SystemInfo:
 
         return not missing_requirements
 
+    def set_locale(self):
+        def is_locale_env_varname(w):
+            # w[:4] == 'LANG' and (not w[4:] or w[4:] == 'UAGE') ...
+            return w[:3] == 'LC_' or w == 'LANG' or w == 'LANGUAGE'
+
+        ret, locales_str = self.run_cmd_get_stdout(["locale", "-a"])
+        if ret != os.EX_OK:
+            return False
+
+        # create a dict
+        #   <locale identifier> (as listed in TRY_LOCALES) => <locale env name>
+        locales = dict((
+            (k.lower().replace("-", ""), k) for k in locales_str.split(None)
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
         kwargs.setdefault('stdin', self.devnull)
         kwargs.setdefault('stdout', self.devnull)
@@ -789,12 +830,11 @@ def merge(dict_1, dict_2):
 
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
2.3.2
