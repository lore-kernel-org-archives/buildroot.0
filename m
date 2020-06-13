From: Paul Cercueil <paul@crapouillou.net>
Date: Sat, 13 Jun 2020 18:20:01 +0200
Subject: [Buildroot] [PATCH] uclibc: add simlinks from
 libdl/libm/libpthread/librt
Message-ID: <20200613162001.154280-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the symbols that were previously present in libdl.so.0, libm.so.0,
libpthread.so.0 and librt.so.0 are now all packed within uClibc.

In order to keep binary compatibility with old executables, which were
dynamically linked with one of the libraries above, add symbolic links
to the uClibc shared library.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/uclibc/uclibc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3ba4589672..73664d5b0b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -424,6 +424,10 @@ define UCLIBC_INSTALL_TARGET_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime
 	$(UCLIBC_INSTALL_UTILS_TARGET)
+	ln -sf libuClibc-$(UCLIBC_VERSION).so $(TARGET_DIR)/lib/libdl.so.0
+	ln -sf libuClibc-$(UCLIBC_VERSION).so $(TARGET_DIR)/lib/libm.so.0
+	ln -sf libuClibc-$(UCLIBC_VERSION).so $(TARGET_DIR)/lib/libpthread.so.0
+	ln -sf libuClibc-$(UCLIBC_VERSION).so $(TARGET_DIR)/lib/librt.so.0
 endef
 
 # STATIC has no ld* tools, only getconf
-- 
2.27.0
