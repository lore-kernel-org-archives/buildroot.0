From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu,  3 Dec 2015 18:31:16 -0300
Subject: [Buildroot] [PATCH] openssl: re-enable parallel build
Message-ID: <1449178276-15264-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

The previous incarnation was incomplete, it only applied one of the
Gentoo patches, hence it had corner cases.
Apply all 4 patches as pointed out by Mike on the mailing list.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 ...-waste-time-building-manpages-if-we-re-not-going.patch |  5 +++--
 package/openssl/openssl.hash                              |  5 +++++
 package/openssl/openssl.mk                                | 15 ++++++++++-----
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
index e4dde7d..10d2b75 100644
--- a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
+++ b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
@@ -4,6 +4,7 @@ Date: Sat, 16 May 2015 18:53:51 +0200
 Subject: Dont waste time building manpages if we're not going to use em.
 
 Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
+[Gustavo: update for parallel-build]
 ---
  Makefile.org | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -16,8 +17,8 @@ index 60f07cc..976ceaf 100644
  dist_pem_h:
  	(cd crypto/pem; $(MAKE) -e $(BUILDENV) pem.h; $(MAKE) clean)
  
--install: all install_docs install_sw
-+install: all install_sw
+-install: install_docs install_sw
++install: install_sw
  
  install_sw:
  	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index dee8ab9..2d2a5b0 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,2 +1,7 @@
 # From https://www.openssl.org/source/openssl-1.0.2e.tar.gz.sha256
 sha256	e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff	openssl-1.0.2e.tar.gz
+# Locally computed
+sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
+sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
+sha256	30cb49489de5041841a74da9155cd4fabfbce33237262ba7cd23974314ae2956	openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
+sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 1f07df1..c3ea08d 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -13,6 +13,11 @@ OPENSSL_DEPENDENCIES = zlib
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
+OPENSSL_PATCH = \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 
 ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
@@ -98,23 +103,23 @@ OPENSSL_POST_CONFIGURE_HOOKS += OPENSSL_FIXUP_STATIC_MAKEFILE
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
2.4.10
