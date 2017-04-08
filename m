From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:15:39 +0200
Subject: [Buildroot] [git commit] check-package: check *.mk for typo in
	variable
Message-ID: <20170408141752.AAD99817AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40ef732490b1130e1d79c6dfc792a18d3df4dd02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warn when a variable is defined in a .mk file and it don't start with
the package name.

This function generates false warnings and the maintenance of the
whitelist can be an extra burden, but it catches some typos really hard
to see:
- POPLER_CONF_OPTS [1]
- BALELD_LICENSE [2]
- DRDB_UTILS_DEPENDENCIES [3]
- PERL_LIBWWW_LICENSE_FILES [4]
- AVRDUDR_LICENSE_FILES [5]
- GST1_PLUGINS_ULGY_HAS_GPL_LICENSE [6]
- ON2_8170_LICENSE [7]
- LIBFDTI_CONF_OPTS [8][9]
- IPSEC_DEPENDENCIES [10]

[1] http://patchwork.ozlabs.org/patch/681533
[2] http://patchwork.ozlabs.org/patch/643293
[3] http://patchwork.ozlabs.org/patch/449589
[4] http://patchwork.ozlabs.org/patch/464545
[5] http://patchwork.ozlabs.org/patch/305060
[6] http://patchwork.ozlabs.org/patch/253089
[7] http://patchwork.ozlabs.org/patch/250523
[8] http://patchwork.ozlabs.org/patch/394125
[9] https://github.com/buildroot/buildroot/commit/fe7a4b524b72bcb448f7e723873d8244620cb2f1
[10] https://github.com/buildroot/buildroot/commit/dff1d590b2a0fadf58b6eed60029b2ecbab7c710

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/checkpackagelib_mk.py | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/support/scripts/checkpackagelib_mk.py b/support/scripts/checkpackagelib_mk.py
index f66888d..0740a37 100644
--- a/support/scripts/checkpackagelib_mk.py
+++ b/support/scripts/checkpackagelib_mk.py
@@ -131,6 +131,58 @@ class TrailingBackslash(_CheckFunction):
                     self.lastline]
 
 
+class TypoInPackageVariable(_CheckFunction):
+    ALLOWED = re.compile("|".join([
+        "ACLOCAL_DIR",
+        "ACLOCAL_HOST_DIR",
+        "BR_CCACHE_INITIAL_SETUP",
+        "BR_NO_CHECK_HASH_FOR",
+        "LINUX_POST_PATCH_HOOKS",
+        "LINUX_TOOLS",
+        "LUA_RUN",
+        "MKFS_JFFS2",
+        "MKIMAGE_ARCH",
+        "PKG_CONFIG_HOST_BINARY",
+        "TARGET_FINALIZE_HOOKS",
+        "XTENSA_CORE_NAME"]))
+    PACKAGE_NAME = re.compile("/([^/]+)\.mk")
+    VARIABLE = re.compile("^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
+
+    def before(self):
+        package = self.PACKAGE_NAME.search(self.filename).group(1)
+        package = package.replace("-", "_").upper()
+        # linux tools do not use LINUX_TOOL_ prefix for variables
+        package = package.replace("LINUX_TOOL_", "")
+        self.package = package
+        self.REGEX = re.compile("^(HOST_)?({}_[A-Z0-9_]+)".format(package))
+        self.FIND_VIRTUAL = re.compile(
+            "^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
+        self.virtual = []
+
+    def check_line(self, lineno, text):
+        m = self.VARIABLE.search(text)
+        if m is None:
+            return
+
+        variable = m.group(1)
+
+        # allow to set variables for virtual package this package provides
+        v = self.FIND_VIRTUAL.search(text)
+        if v:
+            self.virtual += v.group(2).upper().split()
+            return
+        for virtual in self.virtual:
+            if variable.startswith("{}_".format(virtual)):
+                return
+
+        if self.ALLOWED.match(variable):
+            return
+        if self.REGEX.search(text) is None:
+            return ["{}:{}: possible typo: {} -> *{}*"
+                    .format(self.filename, lineno, variable, self.package),
+                    text]
+
+
 class UselessFlag(_CheckFunction):
     DEFAULT_AUTOTOOLS_FLAG = re.compile("^.*{}".format("|".join([
         "_AUTORECONF\s*=\s*NO",
