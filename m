From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Apr 2019 18:57:58 +0200
Subject: [Buildroot] [PATCH 2/4] package/squeezelite: add optional
 lirc-tools dependency
In-Reply-To: <20190406165800.4493-1-fontaine.fabrice@gmail.com>
References: <20190406165800.4493-1-fontaine.fabrice@gmail.com>
Message-ID: <20190406165800.4493-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squeezelite/Config.in      | 8 ++++++++
 package/squeezelite/squeezelite.mk | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index 57f55ffc8c..b1820a146d 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -27,6 +27,14 @@ config BR2_PACKAGE_SQUEEZELITE_FFMPEG
 config BR2_PACKAGE_SQUEEZELITE_DSD
 	bool "Enable DSD decoding"
 
+config BR2_PACKAGE_SQUEEZELITE_LIRC
+	bool "Enable lirc support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIRC_TOOLS
+
+comment "lirc support needs a toolchain with C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
 	bool "Enable resampling support"
 	select BR2_PACKAGE_LIBSOXR
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index 012b5304ab..e41053663a 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -20,6 +20,11 @@ ifeq ($(BR2_PACKAGE_SQUEEZELITE_DSD),y)
 SQUEEZELITE_MAKE_OPTS += -DDSD
 endif
 
+ifeq ($(BR2_PACKAGE_SQUEEZELITE_LIRC),y)
+SQUEEZELITE_DEPENDENCIES += lirc-tools
+SQUEEZELITE_MAKE_OPTS += -DIR
+endif
+
 ifeq ($(BR2_PACKAGE_SQUEEZELITE_RESAMPLE),y)
 SQUEEZELITE_DEPENDENCIES += libsoxr
 SQUEEZELITE_MAKE_OPTS += -DRESAMPLE
-- 
2.20.1
