Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E354DCD98C5
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 22:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5619160EFF;
	Sat, 13 Jun 2026 22:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zxPuFxM1BC3; Sat, 13 Jun 2026 22:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1265960F8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781388100;
	bh=I3fcni/sCPDlAg4Z6NHYGhJtTxfz4kgMzWh8Y3Pa/9A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XtsrXndV1K7L1tnuo70emdutDJMotce/hxn0sISq78E3AKnBqR5J/+FHlaRARcsoA
	 ivpEPdSX7FiAKSVaDB3GhVwcalX/kAGwucWvWIbW4LSquHyGmqPWvkti0sxc1rgTeM
	 /vJ2CWFou3DmFLOADtKGAv9jgOuvY3lNiLN1dj6ed9oI7YRBMmhD/u0XqPA1U+0zcG
	 /nlAwPdtNyPqtQcJ1JafLClPMb4un5WGetXQHAlxYzh+S1+ZCtRFan4YEYK5axjybL
	 gBvjUInf/aA5ZMPvyaHdmPwkJ/g8mla+t8H+PWIlTGmPsCmZMzPgOr/BceaqbPqdv7
	 NtgmCDTJ2dsNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1265960F8B;
	Sat, 13 Jun 2026 22:01:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0EF4F4
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 22:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2BA660F8B
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 22:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bz3rq02rBeew for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 22:01:37 +0000 (UTC)
X-Greylist: delayed 332 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 13 Jun 2026 22:01:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD57760EFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD57760EFF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.147;
 helo=fout-b4-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD57760EFF
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 22:01:36 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id 0409C1D000FE;
 Sat, 13 Jun 2026 17:56:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Sat, 13 Jun 2026 17:56:03 -0400
X-ME-Sender: <xms:8tEtao7-Dg3zSHO2lYot3Vy94W_JD0GaCilYqC2hRWc6oIfzQ5K7CA>
 <xme:8tEtauPhlXR-TDK0AP9L2Cy_C-FkqdK1GkuRJnqxwpq5SFJDNSl_jc-6BRGSKQEEz
 lAvPHWgwVU8nQsfWFW6seaHT4DzTAECNLGdKiYw1JuYuJHAAaFgKGK9>
X-ME-Received: <xmr:8tEtamnSmz9hn-sOW7EDWBMTEE_wsIHc3KYjvYmNY0sa_yyhoFqnepZye82B-g5bYRiv8Tlgp_H4TPPdSFWwLQXNOiebbL0SA80QSup5F2SLqgqqvFA7C4BR>
X-ME-Proxy-Cause: dmFkZTFOjTwTVnaoQ9Y3SBF8OmoKyvvGa+obe582U3hgaLtVl2HaNgONXhv7PGG9mYUe9s
 /Rztj/S5BOmpu9sp0nCWwE25ZSBog9liTE6ZlggUwMdjQMsLgYPwe4LO8PaHgLSeyuhoTG
 XL+ll+x6AOkkYcyc/OHU0WrXwtyhxBZy0unhrOIsiVHFU+/6P0DgafU4PzqdUrdOFolmhJ
 FSnp+0KZATVdnoDrfyP/ntLkuShFzjybRYoYvC3ItcIt4yDc/2KWxyTC7FgIIIQJ8PUocH
 PXCkL6cAl8xUWEgnTyKu4A/F3Aeo2OYCbxtw3grIqTUCdywawl1dt7pGncA4pHRO2RpECF
 k2RrNPQmyAvQu3JtYXJp+XQ2WatCcfn4daod79cOW8YzPRxLHIfZIfDSb8CtWgip+jVlVo
 gcTBStH5AzLVpb8ZIJqsfV6SB6hMqM0xqdTMLvhltijlP/8ZhlqugMDDdyuGh6W75JpZkR
 6qjgtE2Pcm5zzaE75yVJ+VcygSa4egxB1QlbefM66N9qsN6FLL2s5N7G/TXy0zWnrFV5jI
 VI3iGrVzMptdaR9+035uF+UyRNah+PnSUEEpxKwNKvmI/JkxU4ziOr8rhHVfox1If22vVQ
 U3F+XTe9xc934TTA2K9BGdJLoQpQkRKVhnfSlvQ7aGMWjiO3Db3Xz4frFlUg
X-ME-Proxy: <xmx:8tEtalTkAM18rreCnHxUdE4Lho4qsu5XmNnYah4Te_C_7menqBMzUA>
 <xmx:8tEtaiC4cqBum1talRYZC33L7c6PB80qVSZTJTwRf4zRy-e1_iKnQA>
 <xmx:8tEtakSpj8jzZcjjj7ehxRDdd9jTTO42NLkRe9NVNyEmpLvxHlmlhA>
 <xmx:8tEtaoqlT-SGwmJ07Ytmeu3tRX3HikH2OXIxHiRsLSXbuZPpNcDwwg>
 <xmx:8tEtaigp-IGsX6eYndriVVEBYdptIo8AybyWdorJkKBInXdI-pgMwGgc>
