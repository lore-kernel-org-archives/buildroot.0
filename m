Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644B9C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 10:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 307C281FF2;
	Tue, 21 May 2024 10:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9iJm-bradbB; Tue, 21 May 2024 10:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24DD581E28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24DD581E28;
	Tue, 21 May 2024 10:32:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE56C1C5114
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B68F7608B8
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjwyQP45VwfP for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 10:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 374FF608B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374FF608B4
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 374FF608B4
 for <buildroot@buildroot.org>; Tue, 21 May 2024 10:32:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A77BACE0EE9;
 Tue, 21 May 2024 10:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A07C2BD11;
 Tue, 21 May 2024 10:32:10 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 13:31:53 +0300
Message-ID: <20240521103154.32660-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521103154.32660-1-jarkko@kernel.org>
References: <20240521103154.32660-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716287530;
 bh=xx5dmiy9W1w6P0g5RssK7d5F2hzbYcOdasSbwQkdOP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ou8hJVoFHAmuK5+/QNCmYhs3gNKKxxejCp8hAE83baecHca1u6cPzY2U7dWQDN8dF
 YvFQ5ss3lQMaRGTJGyf4lSYIzVXWLHnRDz/4euX7VAp4ZnxZRnDBhUUlfS+tsSrNJf
 GA7IDOFw3x7aBZ7CG1yb/v4eWJYyTGY+XWHUOQGWuY+kEaILM2YsAzFA/xVkbzaUCm
 nHTK3kevlNG/OfcwbZ9n0QEkUh0sQdFehKtauxfOYK4PDww3V0AhfFlQz/JY6roGNW
 /HXAOLRTu0oHoMBOxyyzySyXCh0QrZvMf+H00qHHl8UXELfkDppp4h8V01oxehqmMp
 JHtoTnrsz+wiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ou8hJVoF
Subject: [Buildroot] [PATCH v4 2/3] package/libtpms: add host package
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
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
v4:
- Changed in libtpms.mk to purely HOST_*.
v3:
- Use package deps in Kconfig as this just a library.
- DEPENDENCIES and CONF_OPTS for the host build
v2:
- Use host packages in package/libtpms/Config.in.
- Select BR2_HOST_PACKAGE_LIBOPENSSL.
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libtpms/Config.in    | 20 ++++++++++++++++++++
 package/libtpms/libtpms.hash |  2 ++
 package/libtpms/libtpms.mk   | 18 ++++++++++++++++++
 5 files changed, 42 insertions(+)
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
index 0000000000..335a5bc7b6
--- /dev/null
+++ b/package/libtpms/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBTPMS
+	bool "libtpms"
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_OPENSSL
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
index 0000000000..68be1f6b44
--- /dev/null
+++ b/package/libtpms/libtpms.mk
@@ -0,0 +1,18 @@
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
+
+# Straight from the git repository:
+HOST_LIBTPMS_AUTORECONF = YES
+HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
+HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
+
+$(eval $(host-autotools-package))
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
