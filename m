From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 17:47:51 +0100
Subject: [Buildroot] [git commit] qextserialport: tell qmake to generate .pc
	file
Message-ID: <20161125164755.BD46481E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d5241615af6fcd134d9937fc4c00ea33825d6db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of creating our own .pc file with a patch, just tell qmake to
do it by adding create_pc to CONFIG.

This corrects the .pc file for Qt5. Previously, the include directory
was set to /usr/include, while for Qt5 it should be /usr/include/qt5.
This hasn't caused any autobuild failures since no other package uses
qextserialport.

Note, however, that the package is now called Qt5ExtSerialPort in Qt5,
while before it was qextserialport like in the Qt4 case.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...to-add-a-pkgconfig-file-to-ease-usage-wit.patch | 28 ++++++++++++++++++++++
 package/qextserialport/0003-pkgconfig.patch        | 19 ---------------
 package/qextserialport/qextserialport.mk           |  1 -
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/package/qextserialport/0003-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch b/package/qextserialport/0003-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch
new file mode 100644
index 0000000..09e26a9
--- /dev/null
+++ b/package/qextserialport/0003-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch
@@ -0,0 +1,28 @@
+From 14d4d3e7b5c748118acffddd397fb67b37fd5054 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Thu, 24 Nov 2016 22:44:02 +0100
+Subject: [PATCH] Tell qmake to add a pkgconfig file to ease usage with
+ applications
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ qextserialport.pro | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/qextserialport.pro b/qextserialport.pro
+index 8d2c03a..2fcb39c 100644
+--- a/qextserialport.pro
++++ b/qextserialport.pro
+@@ -42,7 +42,8 @@ TEMPLATE=lib
+ include(src/qextserialport.pri)
+ 
+ #create_prl is needed, otherwise, MinGW can't found libqextserialport1.a
+-CONFIG += create_prl
++CONFIG += create_prl create_pc
++QMAKE_PKGCONFIG_DESTDIR = pkgconfig
+ 
+ #mac framework is designed for shared library
+ macx:qesp_mac_framework:qesp_static: CONFIG -= qesp_static
+-- 
+2.10.2
+
diff --git a/package/qextserialport/0003-pkgconfig.patch b/package/qextserialport/0003-pkgconfig.patch
deleted file mode 100644
index bb55ad7..0000000
--- a/package/qextserialport/0003-pkgconfig.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Add a pkgconfig file to ease usage with applications
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: qextserialport-ef4af2a2ee3f/qextserialport.pc
-===================================================================
---- /dev/null
-+++ qextserialport-ef4af2a2ee3f/qextserialport.pc
-@@ -0,0 +1,10 @@
-+prefix=/usr
-+exec_prefix=${prefix}
-+libdir=${prefix}/lib
-+includedir=${prefix}/include/QtExtSerialPort
-+
-+Name: QtExtSerialPort
-+Description: QtExtSerialPort library
-+Version: 1.2.0
-+Libs: -L${libdir} -lqextserialport
-+Cflags: -I${includedir}
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 62bf3b0..1100946 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -32,7 +32,6 @@ endef
 
 define QEXTSERIALPORT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	cp $(@D)/qextserialport.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 endef
 
 ifeq ($(BR2_STATIC_LIBS),y)
