From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:42:59 +0200
Subject: [Buildroot] [git commit] genrandconfig: move instantiation of
	SystemInfo down
Message-ID: <20170725210434.4937D7FDE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8c6d52c89a2c1fd7d40f9e9ad4b7689255538d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SystemInfo class is instantiated globally and passed down to all
functions, but it is really only used in fixup_config. So instead,
instantiate it there.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a9519b5..79916fe 100755
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
