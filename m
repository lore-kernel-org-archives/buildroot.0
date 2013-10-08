From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:16:59 +0200
Subject: [Buildroot] [PATCHv3 02/20] glibc: fix glibc build by creating an
	empty gnu/stubs.h
In-Reply-To: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381256237-27948-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The stubs.h header is not installed by install-headers, but is needed
for the gcc build. An empty stubs.h will work, as explained in
http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick is
used by Crosstool-NG.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a9e89f1..4d89caf 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -47,6 +47,17 @@ else ifeq ($(BR2_MIPS_OABI32),y)
 GLIBC_EXTRA_CFLAGS += -mabi=32
 endif
 
+# The stubs.h header is not installed by install-headers, but is
+# needed for the gcc build. An empty stubs.h will work, as explained
+# in http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick
+# is used by Crosstool-NG.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GLIBC),y)
+define GLIBC_ADD_MISSING_STUB_H
+	mkdir -p $(STAGING_DIR)/usr/include/gnu
+	touch $(STAGING_DIR)/usr/include/gnu/stubs.h
+endef
+endif
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
@@ -89,6 +100,7 @@ define GLIBC_CONFIGURE_CMDS
 	cp $(@D)/build/csu/crt1.o $(STAGING_DIR)/usr/lib/
 	cp $(@D)/build/csu/crti.o $(STAGING_DIR)/usr/lib/
 	cp $(@D)/build/csu/crtn.o $(STAGING_DIR)/usr/lib/
+	$(GLIBC_ADD_MISSING_STUB_H)
 	$(TARGET_CROSS)gcc -nostdlib \
 		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
 endef
-- 
1.8.1.2
