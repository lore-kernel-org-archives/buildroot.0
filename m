From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:31:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/kexec: add optional support for xz
Message-ID: <1456007514-29695-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When xz was compiled before, kexec will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/kdump | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [liblzma.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kexec/kexec.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index d158406..7264a1c 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -17,6 +17,17 @@ else
 KEXEC_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+# fixes broken check for xz when cross-compiling:
+# checking for lzma_code in -llzma...
+# ./configure: line 4712: ac_fn_c_try_link: command not found
+KEXEC_CONF_ENV += ac_cv_lib_lzma_lzma_code=yes
+KEXEC_CONF_OPTS += --with-lzma
+KEXEC_DEPENDENCIES += xz
+else
+KEXEC_CONF_OPTS += --without-lzma
+endif
+
 define KEXEC_REMOVE_LIB_TOOLS
 	rm -rf $(TARGET_DIR)/usr/lib/kexec-tools
 endef
-- 
2.7.0
