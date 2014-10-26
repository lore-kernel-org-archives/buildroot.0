From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 14:09:25 +0100
Subject: [Buildroot] [git commit] mp4v2: new package
Message-ID: <20141026130945.19247B069A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53e22e14a78c104b37333c3e88d8e853df31f23a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use --enable-largefile/--disable-largefile as appropriate.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/mp4v2/Config.in  |   22 ++++++++++++++++++++++
 package/mp4v2/mp4v2.hash |    2 ++
 package/mp4v2/mp4v2.mk   |   26 ++++++++++++++++++++++++++
 4 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9e361b9..33d270c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -558,6 +558,7 @@ menu "Audio/Sound"
 	source "package/libsndfile/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/mp4v2/Config.in"
 	source "package/opencore-amr/Config.in"
 	source "package/opus/Config.in"
 	source "package/portaudio/Config.in"
diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
new file mode 100644
index 0000000..42315a2
--- /dev/null
+++ b/package/mp4v2/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_MP4V2
+	bool "mp4v2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The MP4v2 library provides functions to read, create, and
+	  modify mp4 files.
+
+	  https://code.google.com/p/mp4v2/
+
+if BR2_PACKAGE_MP4V2
+
+config BR2_PACKAGE_MP4V2_UTIL
+	bool "Install mp4 command line tools"
+	help
+	  Enable to install the mp4 command line tools mp4art,
+	  mp4chaps, mp4extract, mp4info, mp4subtitle, mp4tags, and
+	  mp4trackdump.
+
+endif
+
+comment "mp4v2 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
new file mode 100644
index 0000000..d5a49c4
--- /dev/null
+++ b/package/mp4v2/mp4v2.hash
@@ -0,0 +1,2 @@
+# From https://code.google.com/p/mp4v2/downloads/detail?name=mp4v2-2.0.0.tar.bz2
+sha1 193260cfb7201e6ec250137bcca1468d4d20e2f0 mp4v2-2.0.0.tar.bz2
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
new file mode 100644
index 0000000..c89b7e0
--- /dev/null
+++ b/package/mp4v2/mp4v2.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# mp4v2
+#
+################################################################################
+
+MP4V2_VERSION = 2.0.0
+MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
+MP4V2_SITE = https://mp4v2.googlecode.com/files
+MP4V2_INSTALL_STAGING = YES
+MP4V2_LICENSE = MPLv1.1
+MP4V2_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_LARGEFILE),y)
+MP4V2_CONF_OPTS += --enable-largefile
+else
+MP4V2_CONF_OPTS += --disable-largefile
+endif
+
+ifeq ($(BR2_PACKAGE_MP4V2_UTIL),y)
+MP4V2_CONF_OPTS += --enable-util
+else
+MP4V2_CONF_OPTS += --disable-util
+endif
+
+$(eval $(autotools-package))
