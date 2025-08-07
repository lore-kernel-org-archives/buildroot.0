Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C01C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EC040541;
	Thu,  7 Aug 2025 18:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fM3l5viDDsJi; Thu,  7 Aug 2025 18:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B619440543
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B619440543;
	Thu,  7 Aug 2025 18:23:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37D264C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FEC1605C3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAJROIcCjfAe for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 617CB6064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 617CB6064C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 617CB6064C
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:48 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so8947755e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591026; x=1755195826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v77CTMcJjU+SLk+HiEUkpS3ptZeficIm6UObV5bL0GU=;
 b=NlnESbUFEhCVUnW8lq4sofNt08a+RKF2kKMsi9CWLbLC5Js00kbKuwb+kZDn2ot0Tt
 SelhiJpqMHgW2YtIgdaNtrkhPaDfEJOvgkhDlVbhTdIFsWba7KwcJJOvDnD8TVt07asJ
 iK/zB+XH325pt3NDRo2DzaG+2cxizfqBQdterMW7/LRGryhk1RIxCQ7ehR0mSgzDsJQs
 8BKV2tLgumAgfriZZtrQWl/wty9HWluvJuWBTkPnXKqNRS3PglsqxJNOTxeET3pTdC9w
 jn609o9xX5u2sqQ5af3+c3DCfOSp+jX2VTgwP3fe5Z/w+se1FQZj9i8mdMk/ml7br3HQ
 l1JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNHP5hjzUAu7ju8H9IH7VY2c/DVxRR0eUWxuyaEDqD0ZFn5tnh5u2kH+ePQzsqUpD4aEnxDO4/ef0=@buildroot.org
X-Gm-Message-State: AOJu0YwgR61Y14112WuLHs9y0o6oi8QZcjxDPwnT93dmehxm68FFwCv0
 tK3oAftln5Lt2QtaVwKQo5XdrHPBZtVcYd4kcFa6GY5ctdz2dHiRgko12KSaopJj/Q4=
X-Gm-Gg: ASbGncvAUkLvKc41TCYvUrF5ro376THZsE/crliD7j1FpkPJVqY0QDS82XE1Y7z3F3f
 ivan9/bJsxnL6JpGHlNAb/c0oNBOdEswxEgr0WywPxMIto1iHgNfHj8aIvsDuAqMfalGqGDr1fh
 X5QfwzqvJXtJHpo78ExwNZ6gbBc8TfJ4I9XuoBBtM2URo4OJmGDv0P9R4vKHuhvuscING3TaoOa
 9QS5ZbWetWhM9oOmv0AnGipb3Lyna/4q8/z+KRuUAoBCD5FAlwmv4BMkONqBzR80yQg4XqoRPVk
 0UF2wxE7D+s+ejDNOT4FTAp9Ti3HgcbrAwoHvmDg8/h6zcshR1uJDIAz5E7UZfoJ0BUCQ1Zh/RE
 8cJ184plwJrqeJg==
X-Google-Smtp-Source: AGHT+IHDO3qFnHU5WJ55ADd2flTIyWemYUpt19oYqcdVYvwWO7bXXGnmoK9PlM63x+7KKsFCAx3CMg==
X-Received: by 2002:a05:600c:1ca6:b0:458:bfb1:1fc7 with SMTP id
 5b1f17b1804b1-459e707ffd9mr68859215e9.6.1754591026207; 
 Thu, 07 Aug 2025 11:23:46 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5868fd7sm112373195e9.18.2025.08.07.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:46 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:45 +0200
Message-ID: <20250807182345.723308-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250425201824.141234-6-thomas.petazzoni@bootlin.com>
References: <20250425201824.141234-6-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591026; x=1755195826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v77CTMcJjU+SLk+HiEUkpS3ptZeficIm6UObV5bL0GU=;
 b=C2z9ehqUPZVCcYX6TweyyHMgT9mvjMHWqF5p4MGjWhTkXvfCzo4byKNVHeH93AH0uI
 j7HSylVtcTFeZZzh8pxVrPY7LrWxSLI21iFqokR9GMIw2Hm39LGyG32E84mvpYv9ZPaB
 IRF58+8WVyiulBQG/lb32uwdym8U9ePjGlDLi/+oalE87RbkvFTF23vf6tZhV4tkkS/n
 VRu0Z/yz+BsSoKptVEeuXJc6YCYb5Y2w2KqUaF7lidompriznwltqmrO4U9tuiUqFgfy
 kQKeElMF1fVSRCLRvc3uIC7PH94Om17RwSq7haZTOBRwz6qRyEufCt7IWNb0S/NRFC0n
 Vvyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C2z9ehqU
Subject: Re: [Buildroot] [PATCH 5/7] package/gcc: drop stale hash
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
> The hash for the GCC 10.4.0 tarball should have been removed a long
> time ago, when support for GCC 10.x has been removed.
> 
> Fixes: d37a8f3a2e2a387b102f2982d51aca78bcc09727 ("package/gcc: remove gcc 10.x")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/gcc/gcc.hash | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 7a473cdc02..00da7dd49b 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -1,7 +1,5 @@
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
>  sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
> -# From https://gcc.gnu.org/pub/gcc/releases/gcc-10.4.0/sha512.sum
> -sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
>  sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
