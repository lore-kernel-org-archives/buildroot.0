Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F4BC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 23:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA69A849D1;
	Wed,  5 Jun 2024 23:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bc6sS3o2gRX; Wed,  5 Jun 2024 23:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 271AD849D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 271AD849D7;
	Wed,  5 Jun 2024 23:35:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3C6B1BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B039E423ED
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xiuCXTyCD6x4 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 23:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 753C441A72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753C441A72
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 753C441A72
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 23:35:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1864E60025;
 Wed,  5 Jun 2024 23:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC1CC32782;
 Wed,  5 Jun 2024 23:35:19 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 02:35:02 +0300
Message-ID: <20240605233503.23516-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605233503.23516-1-jarkko@kernel.org>
References: <20240605233503.23516-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717630519;
 bh=+CWcXWauWfNWNEqbBKOkwaROYfAL/CdUDMhJlKQzu4Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dzj66uSEYpalbA4BVwx0a7XR2WufHEKArhhS9QlU+8D/UTKcOYvh9lje2uszvZVCB
 L0ibCrtz2qxFuV+kaDPwJkGIRoKjXNnn6GhYli5zNujKZm/qx8KezyDp8PCAJZjSIq
 SUv85K5HWrUf5IRuNs74FqeAYEossJX6q8YcdIRG3+Nrt2fvTolEfgNU85J/+MVaRL
 5juLC4fPyQz0MPzdw3vEurBT1TgAnRGMDRE0jBXOpoTnvjjsOjhewszT69LGPfMNzW
 zYYKO+X9Pp9rfOqbmnhLzC8c+2xeWa9DuqKHpQk2e/L5vxjpzPCtcoMTyIwzLwuhf1
 wiYG+pyqiwDkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Dzj66uSE
Subject: [Buildroot] [PATCH v7 2/3] package/libtpms: add host package
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
v7:
- Rebase to f77d698f83b2 ("support/scripts/apply-patches: use appropriate TAR").
v6:
- Remove Config.in.host entirely. Not required for pure deps.
v5:
- Config.in.host
- s/"libtpms"/"host libtpms"/
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
 package/libtpms/libtpms.hash |  2 ++
 package/libtpms/libtpms.mk   | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 03aa7bfa74..3ca7fcc36e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1521,6 +1521,7 @@ N:	Jared Bents <jared.bents@rockwellcollins.com>
 F:	package/libvirt/

 N:	Jarkko Sakkinen <jarkko@kernel.org>
+F:	package/libtpms/
 F:	package/quota/

 N:	Jason Pruitt <jrspruitt@gmail.com>
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
index 0000000000..19d7cef89f
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
+# Required because a plain Git clone is used:
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
