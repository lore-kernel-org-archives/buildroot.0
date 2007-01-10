From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 02:30:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070110103011.7C55248575@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 02:30:10 -0800 (Wed, 10 Jan 2007)
New Revision: 17223

Log:
fix install such that pkg-config setup is correct


Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-01-10 10:29:24 UTC (rev 17222)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-01-10 10:30:10 UTC (rev 17223)
@@ -82,16 +82,10 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--prefix=$(STAGING_DIR) \
+		--exec_prefix=$(STAGING_DIR) \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
 		--disable-libasprintf \
 	);
 	touch $(GETTEXT_DIR)/.configured
@@ -101,19 +95,7 @@
 	touch -c $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 
 $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
-	$(MAKE) prefix=$(STAGING_DIR) \
-		exec_prefix=$(STAGING_DIR) \
-		bindir=$(STAGING_DIR)/bin \
-		sbindir=$(STAGING_DIR)/sbin \
-		libexecdir=$(STAGING_DIR)/usr/lib \
-		datadir=$(STAGING_DIR)/share \
-		sysconfdir=$(STAGING_DIR)/etc \
-		localstatedir=$(STAGING_DIR)/var \
-		libdir=$(STAGING_DIR)/usr/lib \
-		infodir=$(STAGING_DIR)/info \
-		mandir=$(STAGING_DIR)/man \
-		includedir=$(STAGING_DIR)/include \
-		-C $(GETTEXT_DIR) install;
+	$(MAKE) -C $(GETTEXT_DIR) install;
 
 gettext: uclibc $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
