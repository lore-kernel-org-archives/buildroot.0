From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 21:04:38 +0200
Subject: [Buildroot] [PATCH 2/2] openssl: enable parallel build and
	installation
In-Reply-To: <1431803078-27629-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431803078-27629-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1431803078-27629-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ste-time-building-manpages-if-we-re-not-going.patch | 12 ++++++------
 ...cryptodev-Fix-issue-with-signature-generation.patch |  2 +-
 package/openssl/0003-Fix-c_rehash.patch                |  2 +-
 package/openssl/openssl.hash                           |  4 ++++
 package/openssl/openssl.mk                             | 18 +++++++++++++-----
 5 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
index 93e2118..4066dae 100644
--- a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
+++ b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
@@ -1,4 +1,4 @@
-From 53980448064b362a58e4ab2aca6f38fec93c07c3 Mon Sep 17 00:00:00 2001
+From 167e29662b07805eac9ef67e10af9d71761233c3 Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Sat, 16 May 2015 18:53:51 +0200
 Subject: [PATCH 1/3] Dont waste time building manpages if we're not going to
@@ -10,17 +10,17 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.org b/Makefile.org
-index b7a3f96..8a47840 100644
+index f2c5eff..4d58a9a 100644
 --- a/Makefile.org
 +++ b/Makefile.org
-@@ -536,7 +536,7 @@ dist:
+@@ -539,7 +539,7 @@ dist:
  dist_pem_h:
  	(cd crypto/pem; $(MAKE) -e $(BUILDENV) pem.h; $(MAKE) clean)
  
--install: all install_docs install_sw
-+install: all install_sw
+-install: install_docs install_sw
++install: install_sw
  
- install_sw:
+ install_dirs:
  	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
 -- 
 2.1.0
diff --git a/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
index 17887d3..8b77157 100644
--- a/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
+++ b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
@@ -1,4 +1,4 @@
-From 0718df24bd828f26d7d0e8e7f935d8e21f70ebca Mon Sep 17 00:00:00 2001
+From 426288a7c55ddd2ad63a11d8a05defe165448213 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Sat, 16 May 2015 18:55:08 +0200
 Subject: [PATCH 2/3] cryptodev: Fix issue with signature generation
diff --git a/package/openssl/0003-Fix-c_rehash.patch b/package/openssl/0003-Fix-c_rehash.patch
index 2c51832..b69bf11 100644
--- a/package/openssl/0003-Fix-c_rehash.patch
+++ b/package/openssl/0003-Fix-c_rehash.patch
@@ -1,4 +1,4 @@
-From e2b290598f513a5bc4d8187cbc53bbc98b7a1e49 Mon Sep 17 00:00:00 2001
+From c52bc9d5e2195427aa322f2607d55211306648f1 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Tue, 27 Jan 2015 18:27:32 -0300
 Subject: [PATCH 3/3] Fix c_rehash
diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index c9987fc..b14c9bb 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -2,3 +2,7 @@
 # From https://www.openssl.org/source/openssl-1.0.2a.tar.gz.sha1
 md5	a06c547dac9044161a477211049f60ef	openssl-1.0.2a.tar.gz
 sha1	46ecd325b8e587fa491f6bb02ad4a9fb9f382f5f	openssl-1.0.2a.tar.gz
+sha256  db2dcdb27062923d2818f988787bb802c292053d1d8a5bf032800e658c7bd196 openssl-1.0.2a-parallel-build.patch?revision=1.2
+sha256  147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f openssl-1.0.2a-parallel-obj-headers.patch?revision=1.1
+sha256  eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9 openssl-1.0.2a-parallel-install-dirs.patch?revision=1.1
+sha256  5be3c20d64cadaed7bc4e8e500e8a67faafded7fb326779620fdb29397c44d87 openssl-1.0.2a-parallel-symlinking.patch?revision=1.1
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index f90c811..328b8aa 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -13,6 +13,14 @@ OPENSSL_DEPENDENCIES = zlib
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
+OPENSSL_GENTOO_PATCHES = \
+	build.patch?revision=1.2 \
+	obj-headers.patch?revision=1.1 \
+	install-dirs.patch?revision=1.1 \
+	symlinking.patch?revision=1.1
+OPENSSL_PATCH = \
+	$(foreach p,$(OPENSSL_GENTOO_PATCHES),\
+		https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/openssl/files/openssl-1.0.2a-parallel-$(p))
 
 ifeq ($(BR2_PACKAGE_OPENSSL_BIN),)
 define OPENSSL_DISABLE_APPS
@@ -95,23 +103,23 @@ define OPENSSL_CONFIGURE_CMDS
 endef
 
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
2.1.0
