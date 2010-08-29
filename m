From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Sun, 29 Aug 2010 23:24:07 +0200
Subject: [Buildroot] [git commit master 1/1] pppd.mk installs radattr.so
	twice and omits radrealms.so
Message-ID: <20100829212918.B34B48A2D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b6207627b4d20628ca0491377f17c5f3c91627d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In pppd.mk the radattr.so plugin (for radiua) is installed twice (the second
install overwriting the first) but the radrealms.so plugin is omitted from
the install. This appears to be a copy-paste error.

Below is patch that corrects this.

signed-off by: Darcy Watkins <dwatkins@tranzeo.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/pppd/pppd.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 317e9e6..8550b6f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,7 +18,7 @@
 	fs: old-style squashfs for big endian archs fixed.
 
 	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
-	luafilesystem, lzo, netcat, php, proftpd, qt, samba,
+	luafilesystem, lzo, netcat, php, pppd, proftpd, qt, samba,
 	startup-notification, sysvinit, util-linux
 
 	Removed packages: stunnel
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 9d081f2..35fd451 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -55,8 +55,8 @@ $(PPPD_TARGET_INSTALL_TARGET):
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radius.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radius.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radrealms.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radrealms.so
 	for m in $(PPPD_MANPAGES); do \
 		$(INSTALL) -m 644 -D $(PPPD_DIR)/$$m/$$m.8 \
 			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \
-- 
1.7.1
