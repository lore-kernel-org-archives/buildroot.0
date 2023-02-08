Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85160C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0162E40465;
	Wed,  8 Feb 2023 15:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0162E40465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhR2p6masx0T; Wed,  8 Feb 2023 15:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90D4440BF1;
	Wed,  8 Feb 2023 15:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90D4440BF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3F901BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A609408F4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A609408F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVO-e1L-MZa8 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:10:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC193408F3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC193408F3
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:10:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so1719941wmb.2
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 07:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B6CXHTO2eoJotvUhtSCsleYuq3v9txUb0dfI83eLVSs=;
 b=2YKfLG6cs02RJW2d2NTWp1zVntZ+FqNlv3PZ0wweypyc2g1L9Xi3DWhr/aL9AR1bM8
 xlqDDShKCdWocYAO8cSmY3Uv1QL/Hp3Xu4EtNsGBaBxZXr39xJ52dL4y5Tvn2DppNxll
 yfOEr7RLoRRFKXka6+CqV1leHbXrRNDfeZCL+oNfXzVncK6UCh7Go60zwib9lK+AJydB
 6kxbNhEntit72BmoPd8JDEYqm4dr+3y9DP4KOJVz4xe8uz0weTuns0GmN/398cqpdvbZ
 fiHR8lD3EFpqpUsdMcoOSRda9tYdtw1CneruG5z9l4R3JHeZ7a9buoly91l8TB/P9QKZ
 bJGw==
X-Gm-Message-State: AO0yUKVlnIqAlqyMjyuZFv3EKN9BFyIqbBQc6QATmtIHs02J4l5RTUiq
 VvbKO8xNKJ/SZahoFrbh+Ceq6g==
X-Google-Smtp-Source: AK7set/raeXgMnggWEq8j11e8eSEmGknK60eGQ73PPRYUr0MtCWxY52MEBB2DZvLgg6oUcBVrOCZVw==
X-Received: by 2002:a05:600c:707:b0:3df:ea9a:21c9 with SMTP id
 i7-20020a05600c070700b003dfea9a21c9mr7630982wmn.27.1675869046137; 
 Wed, 08 Feb 2023 07:10:46 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b003dfee43863fsm2574112wmq.26.2023.02.08.07.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 07:10:45 -0800 (PST)
Message-ID: <da8aa2db-bba2-e885-fe59-1518a23f1c56@smile.fr>
Date: Wed, 8 Feb 2023 16:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB049330FC63A2E74B7886D2A59F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB049330FC63A2E74B7886D2A59F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B6CXHTO2eoJotvUhtSCsleYuq3v9txUb0dfI83eLVSs=;
 b=eunea2Ay78xRxlebzqDKskmn6V1BZzJp46HXhokehFhALRNecWE901FZNotDWbnr7+
 JIlNv7a+7qAPi7mLefdoYs8bsd0jEHYqn/rC0wzmbpHlamOd0IGeAkq4ci9qxwAtLAzb
 g0Fkeg5kzNYuiKcl2xgvOocw4EH0oRIH/lf++sKunJwFHpg0kB5rCv4Fd/1zqoXKsFYU
 4GyFU+Ljr+im+JCyxyUqNWUO1wUnzUhyMdeb8M9HP/xXQuvxhL5GNb9q8f9gBOfcD8cg
 VwLYjUuaBX1pKwxTFS4kNDVw6ve3g13Accfhgbn3M81MYQ0ciKtgVNtLv6wrjTVlppK8
 ad5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=eunea2Ay
