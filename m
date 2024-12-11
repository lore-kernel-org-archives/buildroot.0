Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD777E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 16:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93D6D41370;
	Wed, 11 Dec 2024 16:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsCfW8aSSOFU; Wed, 11 Dec 2024 16:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AEA641351
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AEA641351;
	Wed, 11 Dec 2024 16:10:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7CD26F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5D0E41351
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzthzsZZ-pXV for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 16:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 752F74124C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 752F74124C
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 752F74124C
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:10:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-43622354a3eso1123275e9.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 08:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933450; x=1734538250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8edEJd3Xh3EeLoyhuWau30ZwtLBUuJVB3+4DwZBZMWA=;
 b=I8ekHBj/X269BYyX2wMwxDe+ufuvUQTlmYU2gmbrOh+aNaw/75tDAojXxzIzYiYHZ8
 T73InyGMWgQ7Nf7fZakDRxf+GgQnMIUguFwEhVIg+IM+wctLlHK35CMxW0JlX63T9kRQ
 lwpfDWC3Bx1qVnKSZ/bWwLYjMgJ1lE5ZRJUgwxIIhSJDAkA7qZKeUaw9fYLC5FlTWTk1
 D+NvPWcHDayYEv9V7DGbn540IfupqfkPhpkPPVjJAqLGwSLiWFPiddQNwoN9F3VV5Rbx
 DhvjOJ2zxxOnQspuZwwXne0pvjberDcBxe9uHR8FINYuhJbFU0uifBwFFj3m0cn8lrvJ
 aNRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAaX3sThfL5hwZjZo5RByDVVRw84j8NDZy25I+8wO8/Ha/NykUQUM8lxkMlJRDkhrCUNR+1RJKhyY=@buildroot.org
X-Gm-Message-State: AOJu0YwLFpX/Z1q1WxZbX9grr3fC9XJCWZA8j/AJHlAidgPTnPIz0ikC
 ohCY9rU8lVAp491YkHgYWFSowRjebH8uUu6ovI8YhxZbs94/8A/zHX1cAYNIUIU=
X-Gm-Gg: ASbGncuInQOWAM13cKZUQt5KTK3IUUvVjbI1Z1UeQAqej03yyoxeYiPN2Q/3wdfJl+y
 pP7ICxKK3wtHutAtqw0hHmW/gZ/GB6JsIFD1B/23B2KCiKhSfUWc5pGO5C3s/dv5/AyHEiqx6wo
 MN/scsKCZ+KESyzfhYXpeDlVHBQyGKo81R5aDC7YJng5Rnf3nPgVDS7vb+dmOvbhP1DNlJUSGQt
 /SlF/S8tI/64MboTGFhnzbn484kVIc/KuH7CzOIxWAC/PSRA9W8/AY+O4GgXUXn4KtWbmNRzp/A
 7nXtF840ZbUoSKQoVf+54CjkkwAmZN44l3YIPWpX/g==
X-Google-Smtp-Source: AGHT+IHosI40QNjhQJWnNEauiFpC9ICCbGtuxKLztPmXNpgtxW9B2/lute2oW45QO/64aXNfFkQnSA==
X-Received: by 2002:a05:600c:3109:b0:434:f335:855 with SMTP id
 5b1f17b1804b1-4361c441e47mr20842545e9.28.1733933450388; 
 Wed, 11 Dec 2024 08:10:50 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361f0728dfsm18750995e9.30.2024.12.11.08.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 08:10:50 -0800 (PST)
Message-ID: <cab92b0e-a3bf-4bb8-bca6-d4157e3fea72@smile.fr>
Date: Wed, 11 Dec 2024 17:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241115220215.1057916-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241115220215.1057916-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733933450; x=1734538250; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8edEJd3Xh3EeLoyhuWau30ZwtLBUuJVB3+4DwZBZMWA=;
 b=GjP/mdwn3lLDgivVP2arsfI7ROA+OG2PX7rv54GTWNF+jxnr81x+NKxuZyJ4BHyTMj
 yud3L4ufE6AIuxAWC4+5K/n2HYH/EmwS7yEg6eGL4/c/urfSUVtyR3NMCPRGLKcisOUz
 MkBCeIcYklkkwV+9yqYeOClIBYjVJFi9qWbqg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=GjP/mdwn
Subject: Re: [Buildroot] [PATCH next 1/1] Config.in: switch GNU mirrors URL
 to https
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMTUvMTEvMjAyNCDDoCAyMzowMiwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBBcyBleHBsYWluZWQgb24gWzFdLCB0aGUgcHJpbWFyeSBHTlUgbWlycm9ycyBV
UkwgaXMgaHR0cHMuCj4gVGhpcyBjb21taXQgdXBkYXRlcyBCUjJfR05VX01JUlJPUiB0byBzd2l0
Y2ggdG8gaXQuCj4gCj4gWzFdIGh0dHBzOi8vd3d3LmdudS5vcmcvcHJlcC9mdHAuaHRtbAo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBDb25maWcu
aW4gfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9Db25maWcuaW4gYi9Db25maWcuaW4KPiBpbmRleCBkZjQzZGI3
ZWZmLi4zNDk3Mjk3OWQxIDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbgo+ICsrKyBiL0NvbmZpZy5p
bgo+IEBAIC0yODUsNyArMjg1LDcgQEAgY29uZmlnIEJSMl9LRVJORUxfTUlSUk9SCj4gIAo+ICBj
b25maWcgQlIyX0dOVV9NSVJST1IKPiAgCXN0cmluZyAiR05VIFNvZnR3YXJlIG1pcnJvciIKPiAt
CWRlZmF1bHQgImh0dHA6Ly9mdHBtaXJyb3IuZ251Lm9yZyIKPiArCWRlZmF1bHQgImh0dHBzOi8v
ZnRwbWlycm9yLmdudS5vcmciCj4gIAloZWxwCj4gIAkgIEdOVSBoYXMgbXVsdGlwbGUgc29mdHdh
cmUgbWlycm9ycyBzY2F0dGVyZWQgYXJvdW5kIHRoZQo+ICAJICB3b3JsZC4gVGhlIGZvbGxvd2lu
ZyBhbGxvd3MgeW91IHRvIHNlbGVjdCB5b3VyIHByZWZlcnJlZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
