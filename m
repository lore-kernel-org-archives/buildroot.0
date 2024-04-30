Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3FBC4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 22:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D327D4077C;
	Tue, 30 Apr 2024 22:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXKyoX0o-zMm; Tue, 30 Apr 2024 22:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86F3640798
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F3640798;
	Tue, 30 Apr 2024 22:37:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44EB41BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E0BB40798
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1q3HeSIssm-u for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 22:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C48D4077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C48D4077C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C48D4077C
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 22:37:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so1598865e9.0
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 15:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714516666; x=1715121466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XdLGciyoiqWFHLgkuzdSi7cV+0f4gOxCr1mnu1GU2vk=;
 b=Mc1Z8JwcL9AuPm8y41ele57wW1qfMs6Yzs8ffuPidhBZ0FtKCziReyIxQZCHm58/3V
 Z5tYdrXyM/YfnYsDt/6360amTBKtQPhySLB+WAYaxt2HHur9GKr4syjIONpqcFf8apwi
 twAppLoVE292wB4HqaL6SsceU/Lx7N4qCbCRdCKcWHTtS2ypDxcFrz1sLoQvm9lYgzY7
 7kgbvHTc6FioDRVmSG3ws6+s7P4No5gR7AkECiBPzZzePv1WbNm9eiha0E3da1NKtnoy
 BjsC0uvUArFs68wJPwXHLPkesPAZhuEmHZQKwlKZ2fpt+S4xr8n2VioS/wOXHGhCJ0/9
 Wv1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWk9mQqpqu/WF7VWhO+PJSQ1GnGQd8TwAo1frj1jGuA+15kVZbYOTqJuc74EaMJ4e9KPK4/gOs2HlMDGxyKEl0tocDNa6Wtw==
X-Gm-Message-State: AOJu0YxZTQTwg9+mUb8pkdjCdMO0zjFEOo3WH4r8/duDql4RCk6ysTtR
 ajtDxoQrH7Y36ByEUKuqy092gWO5mLrls6m3Hr4wiZqZ547lYoJIHX2k37aIwjk=
X-Google-Smtp-Source: AGHT+IFrGJXnb47bFf5CX6czGIvs6SyOCJKl+8uzMPRd+lu8v4rrXVyxeVP7ZTu49CA3Uuao/JKpaw==
X-Received: by 2002:a05:600c:3b10:b0:419:c9e1:70b8 with SMTP id
 m16-20020a05600c3b1000b00419c9e170b8mr884829wms.13.1714516665975; 
 Tue, 30 Apr 2024 15:37:45 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 x35-20020a05600c18a300b0041b61504565sm267566wmp.28.2024.04.30.15.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 15:37:45 -0700 (PDT)
Message-ID: <cf30ceb5-e6cd-4421-bcbf-c0f68112b113@smile.fr>
Date: Wed, 1 May 2024 00:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>,
 buildroot@buildroot.org
References: <20240403222513.1267595-1-gero.schwaericke@posteo.de>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240403222513.1267595-1-gero.schwaericke@posteo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714516666; x=1715121466;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XdLGciyoiqWFHLgkuzdSi7cV+0f4gOxCr1mnu1GU2vk=;
 b=TtRTRo8KXS8Sz/MT9BjVroI8dynk4AaJ8I9V5ECW4pmmCUBHe2ynb5pRSrLK9OMFtO
 a4bCtmAT8eDFQ8UbpmUIW/PqPdyxLJrxVOvtFGoDYEkIzDgOGzouTRm1YLPNu64fbzTj
 g/XP5J4IojPZXHhqsXvpbI5eYqQXQOxd/v8Bp/OCOR9mKEXzF9v4Qp2iEmKwlp/ciTAI
 z/PdyYC4fd703V50tRFNFFZQIdRTARpNILgoY9vp5jiRfoqHJiUR3Wr1lMiINGb+mtVx
 GUGSAf3xGIcSGNfYLX4v25C40c4Q348o0fmHhXrLHfi/kwEmYlvHMZy8w64fMVwGubfS
 V2NQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=TtRTRo8K
