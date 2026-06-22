Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F301CDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 21:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F16D880F0A;
	Mon, 22 Jun 2026 21:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhftDZFC53Dj; Mon, 22 Jun 2026 21:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3BF780EFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782165072;
	bh=r/sW/gWfmW9FuI4Uh+eSIBYd8ogzZiapX8M75q2hcOs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vcg0sr+Vq/5YN7itXzid5CmZtG9gKtEbZiLglIng49TxIO7NCIHE+tVVYwcQm5M8I
	 zhvTbyqDwRkzXm5+iRPqV2dNvwPlapW5NIaiGqGYkEov3gKYwnfySP3RWtYhdlJ8MI
	 LJsFX+WzadZLdtqFJMOCK28L/e3Yse3tLvEYy7wHP/qGRICYFILBptVvU+uBTt9xf1
	 rffHK6p+zDazsWGY3XoI1+NnsQTkxfKPjgR7ip3WfRWEyNQGmqekyO1H7sNnoMRvAr
	 3isztRi08QKJ+H2gQ0jn2/rv2dRc5fO3aQH3mXul+BALlRiRodksX8wl05b25Hjpd1
	 0IdRcvPcXUTOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3BF780EFE;
	Mon, 22 Jun 2026 21:51:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51EB3256
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3802F6064D
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Sp4S8VFYIWp for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 21:51:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51F6F60641
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F6F60641
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51F6F60641
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:51:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so38662665e9.1
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 14:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782165068; x=1782769868;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GbfIPd4X8+YsKGa4uzgYdsSrUyNlVVYD6/FICCd8ZGg=;
 b=RAyn/zO6SJRbTbnYX4vUc9F7HQ7mRmD7XLrnFAZ1Gm9sCRx79/jSiy0VXnbFQsOlln
 CS4TfVhddyG9VhMrHR7/RtqaMxV7+c/MWEdXdJuCvwAaD5UbwaN+Plv9+ITKQjvDlYH6
 fZDM48eF9h6IAO/qpEXCdlFILd/leiUtmYXbuslyMRaee85xQKg5xGRjVTaZnQaoQmjW
 vSd4+GNqF+O6IR0RZjT0Y+tUy/spGzqsjc0m4SyEKC9rzjuvBC9gi/3QsMuT1XP+Tbu9
 Xq8rA8DBAzRWN7dTbhS5JNgEm0DJFgY6MOdMFnxsPcNf1i56rXpt8H4Xla8SdiA1Ik3x
 RKAw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qSwdA5TsSwfNX5SKfK8906P2wc93UFWNkZQZ+PpzooMayago8t6ghmkbHoT3LpasVsyGKYKWFhV8=@buildroot.org
X-Gm-Message-State: AOJu0YwBHVsIkk1kubsCU/6gA0zKANWNylo8cLtw1izYQ+md18/nyAYs
 l5rFGyT/t2HlONQohGvbTI5lPbmTkIReUxBZkbg3a1+xrHsM0OxEFyzNpoIE4zX6r68=
X-Gm-Gg: AfdE7cn+8nE8Yx+7SE47FoaFabOkwJK7Ia2f05cBL2lEhQs+w8Wc0sYgBIJTFwoup2W
 oMO8gVYaiGkhFTtWmpzYEcU62tpcPHYjOnJr6qcmk2izUdeltcPWMcc02a3cSDo2/PQyI1fwXtc
 GQQ0YoBuv3wqNDqZ/XQqwYM/xLtmLv0LednZjIpoQ/T3o2+b2n4wv9lVCMslStmHXKqMyIeRO7B
 rHMUvOWrG3AXX7Ajh4dO3zOmyXvCqdIbwZ2u9Eo8ZncGVsYOFlm6KeTgqxO6DAqcrK0Fa/z8O7B
 NBVFYvG7kfAr0pP1UeMTvDLIeXYp//esXBBRU/sKLaZbVR5KBQRuimI3LGEirm12eHYf3oleFvm
 7Ev4nqWAPR5ug6VvgjrZSeiDACvoCeJOi4Bi1DFy0kEdq/wGwCMaWOfNYZdpKrP2OhxFCGK1g1S
 a9qNHIiFiLYbJnhB1V2TNJR2xc/LKAcnAHUsj9ICB8cyMf6I1M3NNApgAlL+7Bx40ts/G98sDk0
 NtpMfpDo+3tI/SDAzluRzNuBcztjBSw53Xs1WWupNlvtPF6CJueG4M=
X-Received: by 2002:a05:600c:524d:b0:492:51aa:2d46 with SMTP id
 5b1f17b1804b1-49251aa2da9mr119794985e9.13.1782165068063; 
 Mon, 22 Jun 2026 14:51:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49245711032sm299342425e9.0.2026.06.22.14.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 14:51:07 -0700 (PDT)
