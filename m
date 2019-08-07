From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 16:34:40 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: instantiate
 SystemInfo() earlier
Message-ID: <20190807143147.87C9A8E519@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4693676ec5e647c13f766c679c3e6800f0d29026
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a future patch, we are going to need a SystemInfo() instance in
gen_config(), so create the SystemInfo() instance there, and pass it
to fixup_config(), where we currently use it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Atharva Lele <itsatharva@gmail.com>
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
