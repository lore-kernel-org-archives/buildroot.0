Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A8C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5897C83C52;
	Fri, 11 Jul 2025 10:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrailOMYUAWU; Fri, 11 Jul 2025 10:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C84783264
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C84783264;
	Fri, 11 Jul 2025 10:45:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73BF61E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6600840517
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQYLS19YoxRV for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72231404CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72231404CA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72231404CA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so1052405f8f.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230709; x=1752835509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgVVLYJc4aphO1WXxsihrJgqdrs5CRGOtIstsg2BZEY=;
 b=dObYs6P88mqrzkUB8Z0B9hR+6DfREyBhty/AzWu8ivbNcXI8raiLlixLOadHijFS9h
 QRPMfJ+YMM1KpWmTQVYmHLYj2eex4gTRgd8zR4AMpJwDg4cNkVP/Tud1RxqofThaeZZQ
 w2lxivfa/2yFk8pe6O2oaoKiMcZ6+AdjxXmyuelYXVy7tdjuoYlcupHIXCcZ3aH92Bdw
 PCCiZSlRLwK9SNldRorqd5OuXKXvUPvQxskrHghynJ+orC2hcncdP+/XivZJfHeeJAcU
 fk4BJ0tXADhGCpxL2ZDslpO+Twpz7KgcFn5y4i0vq/j7S8X5Ylv2A1onUQnKFr4Ucvjj
 c/qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxOD+GhA2H9g1oK04zrGCdpa3/q8FSG6kTa+a4AAcUN6UU3JuSHPh8s6ntBJoI4/on9glmMhoU1WQ=@buildroot.org
X-Gm-Message-State: AOJu0YwBsed7y62S/RVT8lD1Y5dpupasr/2Rq38ICbDlsyW/wtYcnJfA
 5gLTR+5Q7QoNNCJji8EcDS/NDHBn4AfIkOfP6RXxqqihlH1vcdPTGIxABY0/mWA9RoI=
X-Gm-Gg: ASbGnctYEBzRXeJjy0mfs087lbMo0Cnx2bnVz5cuU9u2zjHh6ip87RVYwMztSEEEZVA
 iDq9sz4cHhY6Jq6fuwyAjOhg7F8vD086qep4KsJ3Ycw2gBsS1HsHEtiqenkEZbbC2EjYotYc9fd
 F8BQz9nfTlgeKkNvSkN1TnFGAjNWAwlp5U39qQ4Ns/sqZY06Maiz6x8sb1BCE+LJnvTSGNV7GjT
 skDIpGWgp6yl2+aK0O2H3E48lFlXBdzrP4Pg2+Mbo6kF94AdgBS31D5e9BS34LyCN6nFztRScvr
 XhFx4YpLKez8oIPqH3k7evE+EKfV2cudF82nG9kA+ZiUwcfzwpPaeI5tWYZH930Gk3dkaiRf4k5
 AIsuT2NV5t2uAjfYVVKeAZ2JW
X-Google-Smtp-Source: AGHT+IFIZgvFW5qav+DIFxIfAIVFDmlPPoKj8Ex/dG0i0aDlfajmIFrVFkJ3vbKi6zDh2DJondbFZQ==
X-Received: by 2002:adf:e00a:0:b0:3a4:f7af:b41 with SMTP id
 ffacd0b85a97d-3b5f188e6c0mr1994247f8f.15.1752230709519; 
 Fri, 11 Jul 2025 03:45:09 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0dc3esm4070869f8f.47.2025.07.11.03.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:09 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:08 +0200
Message-ID: <20250711104508.824727-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250704142107.332368-1-buildroot@bubu1.eu>
References: <20250704142107.332368-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230709; x=1752835509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgVVLYJc4aphO1WXxsihrJgqdrs5CRGOtIstsg2BZEY=;
 b=YRKSrlE3sG7TTl+vcuUQBzkcpgMwkfaqA0MTI7cG2XggDCCBZ4celOiTaFwJ3C/DoC
 zrW4UlT2979kyhF5FF1nhUudD0TsrzcgG3c/vJHXm76EktGVUlX9/lidLlp8p9rso+Fz
 WZHkD7BDRpm6h95SBS2ckQsm0kHSgu4OUOQp/ggcxkWPYFLclVfIe/USpJSTy1KWg3OG
 T0dKSrAxfQe8RWxVOSf7MXrd0SGFjWkpcLR+pHIC6o4ngkLYByj5DAZA/mKljzee2X1T
 1Bf7R2QVgVVVwVzfEywR/wHLmlgAQvAK4I0d1XAp/91chJmOyozNwJjaZicGtlMByXAd
 4KCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YRKSrlE3
Subject: Re: [Buildroot] [PATCH 2025.05.x] package/systemd: bump to 256.17
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
> Changes: https://github.com/systemd/systemd/compare/v256.16...v256.17
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index e16823ca78..0c75657898 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  2600db41d9ebd717ca786d754d17699038147b8fddaf15fc935f775a06c0df92  systemd-256.16.tar.gz
> +sha256  72568721e2f373463054875fb788190e367327e1a46eef7de6bc73657aa7cbcb  systemd-256.17.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index bf0f2c1e90..126ce7716f 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 256.16
> +SYSTEMD_VERSION = 256.17
>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>  	LGPL-2.1+, \
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
