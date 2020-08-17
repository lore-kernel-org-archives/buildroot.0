From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 17 Aug 2020 11:10:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: bump to v1.6.11
Message-ID: <20200817091055.203521-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mosquitto 1.6.11 is a bugfix release, read the whole announcement on
http://mosquitto.org/blog/2020/08/version-1-6-11-released/

From the changelog of the client library:
mosquitto_loop_start() now sets a thread name on Linux, FreeBSD, NetBSD,
and OpenBSD. Closes #1777.
This is done with pthread_setname_np; so mosquitto now requires
BR2_TOOLCHAIN_HAS_THREADS_NPTL.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/mosquitto/Config.in      | 4 ++++
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index b4effa36be..21cd56c492 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_setname_np
 	help
 	  Eclipse Mosquitto is an open source (EPL/EDL licensed) message
 	  broker that implements the MQTT protocol versions 5.0, 3.1.1
@@ -19,6 +20,9 @@ config BR2_PACKAGE_MOSQUITTO
 
 	  http://mosquitto.org/
 
+comment "mosquitto needs nptl"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 482962490e..1470a93aa7 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-1.6.10.tar.gz.asc
-sha256  92d1807717f0f6d57d1ac1207ffdb952e8377e916c7b0bb4718f745239774232  mosquitto-1.6.10.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-1.6.11.tar.gz.asc
+sha256  b02d8f1368c40d5779ee125c37daf9003608eb47d7fbb04c5b938c76c1230a1f  mosquitto-1.6.11.tar.gz
 
 # License files
 sha256  cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index cdd515e1a4..1e3e854bda 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.10
+MOSQUITTO_VERSION = 1.6.11
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
-- 
2.25.3
