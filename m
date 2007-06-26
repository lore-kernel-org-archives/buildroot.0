From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 09:34:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package toolchain
	toolchain/uClibc
Message-ID: <20070626163446.CCBE2A4579@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 09:34:45 -0700 (Tue, 26 Jun 2007)
New Revision: 18943

Log:
- add BR2_INET_IPV6 and BR2_INET_RPC
  TODO: use $(DISABLE_IPV6) in packages instead of a gazillion different hackish ways that are currently in there


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-06-26 16:18:00 UTC (rev 18942)
+++ trunk/buildroot/package/Makefile.in	2007-06-26 16:34:45 UTC (rev 18943)
@@ -198,6 +198,10 @@
 DISABLE_LARGEFILE= --disable-largefile
 endif
 
+ifneq ($(BR2_INET_IPV6),y)
+DISABLE_IPV6= --disable-ipv6
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),)
 TARGET_CONFIGURE_OPTS+=CXX=""
 endif

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2007-06-26 16:18:00 UTC (rev 18942)
+++ trunk/buildroot/toolchain/Config.in.2	2007-06-26 16:34:45 UTC (rev 18943)
@@ -29,6 +29,18 @@
 	help
 	    Enable large file (files > 2 GB) support
 
+config BR2_INET_IPV6
+	bool "Enable IPv6"
+	default n
+	help
+	    Enable IPv6.
+
+config BR2_INET_RPC
+	bool "Enable RPC"
+	default n
+	help
+	    Enable RPC. RPC support is needed for nfs.
+
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
 	default n

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-06-26 16:18:00 UTC (rev 18942)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-06-26 16:34:45 UTC (rev 18943)
@@ -142,7 +142,22 @@
 	$(SED) '/.*UCLIBC_HAS_FOPEN_LARGEFILE_MODE.*/d' $(UCLIBC_DIR)/.config
 	echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> $(UCLIBC_DIR)/.config
 endif
-	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
+ifeq ($(BR2_INET_IPV6),y)
+	$(SED) 's.^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' $(UCLIBC_DIR)/.config
+else
+	$(SED) 's.^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.config
+endif
+ifeq ($(BR2_INET_RPC),y)
+	$(SED) 's.^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
+		-e 's.^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
+		-e 's.^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=y,g'
+		$(UCLIBC_DIR)/.config
+else
+	$(SED) 's.^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=n,g' \
+		-e 's.^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=n,g' \
+		-e 's.^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=n,g'
+		$(UCLIBC_DIR)/.config
+endif
 ifeq ($(BR2_SOFT_FLOAT),y)
 	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n,g' \
 		-e 's,^[^_]*HAS_FPU.*,HAS_FPU=n,g' \
@@ -187,8 +202,10 @@
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.config
 endif
 ifeq ("$(KERNEL_ARCH)","i386")
 	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.config