Message-ID: <9820e0fd-a70b-4b35-affe-08c3325fd934@smile.fr>
Date: Mon, 22 Jun 2026 23:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <5eb533070f62b66decb39cb42067e453ef577bfc.1781861320.git.yann.morin@orange.com>
Content-Language: fr
In-Reply-To: <5eb533070f62b66decb39cb42067e453ef577bfc.1781861320.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782165068; x=1782769868; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GbfIPd4X8+YsKGa4uzgYdsSrUyNlVVYD6/FICCd8ZGg=;
 b=qXpDkf8KfMgDXnxY+M4blC07yq9BntQDfzJHDRa2zrSKJ3qUc+q8EQq/J5JWFXmKGf
 Hh+/4sEq09BjM45oWTJlkwANi/jZpCy/CdXiMeIeaXQsobJ5AqGYtcxdxZZqDNZcsAzS
 oBkQ//7kD/FqHZoKYf0YKS0sEhh7/+9lnaPW0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=qXpDkf8K
Subject: Re: [Buildroot] [PATCH 1/1] package/mosquitto: requires cmake >= 4.3
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMTkvMDYvMjAyNiDDoCAxMTozMSwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4gCj4gV2l0aCBhbiBvbGRlciBjbWFrZSB2ZXJzaW9uLCBsaWtlIHRoZSAzLjI1
LjEgYXMgYXZhaWxhYmxlIGluIHRoZSBkb2NrZXIKPiByZWZlcmVuY2UgaW1hZ2UsIG1vc3F1aXR0
byBmYWlscyB0byBidWlsZCB3aGVuIGNjYWNoZSBpcyBlbmFibGVkOgo+IAo+ICAgICBbIDk4JV0g
QnVpbGRpbmcgQ1hYIG9iamVjdCBsaWIvY3BwL0NNYWtlRmlsZXMvbW9zcXVpdHRvcHAuZGlyL21v
c3F1aXR0b3BwLmNwcC5vCj4gICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBbLi4uXS9idWlsZHJv
b3Qvb3V0cHV0L2J1aWxkL21vc3F1aXR0by0yLjEuMi9saWIvY3BwL21vc3F1aXR0b3BwLmNwcDox
NzoKPiAgICAgWy4uLl0vYnVpbGRyb290L291dHB1dC9ob3N0L29wdC9leHQtdG9vbGNoYWluL2k2
ODYtYnVpbGRyb290LWxpbnV4LWdudS9pbmNsdWRlL2MrKy8xNS4xLjAvY3N0ZGxpYjo4MzoxNTog
ZmF0YWwgZXJyb3I6IHN0ZGxpYi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgICAg
IDgzIHwgI2luY2x1ZGVfbmV4dCA8c3RkbGliLmg+Cj4gICAgICAgICAgIHwgICAgICAgICAgICAg
ICBefn5+fn5+fn5+Cj4gICAgIGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCj4gCj4gT2ZmaWNpYWxs
eSwgbW9zcXVpdHRvIG9ubHkgcmVxdWlyZXMgY21ha2UgMy4xOCwgYnV0IHRoYXQgcHJvdmVzIHRv
IG5vdAo+IGJlIGVub3VnaCwgaW4gZmFjdC4uLgo+IAo+IFdlIHdvcmthcm91bmQgdGhhdCBieSBy
ZXF1aXJpbmcgY21ha2UgNC4zLCB3aGljaCBpcyB0aGUgb25lIHZlcnNpb24gdGhhdAo+IGNvdWxk
IGJlIHRlc3RlZCB3aXRoIG91ciBob3N0LWNtYWtlLgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KPiBDYzogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPgo+IENjOiBUaXRvdWFuIENocmlzdG9waGUgPHRpdG91YW4uY2hyaXN0b3Bo
ZUBtaW5kLmJlPgo+IC0tLQo+ICBwYWNrYWdlL21vc3F1aXR0by9Db25maWcuaW4gfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bW9zcXVpdHRvL0NvbmZpZy5pbiBiL3BhY2thZ2UvbW9zcXVpdHRvL0NvbmZpZy5pbgo+IGluZGV4
IDA4MjIzYmM1ZGIuLmQ1NTNkMmZlNWMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tb3NxdWl0dG8v
Q29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9tb3NxdWl0dG8vQ29uZmlnLmluCj4gQEAgLTIsNiAr
Miw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NT1NRVUlUVE8KPiAgCWJvb2wgIm1vc3F1aXR0byIK
PiAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgICMgbGliIHBlZWtzIGluIG1hbGxvYygpIGludGVy
bmFsczsgYnJva2VyIGZvcmsoKXMKPiAgCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUwo+ICsJ
c2VsZWN0IEJSMl9IT1NUX0NNQUtFX0FUX0xFQVNUXzRfMwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdF
X0NKU09OCj4gIAloZWxwCj4gIAkgIEVjbGlwc2UgTW9zcXVpdHRvIGlzIGFuIG9wZW4gc291cmNl
IChFUEwvRURMIGxpY2Vuc2VkKSBtZXNzYWdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
