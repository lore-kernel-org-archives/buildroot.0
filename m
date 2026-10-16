Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7F2CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74288176A;
	Fri, 16 Oct 2026 15:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fxg3Q9SLjuBC; Fri, 16 Oct 2026 15:06:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F3649816FA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163171;
	b=lI7BYgq8ENKlWtKkNeSm5N9qe7zkMUEaecXwaqZEI9Of32Ivu1cXOfKvJ7ZT2cwbugDx
	 VXvwyP9bUg1nQMBw6aPsMDAJrYCYqrI4xmjAzgTw1JCFXbeGDscwNafK4MMlFR0WiTDvt
	 IL/h6WMf2UwXUbagOugZ+Q2jPXJ5RgBc5Ohjz+ynJNxmUPwQsHYoR5WffEuq0WhXzaUfk
	 sP3HLXrs3l5t/3B4lT25rM4bMoHiX8I3uhZgqJCracMGILLoZh9xp9AvBjCV9HzQFkI0s
	 ofLKklfXNra25NOMFmBegDZcxVdCxgQTxZHG2x75N4wMnfUH3SoHNqzO2FhrJp06a0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YgWYC+IEYvmS+TKm1c2zaCdBhp7U6gp7m68ViD9fQII=;
	b=Doil3MMz5YzI7BfgrqJbhxbXzsj+prdDbFh56v+XtaA2rtm1y6/7GWsKKgL8PWrHQHKw
	 jsdf8uu4gO2mJf8iCZeCBk5RrqHGiuOyiUR1WlLsB0QIcOZEr0Oz8VqbnopAPK0ZV8Cw9
	 V9L2oJczBI1krxN/0YMdZuKjzj0Rotk0TrPsguSrvEkSOo1K39unKf15iRm1DEf0TlacT
	 gh8karpVBk9aYPcA5m0NCbn4Un+Eij8e8ADMksmrb6yrVMccQSzPR38OEkKaFKQCqhGyw
	 QcCDloxWCYzGrmNtw6QsfWQMB1B5UFeX5qxko58PKr48zel8vTbxHDtIOd8qW1IjR+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163171;
	bh=YgWYC+IEYvmS+TKm1c2zaCdBhp7U6gp7m68ViD9fQII=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SX9CKivdYlCQQi02ioy80aWjb0w3nGpFJsR1oy6qZJzFL9fYFhF8r4xA1d3ASWzOK
	 8TE3h1yJkrqQCX3d6LMj2xl7ikddGh+ZDCRusKDh7m/BHRXMkyApUoAH7/Wqsm5lhf
	 ddAZHKVVMNEwx5QfbgyaQB5II0yakqbPBK3WGtMqBdFSYSGPPNJFyHCExbV1fRrToI
	 O0Co1UjEYdjzvGmvddPTmH+RJhZsyK7TIcLj+Nz60d0Y5edmArXr9/mFertGvo/+dL
	 Sped9hlYkLzwsY/mKGYYScozaYyCYAthgKimMZ8Ni4zs3/8fkFnrY/NA1BlETB83Zx
	 x7r1k3zey46qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3649816FA;
	Fri, 16 Oct 2026 15:06:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26ED8255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D1988175E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOcQXPaKoGt3 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C18381759
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163166;
 b=LtW4LSTKml6c3qx014Y7JGeopPvs+iWju2/9IXhH1WU8V/ge05YYuC1D+/DmF16VR38R
 nKB8unAZB3GKJBm/qIwz4axfzQFj/MpIKNEsUYPL8qE81SoJp1imcvax5VriT+2pB97cT
 YI8MstTAJh6H1WyWu4g8bZIpsFtyy/yZrbYLKOUQjP8oQMQFSInorzYD+6lLVkELHbCfM
 AvWKjrgMQpDgZ+ORixAVLNDgkkjiiGRrUI15kRO6rZXM4Ale+TYco7dTZBNIB4LKKNdiX
 z4ZcHpEIcrPUd9Eg1mhVWeuUIN407bid2pO1y4BqnvVqjwbm0KYkt+UwsVfNoxu6A1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163166;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=qBLfnNEpjVTiiU2KD/1gbg8gGati0invfoXzdx7OLtU=;
 b=YeOzJVemaeSuFXqjpvr8LldFZRJeBKaJMxnCTkEFyXAnhIsFAwEeVitnZhGeCDKE2tBk
 8B7hopEjDInFiV1vGChtGaxC92PO54sms+MxzdpB/5Le7f2vMttorv0Bm2Q3sQ1uD8FP2
 0QfgeLkxsrKgo3puzQJxHjdhE8Ssx57mU04XjMzMPa68bZSdA8CmzaXS34j6fTlVHxfpQ
 hT01V1+xXGU4i3OdF9xZx7WMlVTLM0I9t/oyunr9Xi9Dx4BxRZ0/swxbaCfwCaxsK47DB
 3HW6vRZm4URP15l5L8bdBteyk/Xja2z6cVhMvfyVrDFORZl191clB7OzQUzmrsR/AkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OLUPDSlZ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C18381759
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-486e8faff03so2876743f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163164; x=1792767964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qBLfnNEpjVTiiU2KD/1gbg8gGati0invfoXzdx7OLtU=;
 b=WYrPFvono+jallw47/OsoAo9BUr55QNQT3Y6iGTnZlnUBGJrrkEEQLzCBt/WV4HZ+n
 oM1/VxHi4Zetnco7PuGU4O3tdtZrfs1r0U8GS9fZdvJrJKg2PWU0omoK8Dacigv+cQVR
 +fzsVvrZhAxXTkVMLGbCMzHvLdrTrmE1iEQNDDnOSqeq1RHCi0v6S/fbATrfEfSgoxD0
 NHh+tzs+iv+/xQgwO4GI8D1lP6svwg5XrGTIldV5X03qJg2JX5DrZeS253lDFKjbNXzQ
 gVvo0QjYkQlFppra7xeHuuBLYcQSo7vzEGceYYnzKti3lOOXt+rEkIJ2liA3CEhjwFBP
 bCAg==
