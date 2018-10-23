From: =?UTF-8?q?I=C3=B1igo=20Huguet?= <inigohuguet@fanamoel.com>
Date: Tue, 23 Oct 2018 10:25:13 +0200
Subject: [Buildroot] [PATCH 1/1] picotts: new package
Message-ID: <20181023082513.30099-1-inigohuguet@fanamoel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PicoTTS, from SVOX, is the speech synthesizer included in Android
AOSP. It's lighweight (actually it compiles really fast), very
suitable for embedded devices, it sounds good and quite natural,
and have good support of all this languages: English, Spanish,
German, French and Italian.

Languages support is probably the main improvements over the existing
speech synthesizer packages, such as flite.

Tested in desktop PC with Ubuntu and embedded device with Allwinner
A20 processor (ARMv7).

The program only can output the synthesized sound to a wav file, and
you have to specify the language as an argument if it's not en_US.
I've added to the package to scripts that are installed to /usr/bin
to help with that:
 - picotts: create the output wav file in /tmp, play it with aplay
   and delete it
 - picotts-lc: detect the current system language and call picotts
   script

Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
---
 package/Config.in            |  1 +
 package/picotts/Config.in    |  8 ++++++
 package/picotts/picotts      | 40 ++++++++++++++++++++++++++
 package/picotts/picotts-lc   | 54 ++++++++++++++++++++++++++++++++++++
 package/picotts/picotts.hash |  1 +
 package/picotts/picotts.mk   | 34 +++++++++++++++++++++++
 6 files changed, 138 insertions(+)
 create mode 100755 package/picotts/Config.in
 create mode 100755 package/picotts/picotts
 create mode 100755 package/picotts/picotts-lc
 create mode 100644 package/picotts/picotts.hash
 create mode 100755 package/picotts/picotts.mk

diff --git a/package/Config.in b/package/Config.in
index 6d2a73ff1b..97aef82b0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -44,6 +44,7 @@ menu "Audio and video applications"
 	source "package/omxplayer/Config.in"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
+	source "package/picotts/Config.in"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
 	source "package/squeezelite/Config.in"
diff --git a/package/picotts/Config.in b/package/picotts/Config.in
new file mode 100755
index 0000000000..7ee5505fa0
--- /dev/null
+++ b/package/picotts/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PICOTTS
+	bool "picotts"
+	select BR2_PACKAGE_POPT
+	help
+	  PicoTTS: text-to-speech voice synthesizer from Android AOSP.
+	  It is lightweight and sounds quite good and natural.
+	  PicoTTS supports languages: English (British and American),
+	  Spanish, German, French and Italian.
diff --git a/package/picotts/picotts b/package/picotts/picotts
new file mode 100755
index 0000000000..331aa97080
--- /dev/null
+++ b/package/picotts/picotts
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+# help msg
+if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
+	echo "Usage: picotts <lang> <msg>"
+	echo "Langs: en-US, en-GB, es-ES, de-DE, fr-FR, it-IT"
+	exit 0
+fi
+
+# errors
+if [ $# -lt 2 ]; then
+	echo "picotts: not enough arguments were given" >&2
+	exit 1
+fi
+
+case "$1" in
+	en-US|en-GB|es-ES|de-DE|fr-FR|it-IT)
+		;;
+	*)
+		echo "picotts: unsupported language: $1" >&2
+		exit 1
+		;;
+esac
+
+# create temp file
+tmpfile=$(mktemp -tp /tmp picoSndXXXXXX)
+tmpfilewav="$tmpfile.wav"
+mv "$tmpfile" "$tmpfilewav"
+
+# extract language argument
+lang_pico=$1
+shift
+
+# play message
+pico2wave -l $lang_pico -w "$tmpfilewav" "$*"
+aplay -q "$tmpfilewav"
+
+# delete temp file
+rm "$tmpfilewav"
+ 
diff --git a/package/picotts/picotts-lc b/package/picotts/picotts-lc
new file mode 100755
index 0000000000..a926f546ad
--- /dev/null
+++ b/package/picotts/picotts-lc
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+# at least 1 arg (the message to play)
+if [ $# -eq 0 ]; then
+	echo "pitotts-lc: no arguments were given" >&2
+	exit 1
+fi
+
+# help message
+if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
+	echo "Usage: picotts-lc <msg>"
+	echo "Language will be automatically detected from system locale"
+	echo "Supported languages: English, Spanish, German, French and Italian"
+	exit 0
+fi
+
+# get language configured in locale environment variable
+if [ "$LC_ALL" != "" ]; then
+	lang=$LC_ALL
+elif [ "$LC_MESSAGES" != "" ]; then
+	lang=$LC_MESSAGES
+elif [ "$LANG" != "" ]; then
+	lang=$LANG
+else
+	lang="C"
+fi
+
+# check if language is supported by picoTTS
+case "$lang" in
+	en_US*)
+		lang_pico="en-US"
+		;;
+	en*)
+		lang_pico="en-GB"
+		;;
+	es*)
+		lang_pico="es-ES"
+		;;
+	de*)
+		lang_pico="de-DE"
+		;;
+	fr*)
+		lang_pico="fr-FR"
+		;;
+	it*)
+		lang_pico="it-IT"
+		;;
+	*)
+		echo "picotts-lc: unsupported language: $lang" >&2
+		exit 1
+		;;
+esac
+
+picotts $lang_pico "$@"
diff --git a/package/picotts/picotts.hash b/package/picotts/picotts.hash
new file mode 100644
index 0000000000..967544767c
--- /dev/null
+++ b/package/picotts/picotts.hash
@@ -0,0 +1 @@
+sha256 1cc989efd85ea90ca228bbb694c4b842a909a232e2c8b9a307d241b3ddec246c  picotts-2f86050dc5da9ab68fc61510b594d8e6975c4d2d.tar.gz
diff --git a/package/picotts/picotts.mk b/package/picotts/picotts.mk
new file mode 100755
index 0000000000..02ccb4d13f
--- /dev/null
+++ b/package/picotts/picotts.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# picotts
+#
+################################################################################
+
+# pkg info
+PICOTTS_VERSION = 2f86050dc5da9ab68fc61510b594d8e6975c4d2d
+PICOTTS_SITE = $(call github,naggety,picotts,$(PICOTTS_VERSION))
+PICOTTS_LICENSE = Apache-2.0
+
+# dependencies
+PICOTTS_DEPENDENCIES = popt
+
+# extract
+define PICOTTS_EXTRACT_CMDS
+	tar xf $(PICOTTS_DL_DIR)/picotts-$(PICOTTS_VERSION).tar.gz -C $(@D) picotts-$(PICOTTS_VERSION)/pico --strip-components=2
+endef
+
+# generate build files (autotools)
+PICOTTS_PRE_CONFIGURE_HOOKS += PICOTTS_EXEC_AUTOGEN
+define PICOTTS_EXEC_AUTOGEN
+	cd $(@D) && ./autogen.sh
+endef
+
+# install additional files
+PICOTTS_POST_INSTALL_TARGET_HOOKS += PICOTTS_INSTALL_ADDITIONAL_FILES
+define PICOTTS_INSTALL_ADDITIONAL_FILES
+	$(INSTALL) -D -m 0755 $(TOPDIR)/$(PICOTTS_PKGDIR)/picotts $(TARGET_DIR)/usr/bin/picotts
+	$(INSTALL) -D -m 0755 $(TOPDIR)/$(PICOTTS_PKGDIR)/picotts-lc $(TARGET_DIR)/usr/bin/picotts-lc
+endef
+
+# build
+$(eval $(autotools-package))
-- 
2.17.1
