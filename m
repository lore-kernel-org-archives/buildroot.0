From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 14 Aug 2007 00:07:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070814070715.460EDA682F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-14 00:07:13 -0700 (Tue, 14 Aug 2007)
New Revision: 19500

Log:
Fix continous remake's of uClibc, Save .config to .oldconfig before 'conf', cleanup ARM config to avoid stop during build

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-14 06:28:01 UTC (rev 19499)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-14 07:07:13 UTC (rev 19500)
@@ -86,6 +86,9 @@
 UCLIBC_NOT_TARGET_ENDIAN:=LITTLE
 endif
 
+ARM_CONFIG:=CONFIG_$(strip $(subst ",, $(BR2_ARM_TYPE)))
+#"))
+
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
 
@@ -117,8 +120,8 @@
 	touch $@
 
 # Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
-$(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.unpacked $(UCLIBC_CONFIG_FILE)
-	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
+$(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.unpacked $(UCLIBC_CONFIG_FILE)
+	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
 		-e 's,^TARGET_ARCH="none",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
@@ -127,143 +130,139 @@
 		-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
 		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
 		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
-		$(UCLIBC_DIR)/.config
+		$(UCLIBC_DIR)/.oldconfig
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
 	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
-		 $(UCLIBC_DIR)/.config
-	/bin/echo "CONFIG_$(BR2_ARM_TYPE)=y" >> \
-		$(UCLIBC_DIR)/.config
+		 $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's/^.*$(ARM_CONFIG).*/$(ARM_CONFIG)=y/g' $(UCLIBC_DIR)/.oldconfig
 ifeq ($(BR2_ARM_EABI),y)
-	/bin/echo "# CONFIG_ARM_OABI is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "CONFIG_ARM_EABI=y" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_ARM_OABI is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "CONFIG_ARM_EABI=y" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_ARM_OABI),y)
-	/bin/echo "CONFIG_ARM_OABI=y" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "CONFIG_ARM_OABI=y" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_generic_arm),y)
-	$(SED) 's,^.*CONFIG_GENERIC_ARM.*,CONFIG_GENERIC_ARM=y,g' $(UCLIBC_DIR)/.config
-else
-	$(SED) 's,^.*CONFIG_GENERIC_ARM.*,# CONFIG_GENERIC_ARM is not set,g' $(UCLIBC_DIR)/.config
 endif
-endif
 ifneq ($(UCLIBC_TARGET_ENDIAN),)
 	# The above doesn't work for me, so redo
 	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
 		-e 's/.*\(ARCH_WANTS_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
 		-e 's/.*\(ARCH_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
 		-e 's/.*\(ARCH_WANTS_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
-		$(UCLIBC_DIR)/.config
+		$(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_LARGEFILE),y)
-	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.oldconfig
 else
-	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' $(UCLIBC_DIR)/.config
-	$(SED) '/.*UCLIBC_HAS_FOPEN_LARGEFILE_MODE.*/d' $(UCLIBC_DIR)/.config
-	echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> $(UCLIBC_DIR)/.config
+	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/.*UCLIBC_HAS_FOPEN_LARGEFILE_MODE.*/d' $(UCLIBC_DIR)/.oldconfig
+	echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_INET_IPV6),y)
-	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' $(UCLIBC_DIR)/.oldconfig
 else
-	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_USE_WCHAR),y)
-	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
-else
-	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.config
-endif
-
 ifeq ($(BR2_INET_RPC),y)
 	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
 		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
 		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=y,g' \
-		$(UCLIBC_DIR)/.config
+		$(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=n,g' \
 		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=n,g' \
 		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=n,g' \
-		$(UCLIBC_DIR)/.config
+		$(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_SOFT_FLOAT),y)
 	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n,g' \
 		-e 's,^[^_]*HAS_FPU.*,HAS_FPU=n,g' \
 		-e 's,.*UCLIBC_HAS_FLOATS.*,UCLIBC_HAS_FLOATS=y,g' \
 		-e 's,.*DO_C99_MATH.*,DO_C99_MATH=y,g' \
-		$(UCLIBC_DIR)/.config
-	#$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n\nHAS_FPU=n\nUCLIBC_HAS_FLOATS=y\nUCLIBC_HAS_SOFT_FLOAT=y,g' $(UCLIBC_DIR)/.config
+		$(UCLIBC_DIR)/.oldconfig
+	#$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n\nHAS_FPU=n\nUCLIBC_HAS_FLOATS=y\nUCLIBC_HAS_SOFT_FLOAT=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) '/UCLIBC_HAS_FLOATS/d' \
 		-e 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' \
-		$(UCLIBC_DIR)/.config
+		$(UCLIBC_DIR)/.oldconfig
 endif
