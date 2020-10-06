From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 6 Oct 2020 23:37:48 +0200
Subject: [Buildroot] [git commit] genrandconfig: uboot-tools env/scr
 creation test files
Message-ID: <20201006212728.6634B81898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3930fd2ddd290a275b1ec707088becdbcde0fef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Normally the kconfig stings would end up empty and cause a build
error.  This patch provides test files to allow testing the creation
of uboot environment and script bin files from user provided txt files.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 63ff32cbfb..93dc6d898b 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -301,6 +301,22 @@ def fixup_config(sysinfo, configfile):
        'BR2_PACKAGE_FLANN=y\n' in configlines:
         return False
 
+    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines:
+        bootenv = os.path.join(args.outputdir, "boot_env.txt")
+        with open(bootenv, "w+") as bootenvf:
+            bootenvf.write("prop=value")
+        configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=""\n')
+        configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="%s"\n' % bootenv)
+        configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE=""\n')
+        configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x1000"\n')
+
+    if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y\n' in configlines:
+        bootscr = os.path.join(args.outputdir, "boot_script.txt")
+        with open(bootscr, "w+") as bootscrf:
+            bootscrf.write("prop=value")
+        configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
+        configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
+
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
