Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6592DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:56:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 313C161108
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 19:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 313C161108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E51160AF4;
	Wed,  3 Nov 2021 19:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzHpkTzhyo2r; Wed,  3 Nov 2021 19:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E726083B;
	Wed,  3 Nov 2021 19:56:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5FB1BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D0446063D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 19:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEjwbH_kX-67 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 19:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA5BD60AD8
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 19:55:28 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id s1so2017736qta.13
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AoujxsnyrPjM1dumLXgg9r1HOBkpJL42tBP/Sxr9vzs=;
 b=RyDCx1K9PpPyu676J9aK9pte1OXfA7wghqiQRmDIGLCirp9royR9y9oW4ecYMZysTy
 +EQ7KGg/RjLLHBsObXvg+UkHbDNV7jdsBML5FTHDGCP9uMftIlDyAK+dFttWRCBhRtDH
 apbzXsrXQChiU1yIvlxf7BWV10fw8dsvA47noef5CkyE7UJLUoaTqYNcJ2Ob2B1UtL+0
 SKPGvdIifJA8GxEESmv3ijy8Hf9yfNj81nVcyOrmTL1fh9y+yZYGiz0DWUo0leNczCJt
 D/t3NFoxX1w14PPhMviw0thXVXF8D2yW6J45mKsSOy+ZsiNs34gHKmfD/AHXG4yaRR8l
 zURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AoujxsnyrPjM1dumLXgg9r1HOBkpJL42tBP/Sxr9vzs=;
 b=4MjJ93/V81RijBJkg1N7ZtPA2vTc24I3cB7kIOMQIdXg8xzJvw9myZFgkTHUyM+cmQ
 daOfh8nBNfLK8eKXFowxxfRgp61gigejHay43L7MyJGP0pobVL3hrWXz1qLBWjjcXmcx
 bpotEUQcYolf0/vWl8oAgNQ78AEGWmbbO3Av5PmVBKawVCNIqwVQ+5jtCg2jdy/bVabl
 Clykm2q57Qs8VHXTLGLlvHlJyslS2/xuvT94Caexcq7yVFW/C/ZpN3/OEy2dZR2k+Ere
 VoN3ovcGsEhFDXTvoSeyz2X3SX3FLUXW9sYjlhr3/3ib45Xe2YhBaomJV6MUJU9Se7Nx
 LMvw==
X-Gm-Message-State: AOAM533SvwTehH8EA9m8mrmVF6BAwokp+lHh7+9oRMWbrM0GrRh3gThe
 D4wiAWSrqlf1TQSZp9dsDzF0sbHTh+I=
X-Google-Smtp-Source: ABdhPJxlxAUI4pWlZmJpgdF0b1pyAd9MAOXqhNHgrdnfy7UOrrlf898yrkrXSp06qux1M1ZvPqxwGA==
X-Received: by 2002:ac8:5990:: with SMTP id e16mr23633123qte.109.1635969327354; 
 Wed, 03 Nov 2021 12:55:27 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id e14sm2449335qty.59.2021.11.03.12.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 12:55:27 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 12:55:19 -0700
Message-Id: <20211103195520.147558-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211103195520.147558-1-aduskett@gmail.com>
References: <20211103195520.147558-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mender-grubenv: fix grub module checks
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
Cc: Mirza Krak <mirza.krak@northern.tech>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3efb5e31fc05705ce3c46b1f0ec031978a5cfab6 broke mender-grubenv by
splititng up BR2_TARGET_GRUB2_BUILTIN_MODULES and
BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI. Indeed, when a user now builds a system
with EFI, the MENDER_GRUBENV_MODULES_MISSING list always returns a full list
of grub modules, resulting in the error condition on line 46 to trigger.

Add an ifeq that checks BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI if
grub_efi is selected.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender-grubenv/mender-grubenv.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index f06dbbe35c..1be722233c 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -31,9 +31,15 @@ MENDER_GRUBENV_DEFINES = \
 # These grub modules must be built in for the grub scripts to work properly.
 # Without them, the system will not boot.
 MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test regexp
+ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y)
+MENDER_GRUBENV_MODULES_MISSING = \
+	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI)),\
+		$(MENDER_GRUBENV_MANDATORY_MODULES))
+else
 MENDER_GRUBENV_MODULES_MISSING = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
+endif
 
 ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
 ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
