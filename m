From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:14:25 +0200
Subject: [Buildroot] [RFCv1 1/8] musl: new package
In-Reply-To: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1398291272-17591-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.mk | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/musl/musl.mk

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
new file mode 100644
index 0000000..a95e53e
--- /dev/null
+++ b/package/musl/musl.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# musl
+#
+################################################################################
+
+MUSL_VERSION = 1.1.0
+MUSL_SITE = http://www.musl-libc.org/releases/
+MUSL_LICENSE = MIT
+MUSL_LICENSE_FILES = COPYRIGHT
+
+# Before musl is configured, we must have the first stage
+# cross-compiler and the kernel headers
+MUSL_DEPENDENCIES = host-gcc-initial linux-headers
+
+# musl is part of the toolchain so disable the toolchain dependency
+MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+MUSL_INSTALL_STAGING = YES
+
+# We need to run the musl configure script prior to building the
+# gcc-intermediate, so that we can call the install-headers step and
+# get the crt<X>.o built. However, we need to call it again after
+# gcc-intermediate has been built, otherwise the configure script
+# doesn't realize that libgcc has been built, and doesn't link the C
+# library properly with libgcc, which causes build failure down the
+# road. We will have the opportunity to simplify this once we switch
+# to a 2-steps gcc build.
+define MUSL_CONFIGURE_CALL
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
+		CPPFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))" \
+		./configure \
+			--target=$(GNU_TARGET_NAME) \
+			--host=$(GNU_TARGET_NAME) \
+			--prefix=/usr \
+			--disable-gcc-wrapper)
+endef
+
+define MUSL_CONFIGURE_CMDS
+	$(MUSL_CONFIGURE_CALL)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) install-headers
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		crt/crt1.o crt/crti.o crt/crtn.o
+	cp $(@D)/crt/crt*.o $(STAGING_DIR)/usr/lib
+	$(TARGET_CROSS)gcc -nostdlib \
+		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
+endef
+
+define MUSL_BUILD_CMDS
+	$(MUSL_CONFIGURE_CALL)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define MUSL_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) install-libs install-tools
+endef
+
+define MUSL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install-libs
+	mv $(TARGET_DIR)/usr/lib/libc.so $(TARGET_DIR)/lib/
+	$(RM) $(addprefix $(TARGET_DIR)/usr/lib/,crt1.o crtn.o crti.o Scrt1.o)
+endef
+
+$(eval $(generic-package))
+
+# Before musl is built, we must have the second stage cross-compiler
+$(MUSL_TARGET_BUILD): | host-gcc-intermediate
-- 
1.9.2
