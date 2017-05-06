From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  6 May 2017 15:49:49 +0200
Subject: [Buildroot] [autobuild-run: 2/2] autobuild-run: Add an exception
	for CS nios2 2016.05 with qt package (gui)
In-Reply-To: <20170506134949.11995-1-romain.naour@gmail.com>
References: <20170506134949.11995-1-romain.naour@gmail.com>
Message-ID: <20170506134949.11995-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain is affected by binutils PR19405 so use an autobuilder
exception like for boost and qt5base (gui). This allow to remove all
toolchain dependencies on the GUI option of qt package and it's reverse
dependencies.

https://sourceware.org/bugzilla/show_bug.cgi?id=19405

Fixes:
http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ed3ddd2..5dcbe5f 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -503,6 +503,10 @@ def fixup_config(**kwargs):
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_QT5BASE_GUI=y\n' in configlines:
         return False
+    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
+    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
+       'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
2.9.3
