Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65847C25B79
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 17:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F31FB406BB;
	Fri, 17 May 2024 17:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ug2R53gesr8R; Fri, 17 May 2024 17:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA90406DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA90406DF;
	Fri, 17 May 2024 17:31:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 658CB1BF357
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 527D0606F7
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WedAEbz9FHUr for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 17:31:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63717606D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63717606D3
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63717606D3
 for <buildroot@buildroot.org>; Fri, 17 May 2024 17:31:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B43261DF6;
 Fri, 17 May 2024 17:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC02DC2BD10;
 Fri, 17 May 2024 17:31:53 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 20:31:39 +0300
Message-ID: <20240517173140.24531-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240517173140.24531-1-jarkko@kernel.org>
References: <20240517173140.24531-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715967114;
 bh=karPCIxtCn7IsVjfsTm9DKThzlDjnsfW2i0sus18IoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EfavZ2rkZ+I5o9jgP9etglQEyok0ZTuuH9cIgqntQ9gdodvAMO3ES9rJi3klzn59e
 sVYWiMki6p8xjtG5jrlCUoooK2XZmNrJGBy/ddyRw6GtI6clsvhoOf9rDNt8/T2x36
 JE1pStYOuvOndBzMVzFTKZkSTaVFXhUErxkoQ2GeTodLFmWmbzcm7ST9Z7gyf+0zXJ
 uegLJYST9RhMtlNtKS94W8XBfC+pmGlhQ6IvY9jZF7t7F5sU6WNeF6UprhdgMHvVYG
 iRrbeglc7XS8F6awPj2b+xpp5DlIHMYosiQWQld0Vi6lg/VzPwODz1MgFIcztYZOAT
 oePaRRQATH11A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=EfavZ2rk
Subject: [Buildroot] [PATCH v2 2/3] package/libtpms: add host package
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

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v2:
- Use host packages in package/libtpms/Config.in.
- Select BR2_HOST_PACKAGE_LIBOPENSSL.
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libtpms/Config.in    | 19 +++++++++++++++++++
 package/libtpms/libtpms.hash |  2 ++
 package/libtpms/libtpms.mk   | 17 +++++++++++++++++
 5 files changed, 40 insertions(+)
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
index 0000000000..9308458248
--- /dev/null
+++ b/package/libtpms/Config.in
@@ -0,0 +1,19 @@
+config BR2_HOST_PACKAGE_LIBTPMS
+	bool "libtpms"
+	select BR2_HOST_PACKAGE_LIBTOOL
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
