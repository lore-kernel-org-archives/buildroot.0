From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 29 Jun 2011 18:13:27 +0200
Subject: [Buildroot] [PATCH 2/2] Add sound support for at91sam9x5ek board
In-Reply-To: <1309364007-17823-1-git-send-email-ludovic.desroches@atmel.com>
References: <1309364007-17823-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <65cf5e71df0a46f12afc654f4b5c1da62b285476.1309358465.git.ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 board/atmel/at91sam9x5ek/alsa/S39alsa-state      |   29 ++++
 board/atmel/at91sam9x5ek/alsa/asound.conf        |    2 +
 board/atmel/at91sam9x5ek/alsa/asound.state       |  166 ++++++++++++++++++++++
 board/atmel/at91sam9x5ek/alsa/post-build_alsa.sh |   19 +++
 board/atmel/at91sam9x5ek/post-build.sh           |    6 +
 5 files changed, 222 insertions(+), 0 deletions(-)
 create mode 100755 board/atmel/at91sam9x5ek/alsa/S39alsa-state
 create mode 100644 board/atmel/at91sam9x5ek/alsa/asound.conf
 create mode 100644 board/atmel/at91sam9x5ek/alsa/asound.state
 create mode 100755 board/atmel/at91sam9x5ek/alsa/post-build_alsa.sh
 create mode 100755 board/atmel/at91sam9x5ek/post-build.sh

diff --git a/board/atmel/at91sam9x5ek/alsa/S39alsa-state b/board/atmel/at91sam9x5ek/alsa/S39alsa-state
new file mode 100755
index 0000000..7023253
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/alsa/S39alsa-state
@@ -0,0 +1,29 @@
+#! /bin/sh
+#
+# Copyright Matthias Hentges <devel@hentges.net> (c) 2007
+# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
+#
+# Filename: alsa-state
+# Date: 20070308 (YMD)
+
+
+asound_restore(){
+	echo "ALSA: Restoring mixer settings..."
+	if test -x /usr/sbin/alsactl -a -e /etc/asound.state
+	then
+		/usr/sbin/alsactl -f /etc/asound.state restore &
+	fi
+}
+
+asound_store(){
+	echo "ALSA: Storing mixer settings..."
+	if test -x /usr/sbin/alsactl
+	then
+		/usr/sbin/alsactl -f /etc/asound.state store
+	fi
+}
+
+case "$1" in
+start)          asound_restore ;;
+stop)           asound_store ;;
+esac
diff --git a/board/atmel/at91sam9x5ek/alsa/asound.conf b/board/atmel/at91sam9x5ek/alsa/asound.conf
new file mode 100644
index 0000000..87bb5ec
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/alsa/asound.conf
@@ -0,0 +1,2 @@
+pcm.!default {  type hw  card 0  } 
+ctl.!default {  type hw  card 0  }
diff --git a/board/atmel/at91sam9x5ek/alsa/asound.state b/board/atmel/at91sam9x5ek/alsa/asound.state
new file mode 100644
index 0000000..5f0349b
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/alsa/asound.state
@@ -0,0 +1,166 @@
+state.AT91SAM9X5 {
+	control.1 {
+		iface MIXER
+		name 'Master Playback Volume'
+		value.0 100
+		value.1 100
+		comment {
+			access 'read write'
+			type INTEGER
+			count 2
+			range '0 - 127'
+			dbmin -9999999
+			dbmax 600
+			dbvalue.0 0
+			dbvalue.1 0
+		}
+	}
+	control.2 {
+		iface MIXER
+		name 'Master Playback ZC Switch'
+		value.0 false
+		value.1 false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 2
+		}
+	}
+	control.3 {
+		iface MIXER
+		name 'Capture Volume'
+		value.0 29
+		value.1 29
+		comment {
+			access 'read write'
+			type INTEGER
+			count 2
+			range '0 - 31'
+			dbmin -3450
+			dbmax 1200
+			dbvalue.0 900
+			dbvalue.1 900
+		}
+	}
+	control.4 {
+		iface MIXER
+		name 'Line Capture Switch'
+		value.0 true
+		value.1 true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 2
+		}
+	}
+	control.5 {
+		iface MIXER
+		name 'Mic Boost Volume'
+		value 0
+		comment {
+			access 'read write'
+			type INTEGER
+			count 1
+			range '0 - 1'
+			dbmin 0
+			dbmax 2000
+			dbvalue.0 0
+		}
+	}
+	control.6 {
+		iface MIXER
+		name 'Mic Capture Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.7 {
+		iface MIXER
+		name 'Sidetone Playback Volume'
+		value 3
+		comment {
+			access 'read write'
+			type INTEGER
+			count 1
+			range '0 - 3'
+			dbmin -1500
+			dbmax -600
+			dbvalue.0 -600
+		}
+	}
+	control.8 {
+		iface MIXER
+		name 'ADC High Pass Filter Switch'
+		value true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.9 {
+		iface MIXER
+		name 'Store DC Offset Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.10 {
+		iface MIXER
+		name 'Playback Deemphasis Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.11 {
+		iface MIXER
+		name 'Input Mux'
+		value 'Line In'
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 'Line In'
+			item.1 Mic
+		}
+	}
+	control.12 {
+		iface MIXER
+		name 'Output Mixer Line Bypass Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.13 {
+		iface MIXER
+		name 'Output Mixer Mic Sidetone Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.14 {
+		iface MIXER
+		name 'Output Mixer HiFi Playback Switch'
+		value true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+}
diff --git a/board/atmel/at91sam9x5ek/alsa/post-build_alsa.sh b/board/atmel/at91sam9x5ek/alsa/post-build_alsa.sh
new file mode 100755
index 0000000..84dad10
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/alsa/post-build_alsa.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+
+echo "Copying alsa configuration files..."
+cp $2/alsa/asound* $1/etc/
+if [ $? = 0 ]; then
+	echo "Done."
+else
+        echo "Failed."
+fi
+
+echo "Copying alsa initialisation script..."
+cp $2/alsa/S39alsa-state $1/etc/init.d/
+chmod 755 $1/etc/init.d/S39alsa-state
+if [ $? = 0 ]; then
+	echo "Done."
+else
+        echo "Failed."
+fi
+
diff --git a/board/atmel/at91sam9x5ek/post-build.sh b/board/atmel/at91sam9x5ek/post-build.sh
new file mode 100755
index 0000000..ced81d1
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/post-build.sh
@@ -0,0 +1,6 @@
+#!/bin/bash
+
+ATMEL_DIR="board/atmel/at91sam9x5ek"
+
+# alsa stuff
+${ATMEL_DIR}/alsa/post-build_alsa.sh $1 ${ATMEL_DIR}
-- 
1.7.0.4
