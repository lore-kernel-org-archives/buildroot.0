From: Mitchell Dokken <mitchell.dokken@gmail.com>
Date: Mon,  7 Jan 2019 21:26:58 -0600
Subject: [Buildroot] [PATCH 1/1] Provides puredata package
Message-ID: <20190108032658.25220-1-Mitchell.Dokken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mitchell Dokken <Mitchell.Dokken@gmail.com>
---
 package/Config.in              |  1 +
 package/puredata/Config.in     | 12 ++++++++++++
 package/puredata/puredata.hash |  2 ++
 package/puredata/puredata.mk   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/puredata/Config.in
 create mode 100644 package/puredata/puredata.hash
 create mode 100644 package/puredata/puredata.mk

diff --git a/package/Config.in b/package/Config.in
index 0df9b73088..e029de53db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -45,6 +45,7 @@ menu "Audio and video applications"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pulseaudio/Config.in"
+	source "package/puredata/Config.in"
 	source "package/sox/Config.in"
 	source "package/squeezelite/Config.in"
 	source "package/tovid/Config.in"
diff --git a/package/puredata/Config.in b/package/puredata/Config.in
new file mode 100644
index 0000000000..c8bafe8885
--- /dev/null
+++ b/package/puredata/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PUREDATA
+	bool "puredata"
+	select BR2_PACKAGE_TK
+	select BR2_PACKAGE_TCL
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_UTILS
+	select BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XAPP_XAUTH
+
+	help
+		Graphic realtime audio programming language
+		http://msp.ucsd.edu/software.htm
diff --git a/package/puredata/puredata.hash b/package/puredata/puredata.hash
new file mode 100644
index 0000000000..505dbe3679
--- /dev/null
+++ b/package/puredata/puredata.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+d2e04e75d22b0e41f27daacc0cd6ec6b05ae0ef214cc7315d57e5bfbeec23fa3  pd-0.49-0.src.tar.gz
diff --git a/package/puredata/puredata.mk b/package/puredata/puredata.mk
new file mode 100644
index 0000000000..842970b983
--- /dev/null
+++ b/package/puredata/puredata.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# puredata
+#
+################################################################################
+
+PUREDATA_VERSION =  0.49-0
+PUREDATA_SOURCE = pd-$(PUREDATA_VERSION).src.tar.gz
+PUREDATA_SITE = http://msp.ucsd.edu/Software
+PUREDATA_INSTALL_STAGING = YES
+PUREDATA_INSTALL_TARGET = YES
+PUREDATA_AUTORECONF = YES
+PUREDATA_CONF_OPTS = --no-recursion --disable-locales
+
+PUREDATA_DEPENDENCIES = alsa-utils tcl tk
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+PUREDATA_CONF_OPTS += --enable-portaudio
+else
+PUREDATA_CONF_OPTS += --disable-portaudio
+endif
+
+ifeq ($(BR2_PACKAGE_JACK2),y)
+PUREDATA_CONF_OPTS += --enable-jack
+else
+PUREDATA_CONF_OPTS += --disable-jack
+endif
+
+define PUREDATA_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+PUREDATA_PRE_CONFIGURE_HOOKS += PUREDATA_RUN_AUTOGEN
+
+$(eval $(autotools-package))
-- 
2.11.0