Feedback-ID: i0df9467b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jun 2026 17:56:01 -0400 (EDT)
From: Michele Comignano <mcdev@playlinux.net>
To: buildroot@buildroot.org
Cc: Comick <mcdev@playlinux.net>,
	Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 13 Jun 2026 23:55:55 +0200
Message-ID: <20260613215558.978962-1-mcdev@playlinux.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm1; t=1781387762; x=1781474162; bh=XGMh5DxHs2
 wyJrJ+7zQAzxrieFRyq7sqwm7u2Ulr3EM=; b=qb78r0dGgfWQZ0LCz7kAu1Cf4m
 ROg4bcKuowIXFLeP1Hhtt7cD4NzbQ7aG2hLPnyNudlHvgg9L/cgLUIu4aUgVSfi6
 raKahDoVPSFWf3UsnRjiD7DJqbipwxstiFjb+23XVPT6RPDScYF6xDcJXJPFfL51
 offfrMADfhyi4ibEIiGQVCjXOmM5MI92KMQnSI8UDKYA99dFsPHvY4uCb1XV8UUb
 Rp5emsKwLFg/fTZJHrn2bFtQI0HpUowtDMFnWRFGXPHzo0IjpX2jkCsRIfUg+TAn
 EpsNvudJf/qUmQYkxcCbjPdLfK0QUywgnYbwe0JVNK+jmZKC4w6s+MGzLRbQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1781387762; x=1781474162; bh=XGMh5DxHs2wyJrJ+7zQAzxrieFRyq7sqwm7
 u2Ulr3EM=; b=OLGg1JvxnUBP4yCklHqRrWPBZyeI970vTMGyyGh2risVGeeQYmD
 5mWU1nIr1M+OSvpMMxSL2+7d/gxbuPtmYJGGiXcXV2C83t/EPC67VdTYmg67MW1q
 U6kz8+Cr1sbHZH6R/JW1J6nuyXNNXIbURxbUsirGZ2wNzPVXGvRH5G5Hmb+10J36
 /8ZngpgCg4ffrKF+xHgqCkrprxKQVG8eB7vPlXPyJ3amdCRc+acYcgsaVUw9kSb2
 oZSWuCW/STRfmqA+IvnGSPm1OjtNHG12TPn3hR49kcG2cE2GosT8mj75I6VH0nQM
 kgiXHf5TZx3RUCn0KQ1nbS3LN3YNnaZU1jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm1 header.b=qb78r0dG; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OLGg1Jvx
Subject: [Buildroot] [PATCH] package/opus: don't use vcvtaq_s32_f32 on 32
 bit ARM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Comick <mcdev@playlinux.net>

Upstream issues is waiting for feedback.

See here for details:
https://gitlab.xiph.org/xiph/opus/-/work_items/2397

Signed-off-by: Michele Comignano <mcdev@playlinux.net>
---
 ...use-vcvtaq_s32_f32-on-32-bit-systems.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch

diff --git a/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
new file mode 100644
index 0000000000..ddd572921f
--- /dev/null
+++ b/package/opus/0001-celt-arm-don-t-use-vcvtaq_s32_f32-on-32-bit-systems.patch
@@ -0,0 +1,26 @@
+From 321532001d59367466a6a4a60f5c6f0fe5fa2176 Mon Sep 17 00:00:00 2001
+From: Comick <mcdev@playlinux.net>
+Date: Sat, 13 Jun 2026 21:48:00 +0200
+Subject: [PATCH] celt/arm don't use vcvtaq_s32_f32 on 32 bit systems
+Upstream: N/A https://gitlab.xiph.org/xiph/opus/-/work_items/2397
+
+---
+ celt/arm/mathops_arm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/celt/arm/mathops_arm.h b/celt/arm/mathops_arm.h
+index b1f9169..c612dae 100644
+--- a/celt/arm/mathops_arm.h
++++ b/celt/arm/mathops_arm.h
+@@ -37,7 +37,7 @@
+ 
+ static inline int32x4_t vroundf(float32x4_t x)
+ {
+-#  if defined(__aarch64__) || (defined(__ARM_ARCH) && __ARM_ARCH >= 8)
++#  if defined(__aarch64__)
+     return vcvtaq_s32_f32(x);
+ #  else
+     uint32x4_t sign = vandq_u32(vreinterpretq_u32_f32(x), vdupq_n_u32(0x80000000));
+-- 
+2.54.0
+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
