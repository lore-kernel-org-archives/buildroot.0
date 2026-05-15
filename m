Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2993CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C721C41AEB;
	Fri, 15 May 2026 13:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QdNh-qAbZco; Fri, 15 May 2026 13:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EB7B41AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852007;
	bh=huTgUJKkHblY08H0GoLC3o+K0rM2HzY5+CIV8TrzTHI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sv0dfitxkFw2d+aKCYhmAWXOuFUf9bWegHdxHvE3VgIElKSXS3MZCjmmnorJkW/34
	 wqORgndWbzDNWHLmVmZJDHmoAu2RQNBm5Yl9eF1g5FZuNrx4Zky7VGsvnllaLZPQKS
	 BnEJPPJrB9O/5rvUIIzFUwIyXgJEnB9wj/1d67KZ0hAzLXO6g6NGFhuGBpfckhtV9I
	 D/QeH0daQZ+JxdUsjh2GrrTsEva9pIZdR7HD5X2/hnTe/ftqeYqQCKlE85jB8JOYLW
	 S0BYDifma5qcwoR/XmAgOzlXYIc91A+W/0WHzkGTyPpK627d3ZJ/jHA5RuWfR+8o5F
	 aquf3flttgtmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB7B41AB2;
	Fri, 15 May 2026 13:33:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B2436F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6734440E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQiIEij3xuiX for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8207A40E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8207A40E23
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8207A40E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso105798255e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778851999; x=1779456799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aUnDCux7EKmLSfRqH1Ez/QMq92otAfDZaiSQw1e1rlI=;
 b=LjFP+EIQkkswh5+vYtiiBByKGA9vGdpQNDYUzObzYv2EVGt0hlP4hYWEFep5gVh1O5
 SJXenuMbysvXVzQa52AxpzBJnQbAS7F7aov5MwKqUw8QslcI1xvAGPGX6Swbep2F8ygI
 vtWY82xTKSkmt0gv4tGKE6vHry5gXvKT0H8cESiZ8OB01spySdyzQ+Jb9tSXBylbDC77
 AwHomo0h+CBhWsE0fCvfCkp2XztUpb6w2rgKPEI2K39Ul6H3cYcvJ9o4zEt0KDeQwBQz
 l6KuBK54z7iJvB5e6oKIqehiZvK+KD0DHl7dlKtQTURS5Ymdl4ffsQjXOiqNXJ2c0lox
 VvTA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+CODkgeqixSFL6lqhzkUGd5WhXA7j8yXK9SV3mzW3TMtHK6/t74ng7Fjg3JOJ/hZVudEt/l34Fu10=@buildroot.org
X-Gm-Message-State: AOJu0YzKaEkCUykhoBpT8K7+LWgO2/CPKmTqohKYSGGEqtxxp23GGD9F
 9nXJ4qJIaO1EBXk60diTgZUnQ7SlJpdhN9cTuNX9WTCyGriIqqxq0b957KViCZO7guY=
X-Gm-Gg: Acq92OGFXMrpFWjvDhtZ0ePCb87O2nNWV9b/WscTfxLjNwBl7uvI6lBj/Cm4Kub6bAL
 o5LP2g/oGLmMMJ/Ru9eCWa65co6G9QEyBIQkPGBAa9Z+l/4ef51bOVDR2JcWqjwAUunB+EzeF/q
 oeThWInDZphQiEzH4tDkWbJfsBmd+aNq1M/OATDmDTfo2tQ2dye99LLLueR2+/xW0162p5HrMBG
 M1i8+0vu1QSbfy/D3gF9QuhMQ2ATxRLiHC+t7YkSKvf5SkdKKqUyrxXofeCvzu/s1m+KbmUSrJj
 bDEtQ+zx1/T2LHIGUpLQpNPz81rkUDU6l0vCa3n2GxQqHW13HV1+XAts/qvT7EQK4Pvwm5qfSKz
 Ue+S9XNhquLQJoE43Nz76OVVfhf1Z6tFvRzxtfQeC4ZDGB9BCnvII/9kafbKGsOy3gG2EN3CO7d
 IxZ1uXyREas2KD3YUH1oGVtaHSEjtveV35CLfqiN3IBIgioz6VCU1+yvY=
X-Received: by 2002:a5d:5f49:0:b0:446:96b1:f53 with SMTP id
 ffacd0b85a97d-45e5c6000acmr5694904f8f.26.1778851999557; 
 Fri, 15 May 2026 06:33:19 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d16sm15435197f8f.6.2026.05.15.06.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:19 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:18 +0200
Message-ID: <20260515133318.314966-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420175839.3705382-1-bernd@kuhls.net>
References: <20260420175839.3705382-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778851999; x=1779456799; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUnDCux7EKmLSfRqH1Ez/QMq92otAfDZaiSQw1e1rlI=;
 b=fTBRzlYXfmTyfBRkDUJSKpX/J1r2IH/K0c660YKsSKVTATpuJXQF7RVWFUZrv67jEz
 K90UOKhzH7dQoOkxehPekea/HAq1hmHOZ9ZM6hOxC0y0Nl/2kKSwWfUh2KiP4xfbOki8
 jEraJDsbrqR8Y3kOUSnqQfaPDEt0tCEvCDzk8wvuYh1BPicSm9pq3IZNKCfpTlFJ+Mkw
 roo+gvjdOWw/0krMKcepLpSbQYERQtPrt2ZX3SfG6+qm0il7mVB2G+B/gsY3GUPRmvVz
 ZD32cOjruZOFX1n2rLIwjCDu+x+REhzxkSxY4NMFgnB69vPTI8asAQRuFh8ibqI/rQZ1
 aiAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fTBRzlYX
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: security bump version
 to 2.16
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
> https://github.com/pjsip/pjproject/releases/tag/2.16
> 
> Fixes CVE-2025-65102:
> https://github.com/pjsip/pjproject/security/advisories/GHSA-w5vr-39x7-h8g5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libpjsip/libpjsip.hash | 2 +-
>  package/libpjsip/libpjsip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index e85d1f47b4..65f52bf3b1 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  8f3bd99caf003f96ed8038b8a36031eb9d8cd9eaea1eaff7e01c2eef6bd55706  pjproject-2.15.1.tar.gz
> +sha256  3af2e481d51aaa095897820fa2ee26c30e530590c6ca56d23e4133bbdad369eb  pjproject-2.16.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 69b3c1cffc..8cea8e3abc 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPJSIP_VERSION = 2.15.1
> +LIBPJSIP_VERSION = 2.16
>  LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>  LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
>  
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
