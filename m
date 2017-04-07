From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Apr 2017 00:24:03 +0200
Subject: [Buildroot] [git commit] mosquitto: bump to version 1.4.11
Message-ID: <20170407225240.8571E816A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d098e18d14551062937bf987a9e1cac3696a9b53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- This version requires a patch (sent upstream) to remove -lanl from
all Linux builds as this library is only needed for adns support
 - sha512 must be computed locally as eclipse.org does not give it for
this version

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Remove-lanl-when-WITH_ADNS-is-unset.patch | 32 ++++++++++++++++++++++
 package/mosquitto/mosquitto.hash                   |  4 +--
 package/mosquitto/mosquitto.mk                     |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/0001-Remove-lanl-when-WITH_ADNS-is-unset.patch b/package/mosquitto/0001-Remove-lanl-when-WITH_ADNS-is-unset.patch
new file mode 100644
index 0000000..f9b1b27
--- /dev/null
+++ b/package/mosquitto/0001-Remove-lanl-when-WITH_ADNS-is-unset.patch
@@ -0,0 +1,32 @@
+From 0de640dd834b6c01c4904e11d51f3a1406c89469 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 3 Apr 2017 20:34:07 +0200
+Subject: [PATCH] Remove -lanl when WITH_ADNS is unset
+
+Do not add -lanl to BROKER_LIBS for all Linux builds.
+Indeed, -lanl is only needed for getaddrinfo_a which is only used in
+_mosquitto_try_connect_step1 when WITH_ADNS is set
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ config.mk | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index 6e369c2..44639d2 100644
+--- a/config.mk
++++ b/config.mk
+@@ -159,10 +159,6 @@ ifeq ($(UNAME),QNX)
+ 	LIB_LIBS:=$(LIB_LIBS) -lsocket
+ endif
+ 
+-ifeq ($(UNAME),Linux)
+-	BROKER_LIBS:=$(BROKER_LIBS) -lanl
+-endif
+-
+ ifeq ($(WITH_WRAP),yes)
+ 	BROKER_LIBS:=$(BROKER_LIBS) -lwrap
+ 	BROKER_CFLAGS:=$(BROKER_CFLAGS) -DWITH_WRAP
+-- 
+2.5.0
+
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index b0b860f..5514c21 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
-# From https://www.eclipse.org/downloads/download.php?file=/mosquitto/source/mosquitto-1.4.10.tar.gz
-sha512  fe5d6d7196a137a496ba6881c77d852396baefb4f0b83ccd9a22175fc05b09e48a09ea249e30ec7db966e11de134ebcc4e2e9b1fd40b31dc59fb0fa2f60b75a1  mosquitto-1.4.10.tar.gz
+# Locally computed:
+sha512  c05ca8679b9a6f540868f4ccf701257fcabc114d5450ac0bbbe80b91bb7cd4fc52668773e945506760c7a5bd8a494e0a56100714112e5d2713d57bfab8951587  mosquitto-1.4.11.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index ddac153..c273c98 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.10
+MOSQUITTO_VERSION = 1.4.11
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
