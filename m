Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE00CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 12:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F10813F3;
	Fri, 16 Oct 2026 12:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AI45L3tWXu5y; Fri, 16 Oct 2026 12:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6D4DD81293
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792152617;
	b=M/rO3sYCmRak6bZTnPF1Z0Wbuc30Yke2PYITxip4xQoqFd5TRNZyllMoYnGLnV4ABqFX
	 b4PbWobJnYEAxE7l1KmogNjYrgiwPvmwt7AMdPlqYpDseZOBVmzzBcLbruDKZ7bZ7CJZx
	 0nXzjf21CV2CMsR8clFYqFHjglrz4LZ/ndFOGWttzEAexI1dXYXk+1/txSackGdmozn15
	 LFnTpXRXtc3N0upZe3hnNMLJEvITwXjCcZyhuv+5+w1lN10cx8HGdp4c1PghFYiyuxpnL
	 6W8xc4X2i2ccmMNOPSgF1bzuSgft4ulwr55MtNMKoKNLTU11tVeIeIX2KLDMYIFbv4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792152617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:Date:To:Cc:Message-ID:
	 MIME-Version:Content-Disposition:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=S0gjUM3fE+ktupFzUpHnemKTUt1UNdZZpdvmk7lwwXA=;
	b=WzA/CCCaEsNVFqG22r54+nejowWxJE9RUuvtlspipi3VVGgKUg4tjz8r/3c6ZzgqzIGD
	 U932rSR8PteGzcxAEtPqzTzGiJ5gi2KOeVMIhBEQbbXc53Mlo9ZZgwt907ld4qNXGDvwS
	 uG0hv6msKdE0cw3YyA0l2sTpfXv2tTDkEb0RiCBHZVxmJqexqm8EY/S2BQl1PmYEUjQPs
	 2Dctw3/mzTh0Kz3jU7OvVHV7RBmVoGd4r6bVLPSCu3Romui7J6Kg3ATRcBg91zfHnFkKE
	 mKzB1l5cs5jOPgYzmJyGSQoCHEvCqTxXCcEkW2hYHM+lUj/Abe+93AjvQvr+f7PbFJw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X7ldK7Lj;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792152617;
	bh=S0gjUM3fE+ktupFzUpHnemKTUt1UNdZZpdvmk7lwwXA=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dv/ygWmDwIXo2pWTFN5R6yA+NqMU2SMuhzx4O4F5nweT9Qzkj5VProKMQQzNucFq9
	 Yspeto8y0tpftJMJtGAzOKKE6b4LkogLFBO+1zmV37+xKPuz70Y+uw9tfV6zgAq7Y9
	 vw7MY09PDDb5UdWNqNJvuzV1Tvho5nCSsY4gaHWXP+VUwTm63F9q35UQV8vszJHddy
	 J8S58kwV6zOB6aovuOWZG4o3fp8Hwyf4ZgMbki6FCSSco2ooYGVkKU5Y6lw7zM5mDo
	 v6B3/C3qyIHBDVP5MysCOY8kVwtBN/TG0xEKHYjHj1ydRSbYESz1I9mhAn7CqRx8Jh
	 yKhYKmuxApadw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D4DD81293;
	Fri, 16 Oct 2026 12:10:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8C68255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AC68812B9
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smElG0_JgVze for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 12:10:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A988E811DD
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792152615;
 b=XRca7/lXh3MMinAoB96Me5smMpPtjOdtN6GPrYHuuZaX994yyqZnEcBIbVccj2UjQqeQ
 Dry9jFKEz/7bsDjRuie7VSlmFuDDURdTTtjs1pLE4RY6fyB93wZHdhICsRPeb8q6ZbpMo
 0aTfYOLih7/9NJjT3Kjj8xDIoH+FnG5b8zE+ECRaXQprMlFaDu4GRvUEZMpu1qKld55uf
 C0g38HmhdBPhIuIoSoLTDW6mZvBBzcmMFZTyB0fbGTc5HxjI1o0wHmvb1+87hQ6ffh89+
 jCe5em+VjuiOy8uw55VUqq4nuLxbEPMThf67yw2FzKJ/qp3Gcm76bnZ6SY3TaQSlwTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792152615;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition;
 bh=Gtt+YFHL5M/tMsPby4RPuqwJo/2GUoJGMkgDLjGZtII=;
 b=Kf0WVEEWcelykRC1wNP7Fb2gkTXCuxCZnRB07XZ03QtdLCd08XftkX/6CHa+53AsssGt
 LdDuQEcgfhHmPwjSblgQIsiUw8ni3UGarhujNUu4VJLbN7ucNl/NB7zCewFCa5QyLknm7
 ZIN8/nDKJ+kakE4H+tQ5CwHXtn8DCqmNJCUUjCeldcw0/BeDVjmgdLRo4ANxVRXpsL7E+
 W71Fg+0GfifQsJEA9FdK42UcFbscKnl0BamXbj81Ny2rvGLRB01qWnZzsTyIfyJkQrbD8
 2FuLStO7srlBIEG73Gp87YQgkWOGb8+xq8l/SqxBaUTgH5LmpqFwHB1zjjCXtaGxaFQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=X7ldK7Lj; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=X7ldK7Lj
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A988E811DD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:10:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48de6a62a4cso3329504f8f.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792152612; x=1792757412; darn=buildroot.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:date:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Gtt+YFHL5M/tMsPby4RPuqwJo/2GUoJGMkgDLjGZtII=;
 b=X7ldK7Ljeh++qUVlbvBSa3E5RaEKU2wdbaeJyIerNDSSs/yLtwkXVuyf89MUZcZrsD
 xen0vRVfN5FOs4W4WVXb2cQAd3bvtQwuokAAULppWTfQ8pgqXmJXqGnrQxE7/NlUjS7j
 92GZz918fAJ4t1wboPYgPRKNy0WkHVQJXls4mqTxsYYrZVDnySjjRXLTUpA874XXUDF3
 5pJDMHGqLVcxhqL6jX5wmxOvLOOTrVL5FMcE6sHW2tiewa91ZSolohfqLbq3whzY32/b
 BOl6r+mOeGNAwARPVkR9SaNdGvQ4noqPezoTQil14aE8FfGDH4cNuH+VkHrfG+LQUF6U
 5cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792152612; x=1792757412;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gtt+YFHL5M/tMsPby4RPuqwJo/2GUoJGMkgDLjGZtII=;
 b=pTC4lSBNR7mseoGdeHk3LQPnxxchVzBkvA1NOwwJKjzdLjvIdFh9uMwlARJY78GTk6
 DD96P1hm7XynD5ApyGKbMvEEF3nBmLK6/7nhF9238a8gyGrT/YVA93TjmulSDxMNHeC6
 1/0urVk8GpfS0taqBrX9V47OYvNmX2FrAaJn4ue72tOP1PxN5mJQWceprZEZ9RPnDX6x
 g9eZCXY0u34z9fegc1onklikpqraoPZqikmtvlj2YBI8z6pmjSWLODSFvZQYff7Ljx8F
 ZK3ZgbPGC3+V5iGWgIPUCDRWIBZdDwHTujhBViz+59TjuKYu0S5ZmPxROTE0aByausL6
 RSWQ==
