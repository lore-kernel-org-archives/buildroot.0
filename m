From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:12 +0200
Subject: [Buildroot] [PATCH v7 05/23] genrandconfig: move instantiation of
	SystemInfo down
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SystemInfo class is instantiated globally and passed down to all
functions, but it is really only used in fixup_config. So instead,
instantiate it there.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v7: new patch
---
 utils/genrandconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a9519b5f2f..79916fef2c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -197,7 +197,7 @@ def is_toolchain_usable(outputdir, config):
     return True
 
 
-def fixup_config(outputdir, sysinfo):
+def fixup_config(outputdir):
     """Finalize the configuration and reject any problematic combinations
 
     This function returns 'True' when the configuration has been
@@ -206,6 +206,7 @@ def fixup_config(outputdir, sysinfo):
     generated).
     """
 
+    sysinfo = SystemInfo()
     with open(os.path.join(outputdir, ".config")) as configf:
         configlines = configf.readlines()
 
@@ -402,7 +403,7 @@ def gen_config(args):
         if ret != 0:
             log_write(args.log, "ERROR: cannot generate random configuration")
             return -1
-        if fixup_config(outputdir, args.sysinfo):
+        if fixup_config(outputdir):
             break
 
     ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
@@ -436,7 +437,6 @@ if __name__ == '__main__':
 
     # Arguments expected by gen_config for which we just set a default here
     args.log = sys.stdout
-    args.sysinfo = SystemInfo()
 
     # Output directory is already created by autobuild-run so emulate it here
     idir = "instance-%d" % args.instance
-- 
2.13.2
