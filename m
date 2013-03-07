From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  7 Mar 2013 22:53:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/zic: new host package
In-Reply-To: <cover.1362693141.git.yann.morin.1998@free.fr>
References: <cover.1362693141.git.yann.morin.1998@free.fr>
Message-ID: <8633649d82c84dd557da6245c327d4adf3ec9072.1362693141.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard Braun <rbraun@sceen.net>

This is the zone information compiler, used to compile the time zone
database.

Signed-off-by: Richard Braun <rbraun@sceen.net>
[yann.morin.1998 at free.fr: export ZIC for all to use]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/zic/zic-fix-dependencies.patch |   27 +++++++++++++++++++++++++++
 package/zic/zic.mk                     |   29 +++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 package/zic/zic-fix-dependencies.patch
 create mode 100644 package/zic/zic.mk

diff --git a/package/zic/zic-fix-dependencies.patch b/package/zic/zic-fix-dependencies.patch
new file mode 100644
index 0000000..e1cbc12
--- /dev/null
+++ b/package/zic/zic-fix-dependencies.patch
@@ -0,0 +1,27 @@
+From 4a2a55a640dd9316dac5f31832064f28f59ab0ae Mon Sep 17 00:00:00 2001
+From: Richard Braun <rbraun@sceen.net>
+Date: Fri, 4 Jan 2013 10:57:24 +0100
+Subject: [PATCH] zic: fix dependencies
+
+The yearistype script is provided by the tzdata package, and is required
+at runtime only.
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d76a81e..30df7dc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -349,7 +349,7 @@ version.h:
+ zdump:		$(TZDOBJS)
+ 		$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(TZDOBJS) $(LDLIBS)
+ 
+-zic:		$(TZCOBJS) yearistype
++zic:		$(TZCOBJS)
+ 		$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(TZCOBJS) $(LDLIBS)
+ 
+ yearistype:	yearistype.sh
+-- 
+1.7.2.5
+
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
new file mode 100644
index 0000000..3dec6af
--- /dev/null
+++ b/package/zic/zic.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# zic
+#
+#############################################################
+
+ZIC_VERSION = 2012j
+ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
+ZIC_SITE = http://www.iana.org/time-zones/repository/releases
+ZIC_LICENSE = Public domain
+
+# Don't strip any path components during extraction.
+define HOST_ZIC_EXTRACT_CMDS
+	gzip -d -c $(DL_DIR)/$(ZIC_SOURCE) \
+		| $(TAR) --strip-components=0 -C $(@D) -xf -
+endef
+
+define HOST_ZIC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
+endef
+
+define HOST_ZIC_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/sbin
+	install -D -m 755 $(@D)/zic $(HOST_DIR)/usr/sbin/zic
+endef
+
+$(eval $(host-generic-package))
+
+ZIC = $(HOST_DIR)/usr/sbin/zic
-- 
1.7.2.5
