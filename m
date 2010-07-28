From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Jul 2010 00:11:38 -0700
Subject: [Buildroot] [PATCH 2/3] uclibc.mk: Make all available versions of
	uclibc compilable with new toolchain build sequence.
In-Reply-To: <1280301099-5930-1-git-send-email-raj.khem@gmail.com>
References: <1280301099-5930-1-git-send-email-raj.khem@gmail.com>
Message-ID: <1280301099-5930-3-git-send-email-raj.khem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 toolchain/uClibc/uclibc.mk |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 016f323..fa55860 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -386,6 +386,16 @@ ifeq ($(BR2_x86_core2),y)
 	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
 endif
+ifeq ($(BR2_UCLIBC_VERSION_0_9_28_3),y)
+UCLIBC_INITIAL_TARGETS=libc/sysdeps/linux/$(UCLIBC_TARGET_ARCH)/crti.o \
+		       libc/sysdeps/linux/$(UCLIBC_TARGET_ARCH)/crtn.o \
+		       libc/sysdeps/linux/$(UCLIBC_TARGET_ARCH)/crt1.o \
+		       pregen install_dev
+CP_CRT_FILES=cp -pLR $(UCLIBC_DIR)/libc/sysdeps/linux/$(UCLIBC_TARGET_ARCH)/crt[1in].o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/
+else
+UCLIBC_INITIAL_TARGETS=lib/crt1.o lib/crti.o lib/crtn.o install_headers
+CP_CRT_FILES=cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/
+endif
 
 $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 	cp -f $(UCLIBC_DIR)/.oldconfig $(UCLIBC_DIR)/.config
@@ -407,9 +417,8 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
-		HOSTCC="$(HOSTCC)" headers \
-		lib/crt1.o lib/crti.o lib/crtn.o \
-		$(if $(BR2_UCLIBC_VERSION_0_9_28_3),install_dev,install_headers)
+		HOSTCC="$(HOSTCC)" \
+		$(UCLIBC_INITIAL_TARGETS)
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
 	if [ ! -f $(TOOLCHAIN_DIR)/uClibc_dev/usr/include/linux/version.h ]; then \
@@ -418,7 +427,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 	fi
 	$(TARGET_CROSS)gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/libc.so
 	$(TARGET_CROSS)gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/libm.so
-	cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/
+	$(CP_CRT_FILES)
 	touch $@
 
 $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate) $(LIBFLOAT_TARGET)
-- 
1.7.0.4
