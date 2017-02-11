From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:19:48 +0100
Subject: [Buildroot] [git commit] poppler: Add option for Qt5 support
Message-ID: <20170211142003.6406180163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=056b5572fc20b4d3a98dbe12e4ec77f2fa360090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to build the libpoppler-qt5 library.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/Config.in  | 9 +++++++++
 package/poppler/poppler.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 2ca3ff6..d741f65 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -24,6 +24,15 @@ config BR2_PACKAGE_POPPLER_QT
 comment "poppler Qt support needs a toolchain not affected by Binutils bug 19405"
 	depends on BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
 
+config BR2_PACKAGE_POPPLER_QT5
+	bool "Qt5 support"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5BASE_XML
+	help
+	  Build Qt support into the Poppler library
+
 endif
 
 comment "poppler needs a toolchain w/ C++, threads"
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 3e8a9f4..022c2c5 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -87,6 +87,13 @@ else
 POPPLER_CONF_OPTS += --disable-poppler-qt4
 endif
 
+ifeq ($(BR2_PACKAGE_POPPLER_QT5),y)
+POPPLER_DEPENDENCIES += qt5base
+POPPLER_CONF_OPTS += --enable-poppler-qt5
+else
+POPPLER_CONF_OPTS += --disable-poppler-qt5
+endif
+
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 POPPLER_DEPENDENCIES += openjpeg
 POPPLER_CONF_OPTS += --enable-libopenjpeg
