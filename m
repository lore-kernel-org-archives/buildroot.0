From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:27 +0200
Subject: [Buildroot] [PATCH 26/30] toolchain/toolchain-external: move uClibc
	specific logic into a separate file
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-27-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-toolchain-external-uclibc.mk for the definition of the
TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO function, which create some symbolic
links in TARGET_DIR.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/pkg-toolchain-external-uclibc.mk    | 13 +++++++++++++
 toolchain/toolchain-external/toolchain-external.mk         | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)
 create mode 100644 toolchain/toolchain-external/pkg-toolchain-external-uclibc.mk

diff --git a/toolchain/toolchain-external/pkg-toolchain-external-uclibc.mk b/toolchain/toolchain-external/pkg-toolchain-external-uclibc.mk
new file mode 100644
index 0000000..02d7076
--- /dev/null
+++ b/toolchain/toolchain-external/pkg-toolchain-external-uclibc.mk
@@ -0,0 +1,13 @@
+# uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
+# patched specifically for uClibc-ng, so it continues to generate
+# binaries that expect the dynamic loader to be named ld-uClibc.so.0,
+# like with the original uClibc. Therefore, we create an additional
+# symbolic link to make uClibc-ng systems work properly.
+define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
+	$(Q)if test -e $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
+		ln -sf ld-uClibc.so.1 $(TARGET_DIR)/lib/ld-uClibc.so.0 ; \
+	fi
+	$(Q)if test -e $(TARGET_DIR)/lib/ld64-uClibc.so.1; then \
+		ln -sf ld64-uClibc.so.1 $(TARGET_DIR)/lib/ld64-uClibc.so.0 ; \
+	fi
+endef
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index f56f049..cb63dd2 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -470,20 +470,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
 endef
 endif
 
-# uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
-# patched specifically for uClibc-ng, so it continues to generate
-# binaries that expect the dynamic loader to be named ld-uClibc.so.0,
-# like with the original uClibc. Therefore, we create an additional
-# symbolic link to make uClibc-ng systems work properly.
-define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
-	$(Q)if test -e $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
-		ln -sf ld-uClibc.so.1 $(TARGET_DIR)/lib/ld-uClibc.so.0 ; \
-	fi
-	$(Q)if test -e $(TARGET_DIR)/lib/ld64-uClibc.so.1; then \
-		ln -sf ld64-uClibc.so.1 $(TARGET_DIR)/lib/ld64-uClibc.so.0 ; \
-	fi
-endef
-
 TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_BUILD_WRAPPER)
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
-- 
2.5.5
