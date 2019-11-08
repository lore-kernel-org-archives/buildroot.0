From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  8 Nov 2019 23:28:32 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/rpi-userland: bump version to
 5070cb7f
Message-ID: <20191108222834.9269-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rebased 0003-Disable-Werror-everywhere.patch
- remove vcfiled support (upstream removed, see [1])

[1] https://github.com/raspberrypi/userland/commit/f00a1189b9f8246dc24c45985de599c50b8c62a5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
 - moved remove of rpi-userland vcfiled files here
   (suggested by Baruch Siach)

Changes v2 -> v3:
 - resend because of white space damage of the last version
---
 Config.in.legacy                              |  6 +++
 .../0003-Disable-Werror-everywhere.patch      | 27 ++++-------
 package/rpi-userland/Config.in                |  7 ---
 package/rpi-userland/S94vcfiled               | 47 -------------------
 package/rpi-userland/rpi-userland.hash        |  2 +-
 package/rpi-userland/rpi-userland.mk          | 23 +--------
 package/rpi-userland/vcfiled.service          |  9 ----
 7 files changed, 18 insertions(+), 103 deletions(-)
 delete mode 100644 package/rpi-userland/S94vcfiled
 delete mode 100644 package/rpi-userland/vcfiled.service

diff --git a/Config.in.legacy b/Config.in.legacy
index fcb10b1291..7167b1d60c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif

 comment "Legacy options removed in 2019.11"

+config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
+	bool "rpi-userland start vcfiled was removed"
+	select BR2_LEGACY
+	help
+	  The vcfiled support was removed upstream.
+
 config BR2_PACKAGE_ALLJOYN
 	bool "alljoyn was removed"
 	select BR2_LEGACY
diff --git a/package/rpi-userland/0003-Disable-Werror-everywhere.patch b/package/rpi-userland/0003-Disable-Werror-everywhere.patch
index 7fb2f97978..27c8acdd41 100644
--- a/package/rpi-userland/0003-Disable-Werror-everywhere.patch
+++ b/package/rpi-userland/0003-Disable-Werror-everywhere.patch
@@ -1,4 +1,4 @@
-From 8275a380658070336df0c404f0ff585d27681836 Mon Sep 17 00:00:00 2001
+From cc9ac86bcff79697d354cc51d3a984fd0f362868 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Thu, 22 Sep 2016 22:59:11 +0200
 Subject: [PATCH] Disable Werror everywhere
@@ -15,6 +15,9 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 [Rebased for rpi-userland-8f0abfb07b96e7ee85f46e59d895014ec5e25f5e]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+[Rebased for rpi-userland-5070cb7fc150fc98f1ed64a7739c3356970d9f76]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  host_applications/android/apps/vidtex/CMakeLists.txt | 2 +-
  host_applications/linux/apps/gencmd/CMakeLists.txt   | 2 +-
@@ -26,8 +29,7 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  interface/vcos/CMakeLists.txt                        | 2 +-
  interface/vcos/pthreads/CMakeLists.txt               | 2 +-
  interface/vmcs_host/CMakeLists.txt                   | 2 +-
- interface/vmcs_host/linux/vcfiled/CMakeLists.txt     | 2 +-
- 11 files changed, 11 insertions(+), 11 deletions(-)
+ 10 files changed, 10 insertions(+), 10 deletions(-)

 diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
 index 6d66d69..06a3192 100644
