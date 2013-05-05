From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  5 May 2013 12:04:25 -0300
Subject: [Buildroot] [PATCH] aircrack-ng: fix build failure and install path
Message-ID: <1367766265-23301-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aircrack-ng doesn't account that openssl needs zlib so fix it.
Fixes:
http://autobuild.buildroot.net/results/97f4f90a7d60a0e3ea81c77f6986f1c1bae8d575/

Also fix the install prefix since it was getting installed to /usr/local

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/aircrack-ng/aircrack-ng.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 48897da..c6574f1 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -21,18 +21,19 @@ else
 endif
 
 define AIRCRACK_NG_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)\
-		$(AIRCRACK_NG_MAKE_OPTS) all
+	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
+		LDFLAGS="$(TARGET_LDFLAGS) -lz" \
+		-C $(@D) $(AIRCRACK_NG_MAKE_OPTS) all
 endef
 
 define AIRCRACK_NG_CLEAN_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)\
-		$(AIRCRACK_NG_MAKE_OPTS) clean
+	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" \
+		-C $(@D) $(AIRCRACK_NG_MAKE_OPTS) clean
 endef
 
 define AIRCRACK_NG_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) \
-		$(AIRCRACK_NG_MAKE_OPTS) install
+		prefix=/usr $(AIRCRACK_NG_MAKE_OPTS) install
 endef
 
 define AIRCRACK_NG_UNINSTALL_TARGET_CMDS
-- 
1.8.1.5
