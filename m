Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E9C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 09:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28E644029F;
	Thu, 11 Jul 2024 09:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyjTRmnIUrd6; Thu, 11 Jul 2024 09:27:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E779240E03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E779240E03;
	Thu, 11 Jul 2024 09:27:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97A381BF574
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83A17820CA
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 09:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hbWw4Wap_KA for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 09:27:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97A01820A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A01820A1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97A01820A1
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 09:27:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0A5724000A;
 Thu, 11 Jul 2024 09:27:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 11:27:28 +0200
Message-Id: <20240711092728.3083087-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720690055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UtCYHBqP3keM4eCI4tLBEQlTnO2l4KgoMVO0LrLoRdo=;
 b=VeAR9DKRtqcbGl7lddcsxuEcAF5+AB6JfWGo4rbC+UPfnCGyBzpe/dTVMK60FvUnPRx4Yh
 gQbJ2AupcIJyS5jzLztvj1x6GIVHpkJ876/SgYKhGpoQC6cjsMzNY5zTeB0YvROGFuPxmP
 gSjkfIsOEIHcGYTz5bv7HxtR3z4R+uGQ68Bhbxsshl12OkqNNcOwSv2pBE6JErSK5TieaE
 HfKmhx70s41YTJJCJmX3iCUqNJfFPfaSlodgPqLClWBqrOb+sbneog2ObwURvOr5KY56FE
 S7Y6QUfUJCbrqlvjIvueoaZu4tIPZkkXCsVx+zyDq/k9kvQ+ZTvlOfRkeebEJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VeAR9DKR
Subject: [Buildroot] [PATCH] boot/optee-os: Add support to build with
 host-cmake
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some specific versions of OP-TEE need cmake on the host to build the scmi
firmware, like the newly release STMicroelectronics 3.19.0-stm32mp-r2
version.

To allow building such OP-TEE OS versions, this commit adds the option
BR2_TARGET_OPTEE_OS_NEEDS_CMAKE which when enabled ensures that host-cmake
is built before OP-TEE OS.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/optee-os/Config.in   | 6 ++++++
 boot/optee-os/optee-os.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 34ea993136..7870629732 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -91,6 +91,12 @@ config BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	  python-cryptography. Select this option if optee-os needs
 	  python-cryptography to be built.
 
+config BR2_TARGET_OPTEE_OS_NEEDS_CMAKE
+	bool "OP-TEE OS needs cmake"
+	help
+	  Select this option if your OP-TEE OS platform configuration
+	  requires the cmake build system to be available.
+
 config BR2_TARGET_OPTEE_OS_CORE
 	bool "Build core"
 	default y
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 33b4e2e1ab..8fa5c824da 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -30,6 +30,10 @@ endif
 
 OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
 
+ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_CMAKE),y)
+OPTEE_OS_DEPENDENCIES += host-cmake
+endif
+
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
 OPTEE_OS_DEPENDENCIES += host-python-cryptography
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
