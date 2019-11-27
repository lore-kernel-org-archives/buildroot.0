From: Yi Zheng <goodmenzy@gmail.com>
Date: Wed, 27 Nov 2019 12:23:48 +0800
Subject: [Buildroot] [PATCH] ecryptfs-utils: add linux-pam dependency if PAM
 has been enabled
In-Reply-To: <20191127042053.GC1282@techyauld.com>
References: <20191127042053.GC1282@techyauld.com>
Message-ID: <CAJPHfYOm0O9WSRv-u1huwqzeEKBsKEEpsqTjd3ugJ=NwiwwSUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

        If linux-pam has been selected, we want to build pam_ecryptfs.so
        and install it into /lib/security/

Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk
b/package/ecryptfs-utils/ecryptfs-utils.mk
index eb3194b6d0..326ff4f2dd 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -11,13 +11,20 @@ ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING

 ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
-ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap --disable-pam
+ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap

 #Needed for build system to find pk11func.h and libnss3.so
 ECRYPTFS_UTILS_CONF_ENV = \
        NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss
-I$(STAGING_DIR)/usr/include/nspr" \
        NSS_LIBS="-lnss3"

+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
+ECRYPTFS_UTILS_DEPENDENCIES += linux-pam
+else
+ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
--
2.24.0
