Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7E9C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 09:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C44A60825;
	Fri,  1 Mar 2024 09:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoxidkIAE_mI; Fri,  1 Mar 2024 09:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B753B60830
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B753B60830;
	Fri,  1 Mar 2024 09:44:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9B5F1BF83B
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C45A682F11
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDdlYh_7OrG6 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 09:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE7C58289B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE7C58289B
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE7C58289B
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 09:44:27 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56648955ac5so2598873a12.3
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 01:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709286266; x=1709891066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6klnfJdD2DTEfMJMg3XQCqE9InjZUAAKb19JxrLIZIU=;
 b=BQe2CW82cut+Xf84L7+w1UA1+igdmvInpOWPTz3YDtjoCej30rYoBqR5SiuNwqDh3W
 qr9JzigCd2gYnDrHgmXzDKKkdRE91OQLPiNvxuLEID8PLvGciSbiHD/QhGc4tG491h3R
 xeJs596tMslWV7kiTd38WUb8AFcZfXEHuAAtqan+OTH7CI7SDAeXRNgAXoiX9HFs1DRl
 DWDEpQ3l2NSpe7se2HLIj3JrItdvAPgeqjg8MYtfl4KZ2VTfN62bmEUHtwnqUoeGEdQj
 hL5SVtailSXHEYC23v5BvuCHkh+uFSCK+VP0ToxqmDzUtstaBMf977D948qYxi2S29vl
 K+XA==
X-Gm-Message-State: AOJu0YyO96fWbWUuqaJ5xu4SW4Ewp8sZM0599pK9mO4DbGE7tqGE8+2n
 WPvnezFHUQFcJKxQTKCGcwE2A1OXFQzuFpr0qaJtgpGX9/yJjRt+FdjRuZWfN1IjvSfq/3Xp3nD
 pYEE=
X-Google-Smtp-Source: AGHT+IGbMzDEXqQvEfuoWOBOH2lt3AO91hLX7caV+6Is8kfGVun2CEnaSvH13EjQGLmveurqODuFTg==
X-Received: by 2002:a05:6402:1e86:b0:565:3aa7:565f with SMTP id
 f6-20020a0564021e8600b005653aa7565fmr763552edf.8.1709286265820; 
 Fri, 01 Mar 2024 01:44:25 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz.
 [89.103.66.201]) by smtp.gmail.com with ESMTPSA id
 cs4-20020a0564020c4400b00566a4dec01fsm1295511edb.11.2024.03.01.01.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 01:44:25 -0800 (PST)
Message-ID: <9f9e6089-053f-43f4-b249-74b24187534f@sairon.cz>
Date: Fri, 1 Mar 2024 10:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240227174823.3504777-1-sairon@sairon.cz>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <20240227174823.3504777-1-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1709286266; x=1709891066; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6klnfJdD2DTEfMJMg3XQCqE9InjZUAAKb19JxrLIZIU=;
 b=Icjx1uaJheFq0bKn4FYJPDQdm3CFZ1j4Zw4EUj3bE0IiXWvERMd4Tgi6WlSscWpGGQ
 t7mzKK+Q9nqWTEaCj9uwu5TDQ12ZC68CKj3oz5q+UydWqReb8mIwbvLbICba1WoQl8lW
 zelPyYo9CaBRtuVgarHOv2B/rAm4i0JBZhd5EWWyo4D0sxZ6cqgyivKQodYGix9mZzIC
 WNCWKr2ah2RdNd3GSXumA4pUEVWZO8Kc4HMVhXDi1Dnz+6Fvc1HOTTVZ/w1f0cYUth5P
 2p04UkbcNBTssQ/S8jUTtb3/hYcijpGG71vyiChBboaSAgxgwgCRjVT5rX5mx86ALZVv
 R90w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=Icjx1uaJ
Subject: Re: [Buildroot] [PATCH] linux-firmware: add options for missing
 Intel b/g/n cards
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjcuIDAyLiAyNCAxODo0OCwgSmFuIMSMZXJtw6FrIHdyb3RlOgo+ICtjb25maWcgQlIyX1BB
Q0tBR0VfTElOVVhfRklSTVdBUkVfSVdMV0lGSV8xMDAwCj4gKwlib29sICJJbnRlbCBpd2x3aWZp
IDEzNSIKCk5vdGljZWQgdGhpcyBjb3B5LXBhc3RlIHR5cG8gaW4gYSBkb3duc3RyZWFtIHJldmll
dy4gSSdsbCBzdWJtaXQgYSAKY29ycmVjdGVkIHYyIHBhdGNoLgoKQ2hlZXJzLApKYW4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
