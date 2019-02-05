From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 20:24:57 +0100
Subject: [Buildroot] [git commit] utils/check-package: warn about overridden
 variables
Message-ID: <20190205192450.08B9685475@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b03fa5d96f54847ce338f0a30839d2ad67d2c4da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the general case, appending values to variables is OK and also a
good practice, like this:
|PACKAGE_VAR = value1
|ifeq ...
|PACKAGE_VAR += value2

or this, when the above is not possible:
|PACKAGE_VAR = value1
|ifeq ...
|PACKAGE_VAR := $(PACKAGE_VAR), value2

But this override is an error:
|PACKAGE_VAR = value1
|PACKAGE_VAR = value2

as well this one:
|ifeq ...
|PACKAGE_VAR += value1
|endif
|PACKAGE_VAR = value2

And this override is error-prone:
|PACKAGE_VAR = value1
|ifeq ...
|PACKAGE_VAR = value2

Create a check function to warn about overridden variables.

Some variables are likely to have a default value that gets overridden
in a conditional, so ignore them. The name of such variables end in
_ARCH, _CPU, _SITE, _SOURCE or _VERSION.

After ignoring these variable names, there are a few exceptions to this
rule in the tree. For them use the comment that disables the check.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-final/gcc-final.mk |  2 ++
 package/zmqpp/zmqpp.mk             |  1 +
 utils/checkpackagelib/lib_mk.py    | 60 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 37b645d252..49f16f699e 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -68,10 +68,12 @@ HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
 # doesn't use floating point operations.
 ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
 HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
+# check-package OverriddenVariable
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
 HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
+# check-package OverriddenVariable
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 801766a7d8..ea6b50e826 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -19,6 +19,7 @@ ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),debug,release)
 # By setting CONFIG to empty, all optimizations such as -funroll-loops
 # -ffast-math -finline-functions -fomit-frame-pointer are disabled
 ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
+# check-package OverriddenVariable
 ZMQPP_CONFIG =
 endif
 
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 51c6577d2c..00efeb7fb2 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -73,6 +73,66 @@ class Indent(_CheckFunction):
                         text]
 
 
+class OverriddenVariable(_CheckFunction):
+    CONCATENATING = re.compile("^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
+    END_CONDITIONAL = re.compile("^\s*({})".format("|".join(end_conditional)))
+    OVERRIDING_ASSIGNMENTS = [':=', "="]
+    START_CONDITIONAL = re.compile("^\s*({})".format("|".join(start_conditional)))
+    VARIABLE = re.compile("^([A-Z0-9_]+)\s*((\+|:|)=)")
+    USUALLY_OVERRIDDEN = re.compile("^[A-Z0-9_]+({})".format("|".join([
+        "_ARCH\s*=\s*",
+        "_CPU\s*=\s*",
+        "_SITE\s*=\s*",
+        "_SOURCE\s*=\s*",
+        "_VERSION\s*=\s*"])))
+
+    def before(self):
+        self.conditional = 0
+        self.unconditionally_set = []
+        self.conditionally_set = []
+
+    def check_line(self, lineno, text):
+        if self.START_CONDITIONAL.search(text):
+            self.conditional += 1
+            return
+        if self.END_CONDITIONAL.search(text):
+            self.conditional -= 1
+            return
+
+        m = self.VARIABLE.search(text)
+        if m is None:
+            return
+        variable, assignment = m.group(1, 2)
+
+        if self.conditional == 0:
+            if variable in self.conditionally_set:
+                self.unconditionally_set.append(variable)
+                if assignment in self.OVERRIDING_ASSIGNMENTS:
+                    return ["{}:{}: unconditional override of variable {} previously conditionally set"
+                            .format(self.filename, lineno, variable),
+                            text]
+
+            if variable not in self.unconditionally_set:
+                self.unconditionally_set.append(variable)
+                return
+            if assignment in self.OVERRIDING_ASSIGNMENTS:
+                return ["{}:{}: unconditional override of variable {}"
+                        .format(self.filename, lineno, variable),
+                        text]
+        else:
+            if variable not in self.unconditionally_set:
+                self.conditionally_set.append(variable)
+                return
+            if self.CONCATENATING.search(text):
+                return
+            if self.USUALLY_OVERRIDDEN.search(text):
+                return
+            if assignment in self.OVERRIDING_ASSIGNMENTS:
+                return ["{}:{}: conditional override of variable {}"
+                        .format(self.filename, lineno, variable),
+                        text]
+
+
 class PackageHeader(_CheckFunction):
     def before(self):
         self.skip = False
