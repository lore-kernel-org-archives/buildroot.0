From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 16 Sep 2015 07:06:25 -0500
Subject: [Buildroot] [v3 2/2] openssl: enable parallel build and installation
In-Reply-To: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
References: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <1442405185-4103-3-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a patch that is originally based on a patch Thomas P.
submitted for an earlier version of this package. I have adopted this
patch to use the latest available Gentoo parallel patch. I have also
seen about a minute improvement on my build times of openssl.

Part of Thomas P's original message:

On my build server, the current build of OpenSSL takes 1 minutes and
20 seconds. With this commit applied, enabling parallel build and
installation, the build only takes 28 seconds.

All the patches are downloaded from Gentoo.

There is apparently some interest in upstream OpenSSL to enable
parallel build, see for example commit
https://github.com/openssl/openssl/commit/c3f22253b139793ff3b91ff7e6969e180cf06815. This
commit is not part of any OpenSSL release, but we can hope that the
problem will resolved in the future.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
CC: Gustavo Zacarias <gustavo@zacarias.com.ar>
CC: Arnout Vandecappelle <arnout@mind.be>

---
Changes from v2 to v3:
 - No changes

Changes from v1 to v2:
 - Removed changes to existing patches in openssl (suggested by Arnout)
 - Updated parallel patch URL to use Gentoo gitweb (suggested by Mike)

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/openssl/openssl.hash |  2 ++
 package/openssl/openssl.mk   | 12 +++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 355be79..9eaa363 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,2 +1,4 @@
 # From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
 sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
+# Locally computed
+sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 3d87919..c1fc420 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -13,6 +13,8 @@ OPENSSL_DEPENDENCIES = zlib
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
+OPENSSL_PATCH = \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=56bd759df1d0c750a065b8c845e93d5dfa6b549d
 
 ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
@@ -99,23 +101,23 @@ OPENSSL_POST_CONFIGURE_HOOKS += OPENSSL_FIXUP_STATIC_MAKEFILE
 endif
 
 define HOST_OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D)
+	$(MAKE) -C $(@D)
 endef
 
 define OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D)
+	$(MAKE) -C $(@D)
 endef
 
 define OPENSSL_INSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
+	$(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
 endef
 
 define HOST_OPENSSL_INSTALL_CMDS
-	$(MAKE1) -C $(@D) install
+	$(MAKE) -C $(@D) install
 endef
 
 define OPENSSL_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
+	$(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
 	rm -rf $(TARGET_DIR)/usr/lib/ssl
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
-- 
1.9.1
