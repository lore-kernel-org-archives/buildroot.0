Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAB2C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE7F810B9;
	Fri, 25 Sep 2026 14:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id immRbNFWXB8v; Fri, 25 Sep 2026 14:47:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C1BD0810AC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347639;
	b=rrn10lMvppsO81FfidQKFaqlH+92JUwLiPIKjhbiC8YpAirJVFDPbekP6em4x6kFqXqr
	 cg8d/SL25rMiIuB8UlEyVUzg9tP6IGvb5glJNFR/DPF/uPtEa02etP+V+AfNe+ssiCaY8
	 XkhLNaBts+1vgPlRfSJlP4ing+DBnnXLbgi68nCo3sPmCB4Ov10Y88LaV2py00z/SV0Ki
	 sjDTlYuO87yzo9G6r/QDl9HBQd4YUeOSWtlBiXuj2H4iysUO9EtkFJVHX8siVAa4UCN1t
	 UYkaHJ644iaVlSPuGB5MFXr8zna9XxHakfX7aLE9fhXQ30hyOwPkk/7oVCPcI3LKF2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347639;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mZGYSrC00zveKF+omWGF1eO3iESbUd2Ra/AgmAt0VYE=;
	b=o8qesSrYILIurpN/lt7f/4dabliGERDhxoVouooSNyLGsgJT1FRHpVNKRJYNvvm9RD1s
	 eQQZfDAIHSv3jJsxTaS2OXKdKNVqTfQpt2xFbt0GeDIjrdSed+cyDkbja/Ok2ZLUhVPGS
	 iwPT/kwNrgU5ppqjjmBbbG3YyDQHet/WCba2/SrJ1h14NrfMCjyKm/FkymG9MJs/yTbW5
	 2c2FozXzHA6Hy7UOpYFMWQAa7M02/NlA4KDpApnB3rjCwNiGcjlqoBpX89xmwbg9yoX/m
	 S14K+MHfELW+wokwecItZ3U+87S8p1co9x/D2vjHf3A4stAfOuUXdkvS2ck3OGo5isA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347639;
	bh=mZGYSrC00zveKF+omWGF1eO3iESbUd2Ra/AgmAt0VYE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lmq5ixlLoYyyHOMX76MDexLntS1cupuvBu7KhKpTv1ny8kplslOGVEX0hGlBf2JNq
	 aTjZhNMFKcBVCYNSeuEosAJc0LytgpFbBxjo0eXxklXib7uYq2GcqceyT8tWG5rf/X
	 OCZn5RkXGsnX4Yvo8aI4MXrfD1CvEN1UbOTudSNY/19wpZFn8KnyHXK4AyJri1e0R8
	 engqXWSKGRSqaYZxNUhCc5g1FFMWil6RIVQGf7uNqt0evIO4i+7EikY30YsQan9jUr
	 xBochAm5mbr3AqEPZwUDEBoBdNODehJ66LHMAr3gbnyT6ftm5TesMtzA33otDzAVmc
	 68JWQsI8dybYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1BD0810AC;
	Fri, 25 Sep 2026 14:47:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EC6334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BAC5407FC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVYzFyLVfEoz for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 20E3B40790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347637;
 b=MNNajudhUqjHhVcbaL/PytsIl9phEf4Z2V2hQa6trpWzh0fu4wQ2ao3BX8KEOetouu9q
 qYLhS0bFEY4tLLI3cfj3J4j7hqFI+Sgi+QB8JJ48+zx7vPrubhqgrEq20jabu30hFOblB
 hAPlYupM8v8WxeVXMtMZLmbZRBamM1seGdelfQOIUlWKtQwDF/QshtqDqgaZ4DfaONiBR
 RBV7+Ws2OG4NTXK5XiD2hSQKrNQAWrZeTff2+5bmYI7hjWMevnJ91CysT+N0v/C50Uhoh
 VinynSsBPu5XUrP/WJeC81uXUjs/zqZq4Bu0nk2P2WSGbC8uZ7VzEtOdWhOxsfMtF0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347637;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=vQVEPBad0XFomFf/NAok50i5WiPIbnlQOGGPCb8B58E=;
 b=OxKgSPXe33HBrHiNYBDpf4eVxo8Vnx/Aq0RbuGemuScqQ1f93KitLnyuIqVRbV1MRPL4
 cwCyMJ/cFtxl3G/eYTlCpHz9qi1HR6chuwcoGJQIlByApQUtyrT0YihQB/KQEARVgzaTo
 Q2eMNIXEWIWEU2DHfvxShPevHrqbdGYpCcluFOoJjqZ4LQKU6tBtudT85U+Oi0GOlw82f
 rKe66dMHOZ4obGdOXxmNh2QsUGvHaXO2LWhdvd1B07erMGGYMMR+tDTPFVv/ieJS0w/5n
 cJlwI3M5f9PfjGE42+xVKj3uajZJGn+Thvmda/0Y+1WBJSKfcRGEKiwZM7g3rtXGZFg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QaFduF6c; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20E3B40790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:16 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so5929935e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347635; x=1790952435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vQVEPBad0XFomFf/NAok50i5WiPIbnlQOGGPCb8B58E=;
 b=oZD4mR512+BkHFR65VICtzUA25hag6XTfXskr6KC+MyVvSOqRLQ39s2ZxiKJium0EJ
 rDAXJ9td+BXmvU0d/3GYDYTpczYYboBENHTtqW0WDOtExrgDpEUOR4uKbbJoheaXw0nX
 cwVf7PpCD1PwX3Eib8Bo32QbcHmCoJtOKVYmQUoXtNmAEubU1EB4wph2QcO+PwLedMe4
 F4KatHVaHQ3RBzBvMElw+UOaQAa5LTXmdA2M8d9qciNHf0kvt1jL9sw68jNLBfOXCLPf
 dTXOWB3G7CYiMmiC6596hIX2l+QBsZOwItpxF/BUn0dROac/x2dqxHSyhnbJ7uW86rbK
 xrsw==
