From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:45:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/lynx: fix build
 with latomic
Message-ID: <20190426130223.5EF2280163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3779f6011d9c92d8044271d70a0e0ca2a994c3f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fbe58db378dfc1b24fe3d50ca515bb7ae4493ee5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
