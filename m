From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 11:51:22 +0100
Subject: [Buildroot] [PATCH 1/7] package/cifs-utils: add optional support
	for keyutils
Message-ID: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When keyutils was compiled before, cifs-utils will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/cifscreds | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libkeyutils.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cifs-utils/cifs-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index e668b08..89358b1 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -14,6 +14,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 CIFS_UTILS_CONF_OPTS += --disable-pie
 endif
 
+ifeq ($(BR2_PACKAGE_KEYUTILS),y)
+CIFS_UTILS_DEPENDENCIES += keyutils
+endif
+
 define CIFS_UTILS_NO_WERROR
 	$(SED) 's/-Werror//' $(@D)/Makefile.in
 endef
-- 
2.7.0
