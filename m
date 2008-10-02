From: Michel Wilson <michel@crondor.net>
Date: Thu, 2 Oct 2008 15:58:58 +0200
Subject: [Buildroot] [PATCH] Makefile.autotools.in: change paths only once
Message-ID: <20081002135858.GD24785@aeon.hgd.crondor.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When using buildroot somewhere under /usr (in /usr/local, for example),
paths in .la-files get updated multiple times by Makefile.autotools.in.
The attached patch fixes this, the sed-script is only applied to lines
not containing $(STAGING_DIR) already.

Regards,

Michel Wilson.

---
Index: package/Makefile.autotools.in
===================================================================
--- package/Makefile.autotools.in	(revision 23359)
+++ package/Makefile.autotools.in	(working copy)
@@ -229,7 +229,7 @@
 #	toolchain/replace.sh $(STAGING_DIR)/usr/lib ".*\.la" "\(['= ]\)/usr" "\\1$(STAGING_DIR)/usr"
 	for i in $$(find $(STAGING_DIR)/usr/lib/ -name "*.la"); do \
 		cp $$i $$i~; \
-		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$i; \
+		$(SED) "\:$(STAGING_DIR):!s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$i; \
 	done
 	touch $@
 
-- 
Michel Wilson     michel at crondor.net
PGP key ID        0xD2CB4B7E
