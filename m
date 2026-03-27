Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C4E10ED652
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5F7613FF;
	Fri, 27 Mar 2026 10:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zabHK3im-o19; Fri, 27 Mar 2026 10:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FDD4613E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605765;
	bh=TRjv6XP5ovnyXKsNO5lx7mNjoJ6IVab93G/WdwvJmA0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N10ymBA5QQJQMOWaT4832d8pRyhG2UQSrILTLQ0Kz1nMWeqQxyAVTPCM8E1Jx7sLp
	 QN7I+pcSqdBzDNYMIpwC2CU9wx717xziKbkX5OeXSynujUCVqXsnpw9M4sbaiZXQBr
	 I/1HhOdlnNFsdEVx+R6pVO3FpJ0xzIpL7xoDki3du8a5vZDg56tAVBoZVGeIGjVQ21
	 wAU50pmItds+noa63qUFd192hr0p4x7REj/ETy0E+S9rL+8MIKuTy8YqiZunfWTfuy
	 PiF3VRvQpMbiiLhlrFH13+bz6IpxmEP0rfkKbhWTy5j5JikThEsiqD2Pos9YfT8dnJ
	 V0xe+0K/rkKoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FDD4613E9;
	Fri, 27 Mar 2026 10:02:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D20B1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A33F613D6
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG5yVS_LCSYh for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DC6AE613ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC6AE613ED
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC6AE613ED
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so15543555e9.0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605760; x=1775210560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NCQsfO5L+iAqA3kJppUi7WVrzkM1ry3jC4ZPEI6GcEU=;
 b=Upgg02+JrBl/qauk5eZy6LSsndrjsIFfz+FYtPBA/ekNrkineIs1fFcFon+CQKXCjr
 AmjM7mRn9tPzfZkGfLltRJ6DVzaN2soCJWc34cZvR8vzH6hImoBvrHKgPcGtwNbvNfV6
 7mH459q9vHbWlbjrFrR5KWpWgIRKc93q/5PNkd4+MXVYc9QUR2t7bWcgb6P2HoD5bE5A
 3gIlFqzZ1hIJDRPalk49vgP10cFZ8kPqlGvmE871obiEdVvXV+76YZ2+hafNqvNeZaoI
 e1Ci0cSVsXrLhNp1d/eZuD+kuBuadZMpXgOBIrTseZSAaY2szcSvkmq3s772FItvU8o2
 9ZVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWES707Alrs90aV/FbVZaI26k9PFZvJPqdVO0vaRBN1SztSvAYCAxiwNr6/C5rVKGu6Kh4zkt+qT74=@buildroot.org
X-Gm-Message-State: AOJu0YxXtX2+PTeCiFtXZWs4SOGYBFvXcnxRLOaTJXItTjUbibJgO301
 +Vjy9NgwP/eOJ4KYII6xcloWFlzWY4fm2faBojtjh98j0vJQJ2TGQBSvnXaQ890fPTY=
X-Gm-Gg: ATEYQzz9RcYnWr1jU1HKaKoyag10i8sdsSk41B2GCo/odlvfCv5yoqoL6djMkTPyHGf
 vG4CjbRyH0E1zeYm0yWmXjlpqF2F6tk+fGyjfY+YUcyrugNchfLRJ5vtq+DIWbYiGm4w2WXTrqg
 +XAnlfKLYMfqesBKgT+g38cK7Wq7MWHPqr4gtBeu6lrftRpt6FGdHxJYYOqRUsZDxjh1IBsmb+K
 r+Srbb93h2wFW1t6GAwnqf1XJk36xaMI2fmFQ9ZAwi09kzu75pUbKzhWtGSypNVbk3IRFoLDkHu
 goIKoPgEOmtGZV5S4xABCu/o2nU/NpVJ7iWwtUhPT5jrF7cgtpD2fmR7SbS67dJx9wTnmiH2ULv
 F4bpSsGo5B8wzYouEMrNG6L4ojVGNNw5FdCylQm0282lcp2KqGN8sSeTPV4BZYTlWqFl7rr/c4r
 vCKwIACmttFD7xM+G5
