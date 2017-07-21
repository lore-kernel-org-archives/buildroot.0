From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:17 +0200
Subject: [Buildroot] [PATCH v7 10/23] genrandconfig: calculate configfile
	only once
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-11-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The path to the .config file is calculated in several places - replace
it with a single calculation, and pass configfile as an argument
to is_toolchain_usable and fixup_config. These functions also don't
need outputdir any more.

This makes it easier to fix the case when configfile is not in
outputdir.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v7: new patch
---
 utils/genrandconfig | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 4893c43f41..eaca6cff8c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -164,10 +164,10 @@ def get_toolchain_configs(toolchains_url):
     return configs
 
 
-def is_toolchain_usable(outputdir, config):
+def is_toolchain_usable(configfile, config):
     """Check if the toolchain is actually usable."""
 
-    with open(os.path.join(outputdir, ".config")) as configf:
+    with open(configfile) as configf:
         configlines = configf.readlines()
 
     # Check that the toolchain configuration is still present
@@ -192,7 +192,7 @@ def is_toolchain_usable(outputdir, config):
     return True
 
 
-def fixup_config(outputdir):
+def fixup_config(configfile):
     """Finalize the configuration and reject any problematic combinations
 
     This function returns 'True' when the configuration has been
@@ -202,7 +202,7 @@ def fixup_config(outputdir):
     """
 
     sysinfo = SystemInfo()
-    with open(os.path.join(outputdir, ".config")) as configf:
+    with open(configfile) as configf:
         configlines = configf.readlines()
 
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
@@ -314,7 +314,7 @@ def fixup_config(outputdir):
        'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
         return False
 
-    with open(os.path.join(outputdir, ".config"), "w+") as configf:
+    with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
     return True
@@ -354,13 +354,14 @@ def gen_config(args):
     # Write out the configuration file
     if not os.path.exists(args.outputdir):
         os.makedirs(args.outputdir)
-    with open(os.path.join(args.outputdir, ".config"), "w+") as configf:
+    configfile = os.path.join(args.outputdir, ".config")
+    with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
     subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                            "olddefconfig"])
 
-    if not is_toolchain_usable(args.outputdir, config):
+    if not is_toolchain_usable(configfile, config):
         return 2
 
     # Now, generate the random selection of packages, and fixup
@@ -378,7 +379,7 @@ def gen_config(args):
                                "KCONFIG_PROBABILITY=%d" % randint(1, 30),
                                "randpackageconfig"])
 
-        if fixup_config(args.outputdir):
+        if fixup_config(configfile):
             break
 
     subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-- 
2.13.2
