Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A10C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F18740C14;
	Wed,  8 Feb 2023 15:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F18740C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hz3auFRVJOvy; Wed,  8 Feb 2023 15:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51DDA40C10;
	Wed,  8 Feb 2023 15:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51DDA40C10
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 897881BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7034C80A7B
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7034C80A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLzAZ8-Ct-k6 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:18:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B0381FEC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54B0381FEC
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:18:29 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso1704840wms.5
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 07:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YnSSQokOgtwILLDFb39fa5FYuU6VtbIjw+XPYQ7rqY=;
 b=B4ztBK4yS1Rj2WqqY/5sAxYdoFPL8QUtwpllmaCS1v164Ckex6HcKzNwrngnqUlEBz
 eEdaDA4ibg6N91iYywoJP/mftmcQOSCLp+zCxKIEQtcfCKs9k8FqZhdT3D72WPs6UgtJ
 JNZzlT7J6R9TrLfsqAIKVn0+9+COBGigRJNlT50HVbDMjmVLn/RGWBjgClNq2v2KYThp
 +FfvQQhD/lWRU3OsNfxzY4eqxSRdkdjHKogQFz/MT3VF4ya0ONHr8tqUltIUoUYeDDZg
 LaRlmEZ4eHAlhSisOloAf5dCsK3l0Zu1YtQUkg1VJ6B6KA+143ktyGGNyAmudtoEeLhA
 M/XA==
X-Gm-Message-State: AO0yUKV5OsL7G2dfD9XSZ2Qw2qHAHBsbQicbgjkROp04AQ+FGdO8SvVZ
 M4MPVA2O/3knckWMZVBkOq7dCQ==
X-Google-Smtp-Source: AK7set/QKxdIWMX8xP6TRAqfuPA09HSblFx9OgGL9JykqtCoLNFCYlVstKYqtZOTKR9ntcAlupxCpQ==
X-Received: by 2002:a05:600c:4b1b:b0:3dc:5987:fe9 with SMTP id
 i27-20020a05600c4b1b00b003dc59870fe9mr7678959wmp.2.1675869507459; 
 Wed, 08 Feb 2023 07:18:27 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a1cf215000000b003e001119927sm2146633wmc.24.2023.02.08.07.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 07:18:27 -0800 (PST)
Message-ID: <89073a3f-f951-d3cc-36c9-4d405dd92919@smile.fr>
Date: Wed, 8 Feb 2023 16:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493DEEFA77B06AFB8DB877F9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB0493DEEFA77B06AFB8DB877F9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YnSSQokOgtwILLDFb39fa5FYuU6VtbIjw+XPYQ7rqY=;
 b=q1FIn8+itzCNVAvCkLwZCwjHBHPSvyCw+Pk1YafAnSEXNy0N3JgxiAoX3nX9I7EQAr
 P9JvBTa5Ie34XGMEgmdEuqj7iMP6zVXcx6s7P9L04K1gxiiPvPo2HkUEyR8wbKfMzo8R
 Ytdkv5ShedzpFfDinecENm+XMbDqVEghTMvaopxxwYFpR/Tv/Wujg2ovwdUf7//BkKN/
 5Q2OYqSMqCiFImCHACEEpjqp/vAXKzwGy96i/pVnVfxY6ocPY/N4kgdE83s3lIDYwXzp
 1pVvB0Mtlq3070T2tu1hsipvgyoBaaeYJ+LOYoZglcxy9Of78BSv25DL8a1Ar/moJs2R
 IG+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=q1FIn8+i
Subject: Re: [Buildroot] [PATCH v2 09/11] package/spirv-llvm-translator:
 bump to version 15.0.0-2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjEzLCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6CgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21p
bGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIExh
bmcgPGQubGFuZ0BhYmF0ZWMuYXQ+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAtIEJ1bXAg
dG8gbGF0ZXN0IGNvbW1pdCB0aGF0IHN1cHBvcnRzIGxsdm0xNQo+IC0tLQo+ICBwYWNrYWdlL3Nw
aXJ2LWxsdm0tdHJhbnNsYXRvci9zcGlydi1sbHZtLXRyYW5zbGF0b3IuaGFzaCB8IDIgKy0KPiAg
cGFja2FnZS9zcGlydi1sbHZtLXRyYW5zbGF0b3Ivc3BpcnYtbGx2bS10cmFuc2xhdG9yLm1rICAg
fCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3BpcnYtbGx2bS10cmFuc2xhdG9yL3NwaXJ2
LWxsdm0tdHJhbnNsYXRvci5oYXNoIGIvcGFja2FnZS9zcGlydi1sbHZtLXRyYW5zbGF0b3Ivc3Bp
cnYtbGx2bS10cmFuc2xhdG9yLmhhc2gKPiBpbmRleCBlZGZjYTFlYTAyLi4wZTA2ZDM2ZGUxIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3BpcnYtbGx2bS10cmFuc2xhdG9yL3NwaXJ2LWxsdm0tdHJh
bnNsYXRvci5oYXNoCj4gKysrIGIvcGFja2FnZS9zcGlydi1sbHZtLXRyYW5zbGF0b3Ivc3BpcnYt
bGx2bS10cmFuc2xhdG9yLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBsb2NhbGx5IGNhbGN1
bGF0ZWQKPiAtc2hhMjU2ICBiZGQ3Y2I2NzdiOWZjYWFmZjFjY2UyMTUzZGU5ZDY5Mjk4ZjEzNmVk
ZWNhZWYzNjMxOTE1NjE0YmI1ZGIwOWExICBzcGlydi1sbHZtLXRyYW5zbGF0b3ItdjExLjAuMC0y
OTctZ2E2MTliMzRiY2U1NTM2MGQ3OWZlYTkwNThhOTNkZWQwNDkxOWYyYjIudGFyLmd6Cj4gK3No
YTI1NiAgYzJiMjliYzQ5NWZlMTRhMjFlODcxNDgxYjVhMjVkN2FiZWQ5M2RmOGZhM2ZjMjJlOTk2
ZTM5ZDljMTM3MzI4MCAgc3BpcnYtbGx2bS10cmFuc2xhdG9yLXYxNS4wLjAtMi1nMjQ3ODkyMGE5
MWJmZjVjNTljYTY1ZWE5YmNlOGZmYWE1YWY4ZmE4OC50YXIuZ3oKPiAgc2hhMjU2ICBlM2JjMzY0
NDBmYzkyN2M2MmQ1Y2MyNGVmZWVmZTIyNWExNGQ0ZTM0ZmZlYjBjOTJlNDMwNjI1Y2NlOWVlNDQ0
ICBMSUNFTlNFLlRYVAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRv
ci9zcGlydi1sbHZtLXRyYW5zbGF0b3IubWsgYi9wYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRv
ci9zcGlydi1sbHZtLXRyYW5zbGF0b3IubWsKPiBpbmRleCAxNTlmN2QzYjUyLi5kOTIwOTk5YjI4
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3BpcnYtbGx2bS10cmFuc2xhdG9yL3NwaXJ2LWxsdm0t
dHJhbnNsYXRvci5tawo+ICsrKyBiL3BhY2thZ2Uvc3BpcnYtbGx2bS10cmFuc2xhdG9yL3NwaXJ2
LWxsdm0tdHJhbnNsYXRvci5tawo+IEBAIC01LDggKzUsOCBAQAo+ICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICAKPiAgIyBHZW5lcmF0ZSB2ZXJzaW9uIHN0cmluZyB1c2luZzoKPiAtIyAgIGdp
dCBkZXNjcmliZSAtLXRhZ3MgLS1tYXRjaCAndjExKicgLS1hYmJyZXY9NDAgb3JpZ2luL2xsdm1f
cmVsZWFzZV8xMTAKPiAtU1BJUlZfTExWTV9UUkFOU0xBVE9SX1ZFUlNJT04gPSB2MTEuMC4wLTI5
Ny1nYTYxOWIzNGJjZTU1MzYwZDc5ZmVhOTA1OGE5M2RlZDA0OTE5ZjJiMgo+ICsjICAgZ2l0IGRl
c2NyaWJlIC0tdGFncyAtLW1hdGNoICd2MTUqJyAtLWFiYnJldj00MCBvcmlnaW4vbGx2bV9yZWxl
YXNlXzE1MAo+ICtTUElSVl9MTFZNX1RSQU5TTEFUT1JfVkVSU0lPTiA9IHYxNS4wLjAtMi1nMjQ3
ODkyMGE5MWJmZjVjNTljYTY1ZWE5YmNlOGZmYWE1YWY4ZmE4OAo+ICBTUElSVl9MTFZNX1RSQU5T
TEFUT1JfU0lURSA9ICQoY2FsbCBnaXRodWIsS2hyb25vc0dyb3VwLFNQSVJWLUxMVk0tVHJhbnNs
YXRvciwkKFNQSVJWX0xMVk1fVFJBTlNMQVRPUl9WRVJTSU9OKSkKPiAgU1BJUlZfTExWTV9UUkFO
U0xBVE9SX0xJQ0VOU0UgPSBOQ1NBCj4gIFNQSVJWX0xMVk1fVFJBTlNMQVRPUl9MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRS5UWFQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
