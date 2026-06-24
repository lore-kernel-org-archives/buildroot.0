Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45163CDE003
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F08F260BA4;
	Wed, 24 Jun 2026 14:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjq-Zhb3VFMn; Wed, 24 Jun 2026 14:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C55E160BDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310024;
	bh=MXXCSaP3QmX7ndzGbW7soOmOHYzsnrUpnIMC6srYE1I=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=K6VZjTmwpoJBa1S3UewTOYXSr2Y975Gc1Z0LsVvKneKS7ZMbvhDVQTS0VWMGYuNGr
	 5VuMg1gvj7KAiJMEYAkwOqy6MCEhlNwHhuZtJnRopa77unb/k3tU503Ou+zX8zkpL5
	 FCJpiC7NOnbNH/tmqnxdxT1soGx4403U277iWKmrNSM1xRiYuXNOiwtzWZBa4V3MEH
	 RL7sA0jjGA0SWy1qK9ZwdU7cX4XTq9ukdYug101HB5JpZ5s1GS/3ZbTTBK4Sgja+Rd
	 YpRWi9yrl1CQmtslXPSQbTqz9dym+LPWdrEAbrI1ut7vRhAA3XDMF2Nw9zrzlglZxk
	 kHn4YAngzJNYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C55E160BDF;
	Wed, 24 Jun 2026 14:07:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F29AA367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D825D408EE
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQvumOhruVit for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5010408AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5010408AF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5010408AF
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4923fb1f095so11232075e9.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310013; x=1782914813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WcBggOKzgi6R67IpzfiFK7PhO4Okv0TrdjSTazJ4C0M=;
 b=J7di9pr5e2lIKyQaxta8SRaKjNgNb5+xvbflP3oos0KJ2am/I0iu3NYfaKPfzILcgd
 OxcVsHQvx/yEl19cQpGFatNY0uZcPN8QtcjjVhaIqdSHeEHDMI1Kbq5+zFGRI4WP74S1
 WLBEGT16dB1a2UxRqfkI9V+vAayUmEaG67WYYmoFWDTQmoUJJX2n1RS4ToOVn+voU9s0
 XaRWGA05VwoOfraYN5X7Kimuz/auuiLOi9LB7/3zxUyrDunEKkF3mpOD1nEpHixrI9+C
 qvmYO46wcqkTp8CfRgsvgkm9iHva6w6Yh0TKa3VIuJQaS4/Wc0+apLdtBvQFAujJjPIb
 6XXw==
X-Gm-Message-State: AOJu0YyxF2SkLtc/MgYfbJcuV+KP42j11ZuJKGFxqUnYqPoUA01KFJm3
 wGNIwNeape0yaULMzacpe0Hj99wJddt7gegESp2+BHyBMmFn8KikI+HJibmH5SuooEowxKxSBFD
 jd4FZ
X-Gm-Gg: AfdE7cnIpdSF1j65FO1wZucNm9DaC2FBBgRXUT9ZWNBPyg0mfie9LE0bVOrC1RWFrQf
 Auar+BKpdhKFlFPYpBqzIEXGishmTWf5a2uf/RpqyGyAews4fpndGCu1gOEpUkCjkGBLrfGDkQH
 llklNCEg+qqY71IOrpGKBSY1oVGYC/GPs//k9i/oPqm17Qg0ppvNbP3spX2+nAHK2ll3ouubd00
 hqU1P5cIQTi8wfIpfYi8w7exfFbdgCg9opq6f9BSDS++dDYrWCnSTX8zSfp7yDi9Z3kvg1hhSHr
 nlKMSOQgI8JudaEgxMer8Kc6e6Z2D9fRVD0puKplFfg0n+MNipzaR58IW5ip/vn9Jx43Prtjpeu
 wT9nt0MbYDh1yBsz/N5NFd5xYjhRjFHU3BiR/psB4pRDHE7ornYegnmPj+Owzgob9U3mr4ipg2b
 8SZb4usXLBx+2Mprk=
X-Received: by 2002:a05:600c:8b32:b0:492:4a70:fa9b with SMTP id
 5b1f17b1804b1-4925b37c0b1mr115438605e9.24.1782310012718; 
 Wed, 24 Jun 2026 07:06:52 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:39 +0200
Message-ID: <20260624140645.185318-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310013; x=1782914813; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcBggOKzgi6R67IpzfiFK7PhO4Okv0TrdjSTazJ4C0M=;
 b=Jo32FczNIlS2AWSggjklqAUb7uBTRpbnR+De8VxPTFg01IkJxLGE//BQ1sM4Jw3aYC
 SDnttrgsQ+X8UZ29gXcbzjko7VYy0Qdf5GuLwhTR1cSWhXXT8wBOAOpKukro4ommKmxJ
 jAyQ94hejXxCV0sZmp4yMzVVhJmlMwyzb9d8mLPcgMallhrbxx4Ba+Zzm9TVtGJOEAsp
 nUvN8MU6PonEepoujaY8cW9bTvIUDV6+2fMMbvVeG9b5qA6nyjiMaB6UGVpplIhA0b0y
 yYb2boYtmPZo0x+m2ZBe56bgCFVTKCmKFjbuFlCOHrd1Ih4CfF4GN1cJOdUbPpDSBAEz
 R88g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Jo32FczN
Subject: [Buildroot] [RFC PATCH 08/14] package/python-pip: add detail to
 vulnerability
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The vulnerability is marked as fixed as it work as expected according to
the upstream project.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pip/python-pip.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index d12bea3225..ae9a4225eb 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -12,9 +12,10 @@ PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 PYTHON_PIP_CPE_ID_VENDOR = pypa
 PYTHON_PIP_CPE_ID_PRODUCT = pip
-# Disputed CVE: things work as designed, and only affects the
-# --extra-index-url option. This CVE will never be fixed.
+
 PYTHON_PIP_IGNORE_CVES += CVE-2018-20225
+PYTHON_PIP_CVE-2018-20225_STATUS = fixed
+PYTHON_PIP_CVE-2018-20225_DETAIL = Disputed CVE: things work as designed, and only affects the --extra-index-url option. This CVE will never be fixed.
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