X-Gm-Message-State: AFuF++nyU/kH+LbZdk6xyik7QO+ModTw/mmfsOVds8FKuYBje6qYK6Hm
 jyxABV6327CvI7JfjGdC6JejcGRB0yUu4QP0LOR6MrfJW32oGKLfUyeOmswu5Qq5ZJZqNiFo9le
 OvFD2HsESkA==
X-Gm-Gg: AYBFou1r7gn3QqECCoy0T9QNdnrt99ukxC/w5N9xvL9MNIHEWtG4/SMWIJTkoaBtmOm
 ZCok+Oni7E6z03LqcdB2MBMsvUQA2qGVVLSfKOvXTgZYdVV56owMtpWJzaXE2RrrF2GQjJP6JSw
 nbsgB30GBgeRa3/qgoYUksX/zQXsaCOVS649Qe7a5157yKFWIoS0374g9VLwyjtcN70Kwhz92ZU
 k2a1ICpbAGcSY1OZGdvd7dY+9+uPWs2weurQp2uDjgWFQybHqCsK8pIvZ5pP0ymQgoxuTcGF6cY
 0k0KeWsnF7MiUb276WUznwGzDwLCqsqWZizEpAPZlS0IS8sjmEkBgrhhUW75oSOrWvit5ljOeUv
 M4OHuE7SeZKKya7vdYRScCV9nKcP3ELPI9lNxefq3E11ruTwaQAvqW05Pa9u3FoznCfwX+hClm9
 sXRvDkqabTnsIW4x5TXg28nJpEm3Wp28zs9FTKYKDGKaiUv7XjIGe7MAJJPJJFwwksEk/AX4whu
 lNJ6kDK/6XbQT8PNTW6wq/xy2bZjqXGst+0ieM8X3euwnl7b93W
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id
 5b1f17b1804b1-49fe66c8a5amr112457445e9.7.1790347634763; 
 Fri, 25 Sep 2026 07:47:14 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe667ae2fsm152814725e9.13.2026.09.25.07.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:14 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:10 +0200
Message-ID: <20260925144713.4100808-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918143217.2032351-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.100.1
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
> https://lists.exim.org/lurker/message/20260918.121220.0f87338e.en.html
> 
> Contains the following security fixes:
> 
> * GCVE-25-2026-09-50-1
> * GCVE-25-2026-09-51-1
> * GCVE-25-2026-09-55-1
> * GCVE-25-2026-09-56-1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/d768aae73b6ef5604c81d3a0b905e61134f12d2d
> 
>  package/exim/exim.hash | 4 ++--
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index c075b2fe96..49036ecb1e 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  5bd0a3e353dbfcd5c8174388b824316a61ee2455d9052ea2f0877dee939d33b3  exim-4.100.tar.xz
> +sha256  e9fb41f6724a5b136d64c9d19dbc5f26494af879a3e7e3190f91639eaa79fa0d  exim-4.100.1.tar.xz
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  e7f2cc1ba9af4b1113d9a40b384bf2e5439f539381126018fb9a15d3afaf687fd209d06d1cfa96e61426df0d9f4e7988e49e1192510abc02b2aa19b14b051abc  exim-4.100.tar.xz
> +sha512  42b7d59bca187e0e8b3cd85d97ff40fe8de9d807fb12ce38749c30056c92689ce98b09874aec06f1d83fde806fe6193312a98681b56c8baff1acfcf91244bbab  exim-4.100.1.tar.xz
>  # Locally calculated
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index a8395a2309..c52428a800 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIM_VERSION = 4.100
> +EXIM_VERSION = 4.100.1
>  EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>  EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
