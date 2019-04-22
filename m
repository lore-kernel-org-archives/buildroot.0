From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Apr 2019 12:48:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/lynx: fix build with latomic
Message-ID: <20190422104821.16807-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Help lynx finding openssl dependencies by giving it a path in --with-ssl
and using pkg-config to directly pass the correct libraries in LIBS.

This will disable the call to pkg-config and CF_ADD_LIBS which has the
sad behavior of removing duplicates ...
As a result, build fails because, the following correct dependencies:

configure:14170: testing adding -L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lz -pthread -latomic -lcrypto -lz -pthread -latomic  to LIBS ...

is replaced by:

-L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto

As a result, static linking fails on crypto because the second -latomic
has been removed ...

Fixes:
 - http://autobuild.buildroot.org/results/2c28426253014d93e86e3ba6ed578e84317a9f19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lynx/lynx.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index 174d741dd9..3ac5b4cabf 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -21,8 +21,9 @@ LYNX_CONF_OPTS += --with-screen=slang
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LYNX_DEPENDENCIES += openssl
-LYNX_CONF_OPTS += --with-ssl
+LYNX_DEPENDENCIES += host-pkgconf openssl
+LYNX_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
+LYNX_CONF_ENV = LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LYNX_DEPENDENCIES += gnutls
 LYNX_CONF_OPTS += --with-gnutls
-- 
2.20.1
