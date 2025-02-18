Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21805C021A9
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 01:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E1F40888;
	Tue, 18 Feb 2025 01:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwM5TKelpugx; Tue, 18 Feb 2025 01:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 892B04112F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 892B04112F;
	Tue, 18 Feb 2025 01:53:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54673968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4137A41168
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSZI8t_tPcpx for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 01:53:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 574044010D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 574044010D
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 574044010D
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 01:53:17 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-855183fdcafso157797939f.1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 17:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739843597; x=1740448397;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3Y39YL5CYTJSDn0QgdYAEIeX+9Q3sM9PxqyCRLVEeis=;
 b=pzbDepIGQAXrFiV791JlVwv/5RJvHb5NJtdAvhmRB9Hgaetq7P6XrkrqQwogu7SvDp
 sLgwV+vI06T/EXJ31hRBfrXiXTyuuUGxNuD4IC8SzJ9aVpmCwvoZ+QlUa2/vnMexFsnl
 QnZPWK+X6y+HCgYMHwADoaEmGm4hoMD3tgCi8/OfxFwrWU0BTKunNsl1n6DZEQqhFuC6
 h50mSAxRVElPRp3xa3PyHBTUFzS74S9e77VlyENKjCv1aiJ2sMMRIgKqz+TKJNNZ/uuE
 nHuE2nXAcma2o/1NB3lr1cCmgnMLJEw+utyFzEBqHbxoBJtbOkQS4QGgnGsxYqrKfRGE
 A+Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdnpTjgQGRiZAlxuhdRFBqOOERsHE+7odJ50ts6ehQEdkc94BlJhKfwB+TSSr/qNCkHzGpdpHYvXM=@buildroot.org
X-Gm-Message-State: AOJu0Yzr0cw3QGedTcNnyzTy9Sp9tNYRrBtphbd9628AoH6i1+Zd6CNW
 lK0I/Aiqz8bVRp+LF2WkEi26G6mV6+hPFsDSLyGAWSXoYHJkazPK
X-Gm-Gg: ASbGncubkB87nFFUmCZlM5jh2ZeSRXHn7jfh7dAv+WztKF6dXjbUmD1NX95EUkiCde7
 Y9Pty9QUkVyWPcEWMXgBGYqLvsK53diT4yFxF0kwqxg2/otT/RrXGGjMIsG0lvv8QEzW91pxA81
 FAD9CRdsLkE2hlssoOAc1zCu9xLHZZRSA3brB5IyzXNoPzkKrvyBXHfglGG5Z6jdBt1fCg/Sp1L
 qCtVTWcN+R65wEj0mO2PIx5uTKp/m0u+PgAi3Jg+jupXWHqyzQe+aC6LqkSbznbjqYcl2Vo35Ri
 6/Z8hIyBoXqpEMbJD6HdPCzCsMpjUEysnwM4/1jb1HLpDP/5gIAvO6zcbpOLYwPGIg==
X-Google-Smtp-Source: AGHT+IHXGHMFnwNYBE31ePYtA0xV3/QD4ucs2mTdk9pl9Wgjsy7igM00pfXnaPnl/clqSKXMU1/3IQ==
X-Received: by 2002:a05:6e02:1205:b0:3d1:84ad:165e with SMTP id
 e9e14a558f8ab-3d18cd0864emr123747735ab.7.1739843596805; 
 Mon, 17 Feb 2025 17:53:16 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d18fb67cc2sm3212845ab.69.2025.02.17.17.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 17:53:16 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 17 Feb 2025 19:53:15 -0600
Message-Id: <D7V72XME2L9T.1W21WIF6HME4E@gmail.com>
To: "Akhilesh Nema" <nemaakhilesh@gmail.com>, <buildroot@buildroot.org>
Cc: "Brandon Maier" <brandon.maier@collins.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
 <20250111063753.769689-2-nemaakhilesh@gmail.com>
In-Reply-To: <20250111063753.769689-2-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739843597; x=1740448397; darn=buildroot.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Y39YL5CYTJSDn0QgdYAEIeX+9Q3sM9PxqyCRLVEeis=;
 b=Tdt7trAYXN12NL/Cwp0ur27bEyi6mxJkJvywuCDdZBIl8YdBs6HA/74LHZhg6Kgamn
 SdQF4yoav24x2dSkyCpS3xEmz2wgocNKhdOpqPw7D9uVPq1V/kgujHYWKiQbPpRdx68G
 6KH6MlqfbeDWgyF74LgUx+WVJ0LpE5ut8fwP0ZZVng3Fns4ewpAMFHETzXzkEUsqV3rD
 Uf4xOWRseQ5HmY7Mt8MWJExSXLYzjudgRz1KZpCox6UZOl4AkXosZKIK93LPyAo5G8CP
 1N17uUP9AY2kfS/pXGTwMdGep9jnMmIXnc4br1CKh551JsM8Ow/pEyKuBgevpCeLnxUf
 TnAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tdt7trAY
Subject: Re: [Buildroot] [PATCH 2/5] package/qoriq-fm-ucode: bump version to
 lf-6.6.52-2.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat Jan 11, 2025 at 12:37 AM CST, Akhilesh Nema wrote:
> The package is unchanged; a new tag was added to match other NXP QorIQ package versions.
>
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Reviewed-by: Brandon Maier <brandon.maier@gmail.com>

> ---
>  package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
>  package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
> index 67efd675cc..bf494b177b 100644
> --- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
> +++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  c994367c74dd2ff6cd70ea269cf1bc775c5f4e11294a8db414491ce6c2eb9dc3  qoriq-fm-ucode-lf-6.6.23-2.0.0.tar.gz
> +sha256  6b9e2a5c383fb9288db1459821fc696f3abfeddd080b04c11cf9f712f0d36470  qoriq-fm-ucode-lf-6.6.52-2.2.0.tar.gz
>  sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
> diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
> index 84360533eb..71904e5b13 100644
> --- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
> +++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -QORIQ_FM_UCODE_VERSION = lf-6.6.23-2.0.0
> +QORIQ_FM_UCODE_VERSION = lf-6.6.52-2.2.0
>  QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
>  QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
>  QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
