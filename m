From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:31:41 +0200
Subject: [Buildroot] [git commit] package/mosquitto: security bump to v1.6.12
Message-ID: <20200829172516.20531821DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df15d751c7211af8c15f04b039edb466fee05658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mosquitto 1.6.11 is a bugfix release, read the whole announcement on
http://mosquitto.org/blog/2020/08/version-1-6-11-released/

Mosquitto 1.6.12 is a security and bugfix release, read
http://mosquitto.org/blog/2020/08/version-1-6-12-released/

From the 1.6.11 changelog of the client library:
mosquitto_loop_start() now sets a thread name on Linux, FreeBSD, NetBSD,
and OpenBSD. Closes #1777.
This is done with pthread_setname_np; so mosquitto now requires
BR2_TOOLCHAIN_HAS_THREADS_NPTL when built with threading support.

2 reverse dependencies use the threaded API, but they already
depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL:
* domoticz [1] (we add a comment for mosquitto)
* shairport-sync [2]

[1] https://github.com/domoticz/domoticz/blob/2020.1/main/mosquitto_helper.cpp#L344
[2] https://github.com/mikebrady/shairport-sync/blob/3.3.6/mqtt.c#L227-L229

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/Config.in       | 2 +-
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 1ed2d63520..42244524d2 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sleep_for
 	# pthread_condattr_setclock
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LUA_5_3
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 482962490e..13f0c8de23 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-1.6.10.tar.gz.asc
-sha256  92d1807717f0f6d57d1ac1207ffdb952e8377e916c7b0bb4718f745239774232  mosquitto-1.6.10.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-1.6.12.tar.gz.asc
+sha256  548d73d19fb787dd0530334e398fd256ef3a581181678488a741a995c4f007fb  mosquitto-1.6.12.tar.gz
 
 # License files
 sha256  cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index cdd515e1a4..5734dd45c5 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.10
+MOSQUITTO_VERSION = 1.6.12
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
@@ -41,7 +41,8 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_ADNS=no
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# threaded API uses pthread_setname_np
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=yes
 else
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=no