X-Received: by 2002:a05:600c:1d1f:b0:486:d76c:fa57 with SMTP id
 5b1f17b1804b1-48727eb81bbmr32925405e9.17.1774605759809; 
 Fri, 27 Mar 2026 03:02:39 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d2366dsm79245105e9.10.2026.03.27.03.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:39 -0700 (PDT)
To: Andreas Ziegler <br025@umbiko.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:38 +0100
Message-ID: <20260327100238.46259-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314061837.9425-4-br025@umbiko.net>
References: <20260314061837.9425-4-br025@umbiko.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605760; x=1775210560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NCQsfO5L+iAqA3kJppUi7WVrzkM1ry3jC4ZPEI6GcEU=;
 b=hd7qlGuMJ5HX7t396UZRFKcM+4QWIaA+dii6/AEjMFiUNJrdt6nY+SpphAm7Ez137H
 fmY3Y33LdLQXc4Hb8IBn8ZdsiDnFZTgOTcgkV9OURe6I0tVkL0dgDBq8sVBY8x/FmJAI
 gXxnscYujJ1iLoN5VMxrTN1EC1KUK1rU7NCMo4MVvLG4Ma6IQnhoFQkYv+SA9yxWnXM2
 XEoUS9ZQz7xlckM3bUdGnWWJ+/1xnFGi8WQNJa2G3sr/xb7Juv1QNKHuaIBUDMrtt43q
 0CQPrGcPGEXdefymWe7YybHNkvFuddOKlnqnGE38OSrzQnYT1XkkWsl1huUJ5g6o8ZZE
 F6Dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hd7qlGuM
Subject: Re: [Buildroot] [PATCH 3/3] package/mpd: add missing optional
 dependency
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
> Config.in selects libiconv in certain situations (uClibc with locales
> not enabled). This may lead to a build error with utils/test-pkg -p mpd.
> 
> Add missing optional dependency and restore sorting order.
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Applied to 2026.02.x & 2025.02.x. Thanks

> ---
>  package/mpd/mpd.mk | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index c8107be128..ce7c44a9a8 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -26,14 +26,6 @@ MPD_CONF_OPTS = \
>  	-Dpipewire=disabled \
>  	-Dsnapcast=false
>  
> -# Zeroconf support depends on libdns_sd from avahi.
> -ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
> -MPD_DEPENDENCIES += avahi
> -MPD_CONF_OPTS += -Dzeroconf=avahi
> -else
> -MPD_CONF_OPTS += -Dzeroconf=disabled
> -endif
> -
>  ifeq ($(BR2_PACKAGE_EXPAT),y)
>  MPD_DEPENDENCIES += expat
>  MPD_CONF_OPTS += -Dexpat=enabled
> @@ -49,6 +41,14 @@ else
>  MPD_CONF_OPTS += -Dicu=disabled
>  endif
>  
> +# uClibc w/o locales
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +MPD_DEPENDENCIES += libiconv
> +MPD_CONF_OPTS += -Diconv=enabled
> +else
> +MPD_CONF_OPTS += -Diconv=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_JSON_FOR_MODERN_CPP),y)
>  MPD_DEPENDENCIES += json-for-modern-cpp
>  MPD_CONF_OPTS += -Dnlohmann_json=enabled
> @@ -63,6 +63,14 @@ else
>  MPD_CONF_OPTS += -Dalsa=disabled
>  endif
>  
> +# Zeroconf support depends on libdns_sd from avahi.
> +ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
> +MPD_DEPENDENCIES += avahi
> +MPD_CONF_OPTS += -Dzeroconf=avahi
> +else
> +MPD_CONF_OPTS += -Dzeroconf=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_MPD_AO),y)
>  MPD_DEPENDENCIES += libao
>  MPD_CONF_OPTS += -Dao=enabled
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