-	$(SED) '/UCLIBC_HAS_THREADS/d' $(UCLIBC_DIR)/.config
-	$(SED) '/LINUXTHREADS/d' $(UCLIBC_DIR)/.config
-	$(SED) '/LINUXTHREADS_OLD/d' $(UCLIBC_DIR)/.config
-	$(SED) '/PTHREADS_DEBUG_SUPPORT/d' $(UCLIBC_DIR)/.config
-	$(SED) '/UCLIBC_HAS_THREADS_NATIVE/d' $(UCLIBC_DIR)/.config
+	$(SED) '/UCLIBC_HAS_THREADS/d' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/LINUXTHREADS/d' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/LINUXTHREADS_OLD/d' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/PTHREADS_DEBUG_SUPPORT/d' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/UCLIBC_HAS_THREADS_NATIVE/d' $(UCLIBC_DIR)/.oldconfig
 ifeq ($(BR2_PTHREADS_NONE),y)
-	echo "# UCLIBC_HAS_THREADS is not set" >> $(UCLIBC_DIR)/.config
+	echo "# UCLIBC_HAS_THREADS is not set" >> $(UCLIBC_DIR)/.oldconfig
 else
-	echo "UCLIBC_HAS_THREADS=y" >> $(UCLIBC_DIR)/.config
+	echo "UCLIBC_HAS_THREADS=y" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_PTHREADS),y)
-	echo "LINUXTHREADS=y" >> $(UCLIBC_DIR)/.config
+	echo "LINUXTHREADS=y" >> $(UCLIBC_DIR)/.oldconfig
 else
-	echo "# LINUXTHREADS is not set" >> $(UCLIBC_DIR)/.config
+	echo "# LINUXTHREADS is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_PTHREADS_OLD),y)
-	echo "LINUXTHREADS_OLD=y" >> $(UCLIBC_DIR)/.config
+	echo "LINUXTHREADS_OLD=y" >> $(UCLIBC_DIR)/.oldconfig
 else
-	echo "# LINUXTHREADS_OLD is not set" >> $(UCLIBC_DIR)/.config
+	echo "# LINUXTHREADS_OLD is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_PTHREADS_NATIVE),y)
-	echo "UCLIBC_HAS_THREADS_NATIVE=y" >> $(UCLIBC_DIR)/.config
+	echo "UCLIBC_HAS_THREADS_NATIVE=y" >> $(UCLIBC_DIR)/.oldconfig
 else
-	echo "# UCLIBC_HAS_THREADS_NATIVE is not set" >> $(UCLIBC_DIR)/.config
+	echo "# UCLIBC_HAS_THREADS_NATIVE is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_PTHREAD_DEBUG),y)
-	echo "PTHREADS_DEBUG_SUPPORT=y" >> $(UCLIBC_DIR)/.config
+	echo "PTHREADS_DEBUG_SUPPORT=y" >> $(UCLIBC_DIR)/.oldconfig
 else
-	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.config
+	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.config
-	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
 else
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.config
-	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(BR2_USE_WCHAR),y)
+	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
+else
+	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
+endif
 ifeq ("$(KERNEL_ARCH)","i386")
-	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_386 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_486 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_586 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_586MMX is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_686 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_PENTIUMII is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_PENTIUMIII is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_PENTIUM4 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_K6 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_K7 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_ELAN is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_CRUSOE is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_WINCHIPC6 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_WINCHIP2 is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_CYRIXIII is not set" >> $(UCLIBC_DIR)/.config
-	/bin/echo "# CONFIG_NEHEMIAH is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_486 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_586 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_586MMX is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_686 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_PENTIUMII is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_PENTIUMIII is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_PENTIUM4 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_K6 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_K7 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_ELAN is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_CRUSOE is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_WINCHIPC6 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_WINCHIP2 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_CYRIXIII is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_NEHEMIAH is not set" >> $(UCLIBC_DIR)/.oldconfig
 ifeq ($(BR2_x86_i386),y)
-	$(SED) 's,# CONFIG_386 is not set,CONFIG_386=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,# CONFIG_386 is not set,CONFIG_386=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_x86_i486),y)
-	$(SED) 's,# CONFIG_486 is not set,CONFIG_486=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,# CONFIG_486 is not set,CONFIG_486=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_x86_i586),y)
-	$(SED) 's,# CONFIG_586 is not set,CONFIG_586=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,# CONFIG_586 is not set,CONFIG_586=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_x86_i686),y)
-	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
 endif
+
+$(UCLIBC_DIR)/.config:	$(UCLIBC_DIR)/.oldconfig
+	cp -f $(UCLIBC_DIR)/.oldconfig $(UCLIBC_DIR)/.config
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
@@ -371,7 +370,7 @@
 		install_runtime
 	touch -c $@
 
-$(TARGET_DIR)/usr/bin/ldd: gcc
+$(TARGET_DIR)/usr/bin/ldd: $(TARGET_CROSS)gcc
 	$(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
 		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
 		PREFIX=$(TARGET_DIR) utils install_utils
@@ -389,8 +388,10 @@
 
 uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
-uclibc-config:	$(UCLIBC_DIR)/.config
+uclibc-config: host-sed $(UCLIBC_DIR)/.config
 
+uclibc-oldconfig: host-sed $(UCLIBC_DIR)/.oldconfig
+
 uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source
