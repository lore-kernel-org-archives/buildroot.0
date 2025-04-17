Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7963DC369C9
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 19:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B5082F9B;
	Thu, 17 Apr 2025 19:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGx76a9SVKif; Thu, 17 Apr 2025 19:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45AD183B57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45AD183B57;
	Thu, 17 Apr 2025 19:22:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F193C11F
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D8061018
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IhAzBuxkq3e for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 19:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3084E60A8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3084E60A8E
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3084E60A8E
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:22:55 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22409077c06so18154545ad.1
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744917774; x=1745522574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LA/Qmb0K50+kaavHMB8nLx91CelTzcWsHBF3+nwRgPE=;
 b=ImzSfCVNk9rgUYYgug9LJN7+nAH0orUnSatAYFVJTzdramQ2oHx0AjDUUpSR5tEMyS
 Zn/hKiQljX0bArxAUAqayxbn/Ik9SgQq9jRVsKMStBwa/NhUCvqMP1V3ZsY/3cGok0BE
 YJGBvi2I8SoLNzD6B0W04/NV4ZW8lGZDkF8EdcF5C/1xrRSuQkUbwr1LbupmHa2O1a3h
 FTLFEIQlDmuLotARlLa0x6Ws6ZW0WLHBC/0JNjOlggKmf11vpwlZ4+OzSmSUmnGVZHuq
 dxm1ussYaiaMTFRqqQlt3G+yRug1qzff8Q0hF9NSWakznfA6WK0JXeR6rRuAImSFDiSm
 bclw==
X-Gm-Message-State: AOJu0Yy9IdOmreKOOPqLS4Q04g/a3OsiAF2mApitsz5WBHosBd3xsV/7
 f94tFXpNPb9EXjxX82pI0/Csf9gtfAJEW77YeqOnLIQ0tLmHn24XrPxTCA==
X-Gm-Gg: ASbGncsjeTJmnPVGkQC5QsPxtATbZ35QG4/A1sMcj6TAvWSeeVBt0ssSQXiI5efM/C3
 CGcXeqgo+GSrxloznPjBfWCRyoAfNydfC02o4Xbt0jRNVKyjrJdHDekTQzTfviB0QZZSUifSaJU
 4yGQOVypolF09XKOgQc0lrpR5y96Xh0MTr8cOcyP3P223A2uZNCnvuxlqyyyCbI01QM7kC/aIAp
 yfYa2r6P+s6tOPBvcaWTTUU4KSe7/NtzajJq4nIYBzmR2GXX0DAyCFykTAAaV86DchG1JDCAi/f
 KZvOgTVFq4NoCRqsb6W9nbHpmI+uIuOpzkXvFWnnry2TRhxPCJZI+g==
X-Google-Smtp-Source: AGHT+IFF6Js2AZaKyvL+VtwYOpeexUctceatgAXECmL8BTzcipJSCBNL5f2E0rbojFpM/rMxS/BjGw==
X-Received: by 2002:a17:903:40cc:b0:223:5c33:56b4 with SMTP id
 d9443c01a7336-22c53583807mr2210655ad.20.1744917774124; 
 Thu, 17 Apr 2025 12:22:54 -0700 (PDT)
Received: from [10.0.0.72] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbfaad42fsm223697b3a.121.2025.04.17.12.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 12:22:53 -0700 (PDT)
Message-ID: <7a6751bd-c005-4b85-9b53-0f12fd9d383b@gmail.com>
Date: Thu, 17 Apr 2025 13:22:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250417190544.1075310-1-lancethepants@gmail.com>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <20250417190544.1075310-1-lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744917774; x=1745522574; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LA/Qmb0K50+kaavHMB8nLx91CelTzcWsHBF3+nwRgPE=;
 b=lZWsVHsngf5euFb/N7BmMIqxqk3nd8BTMvyTC6HW1cwL4LdLiy8vnTwVQJqto0CTXm
 PiKxAmBVwYtnAvgKB5SaFe46RBmvm+0XZYD+9v40tlxssX2vtKy1etY4Ah8Wl2e7Obrj
 Aiouzhkd3s87brAjzCy4C1aRkMM4T72tJ2r/O5kvM8FGgGCAIoaMiM12XHyogt2orZ3G
 tXJBhQJM0C6VLu58WzSUE9CNuEdNQq6W8/LU2tcWXA8MlGWkoADRKbNaH3yFbWIK3tBJ
 F1LWA5dinI2WD+fKQ7QxJDeqTsPjJgftq3iOVu+DCT5pgkti+ISzMpPrJqWeKmIM8jKV
 73aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lZWsVHsn
Subject: Re: [Buildroot] [PATCH] package/libcurl: Also specify the CA bundle
 location
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a patch I've carried for my project where I only keep the ca 
bundle. The ca-certificates package does install the bundle and distros 
like debian do specify a ca path & a ca bundle when configuring.

https://salsa.debian.org/debian/curl/-/blob/debian/unstable/debian/rules?ref_type=heads#L20 


Lance

On 4/17/2025 1:05 PM, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
>
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
> ---
>   package/libcurl/libcurl.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 2066ba0388..509feeab64 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -67,7 +67,8 @@ endif
>   ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
>   LIBCURL_DEPENDENCIES += openssl
>   LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
> -	--with-ca-path=/etc/ssl/certs
> +	--with-ca-path=/etc/ssl/certs \
> +	--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
>   else
>   LIBCURL_CONF_OPTS += --without-openssl
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
