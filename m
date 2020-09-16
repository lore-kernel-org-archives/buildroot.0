From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Sep 2020 14:13:53 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: fix build with Bison
 3.7
Message-ID: <20200916121354.1914130-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from upstream that fixes build with Bison 3.7.

There are no autobuilder failures for this issue, but the following
defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_RPI_USERLAND=y

Failed with:

/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.0/src/core/release/gen/third_party/blink/renderer/core/xpath_grammar.cc:124:10: fatal error: xpath_grammar.hh: No such file or directory
  124 | #include "xpath_grammar.hh"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.

With this patch applied, it builds fine.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../qt5/qt5webengine/0002-fix-bison-3.7.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/qt5/qt5webengine/0002-fix-bison-3.7.patch

diff --git a/package/qt5/qt5webengine/0002-fix-bison-3.7.patch b/package/qt5/qt5webengine/0002-fix-bison-3.7.patch
new file mode 100644
index 0000000000..575fe27b1b
--- /dev/null
+++ b/package/qt5/qt5webengine/0002-fix-bison-3.7.patch
@@ -0,0 +1,55 @@
+From 1a53f5995697f5ac6fd501dbdc0ee39c9488ee66 Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Date: Fri, 14 Aug 2020 16:38:48 +0200
+Subject: Fix bison 3.7
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Do a replace run inspired by newer versions of the script.
+
+Fixes: QTBUG-86018
+Change-Id: Ib1dc771e22a662aff0fae842d135ad58fad08bc1
+Reviewed-by: Michael Br?ning <michael.bruning@qt.io>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../blink/renderer/build/scripts/rule_bison.py        | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/chromium/third_party/blink/renderer/build/scripts/rule_bison.py b/chromium/third_party/blink/renderer/build/scripts/rule_bison.py
+index f75e25fd23f..7e0767e951a 100755
+--- a/src/3rdparty/chromium/third_party/blink/renderer/build/scripts/rule_bison.py
++++ b/src/3rdparty/chromium/third_party/blink/renderer/build/scripts/rule_bison.py
+@@ -45,6 +45,19 @@ from utilities import abs
+ 
+ from blinkbuild.name_style_converter import NameStyleConverter
+ 
++def modify_file(path, prefix_lines, suffix_lines, replace_list=[]):
++    prefix_lines = map(lambda s: s + '\n', prefix_lines)
++    suffix_lines = map(lambda s: s + '\n', suffix_lines)
++    with open(path, 'r') as f:
++        old_lines = f.readlines()
++    for i in range(len(old_lines)):
++        for src, dest in replace_list:
++            old_lines[i] = old_lines[i].replace(src, dest)
++    new_lines = prefix_lines + old_lines + suffix_lines
++    with open(path, 'w') as f:
++        f.writelines(new_lines)
++
++
+ assert len(sys.argv) == 4 or len(sys.argv) == 5
+ 
+ inputFile = abs(sys.argv[1])
+@@ -115,3 +128,9 @@ print >>outputHFile, '#define %s' % headerGuard
+ print >>outputHFile, outputHContents
+ print >>outputHFile, '#endif  // %s' % headerGuard
+ outputHFile.close()
++
++common_replace_list = [(inputRoot + '.hh',
++                        inputRoot + '.h')]
++modify_file(
++    outputCpp, [], [],
++    replace_list=common_replace_list)
+-- 
+cgit v1.2.1
+
-- 
2.26.2
