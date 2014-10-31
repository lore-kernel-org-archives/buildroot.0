From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 31 Oct 2014 16:19:07 +0100
Subject: [Buildroot] [PATCH v2 1/3] skeleton: add support for
	/etc/ld.so.conf.d/*.conf files
Message-ID: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 toolchain/toolchain.mk | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 3f9900b..cd65cfc 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -13,6 +13,31 @@ endef
 TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
 endif
 
+# - glibc can include configuration files at runtime
+# - uclibc does not support "include" feature
+# - musl use /etc/ld-musl-${ARCH}.path file. This file use same syntax
+#     than $LD_LIBRARY_PATH. Since there are plenty of corner cases in
+#     generation of this file, we prefer to not support it. User can
+#     fix the problem by providing file manualy (in a an overlay).
+#
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+define GENERATE_LD_SO_CONF_FILE
+	echo 'include /etc/ld.so.conf.d/*.conf' > $(TARGET_DIR)/etc/ld.so.conf
+endef
+else
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+define GENERATE_LD_SO_CONF_FILE
+	ls $(TARGET_DIR)/etc/ld.so.conf.d/*.conf > /dev/null 2>&1 && \
+	    echo "Usage of /etc/ld.so.conf.d/*.conf files with musl libc is not supported"
+endef
+else # UCLIBC
+define GENERATE_LD_SO_CONF_FILE
+	cat $(TARGET_DIR)/etc/ld.so.conf.d/*.conf > $(TARGET_DIR)/etc/ld.so.conf
+endef
+endif
+endif
+TARGET_FINALIZE_HOOKS += GENERATE_LD_SO_CONF_FILE
+
 # Install the gconv modules
 ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
 GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
-- 
1.9.1
