From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Mon, 14 Sep 2015 22:59:51 -0500
Subject: [Buildroot] [PATCH 2/2] openssl: enable parallel build and
	installation
In-Reply-To: <1442289591-30376-1-git-send-email-ryanbarnett3@gmail.com>
References: <1442289591-30376-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <1442289591-30376-3-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On my build server, the current build of OpenSSL takes 1 minutes and
20 seconds. With this commit applied, enabling parallel build and
installation, the build only takes 28 seconds.

All the patches are downloaded from Gentoo.

There is apparently some interest in upstream OpenSSL to enable
parallel build, see for example commit
https://github.com/openssl/openssl/commit/c3f22253b139793ff3b91ff7e6969e180cf06815. This
commit is not part of any OpenSSL release, but we can hope that the
problem will resolved in the future.

I have tested 20 consecutive builds of a config that has openssl and
host-openssl being used by uboot-tools and host-uboot-tools (through
the FIT image support).

[Ryan: simplified patches from gentoo (single patch now)]
[Ryan: updated offsets to apply cleanly]
[Ryan: updated hash file]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 ...ont-waste-time-building-manpages-if-we-re-not-going.patch | 11 ++++++-----
 .../0002-cryptodev-Fix-issue-with-signature-generation.patch |  7 ++++---
 package/openssl/openssl.hash                                 |  2 ++
 package/openssl/openssl.mk                                   | 12 +++++++-----
 4 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
index 93e2118..f54f2fa 100644
--- a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
+++ b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
@@ -1,19 +1,20 @@
-From 53980448064b362a58e4ab2aca6f38fec93c07c3 Mon Sep 17 00:00:00 2001
+From 12de3d3aa9525c551ebbd7fcff9d9d2b08e58aad Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Sat, 16 May 2015 18:53:51 +0200
-Subject: [PATCH 1/3] Dont waste time building manpages if we're not going to
+Subject: [PATCH 1/2] Dont waste time building manpages if we're not going to
  use em.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 ---
  Makefile.org | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.org b/Makefile.org
-index b7a3f96..8a47840 100644
+index 60f07cc..976ceaf 100644
 --- a/Makefile.org
 +++ b/Makefile.org
-@@ -536,7 +536,7 @@ dist:
+@@ -527,7 +527,7 @@ dist:
  dist_pem_h:
  	(cd crypto/pem; $(MAKE) -e $(BUILDENV) pem.h; $(MAKE) clean)
  
@@ -23,5 +24,5 @@ index b7a3f96..8a47840 100644
  install_sw:
  	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
 -- 
-2.1.0
+1.9.1
 
diff --git a/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
index 17887d3..2fe9fae 100644
--- a/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
+++ b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
@@ -1,7 +1,7 @@
-From 0718df24bd828f26d7d0e8e7f935d8e21f70ebca Mon Sep 17 00:00:00 2001
+From 4f802320219bc5c4969ce92ba42acce73bad0b77 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Sat, 16 May 2015 18:55:08 +0200
-Subject: [PATCH 2/3] cryptodev: Fix issue with signature generation
+Subject: [PATCH 2/2] cryptodev: Fix issue with signature generation
 
 Forward port of 0001-cryptodev-Fix-issue-with-signature-generation.patch
 from http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
@@ -10,6 +10,7 @@ It was originally targetted at 1.0.2-beta3.
 Without this patch digest acceleration via cryptodev is broken.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 ---
  crypto/engine/eng_cryptodev.c | 195 +++++++++++++++++++++++++++++++-----------
  1 file changed, 146 insertions(+), 49 deletions(-)
@@ -445,5 +446,5 @@ index 926d95c..7021d9a 100644
          !ENGINE_set_digests(engine, cryptodev_engine_digests) ||
          !ENGINE_set_ctrl_function(engine, cryptodev_ctrl) ||
 -- 
-2.1.0
+1.9.1
 
diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 355be79..7e67737 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,2 +1,4 @@
 # From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
 sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
+# Locally computed
+sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?revision=1.1
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 3d87919..c7459dd 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -13,6 +13,8 @@ OPENSSL_DEPENDENCIES = zlib
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
+OPENSSL_PATCH = \
+	https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?revision=1.1
 
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
