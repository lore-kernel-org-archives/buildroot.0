From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 20:49:57 +0200
Subject: [Buildroot] [git commit] package/iputils: bump to version s20190515
Message-ID: <20190602201235.01E9F81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ffcd9279e5505535a73cf1200b3a86fd425cf32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit also include changes from s20190324.

Upstream changed build system to Meson, these extra changes
were required:
* remove custom commands of previous build system:
(IPUTILS_INSTALL_TARGET_CMDS, IPUTILS_PERMISSIONS)
* remove USE_SYSFS=no (support removed from upstream
* transform options from USE_FOO={yes,no} to -DUSE_FOO={true,false}

Removed patch included in this release

Build ninfod if possible (when use any crypto)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ing-Fix-AI_CANONIDN-usage-on-some-systems.patch | 57 --------------------
 package/iputils/iputils.hash                       |  2 +-
 package/iputils/iputils.mk                         | 60 ++++++++--------------
 3 files changed, 23 insertions(+), 96 deletions(-)

diff --git a/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch b/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch
deleted file mode 100644
index 556d3786fb..0000000000
--- a/package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 25899e849aa3abc1ad29ebf0b830262a859eaed5 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sat, 21 Jul 2018 17:46:14 +0200
-Subject: [PATCH] ping: Fix AI_CANONIDN usage on some systems
-
-Commit 99f67db used AI_CANONIDN in a way, which broke compilation on
-systems where AI_CANONIDN is not defined in netdb.h (e.g. glibc < 2.3.4,
-alternative libcs that don't support IDN: e.g. current musl 1.1.19 and
-uClibc-ng 1.0.30) when not using the system libidn2.
-
-Fixes: 99f67db ping: Fix ping name encoded using ACE on C locale
-
-Reported-by: Nicholas Fish
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- ping.c | 2 +-
- ping.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ping.c b/ping.c
-index 733477f..b241815 100644
---- a/ping.c
-+++ b/ping.c
-@@ -207,9 +207,9 @@ main(int argc, char **argv)
- 
- #ifdef USE_IDN
- 	setlocale(LC_ALL, "");
--#endif
- 	if (!strcmp(setlocale(LC_ALL, NULL), "C"))
- 		hints.ai_flags &= ~ AI_CANONIDN;
-+#endif
- 
- 	/* Support being called using `ping4` or `ping6` symlinks */
- 	if (argv[0][strlen(argv[0])-1] == '4')
-diff --git a/ping.h b/ping.h
-index 3e09685..8a0c4ef 100644
---- a/ping.h
-+++ b/ping.h
-@@ -28,7 +28,6 @@
- #include <netinet/icmp6.h>
- #include <linux/filter.h>
- #include <resolv.h>
--#include <locale.h>
- 
- #ifdef CAPABILITIES
- #include <sys/prctl.h>
-@@ -36,6 +35,7 @@
- #endif
- 
- #ifdef USE_IDN
-+#include <locale.h>
- #include <idn2.h>
- #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
- #define getnameinfo_flags NI_IDN
--- 
-2.19.0.rc2
-
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 14e2c67134..57b9ccf6a4 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 da14105291dd491f28ea91ade854ed10aee8ba019641c80eed233de3908be7c5  iputils-s20180629.tar.gz
+sha256 9b5125eb5ef9f4e947ad8fdddcf77f538f53b8f47b53eb5bc5347cb16d01c8fd  iputils-s20190515.tar.gz
 sha256 966075293e45785230c19415bcda15bd07c75bead4fe73332d1a4b9c45bb321f  ninfod/COPYING
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8371971231..f0902c7038 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,61 +11,45 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = s20180629
+IPUTILS_VERSION = s20190515
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 
-IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no\
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-IPUTILS_MAKE_OPTS += USE_CAP=yes
+IPUTILS_CONF_OPTS += -DUSE_CAP=true
 IPUTILS_DEPENDENCIES += libcap
 else
-IPUTILS_MAKE_OPTS += USE_CAP=no
+IPUTILS_CONF_OPTS += -DUSE_CAP=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-IPUTILS_MAKE_OPTS += USE_GCRYPT=yes
-IPUTILS_DEPENDENCIES += libgcrypt
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+IPUTILS_CONF_OPTS += -DUSE_IDN=true
+IPUTILS_DEPENDENCIES += libidn
 else
-IPUTILS_MAKE_OPTS += USE_GCRYPT=no
+IPUTILS_CONF_OPTS += -DUSE_IDN=false
 endif
 
 ifeq ($(BR2_PACKAGE_NETTLE),y)
-IPUTILS_MAKE_OPTS += USE_NETTLE=yes
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=nettle
 IPUTILS_DEPENDENCIES += nettle
-else
-IPUTILS_MAKE_OPTS += USE_NETTLE=no
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-IPUTILS_MAKE_OPTS += USE_CRYPTO=yes
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=gcrypt
+IPUTILS_DEPENDENCIES += libgcrypt
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=openssl
 IPUTILS_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LINUX_HEADERS),y)
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=kernel
+IPUTILS_DEPENDENCIES += linux-headers
 else
-IPUTILS_MAKE_OPTS += USE_CRYPTO=no
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
+# BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
+IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
-define IPUTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
-endef
-
-define IPUTILS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/arping      $(TARGET_DIR)/sbin/arping
-	$(INSTALL) -D -m 755 $(@D)/clockdiff   $(TARGET_DIR)/bin/clockdiff
-	$(INSTALL) -D -m 755 $(@D)/ping        $(TARGET_DIR)/bin/ping
-	$(INSTALL) -D -m 755 $(@D)/rarpd       $(TARGET_DIR)/sbin/rarpd
-	$(INSTALL) -D -m 755 $(@D)/rdisc       $(TARGET_DIR)/sbin/rdisc
-	$(INSTALL) -D -m 755 $(@D)/tftpd       $(TARGET_DIR)/usr/sbin/in.tftpd
-	$(INSTALL) -D -m 755 $(@D)/tracepath   $(TARGET_DIR)/bin/tracepath
-	$(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
-endef
-
-define IPUTILS_PERMISSIONS
-	/bin/ping        f 4755 0 0 - - - - -
-	/bin/traceroute6 f 4755 0 0 - - - - -
-endef
+# XSL Stylesheets for DocBook 5 not packaged for buildroot
+IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
 
-$(eval $(generic-package))
+$(eval $(meson-package))