Subject: Re: [Buildroot] [PATCH] configs/raspberrypizero2w_defconfig: fix
 typo in headers series option
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2VybywKCkxlIDA0LzA0LzIwMjQgw6AgMDA6MjQsIEdlcm8gU2Nod8Okcmlja2UgYSDD
qWNyaXTCoDoKPiBUaGUgYnVpbGQgZm9yIHRoaXMgZGVmY29uZmlnIGZhaWxzIHdpdGg6Cj4gCj4g
ICBJbmNvcnJlY3Qgc2VsZWN0aW9uIG9mIGtlcm5lbCBoZWFkZXJzOiBleHBlY3RlZCA2LjgueCwg
Z290IDYuMS54Cj4gCj4gRm91bmQgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1hbmQgd2hpbGUgdHJ5
aW5nIHRvIGZpbmQgYm9hcmRzIHRoYXQgaGF2ZQo+IG1pc3NpbmcgY3VzdG9tIGhlYWRlcnMgc2Vy
aWVzOgo+IAo+ICAgZ3JlcCAtLW51bGwgLS1yZWN1cnNpdmUgLS1maWxlcy13aXRob3V0LW1hdGNo
ICJCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkiIC4vY29uZmlncyBcCj4gICAgIHwgeGFyZ3MgLS1u
dWxsIGdyZXAgLS1udWxsIC0tZmlsZXMtd2l0aC1tYXRjaGVzICJCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV8uKj15IiBcCj4gICAgIHwgeGFyZ3MgLS1udWxsIGdyZXAgLS1udWxsIC0tZmlsZXMtd2l0
aG91dC1tYXRjaCAiQlIyX0tFUk5FTF9IRUFERVJTX1swLTldXCtfWzAtOV1cKz15IlwKPiAgICAg
fCB4YXJncyAtLW51bGwgZ3JlcCAtLWZpbGVzLXdpdGhvdXQtbWF0Y2ggIkJSMl9QQUNLQUdFX0hP
U1RfTElOVVhfSEVBREVSU19DVVNUT01fWzAtOV1cK19bMC05XVwrPXkiCj4gICAuL2NvbmZpZ3Mv
bWFuZ29waV9tcTFyZHcyX2RlZmNvbmZpZyAgIyBwYXRjaCBwZW5kaW5nCj4gICAuL2NvbmZpZ3Mv
cmFzcGJlcnJ5cGl6ZXJvMndfZGVmY29uZmlnCj4gICAuL2NvbmZpZ3Mvc2lwZWVkX2xpY2hlZXBp
X25hbm9fZGVmY29uZmlnICAjIHBhdGNoIHBlbmRpbmcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZXJv
IFNjaHfDpHJpY2tlIDxnZXJvLnNjaHdhZXJpY2tlQHBvc3Rlby5kZT4KPiAtLS0KPiAgY29uZmln
cy9yYXNwYmVycnlwaXplcm8yd19kZWZjb25maWcgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL3Jh
c3BiZXJyeXBpemVybzJ3X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfZGVm
Y29uZmlnCj4gaW5kZXggMWJmMzM1YzA3Ni4uZTE1Mjg4OWYyZCAxMDA2NDQKPiAtLS0gYS9jb25m
aWdzL3Jhc3BiZXJyeXBpemVybzJ3X2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5
cGl6ZXJvMndfZGVmY29uZmlnCj4gQEAgLTMsNyArMyw3IEBAIEJSMl9jb3J0ZXhfYTUzPXkKPiAg
QlIyX0FSTV9GUFVfTkVPTl9WRlBWND15Cj4gIAo+ICAjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBr
ZXJuZWwsIDYuMSBzZXJpZXMKPiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RP
TV82LjE9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15Cj4g
IAo+ICBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9DWFg9eQo+ICAKCkFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
