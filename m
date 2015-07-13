From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 12:56:14 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix support of uClibc-ng
	toolchains
Message-ID: <1436784974-23384-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
patched specifically for uClibc-ng, so it continues to generate
binaries that expect the dynamic loader to be named ld-uClibc.so.0,
like with the original uClibc.

Therefore, when a uClibc-ng toolchain is used as an external
toolchain, we need to create an additional symbolic link to make
uClibc-ng systems work properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 070f068..e6ad4c6 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -710,6 +710,17 @@ define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
 	fi
 endef
 
+# uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
+# patched specifically for uClibc-ng, so it continues to generate
+# binaries that expect the dynamic loader to be named ld-uClibc.so.0,
+# like with the original uClibc. Therefore, we create an additional
+# symbolic link to make uClibc-ng systems work properly.
+define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
+	if test -L $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
+		ln -s ld-uClibc.so.1 $(TARGET_DIR)/lib/ld-uClibc.so.0 ; \
+	fi
+endef
+
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
@@ -723,6 +734,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
+	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
 $(eval $(generic-package))
-- 
2.4.5
