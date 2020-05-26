From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 May 2020 18:07:24 +0200
Subject: [Buildroot] [PATCHv2] package/qt5/qt5declarative: fix parallel
 install
Message-ID: <20200526160724.431212-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While installing qt5declarative	examples on fast machine, example destination
directory will be installed twice, so it can break a parallel install, whereby
two make jobs may run concurrently, trying to install the same files or creating
the same directory.

Cannot touch [...]chapter5-listproperties/app.qml: No such file or directory
Error copying [...]chapter2-methods/app.qml: Destination file exists

This is due to "target" and "qml" target creating the same directory in the
generated Makefile:

  install_target: first FORCE
          @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
          mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods

  install_qml: first FORCE
          @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
          mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods

Add "target" in "qml" dependency to fixes the issue:

  install_qml: first install_target FORCE

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/565470221

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Ga?l Portay <gael.portay@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
v2: Apply this fix each time where several install target are used in .po file:
      INSTALLS += target [qml] [...]
    (Peter)
---
 .../0002-examples-fix-parallel-install.patch  | 209 ++++++++++++++++++
 1 file changed, 209 insertions(+)
 create mode 100644 package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch

diff --git a/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch b/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
new file mode 100644
index 0000000000..280f820ffa
--- /dev/null
+++ b/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
@@ -0,0 +1,209 @@
+From 533035c1de62548657d211421fc92b721cec52bb Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 25 May 2020 20:21:52 +0200
+Subject: [PATCH] examples: fix parallel install
+
+While installing qt5declarative	examples on fast machine, example destination
+directory will be installed twice, so it can break a parallel install, whereby
+two make jobs may run concurrently, trying to install the same files or creating
+the same directory.
+
+Cannot touch [...]chapter5-listproperties/app.qml: No such file or directory
+Error copying [...]chapter2-methods/app.qml: Destination file exists
+
+This is due to "target" and "qml" target creating the same directory in the
+generated Makefile:
+
+  install_target: first FORCE
+          @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
+          mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods
+
+  install_qml: first FORCE
+          @test -d $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods || \
+          mkdir -p $(INSTALL_ROOT)/[...]/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/examples/qml/tutorials/extending-qml/chapter2-methods
+
+Add "target" in "qml" dependency to fixes the issue:
+
+  install_qml: first install_target FORCE
+
+Apply this fix each time where several install target are used in .po file:
+  INSTALLS += target [qml] [...]
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/565470221
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ examples/qml/qmlextensionplugins/qmlextensionplugins.pro        | 2 ++
+ .../tutorials/extending-qml/chapter1-basics/chapter1-basics.pro | 1 +
+ .../extending-qml/chapter2-methods/chapter2-methods.pro         | 1 +
+ .../extending-qml/chapter3-bindings/chapter3-bindings.pro       | 1 +
+ .../chapter4-customPropertyTypes.pro                            | 1 +
+ .../chapter5-listproperties/chapter5-listproperties.pro         | 1 +
+ .../tutorials/extending-qml/chapter6-plugins/import/import.pro  | 2 ++
+ examples/qmltest/qmltest/qmltest.pro                            | 1 +
+ examples/quick/customitems/painteditem/painteditem.pro          | 1 +
+ examples/quick/imageprovider/imageprovider.pro                  | 2 ++
+ examples/quick/imageresponseprovider/imageresponseprovider.pro  | 2 ++
+ examples/quick/scenegraph/simplematerial/simplematerial.pro     | 1 +
+ tests/manual/highdpi/highdpi.pro                                | 2 ++
+ 13 files changed, 18 insertions(+)
+
+diff --git a/examples/qml/qmlextensionplugins/qmlextensionplugins.pro b/examples/qml/qmlextensionplugins/qmlextensionplugins.pro
+index 946626cce7..c537effe64 100644
+--- a/examples/qml/qmlextensionplugins/qmlextensionplugins.pro
++++ b/examples/qml/qmlextensionplugins/qmlextensionplugins.pro
+@@ -17,8 +17,10 @@ pluginfiles.files += \
+ 
+ qml.files = plugins.qml
+ qml.path += $$[QT_INSTALL_EXAMPLES]/qml/qmlextensionplugins
++qml.depends = install_target
+ target.path += $$[QT_INSTALL_EXAMPLES]/qml/qmlextensionplugins/imports/TimeExample
+ pluginfiles.path += $$[QT_INSTALL_EXAMPLES]/qml/qmlextensionplugins/imports/TimeExample
++pluginfiles.depends = install_qml
+ 
+ INSTALLS += target qml pluginfiles
+ 
+diff --git a/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro b/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
+index 9911e02484..8f54cbc478 100644
+--- a/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
++++ b/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
+@@ -11,5 +11,6 @@ target.path = $$DESTPATH
+ 
+ qml.files = *.qml
+ qml.path = $$DESTPATH
++qml.depends = install_target
+ 
+ INSTALLS += target qml
+diff --git a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
+index 7fd850ce36..6433c333f8 100644
+--- a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
++++ b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
+@@ -11,5 +11,6 @@ target.path = $$DESTPATH
+ 
+ qml.files = *.qml
+ qml.path = $$DESTPATH
++qml.depends = install_target
+ 
+ INSTALLS += target qml
+diff --git a/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro b/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
+index 1ae83f71eb..8c7bd415d0 100644
+--- a/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
++++ b/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
+@@ -11,5 +11,6 @@ target.path = $$DESTPATH
+ 
+ qml.files = *.qml
+ qml.path = $$DESTPATH
++qml.depends = install_target
+ 
+ INSTALLS += target qml
+diff --git a/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro b/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
+index 12dfbd6280..75dd1aeaf3 100644
+--- a/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
++++ b/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
+@@ -13,5 +13,6 @@ target.path = $$DESTPATH
+ 
+ qml.files = *.qml
+ qml.path = $$DESTPATH
++qml.depends = install_target
+ 
+ INSTALLS += target qml
+diff --git a/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro b/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
+index 67d1cd35c3..676d623e2d 100644
+--- a/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
++++ b/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
+@@ -13,5 +13,6 @@ target.path = $$DESTPATH
+ 
+ qml.files = *.qml
+ qml.path = $$DESTPATH
++qml.depends = install_target
+ 
+ INSTALLS += target qml
+diff --git a/examples/qml/tutorials/extending-qml/chapter6-plugins/import/import.pro b/examples/qml/tutorials/extending-qml/chapter6-plugins/import/import.pro
+index 5cf4621420..9f663f0b05 100644
+--- a/examples/qml/tutorials/extending-qml/chapter6-plugins/import/import.pro
++++ b/examples/qml/tutorials/extending-qml/chapter6-plugins/import/import.pro
+@@ -18,6 +18,8 @@ DESTPATH=$$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter6-plugins/Ch
+ target.path=$$DESTPATH
+ qmldir.files=$$PWD/qmldir
+ qmldir.path=$$DESTPATH
++qmldir.depends = install_target
++
+ INSTALLS += target qmldir
+ 
+ CONFIG += install_ok  # Do not cargo-cult this!
+diff --git a/examples/qmltest/qmltest/qmltest.pro b/examples/qmltest/qmltest/qmltest.pro
+index b5893c5a1e..2e0d36fef3 100644
+--- a/examples/qmltest/qmltest/qmltest.pro
++++ b/examples/qmltest/qmltest/qmltest.pro
+@@ -21,6 +21,7 @@ macx: CONFIG -= app_bundle
+ target.path = $$[QT_INSTALL_EXAMPLES]/qmltest/qmltest
+ qml.files = tst_basic.qml tst_item.qml
+ qml.path = $$[QT_INSTALL_EXAMPLES]/qmltest/qmltest
++qml.depends = install_target
+ INSTALLS += target qml
+ 
+ }
+diff --git a/examples/quick/customitems/painteditem/painteditem.pro b/examples/quick/customitems/painteditem/painteditem.pro
+index bc7480ab9e..2185b3dd43 100644
+--- a/examples/quick/customitems/painteditem/painteditem.pro
++++ b/examples/quick/customitems/painteditem/painteditem.pro
+@@ -16,6 +16,7 @@ DESTDIR = TextBalloonPlugin
+ target.path = $$[QT_INSTALL_EXAMPLES]/quick/customitems/painteditem/TextBalloonPlugin
+ qmldir.files = TextBalloonPlugin/qmldir
+ qmldir.path = $$[QT_INSTALL_EXAMPLES]/quick/customitems/painteditem/TextBalloonPlugin
++qml.depends = install_target
+ 
+ INSTALLS += qmldir target
+ 
+diff --git a/examples/quick/imageprovider/imageprovider.pro b/examples/quick/imageprovider/imageprovider.pro
+index e54469b0d8..a49d55d254 100644
+--- a/examples/quick/imageprovider/imageprovider.pro
++++ b/examples/quick/imageprovider/imageprovider.pro
+@@ -12,6 +12,8 @@ EXAMPLE_FILES = imageprovider-example.qml
+ target.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProviderCore
+ qml.files = ImageProviderCore/qmldir
+ qml.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProviderCore
++qml.depends = install_target
++
+ INSTALLS = target qml
+ 
+ CONFIG += install_ok  # Do not cargo-cult this!
+diff --git a/examples/quick/imageresponseprovider/imageresponseprovider.pro b/examples/quick/imageresponseprovider/imageresponseprovider.pro
+index 8be4dbb658..e99a269602 100644
+--- a/examples/quick/imageresponseprovider/imageresponseprovider.pro
++++ b/examples/quick/imageresponseprovider/imageresponseprovider.pro
+@@ -12,6 +12,8 @@ EXAMPLE_FILES = imageresponseprovider-example.qml
+ target.path = $$[QT_INSTALL_EXAMPLES]/quick/imageresponseprovider/ImageResponseProviderCore
+ qml.files = ImageResponseProviderCore/qmldir
+ qml.path = $$[QT_INSTALL_EXAMPLES]/quick/imageresponseprovider/ImageResponseProviderCore
++qml.depends = install_target
++
+ INSTALLS = target qml
+ 
+ CONFIG += install_ok  # Do not cargo-cult this!
+diff --git a/examples/quick/scenegraph/simplematerial/simplematerial.pro b/examples/quick/scenegraph/simplematerial/simplematerial.pro
+index 6ae935f357..66a2d92ca8 100644
+--- a/examples/quick/scenegraph/simplematerial/simplematerial.pro
++++ b/examples/quick/scenegraph/simplematerial/simplematerial.pro
+@@ -8,5 +8,6 @@ RESOURCES += simplematerial.qrc
+ target.path = $$[QT_INSTALL_EXAMPLES]/quick/scenegraph/simplematerial
+ qml.files = main.qml
+ qml.path = $$[QT_INSTALL_EXAMPLES]/quick/scenegraph/simplematerial
++qml.depends = install_target
+ 
+ INSTALLS += target qml
+diff --git a/tests/manual/highdpi/highdpi.pro b/tests/manual/highdpi/highdpi.pro
+index a434f848ae..7a010896b3 100644
+--- a/tests/manual/highdpi/highdpi.pro
++++ b/tests/manual/highdpi/highdpi.pro
+@@ -10,4 +10,6 @@ SOURCES += imageprovider.cpp
+ target.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProvider
+ qml.files = ImageProvider/qmldir
+ qml.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProvider
++qml.depends = install_target
++
+ INSTALLS = target qml
+-- 
+2.25.4
+
-- 
2.25.4
