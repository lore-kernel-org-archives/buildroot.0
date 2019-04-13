From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:14:13 +0200
Subject: [Buildroot] [git commit] package/sqlcipher: fix static build with
 openssl and atomic
Message-ID: <20190413191128.270CA83F9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2b6bb17fa6bee2ac94a64e08bbc700cc936b6ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to find openssl dependencies such as lz or latomic

Fixes: static build on sparc v8 (even if there are no autobuilder
failures yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlcipher/sqlcipher.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 4427344120..a16d94d1dc 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -8,7 +8,7 @@ SQLCIPHER_VERSION = v4.0.1
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
-SQLCIPHER_DEPENDENCIES = openssl host-tcl
+SQLCIPHER_DEPENDENCIES = host-pkgconf openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
 SQLCIPHER_CONF_ENV = \
@@ -20,7 +20,7 @@ SQLCIPHER_CONF_OPTS = \
 	--disable-tcl
 
 SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
-SQLCIPHER_CONF_ENV += LIBS="-lcrypto -lz"
+SQLCIPHER_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 
 ifeq ($(BR2_PACKAGE_SQLCIPHER_STAT3),y)
 SQLCIPHER_CFLAGS += -DSQLITE_ENABLE_STAT3