Subject: Re: [Buildroot] [PATCH v2 07/11]
 package/llvm-project/llvm-libunwind: new package
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

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjEwLCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gU3RhcnRpbmcgd2l0aCB2ZXJzaW9uIDE1LCBsbGQgbmVlZHMgdGhlIGxs
dm0gaW1wbGVtZW50YXRpb24KPiBvZiBsaWJ1bndpbmQsIHRoZXJlZm9yZSBpdCBpcyBhZGRlZCBh
cyBhIGhvc3QgcGFja2FnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTGFuZyA8ZC5sYW5n
QGFiYXRlYy5hdD4KPiAtLS0KPiAgLi4uL2xsdm0tbGlidW53aW5kL2xsdm0tbGlidW53aW5kLmhh
c2ggICAgICAgICB8ICAzICsrKwo+ICAuLi4vbGx2bS1saWJ1bndpbmQvbGx2bS1saWJ1bndpbmQu
bWsgICAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9sbHZtLXByb2pl
Y3QvbGx2bS1saWJ1bndpbmQvbGx2bS1saWJ1bndpbmQuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS1saWJ1bndpbmQvbGx2bS1saWJ1bndpbmQubWsK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS1saWJ1bndpbmQvbGx2
bS1saWJ1bndpbmQuaGFzaCBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tbGlidW53aW5kL2xs
dm0tbGlidW53aW5kLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLjJkNjI4NmE0MGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9sbHZtLXByb2pl
Y3QvbGx2bS1saWJ1bndpbmQvbGx2bS1saWJ1bndpbmQuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+
ICsjIGxvY2FsbHkgY29tcHV0ZWQKPiArc2hhMjU2ICAwYWI2ZTA3YmYwNTM1OWUyNDJlOWVhODBl
NDA4OWI4MTk5MTQ4NjdmYTk5N2E3MTVlMzI0ZTU4NGJjZmRmMTE0ICBsaWJ1bndpbmQtMTUuMC4z
LnNyYy50YXIueHoKClNhbWUgaXNzdWUgdGhhbiBmb3IgbGx2bS1jbWFrZSBwYWNrYWdlLgoKPiAr
c2hhMjU2ICBiNWVmZWJjYWNhODA4NzkyMzQwOThlNTJkMTcyNWU2ZDllYjhmYjk2YTE5ZmNlNjI1
ZDM5MTg0YjcwNWY3YjZkICBMSUNFTlNFLlRYVAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xsdm0t
cHJvamVjdC9sbHZtLWxpYnVud2luZC9sbHZtLWxpYnVud2luZC5tayBiL3BhY2thZ2UvbGx2bS1w
cm9qZWN0L2xsdm0tbGlidW53aW5kL2xsdm0tbGlidW53aW5kLm1rCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5iZTk5NjVhNDlhCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tbGlidW53aW5kL2xsdm0tbGlidW53aW5kLm1r
Cj4gQEAgLTAsMCArMSwxOCBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMg
bGx2bS1saWJ1bndpbmQKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArTExW
TV9MSUJVTldJTkRfVkVSU0lPTiA9ICQoTExWTV9QUk9KRUNUX1ZFUlNJT04pCj4gK0xMVk1fTElC
VU5XSU5EX1NJVEUgPSAkKExMVk1fUFJPSkVDVF9TSVRFKQo+ICtMTFZNX0xJQlVOV0lORF9TT1VS
Q0UgPSBsaWJ1bndpbmQtJChMTFZNX0xJQlVOV0lORF9WRVJTSU9OKS5zcmMudGFyLnh6Cj4gK0xM
Vk1fTElCVU5XSU5EX0xJQ0VOU0UgPSBBcGFjaGUtMi4wIHdpdGggZXhjZXB0aW9ucwo+ICtMTFZN
X0xJQlVOV0lORF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5UWFQKPiArTExWTV9MSUJVTldJTkRf
U1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8KPiArCj4gK0hPU1RfTExWTV9MSUJVTldJTkRf
Q09ORl9PUFRTICs9IFwKPiArCS1EQ01BS0VfTU9EVUxFX1BBVEg9IiQoSE9TVF9ESVIpL2xpYi9j
bWFrZS9sbHZtIiBcCj4gKwktRExJQlVOV0lORF9JTlNUQUxMX0hFQURFUlM9T04KPiArCj4gKyQo
ZXZhbCAkKGhvc3QtY21ha2UtcGFja2FnZSkpCgpJdCdzIGEgaG9zdCBvbmx5IHBhY2thZ2UgaGVy
ZSwgaXMgbGx2bS1saWJ1bndpbmQgbWF5IGJlIHVzZWZ1bCBvbiB0aGUgdGFyZ2V0PwpJZiB5ZXMs
IHdlIHNob3VsZCB0YWtlIGNhcmUgb2YgbGlidW53aW5kIHBhY2thZ2UuCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
