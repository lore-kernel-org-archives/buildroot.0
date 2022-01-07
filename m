Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A10BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 23:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C72483112;
	Fri,  7 Jan 2022 23:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeNyaAKwOijv; Fri,  7 Jan 2022 23:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4340082FD7;
	Fri,  7 Jan 2022 23:14:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C05B1BF36E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 763D882FD7
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id taf6O0iUlQ-w for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 23:14:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BE6081450
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 23:14:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9ECE38349A; Fri,  7 Jan 2022 23:07:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 23:28:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62c2da0e7a54e96a12190bcaa79e552b497e634b
X-Git-Newrev: bf4cf9de833e2d571d98d1ca935ea08a3468e463
X-Patchwork-Hint: ignore
Message-Id: <20220107230754.9ECE38349A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptopp: add a target variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf4cf9de833e2d571d98d1ca935ea08a3468e463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So far, cryptopp only had a host variant, but some use-cases require
this library on the target, so this adjusts the cryptopp package
accordingly.

One patch (submitted upstream) is needed to have the proper symlink
corresponding to the SONAME of the shared library.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 ...kefile-add-missing-shared-library-symlink.patch | 62 ++++++++++++++++++++++
 package/cryptopp/Config.in                         |  8 +++
 package/cryptopp/cryptopp.mk                       | 31 +++++++++++
 4 files changed, 102 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3a0cc0c585..b424d20de4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1397,6 +1397,7 @@ menu "Crypto"
 	source "package/botan/Config.in"
 	source "package/ca-certificates/Config.in"
 	source "package/cryptodev/Config.in"
+	source "package/cryptopp/Config.in"
 	source "package/gcr/Config.in"
 	source "package/gnutls/Config.in"
 	source "package/libargon2/Config.in"
diff --git a/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch b/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch
new file mode 100644
index 0000000000..5f87414d53
--- /dev/null
+++ b/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch
@@ -0,0 +1,62 @@
+From e4c2e3bc8174f24cf63923619f5d06d85b84ae1d Mon Sep 17 00:00:00 2001
+From: Kamel Bouhara <kamel.bouhara@bootlin.com>
+Date: Fri, 7 Jan 2022 22:59:23 +0100
+Subject: [PATCH] GNUmakefile: add missing shared library symlink
+
+The GNUmakefile install-lib target currently installs the following
+symlink:
+
+	libcryptopp.so -> libcryptopp.so.8.6.0
+
+However, it does not create the following symlink:
+
+	libcryptopp.so.8 -> libcryptopp.so.8.6.0
+
+This symlink is necessary at runtime because libcryptopp.so.8 is the
+SONAME of the cryptopp library, and therefore this is what the dynamic
+loader will search when starting a program that is linked against
+cryptopp.
+
+For native compilation, the 'ldconfig' invocation that immediately
+follows will create that symlink, so everything works.
+
+For cross-compilation however, ldconfig can't be used, and therefore
+LDCONFIG is passed as /bin/true, and therefore it doesn't create the
+symlink. So instead, create it directly inside the GNUmakefile,
+without relying on ldconfig.
+
+Upstream: https://github.com/weidai11/cryptopp/pull/1101
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ GNUmakefile       | 1 +
+ GNUmakefile-cross | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index 23273edb..3b55e420 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -1412,6 +1412,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
+ 	$(CHMOD) u=rwx,go=rx $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
+ ifeq ($(HAS_SOLIB_VERSION),1)
+ 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
++	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
+ 	$(LDCONF) $(DESTDIR)$(LIBDIR)
+ endif
+ endif
+diff --git a/GNUmakefile-cross b/GNUmakefile-cross
+index 9847f04b..a2b87e4a 100644
+--- a/GNUmakefile-cross
++++ b/GNUmakefile-cross
+@@ -856,6 +856,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
+ 	$(CHMOD) u=rwx,go=rx $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
+ ifeq ($(HAS_SOLIB_VERSION),1)
+ 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
++	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
+ 	$(LDCONF) $(DESTDIR)$(LIBDIR)
+ endif
+ endif
+-- 
+2.33.1
+
diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
new file mode 100644
index 0000000000..4ead5339ab
--- /dev/null
+++ b/package/cryptopp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CRYPTOPP
+	bool "cryptopp"
+	depends on !BR2_STATIC_LIBS
+	help
+	  A free C++ class library of cryptographic schemes
+
+comment "cryptopp needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 6711a37fbc..5e6eb9644d 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -36,4 +36,35 @@ define HOST_CRYPTOPP_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-lib
 endef
 
+define CRYPTOPP_EXTRACT_CMDS
+	$(UNZIP) $(CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
+endef
+
+CRYPTOPP_CXXFLAGS = $(TARGET_CXXFLAGS) -fPIC
+
+# _mm256_broadcastsi128_si256 has been added only in gcc 4.9
+ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
+CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
+endif
+
+CRYPTOPP_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CXXFLAGS="$(CRYPTOPP_CXXFLAGS)"
+
+define CRYPTOPP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CRYPTOPP_MAKE_OPTS) \
+		PREFIX=/usr shared libcryptopp.pc
+endef
+
+define CRYPTOPP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) \
+		LDCONFIG=/bin/true install-lib
+endef
+
+define CRYPTOPP_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) \
+		LDCONFIG=/bin/true install-lib
+endef
+
+$(eval $(generic-package))
 $(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
