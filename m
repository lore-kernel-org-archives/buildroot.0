From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:32:07 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] utils/{check-package,
 checkpackagelib}: consistently use raw strings for re.compile
Message-ID: <20200828164650.2FE5F865E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09ba349f0debf3a975b78835f7b549c48082fc10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Raw strings need to be used when calling re.compile() otherwise Python
3.x flake8 complains with:

W605 invalid escape sequence '\s'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 163f160a8e12e1cae4b43d7c8152d4370f12c442)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/check-package                 | 34 ++++++++++-----------
 utils/checkpackagelib/lib_config.py |  4 +--
 utils/checkpackagelib/lib_mk.py     | 60 ++++++++++++++++++-------------------
 utils/checkpackagelib/lib_patch.py  |  6 ++--
 4 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 52317e02f4..dd18d19c25 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -46,24 +46,24 @@ def parse_args():
     return parser.parse_args()
 
 
-CONFIG_IN_FILENAME = re.compile("Config\.\S*$")
-DO_CHECK_INTREE = re.compile("|".join([
-    "Config.in",
-    "arch/",
-    "boot/",
-    "fs/",
-    "linux/",
-    "package/",
-    "system/",
-    "toolchain/",
+CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
+DO_CHECK_INTREE = re.compile(r"|".join([
+    r"Config.in",
+    r"arch/",
+    r"boot/",
+    r"fs/",
+    r"linux/",
+    r"package/",
+    r"system/",
+    r"toolchain/",
     ]))
-DO_NOT_CHECK_INTREE = re.compile("|".join([
-    "boot/barebox/barebox\.mk$",
-    "fs/common\.mk$",
-    "package/doc-asciidoc\.mk$",
-    "package/pkg-\S*\.mk$",
-    "toolchain/helpers\.mk$",
-    "toolchain/toolchain-external/pkg-toolchain-external\.mk$",
+DO_NOT_CHECK_INTREE = re.compile(r"|".join([
+    r"boot/barebox/barebox\.mk$",
+    r"fs/common\.mk$",
+    r"package/doc-asciidoc\.mk$",
+    r"package/pkg-\S*\.mk$",
+    r"toolchain/helpers\.mk$",
+    r"toolchain/toolchain-external/pkg-toolchain-external\.mk$",
     ]))
 
 
diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index 55c8589d71..c348eec399 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -152,8 +152,8 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
 
 class HelpText(_CheckFunction):
-    HELP_TEXT_FORMAT = re.compile("^\t  .{,62}$")
-    URL_ONLY = re.compile("^(http|https|git)://\S*$")
+    HELP_TEXT_FORMAT = re.compile(r"^\t  .{,62}$")
+    URL_ONLY = re.compile(r"^(http|https|git)://\S*$")
 
     def before(self):
         self.help_text = False
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index a0caf84636..45e37e4598 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -20,12 +20,12 @@ end_conditional = ["endif"]
 
 
 class Indent(_CheckFunction):
-    COMMENT = re.compile("^\s*#")
-    CONDITIONAL = re.compile("^\s*({})\s".format("|".join(start_conditional + end_conditional)))
+    COMMENT = re.compile(r"^\s*#")
+    CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional)))
     ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
-    END_DEFINE = re.compile("^\s*endef\s")
-    MAKEFILE_TARGET = re.compile("^[^# \t]+:\s")
-    START_DEFINE = re.compile("^\s*define\s")
+    END_DEFINE = re.compile(r"^\s*endef\s")
+    MAKEFILE_TARGET = re.compile(r"^[^# \t]+:\s")
+    START_DEFINE = re.compile(r"^\s*define\s")
 
     def before(self):
         self.define = False
@@ -76,17 +76,17 @@ class Indent(_CheckFunction):
 
 
 class OverriddenVariable(_CheckFunction):
-    CONCATENATING = re.compile("^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
-    END_CONDITIONAL = re.compile("^\s*({})".format("|".join(end_conditional)))
+    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
+    END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
     OVERRIDING_ASSIGNMENTS = [':=', "="]
-    START_CONDITIONAL = re.compile("^\s*({})".format("|".join(start_conditional)))
-    VARIABLE = re.compile("^([A-Z0-9_]+)\s*((\+|:|)=)")
-    USUALLY_OVERRIDDEN = re.compile("^[A-Z0-9_]+({})".format("|".join([
-        "_ARCH\s*=\s*",
-        "_CPU\s*=\s*",
-        "_SITE\s*=\s*",
-        "_SOURCE\s*=\s*",
-        "_VERSION\s*=\s*"])))
+    START_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(start_conditional)))
+    VARIABLE = re.compile(r"^([A-Z0-9_]+)\s*((\+|:|)=)")
+    USUALLY_OVERRIDDEN = re.compile(r"^[A-Z0-9_]+({})".format("|".join([
+        r"_ARCH\s*=\s*",
+        r"_CPU\s*=\s*",
+        r"_SITE\s*=\s*",
+        r"_SOURCE\s*=\s*",
+        r"_VERSION\s*=\s*"])))
 
     def before(self):
         self.conditional = 0
@@ -174,7 +174,7 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
         package_upper = package.replace("-", "_").upper()
         self.package = package
         self.FIND_SOURCE = re.compile(
-            "^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
+            r"^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
             .format(package_upper, package, package_upper))
 
     def check_line(self, lineno, text):
@@ -222,7 +222,7 @@ class TrailingBackslash(_CheckFunction):
 
 
 class TypoInPackageVariable(_CheckFunction):
-    ALLOWED = re.compile("|".join([
+    ALLOWED = re.compile(r"|".join([
         "ACLOCAL_DIR",
         "ACLOCAL_HOST_DIR",
         "ACLOCAL_PATH",
@@ -241,7 +241,7 @@ class TypoInPackageVariable(_CheckFunction):
         "TARGET_FINALIZE_HOOKS",
         "TARGETS_ROOTFS",
         "XTENSA_CORE_NAME"]))
-    VARIABLE = re.compile("^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
+    VARIABLE = re.compile(r"^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
 
     def before(self):
         package, _ = os.path.splitext(os.path.basename(self.filename))
@@ -251,9 +251,9 @@ class TypoInPackageVariable(_CheckFunction):
         # linux extensions do not use LINUX_EXT_ prefix for variables
         package = package.replace("LINUX_EXT_", "")
         self.package = package
-        self.REGEX = re.compile("^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
+        self.REGEX = re.compile(r"^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
         self.FIND_VIRTUAL = re.compile(
-            "^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
+            r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
         self.virtual = []
 
     def check_line(self, lineno, text):
@@ -281,16 +281,16 @@ class TypoInPackageVariable(_CheckFunction):
 
 
 class UselessFlag(_CheckFunction):
-    DEFAULT_AUTOTOOLS_FLAG = re.compile("^.*{}".format("|".join([
-        "_AUTORECONF\s*=\s*NO",
-        "_LIBTOOL_PATCH\s*=\s*YES"])))
-    DEFAULT_GENERIC_FLAG = re.compile("^.*{}".format("|".join([
-        "_INSTALL_IMAGES\s*=\s*NO",
-        "_INSTALL_REDISTRIBUTE\s*=\s*YES",
-        "_INSTALL_STAGING\s*=\s*NO",
-        "_INSTALL_TARGET\s*=\s*YES"])))
-    END_CONDITIONAL = re.compile("^\s*({})".format("|".join(end_conditional)))
-    START_CONDITIONAL = re.compile("^\s*({})".format("|".join(start_conditional)))
+    DEFAULT_AUTOTOOLS_FLAG = re.compile(r"^.*{}".format("|".join([
+        r"_AUTORECONF\s*=\s*NO",
+        r"_LIBTOOL_PATCH\s*=\s*YES"])))
+    DEFAULT_GENERIC_FLAG = re.compile(r"^.*{}".format("|".join([
+        r"_INSTALL_IMAGES\s*=\s*NO",
+        r"_INSTALL_REDISTRIBUTE\s*=\s*YES",
+        r"_INSTALL_STAGING\s*=\s*NO",
+        r"_INSTALL_TARGET\s*=\s*YES"])))
+    END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
+    START_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(start_conditional)))
 
     def before(self):
         self.conditional = 0
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index 438353ad3b..e4e914b7f0 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -11,7 +11,7 @@ from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 
 
 class ApplyOrder(_CheckFunction):
-    APPLY_ORDER = re.compile("\d{1,4}-[^/]*$")
+    APPLY_ORDER = re.compile(r"\d{1,4}-[^/]*$")
 
     def before(self):
         if not self.APPLY_ORDER.match(os.path.basename(self.filename)):
@@ -21,7 +21,7 @@ class ApplyOrder(_CheckFunction):
 
 
 class NumberedSubject(_CheckFunction):
-    NUMBERED_PATCH = re.compile("Subject:\s*\[PATCH\s*\d+/\d+\]")
+    NUMBERED_PATCH = re.compile(r"Subject:\s*\[PATCH\s*\d+/\d+\]")
 
     def before(self):
         self.git_patch = False
@@ -44,7 +44,7 @@ class NumberedSubject(_CheckFunction):
 
 
 class Sob(_CheckFunction):
-    SOB_ENTRY = re.compile("^Signed-off-by: .*$")
+    SOB_ENTRY = re.compile(r"^Signed-off-by: .*$")
 
     def before(self):
         self.found = False
