From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:10 +0200
Subject: [Buildroot] [PATCH v7 03/23] genrandconfig: fix (some) pep8 warnings
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warnings fixed:
E731 do not assign a lambda expression, use a def
 -> urlopen_closing is defined with a def. urlopen is not used
    elsewhere so inlined.
E302 expected 2 blank lines
E501 line too long
 -> long lines due to a long string are NOT split
E701 multiple statements on one line (colon)
E722 do not use bare except'
 -> use "except Exception", so KeyInterrupt and SystemExit are still
    passed. We never intended to catch those.
E741 ambiguous variable name 'l'
 -> variable name is replaced with the much more descriptive
    toolchains_csv
E271 multiple spaces after keyword
E231 missing whitespace after ','

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v7: new patch
---
 utils/genrandconfig | 53 ++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a7fe7ceca9..fad60cdea7 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -35,8 +35,10 @@ if sys.hexversion >= 0x3000000:
 else:
     import urllib2 as _urllib
 
-urlopen = _urllib.urlopen
-urlopen_closing = lambda uri: contextlib.closing(urlopen(uri))
+
+def urlopen_closing(uri):
+    return contextlib.closing(_urllib.urlopen(uri))
+
 
 if sys.hexversion >= 0x3000000:
     def decode_byte_list(bl):
@@ -45,10 +47,13 @@ else:
     def decode_byte_list(e):
         return e
 
+
 def log_write(logf, msg):
-    logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()), msg))
+    logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()),
+                              msg))
     logf.flush()
 
+
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
     DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
@@ -59,7 +64,8 @@ class SystemInfo:
         self.progs = {}
 
     def find_prog(self, name, flags=os.X_OK, env=os.environ):
-        if not name or name[0] == os.sep: raise ValueError(name)
+        if not name or name[0] == os.sep:
+            raise ValueError(name)
 
         prog_path = env.get("PATH", None)
         # for windows compatibility, we'd need to take PATHEXT into account
@@ -78,7 +84,8 @@ class SystemInfo:
         """Checks whether a program is available.
         Lazily evaluates missing entries.
 
-        Returns: None if prog not found, else path to the program [evaluates to True]
+        Returns: None if prog not found, else path to the program [evaluates
+        to True]
         """
         try:
             return self.progs[prog]
@@ -89,7 +96,8 @@ class SystemInfo:
         # java[c] needs special care
         if have_it and prog in ('java', 'javac'):
             with open(os.devnull, "w") as devnull:
-                if subprocess.call("%s -version | grep gcj" % prog, shell=True,
+                if subprocess.call("%s -version | grep gcj" % prog,
+                                   shell=True,
                                    stdout=devnull, stderr=devnull) != 1:
                     have_it = False
         # --
@@ -116,6 +124,7 @@ class SystemInfo:
 
         return not missing_requirements
 
+
 def get_toolchain_configs(**kwargs):
     """Fetch and return the possible toolchain configurations
 
@@ -125,7 +134,7 @@ def get_toolchain_configs(**kwargs):
     toolchains_url = kwargs['toolchains_url']
 
     with urlopen_closing(toolchains_url) as r:
-        l = decode_byte_list(r.readlines())
+        toolchains_csv = decode_byte_list(r.readlines())
     configs = []
 
     (_, _, _, _, hostarch) = os.uname()
@@ -133,7 +142,7 @@ def get_toolchain_configs(**kwargs):
     if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
         hostarch = 'x86'
 
-    for row in csv.reader(l):
+    for row in csv.reader(toolchains_csv):
         config = {}
         url = row[0]
         config_hostarch = row[1]
@@ -162,6 +171,7 @@ def get_toolchain_configs(**kwargs):
         configs.append(config)
     return configs
 
+
 def is_toolchain_usable(**kwargs):
     """Check if the toolchain is actually usable."""
 
@@ -187,11 +197,12 @@ def is_toolchain_usable(**kwargs):
             ldd_version_output = subprocess.check_output(['ldd', '--version'])
             glibc_version = ldd_version_output.splitlines()[0].split()[-1]
             if StrictVersion('2.14') > StrictVersion(glibc_version):
-                log_write(log, "WARN: ignoring the Linaro ARM toolchains becausee too old host glibc")
+                log_write(log, "WARN: ignoring the Linaro ARM toolchains because too old host glibc")
                 return False
 
     return True
 
+
 def fixup_config(**kwargs):
     """Finalize the configuration and reject any problematic combinations
 
@@ -222,7 +233,8 @@ def fixup_config(**kwargs):
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
         return False
     # The ctng toolchain tigger an assembler error with guile package when compiled with -Os (same issue as for CS ARM 2014.05-29)
-    if 'BR2_PACKAGE_GUILE=y\n' in configlines and 'BR2_OPTIMIZE_S=y\n' in configlines and \
+    if 'BR2_PACKAGE_GUILE=y\n' in configlines and \
+       'BR2_OPTIMIZE_S=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
         return False
     # The ctng toolchain is affected by PR58854
@@ -252,9 +264,11 @@ def fixup_config(**kwargs):
     # libffi not available on sh2a and ARMv7-M, but propagating libffi
     # arch dependencies in Buildroot is really too much work, so we
     # handle this here.
-    if 'BR2_sh2a=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
+    if 'BR2_sh2a=y\n' in configlines and \
+       'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
-    if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
+    if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and \
+       'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
@@ -319,6 +333,7 @@ def fixup_config(**kwargs):
 
     return True
 
+
 def gen_config(**kwargs):
     """Generate a new random configuration
 
@@ -342,7 +357,7 @@ def gen_config(**kwargs):
     # Select a random toolchain configuration
     try:
         configs = get_toolchain_configs(**kwargs)
-    except:
+    except Exception:
         return -1
 
     i = randint(0, len(configs) - 1)
@@ -371,7 +386,8 @@ def gen_config(**kwargs):
 
     devnull = open(os.devnull, "w")
 
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "olddefconfig"],
+    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
+                           "olddefconfig"],
                           stdout=devnull, stderr=devnull)
     if ret != 0:
         log_write(log, "ERROR: cannot oldconfig")
@@ -391,7 +407,8 @@ def gen_config(**kwargs):
             return -1
         bounded_loop -= 1
         ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
-                               "KCONFIG_PROBABILITY=%d" % randint(1,30), "randpackageconfig"],
+                               "KCONFIG_PROBABILITY=%d" % randint(1, 30),
+                               "randpackageconfig"],
                               stdout=devnull, stderr=devnull)
         if ret != 0:
             log_write(log, "ERROR: cannot generate random configuration")
@@ -399,13 +416,15 @@ def gen_config(**kwargs):
         if fixup_config(**kwargs):
             break
 
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "olddefconfig"],
+    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
+                           "olddefconfig"],
                           stdout=devnull, stderr=devnull)
     if ret != 0:
         log_write(log, "ERROR: cannot oldconfig")
         return -1
 
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"],
+    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
+                           "savedefconfig"],
                           stdout=devnull, stderr=devnull)
     if ret != 0:
         log_write(log, "ERROR: cannot savedefconfig")
-- 
2.13.2
