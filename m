From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 15 Jul 2007 14:54:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/gzip
Message-ID: <20070715215412.944DE30047@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-15 14:54:11 -0700 (Sun, 15 Jul 2007)
New Revision: 19102

Log:
Define HOSTLN to allow gzip to build for non-x86 target

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/gzip/gzip.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-15 19:29:56 UTC (rev 19101)
+++ trunk/buildroot/Makefile	2007-07-15 21:54:11 UTC (rev 19102)
@@ -79,11 +79,15 @@
 ifndef HOSTLD
 HOSTLD:=ld
 endif
+ifndef HOSTLN
+HOSTLN:=ln
+endif
 HOSTAR :=$(shell $(CONFIG_SHELL) -c "which $(HOSTAR)"  || type -p $(HOSTAR)  || echo ar)
 HOSTAS :=$(shell $(CONFIG_SHELL) -c "which $(HOSTAS)"  || type -p $(HOSTAS)  || echo as)
 HOSTCC :=$(shell $(CONFIG_SHELL) -c "which $(HOSTCC)"  || type -p $(HOSTCC)  || echo gcc)
 HOSTCXX:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCXX)" || type -p $(HOSTCXX) || echo g++)
 HOSTLD :=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)"  || type -p $(HOSTLD)  || echo ld)
+HOSTLN :=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)"  || type -p $(HOSTLN)  || echo ln)
 ifndef CFLAGS_FOR_BUILD
 CFLAGS_FOR_BUILD:=-g -O2
 endif

Modified: trunk/buildroot/package/gzip/gzip.mk
===================================================================
--- trunk/buildroot/package/gzip/gzip.mk	2007-07-15 19:29:56 UTC (rev 19101)
+++ trunk/buildroot/package/gzip/gzip.mk	2007-07-15 21:54:11 UTC (rev 19102)
@@ -53,11 +53,11 @@
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	(cd $(TARGET_DIR)/bin; \
-	ln -snf gzip gunzip; \
-	ln -snf gzip zcat; \
-	ln -snf zdiff zcmp; \
-	ln -snf zgrep zegrep; \
-	ln -snf zgrep zfgrep;)
+	$(HOSTLN) -snf gzip gunzip; \
+	$(HOSTLN) -snf gzip zcat; \
+	$(HOSTLN) -snf zdiff zcmp; \
+	$(HOSTLN) -snf zgrep zegrep; \
+	$(HOSTLN) -snf zgrep zfgrep;)
 
 gzip: uclibc $(GZIP_TARGET_BINARY)
 
