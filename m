From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  5 Jun 2017 19:13:06 +0200
Subject: [Buildroot] [autobuild-run] autobuild-run: Add an exception for CS
	nios2 2017.02 with flann
Message-ID: <20170605171306.7941-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain is affected by binutils PR19405 so use an autobuilder
exception like for boost and qt5base (gui).

https://sourceware.org/bugzilla/show_bug.cgi?id=19405

Fixes:
http://autobuild.buildroot.net/results/b13/b13377f03acccedc0441fb1e37e93f8e0b60da5e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 24cdf58..c8921a5 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -494,6 +494,10 @@ def fixup_config(**kwargs):
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
         return False
+    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
+    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
+       'BR2_PACKAGE_FLANN=y\n' in configlines:
+        return False
     # or1k affected by binutils PR21464
     if 'BR2_or1k=y\n' in configlines and \
        'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
-- 
2.9.4
