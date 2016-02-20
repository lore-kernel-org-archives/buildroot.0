From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 00:12:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: add optional support for
	e2fsprogs
In-Reply-To: <1456009925-11756-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456009925-11756-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456009925-11756-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When e2fsprogs was compiled before, quota will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/quotacheck | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcom_err.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libext2fs.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]

Quote from configure log before this patch when e2fsprogs were missing:

checking ext2fs/ext2fs.h usability... no
checking ext2fs/ext2fs.h presence... no
checking for ext2fs/ext2fs.h... no
checking for com_err in -lcom_err... no
checking for ext2fs_initialize in -lext2fs... no
configure: WARNING: Ext2 direct support won't be compiled. Libraries not found.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/quota/quota.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index a6b0322..c30a2bd 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -18,6 +18,13 @@ QUOTA_DEPENDENCIES += gettext
 QUOTA_LIBS += -lintl
 endif
 
+ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
+QUOTA_DEPENDENCIES += e2fsprogs
+QUOTA_CONF_OPTS += --enable-ext2direct
+else
+QUOTA_CONF_OPTS += --disable-ext2direct
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 QUOTA_DEPENDENCIES += libtirpc host-pkgconf
 QUOTA_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
-- 
2.7.0
