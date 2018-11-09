From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Nov 2018 14:05:44 +0100
Subject: [Buildroot] [git commit] mosquitto: security bump to version 1.5.4
Message-ID: <20181109130553.708AC81EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a4c111b1f359e2ba50e31ef1246e48456a391de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the announcement:

When using a TLS enabled websockets listener with require_certificate
enabled, the mosquitto broker does not correctly verify client certificates.
This is now fixed.  All other security measures operate as expected, and in
particular non-websockets listeners are not affected by this.

https://mosquitto.org/blog/2018/11/version-154-released/

Drop patch 0001, now applied upstream:
https://github.com/eclipse/mosquitto/pull/933

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch | 46 ----------------------
 package/mosquitto/mosquitto.hash                   |  2 +-
 package/mosquitto/mosquitto.mk                     |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/package/mosquitto/0001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch b/package/mosquitto/0001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch
deleted file mode 100644
index e350e465b4..0000000000
--- a/package/mosquitto/0001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d684055b2b92e7ec5793e70c9a80c7f8e45e0696 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 24 Aug 2018 16:38:42 +0200
-Subject: [PATCH] _GNU_SOURCE needed for EAI_INPROGRESS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Define of _GNU_SOURCE is needed to be able to use EAI_INPROGRESS in
-loop.c.
-
-This patch fixes a build error
-
-loop.c:334:17: error: ???EAI_INPROGRESS??? undeclared (first use in this function)
-        if(rc == EAI_INPROGRESS){
-
-occuring with a glibc-2.27-based buildroot toolchain for sparc64
-
-Target: sparc64-buildroot-linux-gnu
-[...]
-gcc version 6.4.0 (Buildroot 2018.05)
-
-Source:
-http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2018.05.tar.bz2
-
-Patch sent upstream as PR 933.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- config.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/config.h b/config.h
-index 7607019..ba0ba93 100644
---- a/config.h
-+++ b/config.h
-@@ -39,4 +39,6 @@
- #  define _POSIX_C_SOURCE 200809L
- #endif
- 
-+#define _GNU_SOURCE
-+
- #endif
--- 
-2.18.0
-
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index b38830b8b5..96e2ae9369 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking gpg signature
-sha256 3081a998d303a883b1cd064009beabc88aa9159e26f5258a4ae6007160491d10  mosquitto-1.5.3.tar.gz
+sha256 5fd7f3454fd6d286645d032bc07f44a1c8583cec02ef2422c9eb32e0a89a9b2f  mosquitto-1.5.4.tar.gz
 
 # License files
 sha256 cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 1d72f9b16e..fcce0535cb 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.5.3
+MOSQUITTO_VERSION = 1.5.4
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
