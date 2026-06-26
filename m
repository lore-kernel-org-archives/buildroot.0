Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C17DC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E5C61150;
	Fri, 26 Jun 2026 14:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUifwP-h3Y1p; Fri, 26 Jun 2026 14:56:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8408D6116F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485805;
	bh=F9emitD+n6B9yCHKc5BPlVC67fLSBvE2xTltWlxFTLk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y1k68evbjd5TCXPb5TODKd3zDIPJZdbR5NCokVjX7NlzeMqldqrMm82RIebda9Fm6
	 +JJ8VfZOQR8QSw1h2jaBGp3lh8Ac0hhRwsSjK1ELXniIPnn30PlAA9nUjwTqsySr0d
	 Kw26wBHBxJRC9zbfd8+YtqoLqJdjANxxD5QmCGI1OylK25mU1asVvzzyh8NnVfWYdr
	 UxrUh9gQtg0zZ+ewNop+dWFuv/HpHV/wjgQYGGIhkCFRxqsjg1+BuUoLVyctbku0+3
	 +jpVZ+u/IAiVJBmi7AEqRcJ5ohNF9I5w+VjhI8dNoliO5A482scux0uTwLq4w2eum1
	 s/s4mvVSKV9yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8408D6116F;
	Fri, 26 Jun 2026 14:56:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87AEC3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 792604070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajbE0WzDJo6H for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68F9D40702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F9D40702
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68F9D40702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso13869815e9.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485785; x=1783090585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qgdWJIS/Lv14UhUoFY166wdsmm4+blMahJofuePGl4o=;
 b=X5qh2k9RdVmSkBYQnVn+MfkM7KN7oJQyhULNVTQSrjaStOaCn8KPWumgb0U6DQdwWr
 ebz65MEXZZsWRa+v1Q9QWka5qJTsxdBVk7cfljyACVpFxl1N4gQRE1QzyD0CoxaCj/Vd
 A3ymM82rGyFoWKXMabweXk5PI3RdFLuo4xNtvAz2UONCSXfLhSqzyuAmjei/cHXuTCqs
 yVHx4mfB2tc/lkIiN1Gg8OcLThFZmRziu5G4Th36KPTTCEsLL35wywhs/WCWCyEUd8VG
 XtTA0Nnv6bbg7/6dXC0dA7OJ8xRS8FaicvLK7LHWHvn72boJQoh46cgFhBKY3IR/KY8K
 U40A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Z0wgcVIzPaR2+DU2AofA1xcTr/sjmnzeALa4vXgGgBn58LeK07tVA491XNaHNbd74X4uR5x8cnrw=@buildroot.org
X-Gm-Message-State: AOJu0YxEVfCreP5LUK40/hXqBMfK2iloW3n+6Lrge6ooXx4xeo3QwmJA
 70khg8XZYF1S6o4hqEaO91DebewqCiTSCEbwYFC4xSw5ol/1v1B/lF+H8hgwjdf+Seo=
X-Gm-Gg: AfdE7cl3un4IrjIJRViHva7uZL/S7cwVmRLU35sJJtEmPLIpIHW8TWpxeR3KD6n8oBq
 oQdKM4jcolqs5jfXF+aTs2gexF+0BTd4+D84LS88Vsq0H+tZ6YT7Ii36+1Gz4HYAFnVJnhfg2Rb
 O2A1VY/GoyFVjEzZIqbm8705Z+exRnXqRX8RCUGfKYKM4WpezSeINXUPge33qHr65pPX8HVJKxS
 HuKzCDeEtAvcBXYXWQzUgwM2jixc3bfvvTGzKwZeaEfR3BmMIZVqh7XuMuIWMl/M5PjTg09gWfM
 hWoEL2em8kW+8HdoE4WQnrM85oNSNvL2FalxzJJuK7HgNTMzqZJwWVj6Qn5w4Z/e26bpiDdkGUR
 ykZdAFaYw90MnrnXXWERd2bO4zgS18HyD+dbA5XRlgOMhO40QLlBj+cAnKOTzmhFlaMo04lcKAI
 +LCc1Z
X-Received: by 2002:a05:600c:3b85:b0:490:50c5:8153 with SMTP id
 5b1f17b1804b1-4926683231fmr106390205e9.2.1782485785375; 
 Fri, 26 Jun 2026 07:56:25 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4927038578bsm11506895e9.4.2026.06.26.07.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:25 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:24 +0200
Message-ID: <20260626145624.345059-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-27-peter@korsgaard.com>
References: <20260618124835.2935850-27-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485785; x=1783090585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgdWJIS/Lv14UhUoFY166wdsmm4+blMahJofuePGl4o=;
 b=OexLITaVT9TPEgV3n4RiUWUZAl8CBf7twFALdkPorB/aF7wJqloBdJi41gP1Z9DZ7r
 psYNZ+DlDlJUk6BkHN6qVinXn8BAh0251POf285sXXmuIBwSuqQEYAul5MFde3kz0miY
 FxzApUJPa+Ak1QukSf9MRYXBPaiUwNaIcb5pIsjs5CvEmV5dNbPtjaOyR7a6StCIDQnB
 6+p3Vh+F3jSagbN5GDROgTCivkLH80IjQyXR7fwHEPZ7SGH43Iofvy4DyxZr4JjXdsVE
 q2Vx1rAIf8EFP+nv63GmoQBW68F8r/prLWECHkLXseQsc6Sz+niKY9FLbALPpACtw8u5
 46cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OexLITaV
Subject: Re: [Buildroot] [PATCH 27/29] support/testing: test_usbip.py: use
 assertRunNotOk()
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
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_usbip.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
> index da94d6f92c..2fae8f7f6a 100644
> --- a/support/testing/tests/package/test_usbip.py
> +++ b/support/testing/tests/package/test_usbip.py
> @@ -56,8 +56,7 @@ class TestUsbIp(infra.basetest.BRTest):
>  
>          # The daemon is not running yet. Listing remote devices is
>          # expected to fail.
> -        _, ret = self.emulator.run("usbip list --remote=127.0.0.1")
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk("usbip list --remote=127.0.0.1")
>  
>          # We start the USBIP daemon.
>          self.assertRunOk("usbipd -D")
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
