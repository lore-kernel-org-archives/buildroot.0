Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDB1C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C414061128;
	Fri, 26 Jun 2026 14:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGJERwIZLPKf; Fri, 26 Jun 2026 14:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1AFB61144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485798;
	bh=PSF3qO214LK/Lo43Zpl042tWTYHzGj1iDTYiUEJYosM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hkaYo/NQAU1+d4Ysum3JmQPbhLqnnxJXS8U1iunuwRVdFbJogOhEdqbTfvTMFuW+F
	 JtE1mpZgZDJscPRH/mbd2OMKIahl+UY4qyQv1G6r2WAOvnPaWQ2VVl8GzstW6ezVSn
	 pxMDInb6pWOBIiktH4sE0BYI9vq6zvmP5SIHtE42lyXDhOcKXMO9yBhHeJR+q+4nLf
	 ++rWYTjbBDEIqTGECJAZIz2HcXUG1mzGN2fdff1D07ADBJ66b3pg5DZcZybCA91SiO
	 UDqgN4N7oZJ1TkqkHlQoc5WTgeabqzij7V806d/c83vW7H1lSEktcC8EA2LIu1NPVG
	 8s0dZO4SJKpig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1AFB61144;
	Fri, 26 Jun 2026 14:56:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31A18231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2392B4070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldqNsfQixDGp for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FEBB4071F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FEBB4071F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FEBB4071F
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso10209885e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485780; x=1783090580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HKtPYpB9ZS2k3tQXX8h3jn9uMLTg1xYVYvui7OTyUAU=;
 b=Ugo39sblupIC87LwlZVWm6TKg+6gh49NF5ud1VlhDL3Vwt/vw8tDc7Xd2WtpM8LCNq
 b03zrQkZQkqX2MImj+QS3NsBxnr9FxxdaUWv82f0tDfCRRb5pzlPU66CMjXZEYMFhNjR
 hkS2mmDmkQ6oj+QeSxdPnCz+U3GlGQvNUTkU/XZKSTOKbDaL/6+PWJr7ZQvGenY0+e2i
 fOB7tQvKF9wPclAGhcM1HNif+LrKw7u9QVc/1m4+3VdxHZeiy5XBOn9Dz/2qL1G6vqdI
 8PEXAzHo5Eo1L1pmL4GIrvgJEUo0CGdgy1EqH0tziek/mKc8808PA+OOV9VdrPdCBTSq
 u+rg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KLmaNe7o80LgKkrI+e7QxNuQRCBgDbLtZ8Mhkd4bduvCFhvyDhhOgsASR2clUAor9Kz1AO7VCb+0=@buildroot.org
X-Gm-Message-State: AOJu0YxnFD5c3vLZ3G+v5bZEddpDJi2ICT3zJ3xREVkX1WPzc5XBNeIf
 MwIcGsJGRId/XblCXsTZzotqlzlqZFz2LmHD5N0e2BeDTPJKbm/S2yaoTy1Yp/49iuSt6jn0dSF
 nvHgy
X-Gm-Gg: AfdE7cmoy8hDEZPm75d9sbZxqR0Uf1WQ2HOk/FDZizLKxweCy6OvwUZuSRf2/Z8xYHj
 gE5VLJTPhMIUd5xBanUgtXLLntct/nsU9QZBRdDdeQxOwo9nt0VypvXOrxep5Ee0yZ2kESU8V24
 lMII/7rZS/E0iVyiKVHclJo1dXfXgEYKqzPfNb9Dk4TEn0uGpVQJC7Fp9tB6ylUCkekWsvkhlvG
 M8SKaKwNbGRVaMq6FQZi1FW41qsls+13s1D1K+ebf7HXaps0TmNvrz1/YAyvTrreJmWNtT2Fbi6
 y/3nt3JW03DWp20jQ6yx/Dg3HcjjQWAOiKAejO2C93CPCKVvrTtKAftK+QZq+pcqAdSbE3iQNHk
 MwlIJkUBF25FuYQkpSohLGJ2RuaZjiZvXBXaYI9JJMzOIcwi4DAFfkSX0AARZto6qwIUGDrJK7K
 kNQRAm
X-Received: by 2002:a05:600c:3b29:b0:490:e5c1:b8b9 with SMTP id
 5b1f17b1804b1-4926fac56a2mr18826065e9.0.1782485779956; 
 Fri, 26 Jun 2026 07:56:19 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46f978dc0a9sm2732214f8f.15.2026.06.26.07.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:19 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:19 +0200
Message-ID: <20260626145619.344716-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-19-peter@korsgaard.com>
References: <20260618124835.2935850-19-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485780; x=1783090580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HKtPYpB9ZS2k3tQXX8h3jn9uMLTg1xYVYvui7OTyUAU=;
 b=DFaIpHtHr1k0NQO1KB+OfY0pjvE7I8j9iXJI7/qvH0KXB53MNiIEtlFzhGjI3FL2Rf
 vP6bAHFBuq7JDwjrNWj/VueQyOPuhotkcikfYkinne15z7FWPN9YKbskI0kCZpzB/HAn
 JgQGkM5M2eczRmvRKZjHdwTltHutyZcPQbbLl5ob5nrN65hH3/C6HX90cNJsDwmWJ1Mq
 SlthjcSWi+vDw43yvHEmjCVj88PgBu3EzfqrvOSTnUpkL+Ow2t7XqMUbwpLsEGirCZUI
 j18i4WShHhpzoobZIFpfnUzKARXb1YNGvLdYP0cLDgi6fIWPcCTL8sJP7Ea/0t44JmSB
 qpxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DFaIpHtH
Subject: Re: [Buildroot] [PATCH 19/29] support/testing: test_mtools.py: use
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
>  support/testing/tests/package/test_mtools.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_mtools.py b/support/testing/tests/package/test_mtools.py
> index 23ec08b6d6..8fc8766207 100644
> --- a/support/testing/tests/package/test_mtools.py
> +++ b/support/testing/tests/package/test_mtools.py
> @@ -29,8 +29,7 @@ class TestMtools(infra.basetest.BRTest):
>          # Any Mtools command is expected to fail on an unformatted
>          # partition.
>          cmd = f"minfo {mtools_opts} ::"
> -        _, exit_code = self.emulator.run(cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(cmd)
>  
>          # Now, let's format the partition file to FAT
>          self.assertRunOk(f"mformat {mtools_opts} ::")
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
