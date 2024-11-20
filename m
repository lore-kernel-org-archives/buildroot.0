Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073A1D6E2CE
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 08:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A762960674;
	Wed, 20 Nov 2024 08:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96SK6h9VcFb9; Wed, 20 Nov 2024 08:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9874660690
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9874660690;
	Wed, 20 Nov 2024 08:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27768970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0641A851E2
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7LNn520Jt_g for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 08:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 068BA851DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068BA851DE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 068BA851DE
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:07:10 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a0d:e487:139f:e4e9:e019:e105:213e:675c])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9728720039E;
 Wed, 20 Nov 2024 09:07:06 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 09:07:03 +0100
Message-ID: <20241120080703.63802-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <87h682ed2c.fsf@tarshish>
References: <87h682ed2c.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732090029;
 bh=cEFZr52Fo4/9LOlvT0IiPsU/0uOhTb6VG0MNkg4zSAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ob69ncxeCYf5RipSGFU7L+a5kf/PMfVCxqKlaAMjZC8yJtUxkOyFvHWTAm5jilfs9
 pqUopZQLj+i9SCeoBxgl5DFyY9zv+l63HwKwhik6fqBJeaMN+Nu9CXhdzTAIrLcfFl
 wqtxaBI25aeEvPBmiFb7N9EQLsWCX83Lx1SwKtZ5VVtedp0giuVfAhn6XXGefx/XRU
 IN39kC/VPy73ZniLmJjO+uCC52ggkS2oBE8YaPKfrbujqmbPKs5Xhwtei79gO7isg/
 9NLEokKpRk4hvMzHG1VK+MmYyk/hCx3U3KWj+JOwEz38Wc0x+DCm2+e15IS/v38WGk
 znoLxNTz6jniQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ob69ncxe
Subject: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
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
Cc: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libnss_ato module is a set of C library extensions which allows to
map every nss request for unknown user to a single predefined user.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
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
index 3945803d53..6dee1c10ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
+F:	package/libnss-ato/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..30dc2c1712 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1610,6 +1610,7 @@ menu "Crypto"
 	source "package/libmd/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libnss-ato/Config.in"
 	source "package/libolm/Config.in"
 	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
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
index 0000000000..46b8a7963b
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
