Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8009C79F9D
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 14:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50FAE60A78;
	Mon,  5 Jan 2026 14:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rbd-M4NOLYs7; Mon,  5 Jan 2026 14:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC4060A70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767623342;
	bh=MuEP63mtIZb6TFBULNpqRQsf1o2gpr04GVeAWIjzZ0Y=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cTibOB0SSDiKUYb3OnK6MUycBpNi0IKw66HcmmpCt2pVzXHRqozCk6uwm9wJSMM+4
	 4tFj/2aILppH9EU09OufdH0ccM04PoXLkiodQgJ7jvfR4sMqDC2TOyq7Oqj8i5sxvI
	 rQiG4UuoUw3LTN2GFca6aeK3/EYu3jmb6tSgsDb2ikuu9oZmKnpin6B5QGXGdgBMZb
	 zmi4qCVPHPKqCqNBt6sdTuvbyJ0Fqrv6oJuE0cwCTJBJI7Yu4qO99NOlJ9b3dyXfJV
	 FM32n3i3r5Vkv6L+Df6LLEx2yWbTLF5o+1NeA+p71qkMgPVBXzBe+Ld0vH27FFysrj
	 tDBdArMlBICxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC4060A70;
	Mon,  5 Jan 2026 14:29:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45A4C2DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C6C2406C4
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbHEqexd0cqg for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 14:28:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 434F0406D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434F0406D9
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 434F0406D9
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:28:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E727AC1E485
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:28:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CAD5760726;
 Mon,  5 Jan 2026 14:28:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E66D103C8417; Mon,  5 Jan 2026 15:28:52 +0100 (CET)
Date: Mon, 05 Jan 2026 15:28:40 +0100
MIME-Version: 1.0
Message-Id: <20260105-uboot-2025-10-fix-build-on-lts-v1-1-51997f7758a4@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJfKW2kC/x3NQQqDMBCF4avIrDsyiUakVyldGB11QJKSaBHEu
 zu6/ODxvwMyJ+EM7+KAxH/JEoPCvAro5y5MjDKowZJtyJDDzce4otKhIRxlR7/JMmAMuKwZXW/
 axtdV1Y41aOSXWDfPweeOuJJsucP3PC90cZmTewAAAA==
X-Change-ID: 20260105-uboot-2025-10-fix-build-on-lts-5c186b4338f4
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767623335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=eKkzYw26vGnxqW5gyw1FQopE5LHquiF/rZ6/GlOZvOM=;
 b=VVDsLQNp6KD043rGT3g8w9ti3TfGADYlmhESw03I1etdJ7Ix6sJ8ITQpwLK2lgVDTd7x7Y
 go4Oa35NZhDqZqtJggQJG+mSQO559UlSHlFcCkbCePPAIndb0Angp5rx0ekPYRFu3Hp5Do
 RRsLQ7C2IqdhTTSSxXYUvZSallGe6NulwCv+T3/qNRd6WetzqxbSibqlH/mvzJWaaqTGNN
 UIUuueiNL1qNvIbCq2rEyZ6CnzPrVSaptr2HIdkshA6SWWtS1X9kMiIbluTFdLAW5Ps4+Z
 7zIo8gJwvpJ1KNNGGZhJP17wVeP4UuMKRqgNeO/ZW9VwRSH5AeL4zIlW43IFdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VVDsLQNp
Subject: [Buildroot] [PATCH 2025.02.x] uboot: allow building versions >=
 2025.10
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With upstream commit a239b0b0b6db ("Add symlink from gpl-2.0.txt to
a COPYING file"), COPYING is now a symlink to Licenses/gpl-2.0.txt,
causing the install command in UBOOT_COPY_OLD_LICENSE_FILE to fail
because the source and destination refer to the same file. To avoid
this, copy the license file only if Licenses/gpl-2.0.txt does not
already exist.

Link: https://gitlab.com/buildroot.org/buildroot/-/commit/128c26f2875dd60ed5fafe25f63b3da11bb79f60
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
This change was applied on master as part of commit 128c26f2875d
("boot/uboot: bump to version 2025.10"). This commit is only taking the
line to allow to building a recent U-Boot on stable branches.

To maintainers: I'm not sure whether I should set the original patch author
as the author of this patch, or add a Co-developed-by, or something
else. I'm fine with resending with such changes if they apply.
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a31010..0d77340f85a4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -307,7 +307,7 @@ endif
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-	if [ -f $(@D)/COPYING ]; then \
+	if [ -f $(@D)/COPYING ] && [ ! -f $(@D)/Licenses/gpl-2.0.txt ]; then \
 		$(INSTALL) -m 0644 -D $(@D)/COPYING $(@D)/Licenses/gpl-2.0.txt; \
 	fi
 endef

---
base-commit: e81d65de87f710d711fb204e2af4ac07d26feb20
change-id: 20260105-uboot-2025-10-fix-build-on-lts-5c186b4338f4

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
