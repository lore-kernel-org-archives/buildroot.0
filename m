From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 25 Apr 2019 20:14:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/openssh: fix build with atomic
Message-ID: <20190425181437.25687-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-config to retrieve openssl dependencies such as atomic

Fixes:
 - http://autobuild.buildroot.org/results/33d0e56368ab0e74d523be4837824654a4684746

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssh/openssh.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4fef5caedb..d21640e43e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -8,7 +8,10 @@ OPENSSH_VERSION = 7.9p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
+OPENSSH_CONF_ENV = \
+	LD="$(TARGET_CC)" \
+	LDFLAGS="$(TARGET_CFLAGS)" \
+	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
 	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
@@ -27,7 +30,7 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 OPENSSH_CONF_OPTS += --without-pie
 endif
 
-OPENSSH_DEPENDENCIES = zlib openssl
+OPENSSH_DEPENDENCIES = host-pkgconf zlib openssl
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 OPENSSH_DEPENDENCIES += cryptodev-linux
-- 
2.20.1