@@ -55,7 +57,7 @@ index f95d1a1..034bf20 100644

  include_directories( ../../../..
 diff --git a/host_applications/linux/apps/raspicam/CMakeLists.txt b/host_applications/linux/apps/raspicam/CMakeLists.txt
-index 42636e8..d778f09 100644
+index f7db21e..b94bdc3 100644
 --- a/host_applications/linux/apps/raspicam/CMakeLists.txt
 +++ b/host_applications/linux/apps/raspicam/CMakeLists.txt
 @@ -1,7 +1,7 @@
@@ -107,7 +109,7 @@ index 5ce5aca..02aea7c 100644

  include_directories( ../../../..
 diff --git a/interface/mmal/CMakeLists.txt b/interface/mmal/CMakeLists.txt
-index 37ae757..78b24a9 100644
+index 46f149d..06273dc 100644
 --- a/interface/mmal/CMakeLists.txt
 +++ b/interface/mmal/CMakeLists.txt
 @@ -3,7 +3,7 @@ if (NOT DEFINED LIBRARY_TYPE)
@@ -146,7 +148,7 @@ index 1d81ca3..b35cd8e 100644
  endif ()

 diff --git a/interface/vmcs_host/CMakeLists.txt b/interface/vmcs_host/CMakeLists.txt
-index fde18da..802c158 100755
+index a157db1..dc384ca 100755
 --- a/interface/vmcs_host/CMakeLists.txt
 +++ b/interface/vmcs_host/CMakeLists.txt
 @@ -2,7 +2,7 @@
@@ -158,17 +160,6 @@ index fde18da..802c158 100755

  # vc_vchi_gencmd.c has a type-punning problem in vc_gencmd_read_response
  add_definitions(-fno-strict-aliasing)
-diff --git a/interface/vmcs_host/linux/vcfiled/CMakeLists.txt b/interface/vmcs_host/linux/vcfiled/CMakeLists.txt
-index aed0e83..d834b3f 100644
---- a/interface/vmcs_host/linux/vcfiled/CMakeLists.txt
-+++ b/interface/vmcs_host/linux/vcfiled/CMakeLists.txt
-@@ -1,5 +1,5 @@
-
--add_definitions(-Werror)
-+add_definitions()
-
- # vcfiled - serves files to videocore. used for media handlers from
- # OpenMAX/IL and loading VLLs.
 --
-2.19.0
+2.23.0

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 8d349f21e1..342faf26e3 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -32,13 +32,6 @@ config BR2_PACKAGE_PROVIDES_LIBOPENVG
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
 	default "rpi-userland"

-config BR2_PACKAGE_RPI_USERLAND_START_VCFILED
-	bool "Start vcfiled"
-	depends on BR2_INIT_SYSV || BR2_INIT_BUSYBOX
-	help
-	  vcfiled is a daemon serving files to VideoCore from the host
-	  file system.
-
 config BR2_PACKAGE_RPI_USERLAND_HELLO
 	bool "hello_pi examples"
 	help
diff --git a/package/rpi-userland/S94vcfiled b/package/rpi-userland/S94vcfiled
deleted file mode 100644
index 4d27b91bae..0000000000
--- a/package/rpi-userland/S94vcfiled
+++ /dev/null
@@ -1,47 +0,0 @@
-#!/bin/sh
-
-NAME=vcfiled
-DESC="VideoCore file server daemon $NAME"
-DAEMON="/usr/sbin/$NAME"
-DAEMON_ARGS=""
-CFGFILE="/etc/default/$NAME"
-PIDFILE="/var/run/$NAME.pid"
-
-# Read configuration variable file if it is present
-[ -r "$CFGFILE" ] && . "$CFGFILE"
-
-start()
-{
-	printf "Starting $DESC: "
-	start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS &&
-			echo "done" || echo "failed"
-}
-
-stop()
-{
-	printf "Stopping $DESC: "
-	if start-stop-daemon -K -q -R TERM/30/KILL/5 -p "$PIDFILE" -n "$NAME"; then
-		# This daemon does not remove its PID file when it exits.
-		rm -f "$PIDFILE"
-		echo "done"
-	else
-		echo "failed"
-	fi
-}
-
-case "$1" in
-	start)
-		start
-		;;
-	stop)
-		stop
-		;;
-	restart|reload)
-		stop
-		start
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}" >&2
-		exit 1
-		;;
-esac
diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 2502a3f592..6d59f2aafc 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9424ffa45ef888fb61483c63fd66532c1c648e071fea72c93762efbb3c2a8669 rpi-userland-e5803f2c986cbf8c919c60278b3231dcdf4271a6.tar.gz
+sha256 d6231e9fa33c805cf7cbb559a0d6eb125605fc2ba862d9e5a3248778dd269859 rpi-userland-5070cb7fc150fc98f1ed64a7739c3356970d9f76.tar.gz
 sha256 bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5 LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 20ef2fca98..2b672b6c97 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,31 +4,15 @@
 #
 ################################################################################

-RPI_USERLAND_VERSION = e5803f2c986cbf8c919c60278b3231dcdf4271a6
+RPI_USERLAND_VERSION = 5070cb7fc150fc98f1ed64a7739c3356970d9f76
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
-RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) \
-		-DVCFILED_LOCKFILE=\\\"/var/run/vcfiled.pid\\\""
+RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr

 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg

-ifeq ($(BR2_PACKAGE_RPI_USERLAND_START_VCFILED),y)
-define RPI_USERLAND_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/rpi-userland/S94vcfiled \
-		$(TARGET_DIR)/etc/init.d/S94vcfiled
-endef
-define RPI_USERLAND_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/rpi-userland/vcfiled.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/vcfiled.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/vcfiled.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vcfiled.service
-endef
-endif
-
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)

 RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
@@ -54,9 +38,6 @@ RPI_USERLAND_CONF_OPTS += -DALL_APPS=OFF
 endif # BR2_PACKAGE_RPI_USERLAND_HELLO

 define RPI_USERLAND_POST_TARGET_CLEANUP
-	rm -f $(TARGET_DIR)/etc/init.d/vcfiled
-	rm -f $(TARGET_DIR)/usr/share/install/vcfiled
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/install
 	rm -Rf $(TARGET_DIR)/usr/src
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
diff --git a/package/rpi-userland/vcfiled.service b/package/rpi-userland/vcfiled.service
deleted file mode 100644
index b09aa62774..0000000000
--- a/package/rpi-userland/vcfiled.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=VideoCore file server daemon
-
-[Service]
-ExecStart=/usr/sbin/vcfiled --foreground
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
--
2.23.0
