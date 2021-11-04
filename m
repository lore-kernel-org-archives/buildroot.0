Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FADC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 23:14:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8FE61212
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 23:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA8FE61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FE2C40624;
	Thu,  4 Nov 2021 23:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWg-JEDQXsfJ; Thu,  4 Nov 2021 23:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182C740584;
	Thu,  4 Nov 2021 23:14:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7ED1BF21A
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 23:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AECC80F8C
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 23:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPwn1W6yfgx9 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 23:14:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2C3380F87
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 23:14:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so10969605wrg.5
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 16:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7boXD59byeljzsPbl1X0cF+9B+10feGj0cVuCjU6z30=;
 b=RvlNh0zmf3Q82cVDOzCKTYkf2GpnGBNk95dJY6yi6LmhIC6H3aH4lHVFBF5GaG3s3u
 fSIgKh6nSEQyKLTiowKcEHwZz6hkY/sWwX5aUxjB1StIBrUezwze9F+ba6VFKMDjB6xd
 gR6xfK88XF1IlsDIkk3uoErUNhnNweaf722I3IcX03lPuuQGc4Okt0TITNbnPhgu6nml
 08zv4rfx/B4k1CYEFI0O65ojrn73mw2OxvmoURkekbMu+8U1hs9RW+8AFcK2IAWAMe27
 NMm0G35OcnD0SQZtT6cU2WKOz6GIW+LsTKkfotOjCQxggu4E3d3HEj0kT0s5J3p6yjNy
 vWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7boXD59byeljzsPbl1X0cF+9B+10feGj0cVuCjU6z30=;
 b=KqKWleNadN46U3qPuF6Co5Khv48F8Tat1Prk5hG2uHkA4RE1vvFtDVHdaRWH1DRLdT
 JqR2c4pOuvgWgYQ8aO0MDIxTL3/7bkQKHiR/cOD6eM3J0exZr28jIlNlbF9yM4fnS4XU
 CPVHPLTKmaY+I7FY49f2UGWYtbiMGXF3oCP+ZVhsSXk3OdUHL+x3yp1ryXYqoz2/yYfd
 6WqdEQXQYtUyGagdLia6QoBTFlYRkCpkthuZA5CW0SjBSOv9M+lu7ag01DC1TW8QNSl/
 iht/fKKIBiO6HZhuGVKNQjFYk2fxzV+0qjc1Wb42mlcNqJQgH1sht51zluz5riAPCpee
 OOoQ==
X-Gm-Message-State: AOAM530pVpIMpIkcQqm4ReVmuri0aANxG2PNa1u9bbwzD0ar+QGHP+9E
 W4WCAq65Om7aRgTKF/gfD8o7lqYlcZA=
X-Google-Smtp-Source: ABdhPJxQXe0Ln1F9hlvDUgiiSFdkQeS8VfaiqE9DgQPxoz+Mf/vKSm487/styWElyFN4q6lNnChVig==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr69310674wru.362.1636067646373; 
 Thu, 04 Nov 2021 16:14:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z14sm6542995wrp.70.2021.11.04.16.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 16:14:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 00:12:08 +0100
Message-Id: <20211104231210.2027405-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104231210.2027405-1-fontaine.fabrice@gmail.com>
References: <20211104231210.2027405-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/dahdi-linux: needs CRC CCITT
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dahdi-linux needs a linux with CRC CCITT since the addition of the
package in commit d959966b41bd88a36664c733a8a8d2b6809e4fc2 as stated in
the README:

- CONFIG_CRC_CCITT must be enabled ('y' or 'm'). On 2.6 kernels this can
  be selected These can be selected from the "Library Routines" submenu
  during kernel configuration via "make menuconfig".

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dahdi-linux/dahdi-linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index 4d2c7e7177..cb1d692e94 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -60,6 +60,10 @@ define DAHDI_LINUX_EXTRACT_FW
 endef
 DAHDI_LINUX_POST_EXTRACT_HOOKS += DAHDI_LINUX_EXTRACT_FW
 
+define DAHDI_LINUX_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC_CCITT)
+endef
+
 # Need to pass the same options as for building the modules, because
 # it wants to scan Linux' .config file to check whether some options
 # are set or not (like CONFIG_FW_LOADER).
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
