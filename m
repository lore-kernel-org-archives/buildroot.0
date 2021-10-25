Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4332C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:02:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C59B60E8B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C59B60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF86E608B0;
	Mon, 25 Oct 2021 22:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-LeyGMoghL6; Mon, 25 Oct 2021 22:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B7286089F;
	Mon, 25 Oct 2021 22:02:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 701A11BF2FA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 601B46089F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uXpqhc5mt66 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:02:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1448160809
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:02:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v17so14089168wrv.9
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vnLbAmO7rMyy/ZElpINzkRdRwVl7uaiDB/CRp/HeBl4=;
 b=SjlUJE6tIbzUAHcnlsfaoSbh9vcMEz55CbUntGAtddXrqxaMXSPgJprgfN8KtrB8tO
 NyQt5tVuf9pOFqJWujj29+l2TppBs10fjqrkovFW7s1IH9R0/Nn5k0NaL0n+sK3XgwF3
 uhms2TEgK6s6IxIz+Ce7UwuxoE1Ey2/CJV0u9q30n6hDxoTjhySWF9ZrEm987ZHza4vo
 z5zfCLj/DTu+TRpBTzj7AOWyC8cUCVHx5TM7dSvWGFamWg/uR2zDBQ0uwifLFfMqTlds
 3ZXfUKm8Q8ba8EealMdUafFMOD+QaxRzR825gUV22OIsV6sbdq17lk5Bi0zzmxHCZP5E
 GVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vnLbAmO7rMyy/ZElpINzkRdRwVl7uaiDB/CRp/HeBl4=;
 b=n2VMaRdK8O0l2+MBoDRc2ux/XVtXTiQRxlnzro7Bv9NsECvLIkF8KinJldpWMcowuq
 OwG0zpeSgGL0acGsi1WYE8bmyxB8oIYhd1ZMquTi9wZK6Dz5EzSAEqN+fSd3Ti6L6Kwh
 1pcTIHWxBT4jaTxLbqxva2SIhMb6vWrAcyTToqsCgmtXFncKpRWSJO7D8J7xzebM5GLf
 D74pHnF39QSeFLr7JEkDkEz/5poLLuhfgEfWVL2IYryPGrplK1a9CwGzApNG9eiZKxL7
 KycjIBjSQbcZ7zOfsugjH/fANe4YkigFFHA3mG8Fsn8jTA0Y5eQG4ECJdB6Fgy322eSn
 QnIg==
X-Gm-Message-State: AOAM532NwMXcMpwV/UwKSeK+8gYMZ67mIVsNebqdWlAPwu34jJCUSGIZ
 w2WdRrwTLp6BsHak5spmI+nbtJd2xaw=
X-Google-Smtp-Source: ABdhPJxSZrfDSExqAzqGub8+7mTg5BhGocpcpJrc9AYjHTpKQAvOG0nWPzBd5Igbd3Zefh5VJopqcA==
X-Received: by 2002:adf:b348:: with SMTP id k8mr26397675wrd.435.1635199346187; 
 Mon, 25 Oct 2021 15:02:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id r4sm8072674wrp.26.2021.10.25.15.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:02:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 00:00:57 +0200
Message-Id: <20211025220057.3713850-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/espeak: don't override dependencies
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
Cc: Arnaud Aujon <arnaud@intelibre.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override ESPEAK_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/espeak/espeak.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index aa0b5b0716..347fcb607d 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -13,11 +13,11 @@ ESPEAK_LICENSE_FILES = License.txt
 
 ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA),y)
 ESPEAK_AUDIO_BACKEND = portaudio
-ESPEAK_DEPENDENCIES = portaudio
+ESPEAK_DEPENDENCIES += portaudio
 endif
 ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO),y)
 ESPEAK_AUDIO_BACKEND = pulseaudio
-ESPEAK_DEPENDENCIES = pulseaudio
+ESPEAK_DEPENDENCIES += pulseaudio
 endif
 
 define ESPEAK_EXTRACT_CMDS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
