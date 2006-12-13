From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 15:08:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lsof
Message-ID: <20061213230848.6674A4856A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 15:08:48 -0800 (Wed, 13 Dec 2006)
New Revision: 16909

Log:
- Convince lsof to honor uClibc's notion of wchar and locale support.


Modified:
   trunk/buildroot/package/lsof/lsof.mk


Changeset:
Modified: trunk/buildroot/package/lsof/lsof.mk
===================================================================
--- trunk/buildroot/package/lsof/lsof.mk	2006-12-13 23:01:56 UTC (rev 16908)
+++ trunk/buildroot/package/lsof/lsof.mk	2006-12-13 23:08:48 UTC (rev 16909)
@@ -36,6 +36,13 @@
 	touch $(LSOF_DIR)/.configured
 
 $(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
+ifeq ($(UCLIBC_HAS_WCHAR),)
+	$(SED) 's,^#define[ 	]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(LSOF_DIR)/lsof_4.77_src/machine.h
+	$(SED) 's,^#define[ 	]*WIDECHARINCL.*,,' $(LSOF_DIR)/lsof_4.77_src/machine.h
+endif
+ifeq ($(UCLIBC_HAS_LOCALE),)
+	$(SED) 's,^#define[ 	]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(LSOF_DIR)/lsof_4.77_src/machine.h
+endif
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_DIR)/lsof_4.77_src
 
 $(TARGET_DIR)/$(LSOF_TARGET_BINARY): $(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY)
