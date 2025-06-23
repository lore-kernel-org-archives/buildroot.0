Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5463CC7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 21:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1EF940A1B;
	Mon, 23 Jun 2025 21:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoZl6u9C1fka; Mon, 23 Jun 2025 21:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97CBA40A3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97CBA40A3B;
	Mon, 23 Jun 2025 21:43:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 027A6767
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 21:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC40560B85
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 21:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfJvEQZLdoxc for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 21:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1797360B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1797360B6B
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1797360B6B
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 21:43:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 53EAD4386A;
 Mon, 23 Jun 2025 21:43:49 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Date: Mon, 23 Jun 2025 23:40:48 +0200
Message-ID: <20250623214048.1751840-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhholhgrnhhgv
 gejleesghhmrghilhdrtghomhdprhgtphhtthhopehsvghnsehhrghsthhinhhgshdrohhrgh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750715030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=poTRdwNcI/C/+jepGDUrtyeszOQAFH9IVKJqATnTOkI=;
 b=NOl7lkDNwtnEZjCehiyFobBnaJpClYu3XPJ3SuQJyTxVeeNSb/BTXHVo80xWT3IJMA42Nx
 8nCfymjk8gReqOWgeUus5mfB58Jr+xND6AlhM8cLRa7UfNPyuMSRpZ/btLv7ejI6BGzpwC
 OpNeL0bf3GygZAO2Yp4Kv0nindny2CHnMTyV1cIZ+a7pzcGPHQc18vQMRU2q2wt2OmWZbZ
 oj903H8fKpIi8VCFXUy98bhcvH220fhxHseCGDLI2DSeN9cs4C/9uXbZJyG0fcvWogGQtM
 KudFX0kyztGSYAJvEMTPGoFip2ky+pC0fHMb/dzEsNncuwIqD5WCbhfG8eSQvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NOl7lkDN
Subject: [Buildroot] [PATCH] package/systemd: fix systemd-boot installation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the bump of systemd to 257.5 in commit
7d8d48cd2ba1396ea146e94020939f4dfe08c5cb, the installation of
systemd-boot fails with:

/usr/bin/install -D -m 0644 /home/thomas/projets/buildroot/outputs/3/build/systemd-257.5/buildroot-build/src/boot/efi/systemd-bootx64.efi /home/thomas/projets/buildroot/outputs/3/images/efi-part/EFI/BOOT/bootx64.efi
/usr/bin/install: cannot stat '/home/thomas/projets/buildroot/outputs/3/build/systemd-257.5/buildroot-build/src/boot/efi/systemd-bootx64.efi': No such file or directory

Indeed, the systemd-bootx64.efi binary is no longer produced in
buildroot-build/src/boot/efi/, but in buildroot-build/src/boot/.

No autobuilder failures have been found corresponding to this issue,
but it can be reproduced with:

 BR2_x86_64=y
 BR2_x86_corei7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
 BR2_INIT_SYSTEMD=y
 BR2_SYSTEM_BIN_SH_NONE=y
 BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_SYSTEMD_BOOT=y
 # BR2_TARGET_ROOTFS_TAR is not set

Most likely this was caused by upstream commit
97318131fd06a5bc35454da81dcbbc84f16d9940, even though we didn't check
if this commit was really the culprit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fa57894369..9d253fd16a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -649,7 +649,7 @@ SYSTEMD_CONF_OPTS += -Dbootloader=enabled
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
-	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
+	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
 	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
 		$(BINARIES_DIR)/efi-part/loader/loader.conf
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
