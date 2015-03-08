From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:41:38 +0100
Subject: [Buildroot] [git commit] package/thrift: force boost libdir to
	staging/usr/lib/
Message-ID: <20150308214853.1366A80431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9be52effc47acf9db9c5183c866bc2cd5dafb58d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libtool append the sysroot path (lt_sysroot) with the libdir value found in
the libstdc++.la file only with bfin toolchain.

Path/to/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so

The issue disappears when --with-boost=$(STAGING_DIR) is removed.
So instead of using --with-boost=$(STAGING_DIR), use
--with-boost-libdir=$(STAGING_DIR)/usr/lib to give the path to boost's
libraries.

Fixes:
http://autobuild.buildroot.net/results/ae2/ae274693b953dd569c3ff63c532e2fc9553b5002/

And many more

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/thrift/thrift.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 559bd28..094f8d0 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -11,7 +11,8 @@ THRIFT_INSTALL_STAGING = YES
 HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
 	host-zlib host-bison host-flex
 THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
-	--with-boost=$(STAGING_DIR) \
+	--with-boost \
+	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
 	--disable-tests \
 	--disable-tutorial
 HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) \
