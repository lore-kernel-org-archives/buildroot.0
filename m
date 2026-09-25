Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD0EC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF6BD60DA5;
	Fri, 25 Sep 2026 14:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3i24UFhcqKt; Fri, 25 Sep 2026 14:44:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 12C6A60D84
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347445;
	b=IXWMmiLiSCYo2kfrtyHmWkzmmkaZdkynTziqvoRFn9Kyhdif79yKBzubtoiNvzZe2Spp
	 gE0f2ryk7nDHvyzFdt8Lsdoqs+xumQJAj3k0ZupYv8wFpmrbZpCemlLBtLOqZ7Yw0ntZU
	 EgW+5Ma5oT6vfD5ZKPOMs9Zmliprz93+bfWpbpF4poPLq39hJz0PiBklI0oZ0nLFJGU3X
	 egouZJQBiavnd76owcABlxYiTFEI5y9MUOFx92Jyke1yBKeO2TlWoGoWVj/FOE9SU/4l2
	 TkMZTu7hDmw1oIgzfRnRoy77qDObi59njW29rSDHD+2IYib+SFjOiwXyVwIAIn2HfDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347445;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GmqlWa6Vc/8c0CN8KlhdJTmJo241/9yOTo7Q/0T6hAA=;
	b=m4ykd/ZTAgykRb4uyavRLubwvDfFw7uGUEblfld3dST0H6MZ0aFTD2KhKDm8HdIUY3ew
	 klRkUj2A5pEoILDIVdNF4IKLlfzzdgO+jmyTteP2VbUfErBJ4gwcJbocIEwuN+qUdSkvX
	 oyvI40UJepvW7+vjsnSFtwvqkQinUkXviySHXc14rFCJRXO97wv2D8qngHX+NzSCZv1TP
	 telrma4qmoYaqNwjgAa3QRF4kXUEn0TX/eB3Y/9eEO1G5qX702CpX/sFB9UlOD6Y20MVn
	 CVwi7+sHGyEXgpsALR0dzDMC46e4AmaCfypXKlgPmLDaiiBccISuL95Dmg7eRM03JPg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347445;
	bh=GmqlWa6Vc/8c0CN8KlhdJTmJo241/9yOTo7Q/0T6hAA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sFfm/0+fGBAFUktvRpxiGla2j9L4/wJ09QPSFJ6kMVOzCp5nYv2jKO4YYUT6rnJ8/
	 npVwiGySW+kjG7GXmOExRVm8IG8edBpy/8C46BFOzxcAHTYJM5SmBkrdjXgAktxZ7k
	 sA9oZpT/9WvpWkXD/PKMwV7NU8IUCOvrNzPvRIXcUy2tipbVx/RxcxsLcLRW6LYSmI
	 RlorfYvyPX4kjLyRx597g+uwd9IX43wgVJ+j2UQJ9UI+/S6vZhhlqWcX5ypMXEREmz
	 gl7so3sR/QBKailrzKJ38xMOA5UGURoWFzIEQwG62JVWPNMFThjd0zP5BOfxgkkSUz
	 yT0duzRJV+j2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12C6A60D84;
	Fri, 25 Sep 2026 14:44:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A5B5334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20DFA40790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHAsEmzFjphu for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E2511407FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347439;
 b=RxTYS8hBdXA/AvSR874J8l8yJH8QD4sy8TJLBR4yOEMLKnZBX40mcWgBX+Ewoi3MxKFB
 /jfHy9z6K7WdcLKCwDoaWSOGdj6H4BKcOQK0qCT0aY/CP2fwirpi2vBLZTTsnPyj1qk8c
 q2dAhYUYtNgTnovkp4t5Cx+MTxO9jPR9N4+rh9p40drRB4ApLoMBDnAfT+0onlxoHFSkE
 s+rNSj3/bRw9yVzPMPb3iOCtaS3egg91BxSeHX8Dw0fv16CWHFLz8C4aLfJChCQv9/poO
 RNfq0FbMHxH4ZmD8zGFAO3O5+ivKtV6FCWJnPrpxaWPmj/8LeNEhCT8heQgXY6sAgTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347439;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Lp2wLRWLsVnrPqC9uWYKNsTDIZCkMH1btX116VuDUyo=;
 b=Hf2CK4n1MVM1kn+ID4I+S4XYlOOZK863nz/m9D2VaT+OL6CJ80NMsqbiYGoIl4sXNq4d
 ZmCI6XKZ7QRTRMx+yHE3V/ZRhU6jSzrtzmrqLDn/ZDElsllp8CY4ijalrBLLSg/m8fARr
 pX6TsmgcAbCGe20xZt+YSXwpYxuGjWPXFHKztQh2eDf+Yx7kprc2GtoRW+0TjFZAgOGg5
 dqsXzvoqU6RLWoXAMmp4C92FGT24xrKeNbC3tMHc6irVkcXuvyjPhWVQXj57Vz1e1x0t3
 3OlGSTENx1F8Ys5GFLAo5ChlavNTYUv981pcnL4arKMoMbs8kTgbW0vCFwR9DKel7fg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EptvQoR4; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::11; helo=mail-wr2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x11.google.com (mail-wr2-x11.google.com
 [IPv6:2a00:1450:4864:30::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2511407FC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:58 +0000 (UTC)
Received: by mail-wr2-x11.google.com with SMTP id
 ffacd0b85a97d-4843c3ee4cfso486756f8f.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347436; x=1790952236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Lp2wLRWLsVnrPqC9uWYKNsTDIZCkMH1btX116VuDUyo=;
 b=XZEZFu8EleXGfEMe9aEvhTRvtOZ8H0coRO+TLx9U0apy/mx5l0Ptk2Vp/Pu71JD+Zi
 L8tH/9RUSxJYxA6SZd6UTwzuD3CF7FdVYplLQQoqKBdQojXCCuZ8ln5rCfRJ2Si3BBrY
 0ElgEdZXM3+QTpDWjAP5hbeFf6TgunAQGhyhlNWGX+8Rt+C2/BrJOKEHNu3YfC6i9TSJ
 LGbygw6BtRB6FHtF/Pa+kYVluQixUIpNeAMgKMbT3m4HXKMAtTwWkhdcPWGEzPickf/e
 y1SPK3EhOGCzGNXyjOtHawdEs+AlUfASmTJUJW56komJgNbh7iQqlDtoHnwMnCAjd+a+
 BCzA==
X-Gm-Message-State: AFuF++kTG1IZx9RYMWePCHuSfclJubRlPrxkwm1zzuTlF18mSzQ0UXD8
 Fa/NLBZ3e/wjeJnxhqQJXFjKdCjBKgK9iFHOuzX4Kf64QaJU5YGE+vRhhUccgJw9NC0sHB/4e+b
 wmkV48eyU+g==
X-Gm-Gg: AYBFou0KD50d1g2gk7qd6k1TKwcOCEwEvwdvStbKGiePrmvA1EUmWy4np3Gyum0fZdy
 /GVBkMoyUeZNFxS7h6uQVf5+bydxq9ccjT0pILvrKkcbN9hCcpLDNLkAqXdJ2Eh3Nh4iwxL1ZCU
 8SPJ3YK5Kh+tH0KlQkOoeIGXjVz49EnrpOQLqcajy4lgPOdknVqnOnseoD38lcXuCKHxnKLEonZ
 wIoTGkExGpdir5VN2vJr0K2Kp9ZP/ATqpqHe1+qJdpZojU5FoJy/7AwkFzvH1GG3rJ/nASQeEK6
 2bZZU04za/CMqDrB41lxQugtriZk7VYXCQGuo+ljz4Dr+Zo/cWT8zSWvigT7ovA0iAwrgrwiqvY
 8hqJ7AzgbR2RUq4eKYB+5L+EaSxN3iFkFWefInfsougSHe1V5+s0AWgbbE/pLHH3kPMQiExsFAe
 iSdyGzkei1WRSmL20vkiiVeBdDLWDT1pwrxxSYjZhOKMhjz71fmfzSm4N+6AUGKbiO2UlIwLFaw
 zde4vTkTYXipG1LK0JsGkPMysQ39I3wcUmTVVRjzV4=
X-Received: by 2002:a05:600c:4f88:b0:49d:1d6a:4cfb with SMTP id
 5b1f17b1804b1-49fe66be085mr100707715e9.1.1790347436588; 
 Fri, 25 Sep 2026 07:43:56 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5dfa6a7sm245149765e9.12.2026.09.25.07.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:56 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:53 +0200
Message-ID: <20260925144355.4095390-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906163101.3704115-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.26.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/738f5949efb0428b2619b49cc293d3ae34a1590b
> 
> tests.package.test_unbound:
> https://gitlab.com/bkuhls/buildroot/-/commits/06e8929035e94389065ac2652e0e61dadd0eee7b
> 
>  package/unbound/unbound.hash | 6 +++---
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index 85724ca243..a6bab2218a 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,8 +1,8 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.sha256
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
>  # After checking pgp signature from:
> -# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.asc
> +# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
>  # with key: 231018690C4D903EF419146AA144323DEAACDF45
> -sha256  0d92275c703d5f5f8baba3dab22117dd8c29b495588a5c229768ed6581566600  unbound-1.25.2.tar.gz
> +sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
>  
>  # Locally calculated
>  sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index 46fca5e2d2..a3a1baaa94 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UNBOUND_VERSION = 1.25.2
> +UNBOUND_VERSION = 1.26.0
>  UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
>  UNBOUND_INSTALL_STAGING = YES
>  UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
