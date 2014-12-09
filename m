From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 00:05:08 +0100
Subject: [Buildroot] [git commit] poppler: Add option for Qt support
Message-ID: <20141209230749.E935780195@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb79843453704ae68cf8d91e2a9cd5359d0b1027
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to build the libpoppler-qt4 library.

[Thomas: slightly adjust the Config.in file, by:
  - Using an if BR2_PACKAGE_POPPLER ... endif block instead of a depends
    on BR2_PACKAGE_POPPLER for the new option.
  - Rewording the option prompt, since there's no need to indicate that
    the Qt support is for poppler since we're already a sub-option of
    poppler.]

Signed-off-by: Alan Ott <alan@signal11.us>
Suggested-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

merge
---
 package/poppler/Config.in  |   12 ++++++++++++
 package/poppler/poppler.mk |    7 +++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index fce296d..5166e15 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -10,5 +10,17 @@ config BR2_PACKAGE_POPPLER
 
 	  http://poppler.freedesktop.org/
 
+if BR2_PACKAGE_POPPLER
+
+config BR2_PACKAGE_POPPLER_QT
+	bool "Qt support"
+	depends on BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_GUI
+	select BR2_PACKAGE_QT_XML
+	help
+	  Build Qt support into the Poppler library
+
+endif
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
