Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7B5CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFF5361046;
	Fri, 19 Sep 2025 12:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERcUH0-CalqB; Fri, 19 Sep 2025 12:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 826F2610AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826F2610AA;
	Fri, 19 Sep 2025 12:56:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59F81E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FDE082FA5
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzYSxm7gaEAs for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA3CA8302F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA3CA8302F
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA3CA8302F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso679935f8f.1
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286590; x=1758891390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vlUEhEn1jjTE/1BphSB0do414+51JRt0g8lW2azU+fU=;
 b=e6i3Jsb8FLfjCfVVau/xFeinY2o1w39uYSg++4ts1iqUMwUL6PNyrXR4EWyNPG24tN
 99u+0fXngIg4tWbnGXZjTzQ61KnFWxd08c7invLMXBSwAD8p2i5uCGiYgMadXUygltvO
 Yvhmq8JdXLMJThwzvRNEZTUosShEEA30GicT+PV84fE7FcDSv4UJURquhpDsQmjqtZzD
 zeflkBPYAsynpLXLfKWZ5R0gdIrVwrvb4ObtFmzciN6n3SiLGNHltswIl5NquM2Ic9z4
 E6cpWIIZp+FoLYSJ3RlNFhdgTgKSkSuUZmYmYRbM43Hb/iemuWzxgDmM+/9hnx/T6fpQ
 P0NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGX5XgdGLObeKftxvqooYqJ3s/ytjRZ6AfSOmbS1NO6BJxDD7sRwKzCuWRaHWZ2GC1qnCfYnPof38=@buildroot.org
X-Gm-Message-State: AOJu0Ywl5YqaaMe0S5ET9575caOZTRIgWe3SD45/UHxJz3obUJynLSIe
 OMSQjFN2c5X3eUP5xczTc23RR36YTHRJtIPMkpUTesTkoTZzu8asrbDJy+uoA+RojuY=
X-Gm-Gg: ASbGnct+nL9g/8S1fndsaoR8purNZLCSqOEnUosP7xQhoGDfGpwsUBaEALZq0akTM0R
 3mvCbxhchsd23fQvfFXyJFYBogd7oQjpEn1Vfwr1rabpZJgoUo6QAAD1uUzWX6NRkg/Z0oOC9tY
 MDCGAjDTC3Jbarc/bim66us4tGTsMDzbSfxsX9ljbAEd1Gp23hGJktzS5jEM1TNKxuBlww6u7Sf
 W0cEcDpKVsQ07COOuC8c6EO6XWaxrvmYTXFSmi45XpoYyceHNbNoRNcKS4GYd5+6OGh6AGI8IrK
 X1EhUhTM5t/jqQ7MSMSjvQqwADaXczHB7sZqLyJom7RgdAaL4lNYR2SaypDB4y219v1VrnRQQ+Z
 F9w9kkJLZE1shKj0=
X-Google-Smtp-Source: AGHT+IEw8WtDw7gDpVxmTYeBDfChE3aFtOO/LGR23PnK7fWaLlI17+w2GcFj93IA5XcMj7MQcj0R3A==
X-Received: by 2002:a05:6000:26c1:b0:3ee:11ca:88e2 with SMTP id
 ffacd0b85a97d-3ee85769996mr2520799f8f.42.1758286589839; 
 Fri, 19 Sep 2025 05:56:29 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f190721esm83283805e9.10.2025.09.19.05.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:29 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:28 +0200
Message-ID: <20250919125628.136742-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250913163458.2608400-1-romain.naour@smile.fr>
References: <20250913163458.2608400-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286590; x=1758891390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vlUEhEn1jjTE/1BphSB0do414+51JRt0g8lW2azU+fU=;
 b=N0/edwGvQW42pNV7bkR3W/YuA4jLW8D8cd4TgsVFW1adNZjOX4hMa3jajObiSyoyEX
 ky0Ooom34Euk98YA+jSqy/jZOcotqSqppp1PC1/3c3zYo5LgM9QZg2k2XJOC2YcBgwaY
 GAdpuwOTKFb1BOucdVpmN4uXisWMd9RseaFcXQj8EA18JNbvZGYOUeVC5VdbB7FnJRj9
 pM0PMoVlsi1b8p56VNUtIyR8zGpi0OuN5UEulCSBMcNRUsH9UncukWLLhtuAd+YQJhHQ
 pHzjTAxcv/QiYZ/+LtVesl4KyEU7uQ6NFuXonVxgMBWWWOOu4iu1IthfAiKXVtUV+OaD
 h3Tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N0/edwGv
Subject: Re: [Buildroot] [PATCH] package/mariadb: workaround cmake < 3.30
 check TRY_RUN issue
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
> The last mariadb version bump [1] added -DHAVE_SYSTEM_LIBFMT_EXITCODE=0
> to workaround cross-compiling issue during libfmt cmake check.
> But it actually requies at least cmake >= 3.30 to work.
> Indeed, our docker image used by Gitlab-CI uses cmake 3.25.1 and
> segfault while testing for libfmt.
> 
>   -- Performing Test HAVE_SYSTEM_LIBFMT
>   /bin/bash: line 1: 163369 Segmentation fault
> 
>   $ cmake --version
>   cmake version 3.25.1
> 
> Using the same TestPerlDBDmysql configuration locally with
> cmake 3.30.8 installed build fine.
> 
> Looking at cmake cmTryRunCommand.cxx history from 3.30.x show that
> several fixes about cross-compiling isses were applied to cmake 3.26.x
> [2] probably solving the issue. Requires BR2_HOST_CMAKE_AT_LEAST_3_30
> for now, since only cmake 3.30.8 installed locally was tested.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124486 (TestPerlDBDmysql)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124439 (TestMariaDB)
> 
> [1] 6cd8f95346 ("package/mariadb: bump version to 10.11.11")
> [2] https://gitlab.kitware.com/cmake/cmake/-/commits/v3.30.9/Source/cmTryRunCommand.cxx?ref_type=tags
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/mariadb/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
> index 503f884c62..b4c276a72f 100644
> --- a/package/mariadb/Config.in
> +++ b/package/mariadb/Config.in
> @@ -14,6 +14,8 @@ config BR2_PACKAGE_MARIADB
>  	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_PCRE2
> +	# HAVE_SYSTEM_LIBFMT cmake < 3.30 check TRY_RUN issue
> +	select BR2_HOST_CMAKE_AT_LEAST_3_30
>  	help
>  	  MariaDB is one of the most popular database servers in the
>  	  world.  It's made by the original developers of MySQL and
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
