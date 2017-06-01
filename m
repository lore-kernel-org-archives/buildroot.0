From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:35:08 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] mosquitto: security bump
	to version 1.4.12
Message-ID: <20170601144624.437718296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ee60e23e360ba7585970a70e523d842b191c78d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-7650: Pattern based ACLs can be bypassed by clients that set
their username/client id to ???#??? or ???+???.  This allows locally or remotely
connected clients to access MQTT topics that they do have the rights to.
The same issue may be present in third party authentication/access control
plugins for Mosquitto.

For more details, see:
https://mosquitto.org/2017/05/security-advisory-cve-2017-7650/

Remove 0001-Remove-lanl-when-WITH_ADNS-is-unset.patch as that patch is now
upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9e9dee25346f861f3276a4c2ab21c98b8caf88a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Remove-lanl-when-WITH_ADNS-is-unset.patch | 32 ----------------------
 package/mosquitto/mosquitto.hash                   |  2 +-
 package/mosquitto/mosquitto.mk                     |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/mosquitto/0001-Remove-lanl-when-WITH_ADNS-is-unset.patch b/package/mosquitto/0001-Remove-lanl-when-WITH_ADNS-is-unset.patch
deleted file mode 100644
index f9b1b27..0000000
--- a/package/mosquitto/0001-Remove-lanl-when-WITH_ADNS-is-unset.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0de640dd834b6c01c4904e11d51f3a1406c89469 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 3 Apr 2017 20:34:07 +0200
-Subject: [PATCH] Remove -lanl when WITH_ADNS is unset
-
-Do not add -lanl to BROKER_LIBS for all Linux builds.
-Indeed, -lanl is only needed for getaddrinfo_a which is only used in
-_mosquitto_try_connect_step1 when WITH_ADNS is set
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- config.mk | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/config.mk b/config.mk
-index 6e369c2..44639d2 100644
---- a/config.mk
-+++ b/config.mk
-@@ -159,10 +159,6 @@ ifeq ($(UNAME),QNX)
- 	LIB_LIBS:=$(LIB_LIBS) -lsocket
- endif
- 
--ifeq ($(UNAME),Linux)
--	BROKER_LIBS:=$(BROKER_LIBS) -lanl
--endif
--
- ifeq ($(WITH_WRAP),yes)
- 	BROKER_LIBS:=$(BROKER_LIBS) -lwrap
- 	BROKER_CFLAGS:=$(BROKER_CFLAGS) -DWITH_WRAP
--- 
-2.5.0
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 5514c21..6c102eb 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha512  c05ca8679b9a6f540868f4ccf701257fcabc114d5450ac0bbbe80b91bb7cd4fc52668773e945506760c7a5bd8a494e0a56100714112e5d2713d57bfab8951587  mosquitto-1.4.11.tar.gz
+sha512  75e6105498869ab13265df7a0bea6052c014d59d0c0efb61162d8257d34c0153fce32130e84c28e99fd494f374949aac5e01c19f7439c2eea575b52ef1179c3c  mosquitto-1.4.12.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 8918128..9853549 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.4.11
+MOSQUITTO_VERSION = 1.4.12
 MOSQUITTO_SITE = http://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
