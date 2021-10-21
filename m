Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A019CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:57:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF2CA610FF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 16:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF2CA610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B194260F1C;
	Thu, 21 Oct 2021 16:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_K5Q60G8X9Y; Thu, 21 Oct 2021 16:57:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27754606ED;
	Thu, 21 Oct 2021 16:57:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8B231BF20B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D70F540735
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 16:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZHPBbFkh3xR for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 16:57:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C724B40733
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 16:57:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 193-20020a1c01ca000000b00327775075f7so358321wmb.5
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cpTfBw+JyfHISk8ugeW4GEzRr2xJHurA3qDjHRizMnA=;
 b=qDZ4rFLAXJBZgIHGb305CqRUJkOUXPy8JkrKCIH2eATISRA6alDDz+EH66hojY6xsB
 BO+BNZh+Gfsc4fxILKlrrwVCXIablUJhh6PLWnjALo4Da5OqW0OOkco8fEcGgIZ8Y2Zt
 Aes6SIIdU4AJckGz+7Njx7LpKfLo7nRPFakeLcWRmRXU2veVKppmkMv09/FgqckTbOdY
 nWgxNkISllphfG0IroE1xErpRaNs8o9LXjrkE4y1Wh70Qwt6gPd+mZ7PvLwCdhy1x705
 d/htmPgSBTcOJLxPFpygBJWWayf1Ty46Y523i2HDppZLTOVieH3N1rL3gDrbQIemwb/B
 TIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cpTfBw+JyfHISk8ugeW4GEzRr2xJHurA3qDjHRizMnA=;
 b=H8vnXMjVSv2lqk2bbuWfGbcQX27LFdPIfxvZ6qoMMNZ7vVd1TtQP0MEi17A6TykgeK
 coZGiS8V/CflMmL0ZsEmDTrsjyVgSWsDEbAc1+kmbAiNTQC20nl5p+b+tP8qZAwxO717
 DAEg2oWTRCbeJUX21X7VqLDx5vRf1N2ZEHn6eJ9UEnu5xahlJMwUD4lTlCRidDKsmKFN
 D47x7ZuHERA36SSRoPCmxQyUgkXAMZqu2ND+ioN2ETWCJdMn5p1Snl8bAPMk9ijfGj1M
 FevNRLhtP+bd4KTlZTdKR2S0t8AouFOZf/+DCScuAhsiMufaPXrMvh1KaS8tf27rugYa
 QEkA==
X-Gm-Message-State: AOAM531c/9LbZ76YjPtFvuB1NyLCsp6wUYRNtencryecO37bWkZK9Ba/
 xuWmDSsJNsIQTnLk/IlSOpG5lhdq+Yg=
X-Google-Smtp-Source: ABdhPJwR9O8fab8GOuPshYz68juy+uRcruUzzhtNhXLkSYXAqigVYIPYHuOFq97V+K6370iFYVoWrg==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr21793042wmq.70.1634835441699; 
 Thu, 21 Oct 2021 09:57:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id m14sm6809725wms.25.2021.10.21.09.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:57:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 18:55:32 +0200
Message-Id: <20211021165532.147323-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to version
 2.4.1
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

- Fix CVE-2021-41159: Improper client input validation for gateway
  connections allows to overwrite memory
- Fix CVE-2021-41160: Improper region checks in all clients allow out of
  bound write to memory

https://github.com/FreeRDP/FreeRDP/releases/tag/2.4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index a6cc16c9ad..637e57e8b0 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.4.0.tar.gz.sha256
-sha256  10ec9b06d74182b354ae288c8e621d94c0fb189b0c3b14a59867ab4c414c08b5  freerdp-2.4.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.4.1.tar.gz.sha256
+sha256  ef75c87926643a0d0041f6556e343ac037380d4260c64885e7cdd20da0147edf  freerdp-2.4.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 1ff6feeaa7..40a3904024 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.4.0
+FREERDP_VERSION = 2.4.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
