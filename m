Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9314CD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 12:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7494040F87;
	Tue,  2 Jun 2026 12:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cix0g3efPcbQ; Tue,  2 Jun 2026 12:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC5440F84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780404041;
	bh=vdwph+4Ni05HSJY1+Vs2gYnZXDdlG50ejz+KaQS2MGs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=IhcY2UXq4iXs3ejrp7HHvg0uebk/mPS/+enpVUbeigFQ2cq3Yts+VvgXKzRBZcntO
	 OCoadQ09xqJ+xv4NKX8GcaxWOGVArdMm+lybs+XRWKwTmfnDk14CYmIbhUB1ycNuM3
	 AUsBV/Sow5jpWybBELhvnEa9V8rM9MENuKIXtZ3aNOXGxOPbIbZdpSAo29UxjnynGh
	 aak7z1nOSjkJQ5WH7Dh4WqDvxS00IVgHXiwYmDVF7bBkebc1xSOXavoCdRz7+nq4Xf
	 GD0+3s8C9qJNYVChFFrWHTbs0EfpiVg6OuZbgu9J8jpInjPXP1kGsx5uuGOYV+Dtbq
	 Xts3b+OmMXgeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC5440F84;
	Tue,  2 Jun 2026 12:40:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6836833C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A22481F80
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfLhBr1Wi6qh for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 12:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 537E881F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537E881F74
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 537E881F74
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490a7678b2dso21897305e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 05:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780404036; x=1781008836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FU16e1qAR9rljeAbJO0jA05CZ6d2bbjdGu83Nmm0atk=;
 b=GB2tmn8ob7Px+ACV+ggeNq/580HwblLgTgKnLhLpWB/Kk6/JZ6pAB8YvLH14/cvSvE
 skpzoizlSY5bR0+6EyVr1mNHp+s5ByolZeNwhmMsEkmesEDK0Q+FFINI3Pj1EOdBdaxK
 f1stRgb1mrAXj2fHzmIoAFGbPh5lQA7r6p3Wjp4gKZ9nbmpHMtE+9BTqEgyJRsATIqcE
 0VIR8z8jzOd0Kxr8jKcqfk8qMi9YQgM/5tdl/VPBD+mGRo4Tbo3UCrWqHv0azHUXwpKT
 woZ11PC1ruyNsTXAHEV9EYF0L0qiE4ZtFzEzwQJbVgYH8jALzt+XQtoVPZI+ltdqg/xW
 q8kw==
X-Gm-Message-State: AOJu0Yyd27dJXde/6JThxiFQX07fPfaFPjRuQasRpxLzTXR6HmlxPDm4
 eY7CRuoxCcfkqKsdedbhimjCTarT04/f6Cmbev0wwPKG+ovNae2qx3FXHN2N+if9E0kyjRqgaYM
 dH2Cq
X-Gm-Gg: Acq92OEcG8f3qaEu0uKpBQFKV4rsLr2OV9ToiBfvD9ryFDsNQqRlSzqV5Mfn9xF9tzf
 894+eMYlEscFpBk1z5J5p4coQ1gSbGyEfiRbUoWz5/CFh5zWjmuvuucstzMSh6MExDc6si2f16F
 SxxODoecldGNOqsQOmj/JEyBjHvYaZTyfjm0gGNVVcXmFuGMubke4mKLRt2PwXJmeuZmTRUwXXl
 y7GLxdQzhMzM0f3C8Tw7rK4ZLh+tbW6q7y1gyY2TdbyqFp34iCJh/PN34fPJeThsUY8CT+sALyE
 vFKzs1E5ahQs1YA7VBgIqIri2Uff7sT76Xku4hPyEwOxNyCQdCE4U03sI+VeFAWSZAnxRir+n0Z
 88CYGtPrs+0jKBigx/g3x5LjCAFl1mK9x48wfQgR/zg+JFoRht4rKE41x4/sRqgTzWWnefkOCP/
 7fcyjeU3wzqCZfCwmeJzWSC1N9D0ImEkyxRkWwohj5C150giQ7w+4IdXju5Q==
X-Received: by 2002:a05:600d:848c:20b0:488:904b:f31 with SMTP id
 5b1f17b1804b1-490a2939559mr199239525e9.22.1780404036148; 
 Tue, 02 Jun 2026 05:40:36 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354b5bdsm32037723f8f.21.2026.06.02.05.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 05:40:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 14:40:35 +0200
Message-ID: <20260602124035.287632-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780404036; x=1781008836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FU16e1qAR9rljeAbJO0jA05CZ6d2bbjdGu83Nmm0atk=;
 b=WzIQAhim+29LUvsYGVpMkLsNqNCHk0Vucl++SQhHHAx8bQe99MxAK1ShLGidS7Olqp
 2RftK+tS3JFZkkA+K6SFVYFC0kES6M4ghnLPi4cTSMkz2zh1HQCWsNstX+KaNKuOT9UP
 MHXcfT7GdoMOioHCzLFhjFR8QJsO9ciL04KytkOY+aIa1ii8awMkziH94dGBQP74Ky17
 jnVGysYcr2/DAlQpxj6hy1q2G40wYzodMFRBwPQGDMLkOZ37vJaDIGt3XJki2E66h8No
 Gkf5y2g2T0LD966eH+5rtxG+1jdvISwpWPWSEouJFfmB/HQ0D3EliU7Yu+ICO9loRhEK
 yUKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WzIQAhim
Subject: [Buildroot] [PATCH] package/python-ecdsa: update CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'python-ecdsa_project:python-ecdsa' hasn't received new CVE
since 2019 while 'tlsfuzzer:ecdsa' received two [1][2].

See the package CVE history at [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-33936
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-23342
[3] https://security-tracker.debian.org/tracker/source-package/python-ecdsa

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-ecdsa/python-ecdsa.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index c94cc0512d..b1ac6fe1b8 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -10,6 +10,7 @@ PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/c0/1f/924e3caae75f47
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-PYTHON_ECDSA_CPE_ID_VALID = YES
+PYTHON_ECDSA_CPE_ID_VENDOR = tlsfuzzer
+PYTHON_ECDSA_CPE_ID_PRODUCT = ecdsa
 
 $(eval $(python-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
