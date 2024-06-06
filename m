Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012A3C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 10:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9671607D5;
	Thu,  6 Jun 2024 10:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzEeJGR488hs; Thu,  6 Jun 2024 10:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B89886084B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B89886084B;
	Thu,  6 Jun 2024 10:48:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29DE71BF5E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C72403E2
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2c0yd07IwqU for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 10:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAFC2400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAFC2400AF
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAFC2400AF
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 10:48:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C14AA61B8D;
 Thu,  6 Jun 2024 10:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1435CC4AF0C;
 Thu,  6 Jun 2024 10:48:25 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 13:48:11 +0300
Message-ID: <20240606104813.1514-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606104813.1514-1-jarkko@kernel.org>
References: <20240606104813.1514-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717670906;
 bh=rTxKQlNLzuAtKEWcXoR0fmlzQLSD4zj7PEidqs8aWPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TwS+TUNzAOqqJh4ltAmwwTzVR/3CWTK35uLXewFeC/TzOFh9EYr+LP0UbswcJq8V8
 VkE8IFQQZs663scEFXOxH4SQZBDHSBP/k4iHWNx/r8ac6fQ+upQvpDeeDLcEDZ6Wc/
 9sQK6jUx0adfcROM26RoGDXJu07kmdfGQfTqK0rbhIJ3hsce+/oltPMQBTJ6EONFbt
 uDujemW8YK2B3UIydyo+AGEvqz9cdjYYwgG7PT0E+U57y5hdsT9qxKv4DnaoDD5wlz
 vYfk5BHlq6GN6kA7lbIOXU8Rq7zhegVOQvIUkBszG6emPTcXFLgpzipXH4i9t9IkxB
 orf5qQxQWIJdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TwS+TUNz
Subject: [Buildroot] [PATCH v2 1/3] package/tpm2-tools: bump version to 5.7
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
Cc: Erik Larsson <who+buildroot@cnackers.org>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tpm2_encodeobject is essential for testing RSAPKCS1 and ECDSA TPM2 signing
keys, as the key blob is loaded to the chip in DER format defined by ASN.1
schema.

Link: https://lore.kernel.org/linux-crypto/20240528210823.28798-1-jarkko@kernel.org/
Cc: Erik Larsson <who+buildroot@cnackers.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/tpm2-tools/tpm2-tools.hash | 2 +-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index f50a896363..a7b1ef559e 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c0b402f6a7b3456e8eb2445211e2d41c46c7e769e05fe4d8909ff64119f7a630  tpm2-tools-5.2.tar.gz
+sha256  3810d36b5079256f4f2f7ce552e22213d43b1031c131538df8a2dbc3c570983a  tpm2-tools-5.7.tar.gz
 sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 12f924eee5..cd9c582aa9 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 5.2
+TPM2_TOOLS_VERSION = 5.7
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
