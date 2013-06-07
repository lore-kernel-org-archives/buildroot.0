From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jun 2013 11:55:30 +0200
Subject: [Buildroot] UCLIBC_EXTRA_CFLAGS in uClibc overridden while
 using buildroot
In-Reply-To: <43F7AEDD312F9E499A1A4E3608E505ED2ABF12D3@SJEXCHMB09.corp.ad.broadcom.com>
References: <43F7AEDD312F9E499A1A4E3608E505ED2ABF12D3@SJEXCHMB09.corp.ad.broadcom.com>
Message-ID: <20130607115530.7132b7b1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rajendra Dendukuri,

On Thu, 6 Jun 2013 19:33:30 +0000, Rajendra Dendukuri wrote:
> I am using buildroot-2012.11 version to build a uClibc toolchain for ARMv7a. I find that uClibc/Rules.mak file defaults to -Os. However I wish to include "-fno-omit-frame-pointer" even when -Os optimization is used. I cannot find a hook in buildroot or uClibc where this can be done. I tried setting the value of UCLIBC_EXTRA_CFGLAGS in the uClibc config file. However that is not being considered. Instead the values passed by buildroot in  "toolchain/uClibc/uclibc.mk" are being used.
> 
> This seems to be a very stiff limitation while using uClibc with buildroot. Any suggestions on how we can overcome this.

Can you try the following patch, and add -fno-omit-frame-pointer to
BR2_TARGET_OPTIMIZATION ?

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index d4f1d4c..8ecb712 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -392,7 +392,7 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 		HOSTCC="$(HOSTCC)" \
 		oldconfig
 	touch $@
@@ -423,7 +423,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 		HOSTCC="$(HOSTCC)" headers \
 		lib/crt1.o lib/crti.o lib/crtn.o \
 		install_headers
@@ -446,7 +446,7 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate) $(LIBFLO
 		DEVEL_PREFIX=/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 		HOSTCC="$(HOSTCC)" \
 		all
 	touch -c $@
@@ -458,7 +458,7 @@ uclibc-menuconfig: dirs $(UCLIBC_DIR)/.config
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 		HOSTCC="$(HOSTCC)" \
 		menuconfig && \
 	touch -c $(UCLIBC_DIR)/.config
@@ -472,7 +472,7 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 		install_runtime install_dev
 	# Install the kernel headers to the staging dir if necessary
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
@@ -503,7 +503,7 @@ $(TARGET_DIR)/lib/libc.so.0: $(STAGING_DIR)/usr/lib/libc.a
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 		install_runtime
 	touch -c $@

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
