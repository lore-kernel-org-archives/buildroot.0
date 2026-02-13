Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE352EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFAD419F6;
	Fri, 13 Feb 2026 19:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA9_xqTEiVgP; Fri, 13 Feb 2026 19:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4791740D18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011686;
	bh=NxsUq9+QV3GMXDqgu42CxdB2x5N6p8gl6jzU/Qjy4J8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qpsySpNMpXl4rbJHMbgtlhowOtwrnEEuBzcS7PS4Ex2k4T6kq4F0ceEWyobLZBX9j
	 Qqx3WMq+73SyFLrSxVLNJcwaLJKVgbhMzynwKB4Vi9v9pzK4KkvrZtVxTPPw3s2NgP
	 covZY8PzOIcjCuE9FgkP+UwL7nytmC56EJKv5PHuSI862PhkvdxOLS9d3Z3JOmaSBk
	 3qv8T6dQUCPt5sQhIwg1qbnidpW7kn1ueK+RkQPIsQb9eD3I84RiVFtAJR2/+I9Ix6
	 4ak5PxH/0O7FVTcdBtjgjtwuE8O+nfHUQUQJElkw6ArjJFhSZYHI3ABivBj4hlTE6x
	 Mvr3NTK+d9Crw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4791740D18;
	Fri, 13 Feb 2026 19:41:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E81C569
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6906613EA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7lyZGXjDqjf for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 702C2613EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 702C2613EB
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 702C2613EB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso7942905e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011677; x=1771616477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cBHDOPaSMQT6aLzmKQ2G5X0l5RKXoODWYYEAswfNd6M=;
 b=lqKn2PXrf70Fmi2IfWj6boeC2HcN6JnNxQShJQ4ONGCqYvG0jPkdktFoAhyfjbVpdw
 3wESSWbyyYE5pNdCZi84zqR4PNO0nHkcNlwlRrUgMEwgDXT8MknaudOlZLNH3FVn2EGS
 fAutchqhfeEsSKMDNpRl3leXh7ZYJNHa8LUhHFb5Np+9VT2pTgkwyHM+uHBF5eE9GwL3
 CJBwa0sWX5pCIgsXGSpKpiDl5plYsKsQoAegAGy2LcdgEGH2VO30Nvc5gxtm43T7kO/4
 USoSUL2BSL2PhQAZ98hN8fFHV4xXw8OWpsuhxs68Ipo/NdWAqUWddCRPzXlFAfHONj2k
 CelQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLQkNjY3eUNv0wiH9CEHQ6Qj9SjrCr2iGoX7YcnaRI4nNobbSmHUgTF0qlzvJ7Oo5CfCuOM8TukrY=@buildroot.org
X-Gm-Message-State: AOJu0YwdDCQ8A9TyfmGXOxNO97Yd4H7RmTVZBq4VyBYhvIBlLo5UYVyJ
 orQRlB6pJDBo3iCcDB6Z/3Dy5X4si2oRo1selxPRC9jYeH84k7iUEqCWiEDUftoJF2A=
X-Gm-Gg: AZuq6aIjmbvNUMVr+RwuGIbyDSrguyemy/GDf8HW/wexjeBdWQrrMls+YpR6PJytTAm
 k3f0aaOw0ElypjDb5oLOU8njnWo0UKpIG8cdVXL6m/bl7/anNSWv8qY8rbO8VjFNTIhX4zxHlbg
 7VGCsfCQazDou1hRCp7MZ7aFgOMilAdjZ1A2iHAN+4Fxp3r3e/oigjo3JUW1RtHqMhQ+VTWsiPz
 ELdWt6/0K1hv0zp2jvZgs4XM7crt3tKzVieX9Uv/ENASO85EpZZYuN2lAGvtjIPgx0f/xfykxsV
 Ir47S7Dszb5mb2GC5mAgnQZ2FQ+7MXw7ibpRtTgLLW7Hax8TZOn5UdFbBkeH0Si5BK8MH37lRe0
 h2EBop29tEZtNkSijXmbXzq1v5hRlC95b9g84JW+7EmD27z0M61+bFUVONwgNXqsyq+89tg5gQr
 eggNAAYlKVZFtreRA=
X-Received: by 2002:a05:600c:5595:b0:47e:e0b3:2437 with SMTP id
 5b1f17b1804b1-48378d62897mr15114915e9.5.1771011677262; 
 Fri, 13 Feb 2026 11:41:17 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4837a5d562esm4287505e9.15.2026.02.13.11.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:16 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:16 +0100
Message-ID: <20260213194116.48960-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204162412.159086-2-thomas.petazzoni@bootlin.com>
References: <20260204162412.159086-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011677; x=1771616477; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBHDOPaSMQT6aLzmKQ2G5X0l5RKXoODWYYEAswfNd6M=;
 b=X+nigEbsVeq7QfFrfO4oCrvL9H6SSrUAjpf4hqZR/hAkfFVy7OQS24ctm77cXy+6AA
 4SnkTEYH2VFw6rWuhrrARDf1sofRUkcKZfsIbmJYiyuQfha6zRyDraK0s9ALN4IO9sZu
 C+dTXX1TubXnfqMtW44WXYlevhZNlRXJGP+diJN38VjdKQubvfpHIa+atpLu7mmN53+u
 AYfrpRqZqFMFnaTgG5JlZoAcJ86/WN4r948ZNqQh4VpxNMlEJWGAyRnchPDv3nZ832bZ
 qRwEisvHzOFbxoIr6eiO3BKhzevrT0UQYTONl9++t28iRj7XH32ig6uUlyvyzqWkkTF/
 QEQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X+nigEbs
Subject: Re: [Buildroot] [PATCH 2/2] package/uclibc: also install utils to
 STAGING_DIR
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
> When BR2_UCLIBC_INSTALL_UTILS is enabled, utils such as getconf, ldd,
> locale get installed to TARGET_DIR. However, they do not get installed
> to STAGING_DIR, which is annoying as it means that they are not part
> of external toolchains built by Buildroot.
> 
> This commit adjusts the uclibc package to make sure those tools also
> get installed to STAGING_DIR.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/uclibc/uclibc.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index dea5445b16..69eb73510e 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -449,6 +449,14 @@ define UCLIBC_INSTALL_UTILS_TARGET
>  		PREFIX=$(TARGET_DIR) \
>  		utils install_utils
>  endef
> +
> +define UCLIBC_INSTALL_UTILS_STAGING
> +	$(MAKE1) -C $(@D) \
> +		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
> +		ARCH="$(UCLIBC_TARGET_ARCH)" \
> +		PREFIX=$(STAGING_DIR) \
> +		utils install_utils
> +endef
>  endif
>  
>  define UCLIBC_INSTALL_TARGET_CMDS
> @@ -479,6 +487,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
>  		RUNTIME_PREFIX=/ \
>  		install_runtime install_dev
>  	$(UCLIBC_INSTALL_HOST_UTILS)
> +	$(UCLIBC_INSTALL_UTILS_STAGING)
>  endef
>  
>  # Checks to give errors that the user can understand
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
