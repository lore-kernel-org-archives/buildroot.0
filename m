Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A86C44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA5340CC5;
	Fri, 10 Jul 2026 13:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbVb_kPmOqEm; Fri, 10 Jul 2026 13:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47F4A40D0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691535;
	bh=WI2lWdnGDyEVWZEABI8NPW+SNwRrCfFhLE9deGuWe+Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KO4aEbCtKpKsLKkFqXP/B5yODp2PvNIWc6o0OwXZLmWIvYutNIisI5LbBOKDcGnf4
	 btaLDQBSNEShNeUDhrCHR1yPSlSKaVhTSnUZsC9dT7TE0gE7OWH3za1reVFL6DCQkR
	 gO3hLI++jXPWGldCulZGvRARqKz9anuBg9k6ZngFHnJaLzsK1OHBSjpoRuphUOSt/V
	 bQPqtqvXFBiN8HCncgWmUFaT4V4RXCcCQNMZvNvGn/S5KWQ4QDxxdv0/jQT0Q95kAr
	 pXrIaiFhXahXh2ngryQr9bM+/kwVSqehz9SIv3AUJ7HYPlNOKWoLjE042eNMayI/Yt
	 qkyqKw1iT2A2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47F4A40D0A;
	Fri, 10 Jul 2026 13:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D3A4A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F48F4022E
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOmBygAlm8xI for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7D2540120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7D2540120
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7D2540120
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:11 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so902778f8f.3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691529; x=1784296329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rPVPPekWGZlGQwNQ/QwDnsQWiCQurYcmIub1iiM+0kE=;
 b=OSIF3c+3ZzvQALBtSkWy+46R24cpU+j8mjXyP5phN5+TWpyP3RrPtFbOpDHgctayR8
 R1ynu6kFUNon1t6Eq6UHS9vyFRm/8xrE1ozFRdc7xap6k/rzly6gSv5OTwXK3a9WaA4i
 SdVwcPoKCYU7zYiPwrztk0uvo6M1BSAs2BG5iVBZ+92L179z4Wbjl7dgmKp4aWWGQxR2
 hxOo8AAdz0x5X9gymjLf9brilFw1WOC1T3i3FN1IYpkp3SkuJ38ZXTYLzWif7Ytzz7s+
 Uh6XIfSBXiAcoiwXaYHdBS2kxh7FH9FmHRp4hTPBDG3ZBxNbvgTMoIy6ZvjSi0XpM/ZR
 ffVg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlALKMzC+U+x976f7mXX4bzvDTjGPV9Rd/tTPKzg28KwMQrFz7nTuzvoFPiiP4ArMX+Jlxo0Qt0e8=@buildroot.org
X-Gm-Message-State: AOJu0YwONrx/zDZ2cjZ/stnPxVlBlQWukpb4KOKj08FEIr5F2jh7T2AI
 cEUOTe0iuERiuaux09x8VBKbU+Ak1CNmTZwJvIfsBzFfnMaW9R0PzfgAnZ/qiwyWa9Q=
X-Gm-Gg: AfdE7cmI8/vnlqJHNCE5AFZQkOS4QL1PV99H+RGJQWiBuZyvoOAYQKlVvzT4vD3Ri50
 +ZS6Xi7Hz3klI6XNz2Kfe+iV7bg92i8mJfsMJbRe23/Aebzapgp1kswmg1KmHolkTZ3kK3MBGtP
 3MW2sXuJ5k5ChRVCV5tNcvwob4mJMunhZhXGvuvO7KfB/bZlvhiQR41e71HJPpE0fWr3OucxaB/
 foPIPUff/kAqDGh2nRxE5thbcqkYV5uY3q2xDw+e0ab5FESxRvudz1jMKAqVMD0DxXnydhpJ7mV
 ONtqFi71tacMwCmVuV2l0ebqFe807v31mHJzH+2AnQS2nFh7Pqg+c6hc2TadHVApx2Y91DqRffY
 zWHU0M9jsjXU138zfyaPcUFWCe36Ts4lutNF3NQ2yqhI3W2V4kQLTqngOTZ+bR66DANKe/UISSJ
 AyGvHQRw==
X-Received: by 2002:a5d:5849:0:b0:47e:8e8a:43f5 with SMTP id
 ffacd0b85a97d-47e8e8a44e9mr5030154f8f.20.1783691529484; 
 Fri, 10 Jul 2026 06:52:09 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0960b06sm60573246f8f.28.2026.07.10.06.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:09 -0700 (PDT)
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:08 +0200
Message-ID: <20260710135208.760322-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701125741.4064511-1-dowan.gullient@smile.fr>
References: <20260701125741.4064511-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691529; x=1784296329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rPVPPekWGZlGQwNQ/QwDnsQWiCQurYcmIub1iiM+0kE=;
 b=J2EoF4qvtVzWjweCHxJ9OuO2+HB411/KnmzyMNWG7uloSOWtP0MUiN7/jR3FU+IciG
 8DyHo7HhZWwt0WtYuEhFJfbWOSM3Uee/LGUJfeEEiGdHkdcxQeM6SmK54raXcn1xDlhc
 JltK4r25IboLItT2ebRVMmeJv0gl1rbf2WMJPcJHCzF9kXi4pm6KFUnWLLhjhG8+VsYW
 cvOVi8Z5g3zhyXcaIE/CIZqaCli4FCxG+avGSrkUF+T8Lywx1ahguxxEqX5oIZousEYc
 YRPGd+6oxDa9/lPYDwFoTU/uJPwt4oqsmTJLFObBGRSxShwR/dTV/n+5Htlzc+OJSOkM
 B80g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J2EoF4qv
Subject: Re: [Buildroot] [PATCH] [PATCH v2 1/1] support/testing :
 test_gnupg2 : fix runtime failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> In the precedent patch "support/testing: test_gnupg2.py: use assertRunNotOk()" [1]
> a small typo (OK instead of Ok) was introduced in the test_gnupg2.py file,
> which caused a runtime failure.
> 
> This patch simply replace "self.assertRunNotOK(cmd)" with
> "self.assertRunNotOk(cmd)" to correct this typo.
> 
> [1] cb791850ada782beca4b03e26356fd8506912d52
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  support/testing/tests/package/test_gnupg2.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
> index 6f862c31ce..c8fb029c95 100644
> --- a/support/testing/tests/package/test_gnupg2.py
> +++ b/support/testing/tests/package/test_gnupg2.py
> @@ -108,4 +108,4 @@ class TestGnupg2(infra.basetest.BRTest):
>          self.assertRunNotOk(cmd)
>  
>          cmd = "gpg --armor --verify {}".format(asc_file)
> -        self.assertRunNotOK(cmd)
> +        self.assertRunNotOk(cmd)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
