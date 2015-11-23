From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:32:25 +0100
Subject: [Buildroot] [git commit] Revert "openssl: enable parallel build and
	installation"
Message-ID: <20151123173232.85CE080F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a597e3c676948c6c1eb6440c82f19b7460f29192
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 55e4ec054c21b9164e10c323a5f0afff1deb1d67.

There are still build failures in parallel builds:
    http://autobuild.buildroot.org/results/9a0/9a0fc1064010a658155e6a18ec72e0e3c58ec7f6/
    http://autobuild.buildroot.org/results/c28/c28064f383da1f577bd9227d004f1939daf4579f/
    http://autobuild.buildroot.org/results/218/2180b9d900b27103acc92a2932f7ffa560b04831/
    and so on...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/openssl.hash |    2 --
 package/openssl/openssl.mk   |   12 +++++-------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 9eaa363..355be79 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,4 +1,2 @@
 # From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
 sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
-# Locally computed
-sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index cad8d0c..da492ff 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -13,8 +13,6 @@ OPENSSL_DEPENDENCIES = zlib
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
-OPENSSL_PATCH = \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
 
 ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
@@ -101,23 +99,23 @@ OPENSSL_POST_CONFIGURE_HOOKS += OPENSSL_FIXUP_STATIC_MAKEFILE
 endif
 
 define HOST_OPENSSL_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(MAKE1) -C $(@D)
 endef
 
 define OPENSSL_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(MAKE1) -C $(@D)
 endef
 
 define OPENSSL_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
+	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
 endef
 
 define HOST_OPENSSL_INSTALL_CMDS
-	$(MAKE) -C $(@D) install
+	$(MAKE1) -C $(@D) install
 endef
 
 define OPENSSL_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
+	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
 	rm -rf $(TARGET_DIR)/usr/lib/ssl
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
