Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78357C25B77
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 13:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4342A6081B;
	Fri, 17 May 2024 13:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYIV6LxpNHgl; Fri, 17 May 2024 13:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169D36077D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169D36077D;
	Fri, 17 May 2024 13:21:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FAA11BF3F0
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC06F8226F
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4E7o6BZe3d41 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 13:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9A368210F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A368210F
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9A368210F
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:21:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 360E9CE1AED;
 Fri, 17 May 2024 13:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B434C2BD10;
 Fri, 17 May 2024 13:20:59 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:20:38 +0300
Message-ID: <20240517132039.7124-4-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240517132039.7124-1-jarkko@kernel.org>
References: <20240517132039.7124-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715952059;
 bh=pjuCghGmhFtuXXvUDSv31JdBi3ZBmvQB42ZXI9YVtlg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YewLPs+oSkGEPCx2W0BYEI86c89jXvv9fJPK+y5bZ1hwfFg2L1t6VeyNqfVtbcT0r
 9Gb8xeihoXplFwFNIxpYFufhbCCHR7UHOfyYpytwvm6cBA/b0PQcN78uSB4tofhiKD
 DVRzQPD/YBtN1cryvx63shsc9wPEXzIgEayUV9VDDPBp8RquIJxvERJjh1wzC1Lp0J
 HeeXqE7F++eg0UBzUNNhFjwngHjc11Argn8orYBqtJ837EtpPuZNmotncagyxlDJWT
 Vss0N1SBHNjGEuKSMsXK4twyczYyP0mBEhT5il+AKJaWdfWbEJwVmrmANifjk8mN70
 MciUn6GaCyElg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=YewLPs+o
Subject: [Buildroot] [PATCH 3/4] package/libtpms: add host package
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libtpms is a library that targets the integration of TPM functionality
into hypervisors, primarily into Qemu. Libtpms provides a very narrow
public API for this purpose so that integration is possible. Only the
minimum of necessary APIs are made publicly available.

Link: https://github.com/stefanberger/libtpms
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libtpms/Config.in    | 20 ++++++++++++++++++++
 package/libtpms/libtpms.hash |  2 ++
 package/libtpms/libtpms.mk   | 17 +++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/libtpms/Config.in
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d..db0dc702a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1519,6 +1519,7 @@ N:	Jared Bents <jared.bents@rockwellcollins.com>
 F:	package/libvirt/
 
 N:	Jarkko Sakkinen <jarkko@kernel.org>
+F:	package/libtpms/
 F:	package/quota/
 
 N:	Jason Pruitt <jrspruitt@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 1b6a5b0dab..30b76349ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1569,6 +1569,7 @@ menu "Crypto"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
 	source "package/libtomcrypt/Config.in"
+	source "package/libtpms/Config.in"
 	source "package/libuecc/Config.in"
 	source "package/libxcrypt/Config.in"
 	source "package/mbedtls/Config.in"
diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
new file mode 100644
index 0000000000..d5ae47375a
--- /dev/null
+++ b/package/libtpms/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBTPMS
+	bool "libtpms"
+	select BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBTOOL
+	help
+	  Libtpms is a library that targets the integration of TPM
+	  functionality into hypervisors, primarily into Qemu. Libtpms
+	  provides a very narrow public API for this purpose so that
+	  integration is possible. Only the minimum of necessary APIs
+	  are made publicly available.
+
+	  It is assumed that the user of libtpms is familiar with the
+	  concepts of the Trusted Platform Module (TPM). For the
+	  interaction with libtpms it is necessary to know how to
+	  construct valid TPM commands and to be able to parse their
+	  results. It is not within the scope of libtpms's documentation
+	  to provide background on this. See the section on references
+	  below.
+
+	  https://github.com/stefanberger/libtpms/wiki
diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
new file mode 100644
index 0000000000..1026aaa4f4
--- /dev/null
+++ b/package/libtpms/libtpms.hash
@@ -0,0 +1,2 @@
+sha256  2807466f1563ebe45fdd12dd26e501e8a0c4fbb99c7c428fbb508789efd221c0  libtpms-0.9.6.tar.gz
+sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
new file mode 100644
index 0000000000..c588b2892c
--- /dev/null
+++ b/package/libtpms/libtpms.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libtpms
+#
+################################################################################
+
+LIBTPMS_VERSION = 0.9.6
+LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
+LIBTPMS_LICENSE = BSD-4-Clause
+LIBTPMS_LICENSE_FILES = LICENSE
+LIBTPMS_INSTALL_STAGING = YES
+LIBTPMS_AUTORECONF = YES
+
+HOST_LIBTPMS_DEPENDENCIES = host-libtool host-pkgconf host-libopenssl
+HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
+
+$(eval $(host-autotools-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
