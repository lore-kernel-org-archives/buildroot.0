From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 14:00:04 +0200
Subject: [Buildroot] [git commit] cups: cleanup cups-config handling
Message-ID: <20120501121323.84F0C96C3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bac353dbe6c4384c022f898201992ef5f5353edb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includedir and rpath fixes are not needed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 7f1f52e..b953a4b 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -55,16 +55,10 @@ CUPS_DEPENDENCIES += host-autoconf
 
 CUPS_PRE_CONFIGURE_HOOKS += CUPS_FIXUP_AUTOCONF
 
-# Fixup prefix= and exec_prefix= in cups-config, and remove the
-# -Wl,-rpath option.
+# Fixup prefix= and exec_prefix= in cups-config
 define CUPS_FIXUP_CUPS_CONFIG
-	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
-		$(STAGING_DIR)/usr/bin/cups-config
-	$(SED) 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
-		$(STAGING_DIR)/usr/bin/cups-config
-	$(SED) "s%includedir=.*%includedir=$(STAGING_DIR)/usr/include%" \
-		 $(STAGING_DIR)/usr/bin/cups-config
-	$(SED) 's%-Wl,-rpath,\$${libdir}%%' \
+	$(SED) 's%^prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
+		-e 's%^exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
 		$(STAGING_DIR)/usr/bin/cups-config
 endef
 
