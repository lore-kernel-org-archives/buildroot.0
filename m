From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Aug 2019 11:13:18 +0200
Subject: [Buildroot] [PATCH 1/2] utils/genrandconfig: instantiate
 SystemInfo() earlier
Message-ID: <20190804091319.32679-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a future patch, we are going to need a SystemInfo() instance in
gen_config(), so create the SystemInfo() instance there, and pass it
to fixup_config(), where we currently use it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index aa5e151b7f..859996cfd5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -198,7 +198,7 @@ def is_toolchain_usable(configfile, config):
     return True
 
 
-def fixup_config(configfile):
+def fixup_config(sysinfo, configfile):
     """Finalize the configuration and reject any problematic combinations
 
     This function returns 'True' when the configuration has been
@@ -207,7 +207,6 @@ def fixup_config(configfile):
     generated).
     """
 
-    sysinfo = SystemInfo()
     with open(configfile) as configf:
         configlines = configf.readlines()
 
@@ -331,6 +330,8 @@ def gen_config(args):
     packages.
     """
 
+    sysinfo = SystemInfo()
+
     # Select a random toolchain configuration
     configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
 
@@ -403,7 +404,7 @@ def gen_config(args):
                                "KCONFIG_PROBABILITY=%d" % randint(1, 30),
                                "randpackageconfig"])
 
-        if fixup_config(configfile):
+        if fixup_config(sysinfo, configfile):
             break
 
     subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-- 
2.21.0
