From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Apr 2020 01:04:14 +0200
Subject: [Buildroot] [PATCH 7/7] support/testing: check if the defconfig
 provided for testing is valid
In-Reply-To: <20200405230414.416403-1-romain.naour@gmail.com>
References: <20200405230414.416403-1-romain.naour@gmail.com>
Message-ID: <20200405230414.416403-7-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the build continue even if some symbols disapear from
the generated dot config file (.config).

This patch add a new check in order to stop the test if one
of the provided symbol is missing. This must be treated as error.

For example, if a symbol disapear due to new dependency constraints.

Inspired by is_toolchain_usable() function from genrandconfig:
https://git.busybox.net/buildroot/tree/utils/genrandconfig?h=2020.02#n164

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/infra/builder.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 88f01d15c0..922a707220 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -12,6 +12,23 @@ class Builder(object):
         self.builddir = builddir
         self.logfile = infra.open_log_file(builddir, "build", logtofile)
 
+    def is_defconfig_valid(self, configfile, defconfig):
+        """Check if the .config is contains all lines present in the defconfig."""
+        with open(configfile) as configf:
+            configlines = configf.readlines()
+
+        defconfiglines = defconfig.split("\n")
+
+        # Check that all the defconfig lines are still present
+        for defconfigline in defconfiglines:
+            if defconfigline + "\n" not in configlines:
+                self.logfile.write("WARN: defconfig can't be used\n")
+                self.logfile.write("      Missing: %s\n" % defconfigline.strip())
+                self.logfile.flush()
+                return False
+
+        return True
+
     def configure(self, make_extra_opts=[], make_extra_env={}):
         """Configure the build.
 
@@ -47,6 +64,9 @@ class Builder(object):
         if ret != 0:
             raise SystemError("Cannot olddefconfig")
 
+        if not self.is_defconfig_valid(config_file, self.config):
+            raise SystemError("The defconfig is not valid")
+
     def build(self, make_extra_opts=[], make_extra_env={}):
         """Perform the build.
 
-- 
2.25.1
