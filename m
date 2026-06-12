Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0478ECD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1EFD41228;
	Fri, 12 Jun 2026 11:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yn4smPAiNhAN; Fri, 12 Jun 2026 11:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3C541240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264282;
	bh=9yPTqmZiJPkBy+r4+iPLIV6OjRcrqXifMVH30HckLRM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UYYoa6KsypNF/0nLZnnb1WT4SQIn4KVQBjHpNVnEpl6mUb+i2oLph0vex5GJpK3hZ
	 /AdWKSdfmCO4yyQyhusueFmIczqXm1CTYZV1znBMn7ScXloGzoZv59+jxb1sqn88t4
	 Gt8sYumFVdNub/xxg6pCmdr33aQ1kC0gx9ldkwd78Ds2xS3RCGwDU95sNwbCT70Bhy
	 nuQmh23HQxd15RcvwawtD4SVvxS5cf6cHkgHVUwK6msobzha0A7NrJvDMfsyxFgZBv
	 gnUb1iXLQBXTqBxMKXTCPxGSnGzuJ9DoIYA3efJDJO9UQGGF/F9HP3vnrqOLVlcOM0
	 Pn8pwmFrm8DzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB3C541240;
	Fri, 12 Jun 2026 11:38:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63327237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55C384066F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9y1Wvg6o1vw for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DBAA40664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DBAA40664
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DBAA40664
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so1234002f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264275; x=1781869075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FRylI+BNLFWX0g7YrTRYudrttNJJf2o82DkIzp5Oi94=;
 b=mfDasqjLAEmnMk3fD5wadBB7rhYk55u8VPYtn5VLUqvZIbJAYU64BS5xLXpriUf5EW
 qta8AdYx5tOM93ncuTAlQZQltuRKH5+rjz9vwhmSiNyEeUn80csOS1zybNPfZhmfi31/
 oS+sxcPfpAAWN8+4yqV3OC5GDSw74vGybQ5kWuyWuynsIX2lT7Lujm84a6RPSpHzyFfV
 nYTzFFB/BsXMf12P9TeXH8mBnxERfJkLNgjJXAZeHbneW3OsUkT60QmD/mC32WjWCSk3
 xiLUZlSB3mjPs0DZyktjbvTAALLYZpMMKodwo+GeP1e4F9FJ1yFKEGXDj/tCiun95s8e
 Psmw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9y+ECJx3iTFFUtDWbf//yzwTUeyv6db4TwsRqFErgka7KPN9nmy08+wvGKupx/7vyI8w/GlMzTJO8=@buildroot.org
X-Gm-Message-State: AOJu0YxZa20m34DmvQCsjcBtlVL1n125CTfv19YUosWvUX6883lXejxR
 3RTrZeWpSf87QSeaw+nBooJdxqOUMnqw7TirWb1GOfgBq9DEiPlRf4ZGpPDJevyVN0HowyB//uT
 ACtHC
X-Gm-Gg: Acq92OGCUO5zctCtpVR0kpAKn3f6ZCdG4hctujDwkQiWvtv8gfANen5fc4GSEEr6VOS
 KMx6fDY1PZIpz4sObfs1/QQ5mxaEWO96oBoe47Rp3OKmP2v9+JjjsjtWk0uV0lIQ/kCvLA3QG+w
 OCA3fNhyW7XSLLkJEBC/yXFAXKr95hIUixkUsE+sKwSPVSRPkyPpNRqwExQLoaZZR0cHNxbHWfY
 PlrUmSIJBPJ1K72ozCScTIEb4Ter7UqNw4L45Z8KENRfw6Va8zx9Z3v1X5PTVqVjMkGbjiwANmB
 l9F4FZiUyi26t4YLwX5K1alFEFGsIhEGqnOzRFNdJm95I0nGUm61szrrkt6ZdkcWSM262s3735X
 ZE3z0Jf8XAsr+u8fMY6GUVjkQT3hsVdsxEOKRn+2jJuYUbtsSAKJDugPWxLJSqsesyWL98jcOoi
 P/j7mnWNqoUqJ75cg=