X-Gm-Message-State: AFq9FYLv11O2uF87DpzQEHIIfKuvIEIc47LJcFFePwcB92VzGN9uKI6g
 11ZyMGyjYVdr+SSu+vCPa8BhTfihrFZ9y27XTA6zYjERgTRP318q1wo6UkmLm0FZmPJfjHz/HvF
 ynCeFxq4=
X-Gm-Gg: AYBFou21DcwvX8mLfUwlAvkhWyahOfgEaxI+hfM1d0QpJvAHCZwWDZ09vgHbJ4nAMmz
 SQcRDx28qC4r+L5+BsB3oIW2RaAKKYAA6N8UHu/G+mlbOSZ4yKtNblgtzJTzC33UCrdcEmne5gZ
 csK2tHKKgaNgfIVlmTYQi2XR4cUjgFJgvO+5c3FCyZ5NnpFWi2dl3QBytEMKMZyJ0cShhOczhDi
 nilYwH6Zk+AEr6CtiBKYr1NooKI3LDlKfVQFyx9334dx/u7ZGIU5JDXRFqMgzXciUOiPp2XgRtR
 Fp6ec27zWwKzmMftoJeJ/k62pJrHN3PWaXECyj3rW2dQgOlizpmBhT3pAcYsJZSHfq5ZHaBWd1L
 gHiMSl2UylvnESa/5dkoWZeup5sk6GI2atN0yfXMDTfFig3hpXVSF4d1uBUnOonQad6lryI2ZUa
 tECBIWCNkFDGpUr05PhNczkraJYoX75KNQf8tU/idW314A2Wxsj0i3rUheGQKb37UEAEreq5OH7
 Px+MczZeylgfW3ESOE8UkUX2CWF3Uea2Ky/+kgHvVvXNfV9ozR4lg==
X-Received: by 2002:a05:6000:46d9:b0:48b:f08:8162 with SMTP id
 ffacd0b85a97d-48dbacf154dmr31932030f8f.39.1792163163937; 
 Fri, 16 Oct 2026 08:06:03 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd5033a2sm5757954f8f.45.2026.10.16.08.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:03 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:01 +0200
Message-ID: <20261016150602.75869-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010143708.421070-1-peter@korsgaard.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/pkg-generic.mk: drop RAWNAME
 variable
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
> This was added in commit 7a41cbf938 ("package: fix patching procedure for
> host packages") to figure out where to find patches, but this was reworked
> in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
> directories") to instead use <FOO>_RAWNAME, so drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/pkg-generic.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 09d6e5b20b..f8ffaa21c7 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
>  $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC):			PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
> -$$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
>  $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
>  $$($(2)_TARGET_EXTRACT):		PKG=$(2)
>  $$($(2)_TARGET_SOURCE):			PKG=$(2)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
