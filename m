From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jul 2015 11:25:34 +0300
Subject: [Buildroot] [PATCH] toolchain-external: fix uClibc-ng 64bit dynamic
	loader link
Message-ID: <b301100fe3edad0eed23cf5557548fe014410899.1437035134.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 34f95bf9dbb0 (toolchain-external: fix support of uClibc-ng toolchains,
2015-07-13) added the missing ld-uClibc.so.1 dynamic linker symlink that
binaries expect when linked with uClibc-ng. However on 64bit targets the
linker is called ld64-uClibc.so.1. Handle that case as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain-external/toolchain-external.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index fcb033ca2ebf..ce9d79f2fa41 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -730,6 +730,9 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 	if test -e $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
 		ln -sf ld-uClibc.so.1 $(TARGET_DIR)/lib/ld-uClibc.so.0 ; \
 	fi
+	if test -e $(TARGET_DIR)/lib/ld64-uClibc.so.1; then \
+		ln -sf ld64-uClibc.so.1 $(TARGET_DIR)/lib/ld64-uClibc.so.0 ; \
+	fi
 endef
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
-- 
2.1.4
