Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41452EF06EA
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 20:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C788160724;
	Sun,  8 Feb 2026 20:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjjkKVVRACdM; Sun,  8 Feb 2026 20:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCAEF607D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770583309;
	bh=YM5N86sDYlTYxyQ5E2dwlYyy70gnVAb7+DFgSdM/6YY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=N+8hPQyZfeLqh3+pJvK1pJwdyDmao7w/K8jZvhOHk1Ceu9LYzgPc7Dgpp+r2n0mS8
	 isDvfZPAMBtcPK+Y8HBxxrk15AguMTWx7ARHhIqVmKhppKSeoWwNskIKKDHDzJFXMy
	 GNrw4mD+eG4NohOetcLTf/GAj7qVZbcGCc8DjkTrylxhFwkZOZeyHilx5BzVH+uQt4
	 HaJA7eB1QZ4Qvk5EOo+aqyvrhFKW4lDqjkN8XlB1hHknqCoKMMRVR5NXgjOx23bfKH
	 PnB835yz6971sxZLss553Mv4+pAG5nNC3d9N/iITS0Pom4IIlx1YX3jNlt7PQ1hVjc
	 R6TdJ2SY7h12w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCAEF607D9;
	Sun,  8 Feb 2026 20:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD02E2A2
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C240C403AF
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoEl86Ik4I04 for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 20:41:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 147344037D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 147344037D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 147344037D
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 20:41:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.65.104.223])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 77FB678032A;
 Sun,  8 Feb 2026 21:41:41 +0100 (CET)
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>
Date: Sun,  8 Feb 2026 21:40:57 +0100
Message-ID: <20260208204057.927317-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770583302;
 bh=H29hk4GoCEmgKCGc8/u3pedAQpmq2k5vqRXSw1pO06o=;
 h=From:To:Cc:Subject:Date:From;
 b=jP1qlMtk/9uhAEbom6X7vecbz2blqGAoevfk/JuFvAzUEhRAFLtEYRZC0RBiCoGba
 G7x0b6GNf0jWOGbjdRCxGlUp8o/a6ivcccu0FAUHxPl/OVbBdvm/oYBCx+dZ1KAQOa
 xVAMaDJ88wgGeQArTfoYCuCXn5K74XC+T6XNDBzHIccXrRoXrIww279ldwSta6qEWK
 8YzlaPcfVp/9A3H1gO4wx12/RsxJNTbN5Tjv/R2AtkSfPmRqtPYy3ytSjR9fROZT1L
 CFJyUDiMkTXMvDU+gNUZACjdP2BzeNxvBRSOd7bkVIfY3mvpe/bGEI/lfq3p6HdRfn
 TdTL1LWhA+Nqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jP1qlMtk
Subject: [Buildroot] [PATCH v2] package/libnss-ato: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libnss_ato module is a set of C library extensions which allows to
map every nss request for unknown user to a single predefined user.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
v1 -> v2:
  - rebased on top of the latest master branch
  - asked upstream for a release tag:
    https://github.com/donapieppo/libnss-ato/issues/27

v1: https://lists.buildroot.org/pipermail/buildroot/2024-November/767814.html
  - Baruch Siach: add depends on BR2_TOOLCHAIN_USES_GLIBC since other
    C libraries do not provide NSS functionality. (applied)
  - Baruch Siach: questioned why upstream Makefile is not used;
    explained that it avoids patching for a single .c file. Added
    comment in .mk. (applied)
  - Neal Frager: suggested asking upstream to create proper release
    tags instead of using commit SHA for SBOM compliance. (done, see
    above)
  - Neal Frager: suggested sending upstream a PR to fix the Makefile
    for cross-compilation.

Tested with Buildroot gitlab CI (12/12 glibc toolchains pass):
  https://gitlab.com/vjardin/buildroot/-/pipelines/2313074190

 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libnss-ato/Config.in       | 11 +++++++++++
 package/libnss-ato/libnss-ato.hash |  4 ++++
 package/libnss-ato/libnss-ato.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/libnss-ato/Config.in
 create mode 100644 package/libnss-ato/libnss-ato.hash
 create mode 100644 package/libnss-ato/libnss-ato.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 225d1ac917..12a8e37a66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3356,6 +3356,7 @@ F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
+F:	package/libnss-ato/
 F:	package/libyang-cpp/
 F:	package/sysrepo-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index 8346ef1a0e..ba03ee6cf0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1630,6 +1630,7 @@ menu "Crypto"
 	source "package/libksba/Config.in"
 	source "package/libmd/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libnss-ato/Config.in"
 	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
diff --git a/package/libnss-ato/Config.in b/package/libnss-ato/Config.in
new file mode 100644
index 0000000000..6c6fc23857
--- /dev/null
+++ b/package/libnss-ato/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBNSS_ATO
+	bool "libnss-ato"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Library to map every nss request for unknown user to a
+	  single predefined user.
+
+	  https://github.com/donapieppo/libnss-ato
+
+comment "libnss-ato needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libnss-ato/libnss-ato.hash b/package/libnss-ato/libnss-ato.hash
new file mode 100644
index 0000000000..5e828f1be6
--- /dev/null
+++ b/package/libnss-ato/libnss-ato.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  3de3161d298c48e55d7416ad89130e13dd72263b93563f3fb79c899fa8450ce2  copyright
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  lgpl-3.0.txt
+sha256  87e17468eec71254e7848cb7c9dae5603ab376a719b05e2f5e69038ffed8beef  libnss-ato-4a29c8410cdac590a210dab2dec41d5f4b40d282.tar.gz
diff --git a/package/libnss-ato/libnss-ato.mk b/package/libnss-ato/libnss-ato.mk
new file mode 100644
index 0000000000..6da646a414
--- /dev/null
+++ b/package/libnss-ato/libnss-ato.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libnss-ato
+#
+################################################################################
+
+LIBNSS_ATO_VERSION = 4a29c8410cdac590a210dab2dec41d5f4b40d282
+LIBNSS_ATO_SITE = $(call github,donapieppo,libnss-ato,$(LIBNSS_ATO_VERSION))
+LIBNSS_ATO_LICENSE = LGPL-3.0+
+LIBNSS_ATO_LICENSE_FILES = copyright lgpl-3.0.txt
+
+# Skip the default build system (avoid patching Makefile for 1 .c)
+define LIBNSS_ATO_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-fPIC -Wall -shared -o $(@D)/libnss_ato.so.2 \
+		-Wl,-soname,libnss_ato.so.2 \
+		$(@D)/libnss_ato.c
+endef
+
+define LIBNSS_ATO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so.2
+	ln -sf libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so
+	$(INSTALL) -D -m 0644 $(@D)/libnss-ato.conf $(TARGET_DIR)/etc/libnss-ato.conf
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
