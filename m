From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:30 +0100
Subject: [Buildroot] [PATCH 13/13] autobuild-run: set locale to en_US or C
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-14-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

some python scripts break if the locale is set to C, try en_US first

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 59 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7980879..b9440b6 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -95,6 +95,20 @@ else:
     decode_bytes = _identity
     decode_byte_list = _identity
 
+if sys.hexversion >= 0x2700000:
+    _run_proc_check_output = subprocess.check_output
+else:
+    # python 2.7 lacks subprocess.check_output(), need to define it here.
+    # It _has_ to raise CalledProcessError if the exitcode is not 0
+    def _run_proc_check_output(args, **kwargs):
+        assert 'stdout' not in kwargs
+        proc = subprocess.Popen(args, stdout=subprocess.PIPE, **kwargs)
+        stdout_data, _ = proc.communicate()
+        ret = proc.poll()
+        if ret != os.EX_OK:
+            raise subprocess.CalledProcessError(ret, args)
+        return stdout_data
+
 MAX_DURATION = 60 * 60 * 4
 VERSION = 1
 
@@ -113,16 +127,23 @@ class SystemInfo:
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
         self.progs = {}
         self.devnull = open(os.devnull, "w")
+        self.env = os.environ.copy()
 
-    def find_prog(self, name, flags=os.X_OK, env=os.environ):
+    def find_prog(self, name, flags=os.X_OK):
         if not name or name[0] == os.sep: raise ValueError(name)
 
-        prog_path = env.get("PATH", None)
+        prog_path = self.env.get("PATH", None)
         # for windows compatibility, we'd need to take PATHEXT into account
 
         if prog_path:
@@ -171,10 +192,43 @@ class SystemInfo:
 
         return not missing_requirements
 
+    def set_locale(self):
+        try:
+            locales_str = _run_proc_check_output(
+                ["locale", "-a"], env=self.env,
+                stdin=self.devnull, stderr=self.devnull)
+        except subprocess.CalledProcessError:
+            return False
+
+        locales = dict((
+            (k.lower().replace("-", ""), k)
+            for k in decode_bytes(locales_str).split(None)
+        ))
+
+        for loc_key in filter(lambda x: x in locales, self.TRY_LOCALES):
+            # cannot modify self.env while iterating over it,
+            #  create intermediate list
+            env_old_locale_keys = [
+                k for k in self.env.keys() if (k == 'LANG' or k[:3] == 'LC_')
+            ]
+            for k in env_old_locale_keys:
+                del self.env[k]
+
+            # set new locale once
+            for vname in self.LOCALE_KEYS:
+                self.env[vname] = locales[loc_key]
+            return True
+        # -- end for
+        return None
+
+    def sanitize_env(self):
+        self.set_locale()
+
     def run_cmd(self, cmdv, **kwargs):
         kwargs.setdefault('stdin', self.devnull)
         kwargs.setdefault('stdout', self.devnull)
         kwargs.setdefault('stderr', self.devnull)
+        kwargs['env'] = self.env
         return subprocess.call(cmdv, **kwargs)
 
     def run_cmd_write_to(self, outstream, cmdv, **kwargs):
@@ -659,6 +713,7 @@ Format of the configuration file:
 def main():
     check_version()
     sysinfo = SystemInfo()
+    sysinfo.sanitize_env()
     (ninstances, njobs, http_login, http_password, submitter) = config_get()
 
     if http_login and http_password:
-- 
2.3.0
