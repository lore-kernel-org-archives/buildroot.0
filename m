Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27266CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F177580EE3;
	Thu, 14 Aug 2025 20:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBHAuBbbbOF7; Thu, 14 Aug 2025 20:32:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5532E80EE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5532E80EE8;
	Thu, 14 Aug 2025 20:32:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00E981BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBA9240491
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5AigW1qbhCo for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E78BB4048F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E78BB4048F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E78BB4048F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45a20c51c40so827315e9.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203536; x=1755808336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOpEjaH+2rMotPLUe/DvvDgnlN1NRsJ8Ry+7tMCemDI=;
 b=J1F4txvYt89mr6gUlyxZeBbf9Atm6b6Inc31JMib73zu94qtAYVhhabQKgI9zHxC9k
 01IWJrL/s/pbm1Yw18iJW8CHnG1zC6VGekhL2jD1GB7p30TUPZSwrcStbyq6+A8fEK4w
 vYLhd5bXUOv3IB9T3YfqSQpRPu1LzrgiU7JCQtbyoGCLsYNIAD3oAvs2fSAkQhcMVYNt
 J41XHK763M3QtxnjWkUXhCDYCmuzDb2/e8i2wkFKxogoSjoIuFKM03vrXSYGRSdU1JPr
 Fw+HbAgkmiyG2YDoTYcn9yCXZsjs9CVMiD3rOpBCrwhmHYmUz3ek+j97MKvSfh9nh57Z
 +89A==
X-Gm-Message-State: AOJu0YwL3GH3hyTHsrHTzdX0vP6BLP3xifW25iKoZoPpnMGSWqSQOxk/
 2ETE4bobrOhQ62nlibOzFLa/a2RBNEcXckcYMuxkbWOe4Iw+wzoy3xuGnWPxLZwPWuOKMgViU1m
 v9tWLZ4k=
X-Gm-Gg: ASbGnctchXTribPvkXZljSPEjd1cBYcZtWprUTzg7gK3hMbQL++RUWno0ycfx26XvpK
 ew9Rs/mgFTOmHIEb/GZwJcO5BuwZpKA5gSRaOguyPX0tpegqCO/TsXV9CZosetrZ03d7mBlJXoy
 yh8LhM36V05xZSMgAysS1vFPbWAUnIw3IlFWym0HPvQciO90eBjOSv0xPJ/odfeLJxgBkJYKaYm
 J8WmStpCUx4b9DPpQhg6dd3u56RNCbXTcCMfFSqcoZ2fPC+wshxk4fd9wFYY+DV0vY6/J3ueNZT
 MuO6bbEQuxcuvt44uMJ2P7LowKxRn4Lpvkd1+xuIzEo62M3CvslUaqmjwsZZWzBRzteuOqOYG69
 EInqk1c3SSCDPEw==
X-Google-Smtp-Source: AGHT+IFPoQl9RMVskrc3dlfCd/5tDMDtyelG/mtAgFZIJebiOoSt222jlh7yDDsEIp/wCesmvvMMsQ==
X-Received: by 2002:a05:600c:3ba7:b0:456:25e7:bed with SMTP id
 5b1f17b1804b1-45a20be5f97mr2514645e9.14.1755203535925; 
 Thu, 14 Aug 2025 13:32:15 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b90d147485sm14200160f8f.19.2025.08.14.13.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:15 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:15 +0200
Message-ID: <20250814203215.2816859-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809175417.315091-1-thomas.perale@mind.be>
References: <20250809175417.315091-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203536; x=1755808336; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOpEjaH+2rMotPLUe/DvvDgnlN1NRsJ8Ry+7tMCemDI=;
 b=OiS7tdIudmXXeYADhGGkVOZAlJZeXrtflhA7vb0zyL5P0sQwylUjIzBo3bsaX03zuO
 YkDyGyqfYGs95tAQkcii0MfgK8yHjY/uTZkxmb+rLDA9RNMS0eT47xBfMVqNqjBK3Tji
 wR0hyT0NYUoYF4n3BvWUKH1mN0i4urCbQWNFQu8IFmknNaYaNJZ4N1a4ZheMkGllTZ6N
 ghTvO34MLBV6F+3S5Od4lkGVdq/tnLQpiBCNTbDrZs+q26gH+zjrDu6ld+okOyRJ1/GV
 24UBFSIfm0bajBOWfR17w3YOXJq2D8mAjIG3paXIbGB6F4USP9Y0aeLs1C6G34aH4557
 qvCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OiS7tdIu
Subject: Re: [Buildroot] [PATCH] package/libapparmor: remove stale reference
 to patch 0001
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
> The AUTORECONF variable was introduced in commit [1] with reference to
> the patches that modified the m4 and Makefile.am files.
> 
> The commit [2] removed the last such patch but left the reference to the
> patch and the AUTORECONF variable.
> 
> Later, commit [3] updated the mirror to the gitlab URL that no longer
> bundle a pre-generated `configure` file, making the execution of
> AUTORECONF necessary anyway.
> 
> This patch removes the obsolete reference to the patch 0001 removed in
> [2] to avoid ambiguity with the new patch 0001 introduced in commit [4].
> 
> [1] 01a82c1401 package/libapparmor: enable python bindings
> [2] 27cd0b5033 package/apparmor: bump to version 3.0.4
> [3] 5649202ddc package/libapparmor: bump to version 3.1.7
> [4] 2640f5dcd0 package/libapparmor: fix build w/ musl
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libapparmor/libapparmor.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
> index fa59ff2924..b1c9a952f0 100644
> --- a/package/libapparmor/libapparmor.mk
> +++ b/package/libapparmor/libapparmor.mk
> @@ -16,7 +16,6 @@ LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
>  LIBAPPARMOR_SUBDIR = libraries/libapparmor
>  LIBAPPARMOR_INSTALL_STAGING = YES
>  
> -# Patch 0001 touches Makefile.am and m4 files
>  LIBAPPARMOR_AUTORECONF = YES
>  
>  # Most AppArmor tools will want to link to the static lib.
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