X-Gm-Message-State: AFq9FYLeAct9oZJFJJReAJtPtCLyiHAa/1znNiMjUPkmyux/q6xgGDcU
 +kabXNbwXn2sMPlDTt/zsN46GIfMbQpMVFLGi/sCe+8RpmYOd/L9lpKaSJ04ux9r
X-Gm-Gg: AYBFou0nYHA8VAuASRnSugb8HKF0xvTg8E3Juwf2XBxkvxKDfzfX1aP5R79YdtBWQwZ
 aKKgf+qTQdCUKnZW8SK6MAxQbBckaC4EkSk4lo+5yxOftjg09x/2iG/wvtvHqPulA43UFPsVe2f
 FwUtx/pAvvuK/v3wbJFqFnPn2+sH8GFCbTuQ70d3BeOwTK6qBG/6QjBtwMNYyAf8BUU7kfIt3Us
 Rivvj0+b7z186UlqakuEaCh79VS0V2u0qXP6s3MEE2OyJZ+L2Pi0TsqgZOEz4toVJ3cVsKofnKd
 UwjFtBPrl9f/jh8aD6J6+eCB7wiutji+rQFkhHt/c2phSg+eKy1O0L9XYDQMov1Fvo3eatC2fDv
 67N06CBxKppwinH3Wdx9Hfs+3vydTDOPMm+kfH8oSKfi/dJmAqJQ0rZrP596+iFYJS28oZLkI6y
 LB9S1vguwOCPfxgjVaKD1AHgyzhOeQZS2UlfogZV6mlnTmdrlrzj4kFsNkmoEuJKv987pSl/eFt
 bPYOYoZNnuwgjOhdeDd4FQBf1uj4EaqFWBr/wq9gxx4z0uw1DMD92kv5q+21tVV0c1RCQ4=
X-Received: by 2002:a5d:64cc:0:b0:48d:f7ef:cd1d with SMTP id
 ffacd0b85a97d-48df959a7a5mr7609970f8f.9.1792152611823; 
 Fri, 16 Oct 2026 05:10:11 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4fe9d9sm4462310f8f.40.2026.10.16.05.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 05:10:11 -0700 (PDT)
From: Maxime Leroy <leo.denieul.yoshino@gmail.com>
X-Google-Original-From: Maxime Leroy <maxime@leroys.fr>
Date: Fri, 16 Oct 2026 14:10:10 +0200
To: buildroot@buildroot.org
Cc: maxime@leroys.fr, olteanv@gmail.com, vjardin@free.fr
Message-ID: <atIUIhV77YHWSUDl@leo-ThinkPad-P16s-Gen-4-AMD>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v6 2/3] package/qoriq-restool: bump to
 lf-6.12.34-2.1.0
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

Align with other NXP Layerscape components using the same tag.
No code changes, just switching from commit hash to official release tag.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 package/qoriq-restool/qoriq-restool.hash | 2 +-
 package/qoriq-restool/qoriq-restool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-restool/qoriq-restool.hash b/package/qoriq-restool/qoriq-restool.hash
index 72a34473f2..77c6442269 100644
--- a/package/qoriq-restool/qoriq-restool.hash
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2879f14c9dd810e92d4c51c7f1a3e6705a5a585c2445e507f63e39872ac6237d  qoriq-restool-lf-6.12.20-2.0.0-3-gb44748e.tar.gz
+sha256  5a17fad0645d943efcae215b2d99f93406f605000cd4f0d5d9df627bc6f4e631  qoriq-restool-lf-6.12.34-2.1.0.tar.gz
 sha256  ddc794a75f11c3bd01015f16b9776064a894015e7a1603541283ccbc2e1c3a40  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
index 79e87ef1dd..3d16531def 100644
--- a/package/qoriq-restool/qoriq-restool.mk
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0-3-gb44748e
+QORIQ_RESTOOL_VERSION = lf-6.12.34-2.1.0
 QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
 QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0+
 QORIQ_RESTOOL_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
