From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 15 Nov 2016 23:16:49 +0100
Subject: [Buildroot] [PATCH] autobuild-run: Add an exception for CS nios2
	2016.05 with qt5base package (gui)
Message-ID: <1479248209-12976-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain is affected by binutils PR19405 and instead of adding a
toolchain dependency on the GUI option of qt5base package and it's reverse
dependencies, use an autobuilder exception.

https://sourceware.org/bugzilla/show_bug.cgi?id=19405

Fixes:
http://autobuild.buildroot.net/results/620/6203c8ded2fcf6734b6f62b61e5a39464692340d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 65276bd..425f56d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -500,6 +500,10 @@ def fixup_config(**kwargs):
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_BOOST=y\n' in configlines:
         return False
+    # The cs nios2 2016.05 toolchain is affected by binutils PR19405
+    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
+       'BR2_PACKAGE_QT5BASE_GUI=y\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
2.5.5
