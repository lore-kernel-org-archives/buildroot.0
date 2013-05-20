From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 20 May 2013 14:21:58 +0100
Subject: [Buildroot] [PATCH] ed: Convert to generic package infrastructure
Message-ID: <1369056118-32503-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

The package uses custom configure and Makefile files.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/ed/ed.mk | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 2bb8e0e..2207f09 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -11,4 +11,23 @@ ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 ED_LICENSE = GPLv3+
 ED_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+define ED_CONFIGURE_CMDS
+	( cd $(@D); \
+		./configure \
+		--prefix=/usr \
+		CPPFLAGS="$(TARGET_CPPFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CC="$(TARGET_CC)" \
+	)
+endef
+
+define ED_BUILD_CMDS
+	$(MAKE)	-C $(@D)
+endef
+
+define ED_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
1.8.2.1
