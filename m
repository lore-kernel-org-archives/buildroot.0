Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D1AC0015E
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 11:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E286560EAA;
	Mon, 24 Jul 2023 11:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E286560EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxQ423OeObsL; Mon, 24 Jul 2023 11:02:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B2D7605AD;
	Mon, 24 Jul 2023 11:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B2D7605AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2508B1BF45A
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 11:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F311C81C93
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 11:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F311C81C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIVbQmAfAAi5 for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 11:02:04 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 287F1818DC
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 11:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 287F1818DC
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbc656873eso40766375e9.1
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 04:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690196522; x=1690801322;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LeS21fiScUqQ6gcQucMpLFjZ0+i4UJ+yQpEkyEkpBqU=;
 b=McODkVuNDo6bnT1j+eIXy9ceXvaCtezcR/3c/emoiNZOdARvH2d8NulxSd3IzdEaLg
 lROx7pNd84mIfvTWO+xo/BU4B5QRnzA/mGoaAInOz41ymQnqaxSxBzdwhImYl4UUYFOC
 YsgQyurUW1eywyRBQy/toqgVcpUMop+Zp+GtS8ZzKybbD17UwmU6nsk3LsEHbtdlSqM5
 ZxAK+wZtetzsB8/reQjgnjtpzz9xnzFLyeIF+TtOhYvvZAB9RSRmOcszbeZQ5FJOgavY
 T6bTDW/nG3SUQCrNb7cYERBs4fDrEvxN2KRlwRslGWTDjsi+rHVOi2B9Kcn8D1qe+Ptr
 vf5Q==
X-Gm-Message-State: ABy/qLbcKh3IS7Uhj4NemRbBJcBL5HJNSxsUbUngmMJYw9SuowzQnDMZ
 CdHcP5t5FjZJ+cJVJLg4YWEzvxt2Gxt3tw==
X-Google-Smtp-Source: APBJJlE9RPuKlcR2roA6d1cqPL5m9oqwNKEWKZF7h1tOZwppwk3upyG+6ZskL78XzwOOTcQOBenbGA==
X-Received: by 2002:a1c:7218:0:b0:3fb:424b:ef6e with SMTP id
 n24-20020a1c7218000000b003fb424bef6emr7599839wmc.23.1690196521967; 
 Mon, 24 Jul 2023 04:02:01 -0700 (PDT)
Received: from ?IPV6:2a01:e34:eca2:2100:1908:92af:1110:d41c?
 ([2a01:e34:eca2:2100:1908:92af:1110:d41c])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c234300b003fc04d13242sm12622871wmq.0.2023.07.24.04.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 04:02:01 -0700 (PDT)
Message-ID: <f354a2cd-2a5c-c645-703f-30a8eb3458f7@gmail.com>
Date: Mon, 24 Jul 2023 13:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20230710212151.574040-1-robertoxmed@gmail.com>
 <20230710212151.574040-2-robertoxmed@gmail.com>
 <45660995.fMDQidcC6G@kilian-aisec>
From: Roberto Medina <robertoxmed@gmail.com>
In-Reply-To: <45660995.fMDQidcC6G@kilian-aisec>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690196522; x=1690801322;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LeS21fiScUqQ6gcQucMpLFjZ0+i4UJ+yQpEkyEkpBqU=;
 b=Jv3LKI3HfwpZdKP3lktnvj8cU45V/lWZDi5d9rW0rY728Z2ji3iixdvtDMvfp+20h5
 6uBZC/2dv9b4x2WRokO8fXr0QNI9cxIbfPnBNuHS7Aocx5ZLVzgo7y7pPb/LUYLFW/7I
 E1ETVznDN3Nl8WEkOyku+Dw2+tWkFPHbugFQ2iX3xv5aal7aKIQ0jvBDmZCPaT5PTKBz
 gow1WxifRnjXeB/3SJ6i8AD2NU/ZLi2o9wdNfin7BdIwl/8WIV7KZbhUzAWQxDzwrH59
 m5JaNjwNhItXzAL51zISsVhN776/Z4IIM7aLlzeEj0m9MMWxVmBgNRpUTtU/yJGCyK2i
 zNcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Jv3LKI3H
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hi Kilian, all,

On 7/14/23 20:08, Kilian Zinnecker wrote:
> Reviewed-by: Kilian Zinnecker <kilian.zinnecker@mail.de> Tested-by: 
> Kilian Zinnecker <kilian.zinnecker@mail.de> Tested v2, but again build 
> test only (I don't have that board). I also had a look at it and it 
> looks good to me.


Any suggestion on how to get this merged to upstream? Or any further 
changes required?

Thank you in advance.

Roberto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
