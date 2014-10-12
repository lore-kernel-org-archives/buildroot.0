From: Alan Ott <alan@signal11.us>
Date: Sun, 12 Oct 2014 15:56:52 -0400
Subject: [Buildroot] [PATCH 1/2] poppler: Add option for Qt support
In-Reply-To: <1413143813-26783-1-git-send-email-alan@signal11.us>
References: <20140406120221.5a5fd253@skate>
 <1413143813-26783-1-git-send-email-alan@signal11.us>
Message-ID: <1413143813-26783-2-git-send-email-alan@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to build the libpoppler-qt4 library.

Signed-off-by: Alan Ott <alan@signal11.us>
Suggested-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
---
 package/poppler/Config.in  | 9 +++++++++
 package/poppler/poppler.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index fce296d..08cceb0 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -10,5 +10,14 @@ config BR2_PACKAGE_POPPLER
 
 	  http://poppler.freedesktop.org/
 
+config BR2_PACKAGE_POPPLER_QT
+	bool "Qt support for poppler"
+	depends on BR2_PACKAGE_POPPLER
+	depends on BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_GUI
+	select BR2_PACKAGE_QT_XML
+	help
+	  Build Qt support into the Poppler library
+
 comment "poppler needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index e4fee3f..a52b079 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -61,4 +61,11 @@ else
 	POPPLER_CONF_OPTS += --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_POPPLER_QT),y)
+	POPPLER_DEPENDENCIES += qt
+	POPPLER_CONF_OPTS += --enable-poppler-qt4
+else
+	POPPLER_CONF_OPTS += --disable-poppler-qt4
+endif
+
 $(eval $(autotools-package))
-- 
2.1.0
