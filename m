From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Apr 2007 04:55:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20070406115538.40286485FC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-06 04:55:37 -0700 (Fri, 06 Apr 2007)
New Revision: 18347

Log:
- using target's LDFLAGS as LDFLAGS_FOR_BUILD is b0rked


Modified:
   trunk/buildroot/package/bash/bash.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2007-04-06 10:41:05 UTC (rev 18346)
+++ trunk/buildroot/package/bash/bash.mk	2007-04-06 11:55:37 UTC (rev 18347)
@@ -23,6 +23,8 @@
 	# This is broken when -lintl is added to LIBS
 	$(SED) 's,LIBS_FOR_BUILD =.*,LIBS_FOR_BUILD =,g' \
 		$(BASH_DIR)/builtins/Makefile.in
+	# using target's LDFLAGS as LDFLAGS_FOR_BUILD is b0rked
+	-$(SED) '/^LDFLAGS_FOR_BUILD/d' $(BASH_DIR)/{,*/{,*/}}Makefile.in
 	$(CONFIG_UPDATE) $(BASH_DIR)/support
 	touch $@
 
@@ -32,6 +34,7 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CCFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		ac_cv_func_setvbuf_reversed=no \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