X-Received: by 2002:a5d:5d10:0:b0:45e:9304:a4c3 with SMTP id
 ffacd0b85a97d-4606f25dc7bmr2891607f8f.19.1781264275182; 
 Fri, 12 Jun 2026 04:37:55 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c4240sm5237195f8f.27.2026.06.12.04.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:54 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:54 +0200
Message-ID: <20260612113754.252284-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531132533.643062-1-romain.naour@smile.fr>
References: <20260531132533.643062-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264275; x=1781869075; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FRylI+BNLFWX0g7YrTRYudrttNJJf2o82DkIzp5Oi94=;
 b=RXBiFX37du/CDvd5Q8TlIznHetsZPAKOKFDtTMf7x/JeBacskLoTtYKSvFCfVUkoNQ
 A6U+/zv6EmHcNcsCuPi6QigLG3hv5FTnX4M9VR/wLWme66ZnIMcNL7AGm8nboZGUuxgN
 zR6koitP8OHdUz/89E/w3IZApW8hfqhoXPVdHvGSivfMwWZi5zWbMDp4aV4zDwEnVIM9
 Ei71cZuq2HMqKe1OThdSzBzZydcHNvO++R2Wx9aII+Ikf8e9C/oFSHQoSuoJg2mnGvp2
 Dgk1egELqx4QtQGxZm9QCg6+zvOaV9TDyLJjCq39M6v+UiTt3NKaBZdpcWi8sxbboqD/
 +yUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RXBiFX37
Subject: Re: [Buildroot] [PATCH] support/testing: TestPppd: force the
 baudrate for pppd
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
> Since the ARM AArch64 toolchain toolchain bump [1], the TestPppd fail
> at runtime since ttyppp0 and ttyppp1 interfaces were not created
> properly:
> 
>     pppd[87]: pppd 2.5.2 started by root, uid 0
>     pppd[87]: Baud rate for /dev/ttyppp1 is 0; need explicit baud rate
> 
> The new toolchain uses glibc 2.42 that include a rework in termios
> "implement arbitrary and split speeds in termios" to support BOTHER
> [2]. This rework seems to conflict with pppd workaround [3] introduced
> when BOTHER was not supported in Glibc.
> 
> Fix this by setting the baudrate on pppd command line (we already set
> this baudrate on socat command line).
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335920 (TestPppd)
> 
> [1] 8d413d61792724877bfd886fe3ba519fb5259566
> [2] https://sourceware.org/git/?p=glibc.git;a=commit;h=5cf101a85aae0d703cdd8ed7b25fe288e41fdacb
> [3] https://github.com/ppp-project/ppp/commit/d65f6713c8514b016629b87d44d5154d70776f7b
> 
> Fix-suggested-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/testing/tests/package/test_pppd.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_pppd.py b/support/testing/tests/package/test_pppd.py
> index 015f10f02d..0ba1ff7ee2 100644
> --- a/support/testing/tests/package/test_pppd.py
> +++ b/support/testing/tests/package/test_pppd.py
> @@ -81,7 +81,7 @@ class TestPppd(infra.basetest.BRTest):
>  
>          # We start our (fake) remote pppd instance, in our netns.
>          cmd = f"ip netns exec {namespace} "
> -        cmd += f"pppd noauth ifname ppp1 {pty1} {remote_ip}:{local_ip}"
> +        cmd += f"pppd noauth ifname ppp1 {pty1} 115200 {remote_ip}:{local_ip}"
>          self.assertRunOk(cmd)
>  
>          # We wait a bit for the pppd to settle...
> @@ -89,7 +89,7 @@ class TestPppd(infra.basetest.BRTest):
>  
>          # We start out local pppd instance, this time in the default
>          # network namespace.
> -        cmd = f"pppd noauth ifname ppp0 {pty0} {local_ip}:{remote_ip}"
> +        cmd = f"pppd noauth ifname ppp0 {pty0} 115200 {local_ip}:{remote_ip}"
>          self.assertRunOk(cmd)
>  
>          # We wait again...
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
