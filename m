Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF82C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 20:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A66F060DC5;
	Sat,  9 Aug 2025 20:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLr4-HcQO0uU; Sat,  9 Aug 2025 20:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E193160C18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E193160C18;
	Sat,  9 Aug 2025 20:42:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 136B321B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED83960C18
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfbztiYtr6HZ for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 20:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE29660C0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE29660C0F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE29660C0F
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:42:20 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so1972576f8f.2
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 13:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754772139; x=1755376939;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X9DSocK+7vHKg5q2vFJdv5dQvhUy8sQfuA4o8VpOsyE=;
 b=cOyW0878Gk+B6xgOZouWGkU6cGShg2nRQvfiV3UxtsMvbo9HJmLos309OqBvJbL2ZB
 /UrBAj63tW/eGkkfnKO/29lfahzwO7RtGYW0/cPBCuahjMYWAMSxNPahfVgZAvUhfcLU
 7fe4suPl3AZyhrB+ORQy0qUNrVVu5mB7quVIefKzOAfpt/5+MgyiP14dYREhxGWYJrcu
 4ZBRih66yCLcm77o1f1U+jWg33yQ6CSvK9nXxe232Ik9jPKDNAEHcvr7CClV3z2ebdNn
 HfzLAw9gYntP7DK4rNryP5llCnEaN+Vb1F/PNYcBOzMd6tO+0mij4Grz7Anjsd+rNP+f
 SrNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWt2stDabE4SAbLDG0/oakSXWdZP34w0KiPdhlsimkgXg4LJXsh1SPjqhpv7y3podcOb3V2n5etBg=@buildroot.org
X-Gm-Message-State: AOJu0Yzpo1bgokWNy+w761YTo885vLt0MgXXM+D00fSqRlBIKyln8Ord
 +8ARL61ofq2sJlACDEe1ynbzmmyGv7mkkTp7PcTn/gaMBwSA+v1Yosb2kSZZjKb2qF4=
X-Gm-Gg: ASbGnctCt6N1acu6snUQYld1Q8ZSz6z4oxGdxbZdYed4z4yO4Lgxlb6B8f0k0CyWbcU
 3H2x2/Yox9TxRa7XV7Y5WphBOFWb8YUeEWDqR55YjrJllgt8nQ10fzaD1LEjWZdkF887yj2pCgW
 4YRV5Y9loTOHC4KnDQLD1tDmYoQoBuTVqOAVfKhvGqUaOhhvcnsDYzRGC3j/iPt4Az704kbdCZp
 WS8qNbKDe80wHIYZNDJz2WRNOP5iGNzc592ZWeAIniwNLXR2ML2ByXqTon+AQ8pWG2D4n9+jvf9
 lGvf/wcMTEQW0UEUIXM5smfgNKJZL/NFQ7n4KW5xCSmg/SAgaJLp2eqjI/4chmaguVx5ZDTblXF
 2DAHCKNXhEjsAhIxCLpEpzeMjmRLLB2p4iBue69nJih8QKz8GmIUyVKVZJeF0vEUvl24xrCH1ez
 ADAUk5FDAZJ/mmhL1KQSX0BuGqmtSJo3qbLiPB8lY0B9vheMMS8nIA8Cc5q/qA
X-Google-Smtp-Source: AGHT+IEBCrXH5ZAPkC8ZRg/MzNF3FQAdR/H7N0cpmJZ1/RzVDJ+PwfUJed0F/yLojbY3OFomHDMypg==
X-Received: by 2002:a05:6000:1a86:b0:3b7:54b3:c512 with SMTP id
 ffacd0b85a97d-3b900b6aecfmr5253689f8f.58.1754772138523; 
 Sat, 09 Aug 2025 13:42:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4533e6sm35771023f8f.35.2025.08.09.13.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 13:42:18 -0700 (PDT)
Message-ID: <e0045fd1-40e1-4af8-8031-9e051aff6833@smile.fr>
Date: Sat, 9 Aug 2025 22:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
References: <20250806-php-lua-v2-1-a73faad939e9@bootlin.com>
Content-Language: fr
In-Reply-To: <20250806-php-lua-v2-1-a73faad939e9@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754772139; x=1755376939; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X9DSocK+7vHKg5q2vFJdv5dQvhUy8sQfuA4o8VpOsyE=;
 b=dF3ykiaygmYpho5faPIivOf4DoAEmH3Zi7D+eN86Rf939L2LgwuopVAiZvGbAersjm
 ADZpyhOnUn92PM2MmoxaS0mmzZHFwm6zQR+FfGfUqglrEr/I4CnlnA+9vgSrvTyackyB
 X092NN8PQdnsTsGav6UJqCGs/13t0YdqmLeeA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=dF3ykiay
Subject: Re: [Buildroot] [PATCH v2] package/php-lua: fix build with
 PHP8/GCC14
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

SGVsbG8gQWxleGlzLCBBbGwsCgpMZSAwNi8wOC8yMDI1IMOgIDIyOjQyLCBBbGV4aXMgTG90aG9y
w6kgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IE9uIGJvdGggQnVpbGRyb290IDIwMjUuMDIu
eCBhbmQgbWFzdGVyIGJyYW5jaCwgcGhwLWx1YSBidWlsZCBmYWlscyBvbgo+IHRoZSBmb2xsb3dp
bmcgZXJyb3I6Cj4gCj4gbHVhLmM6ODYyOjQ0OiBlcnJvcjogYXNzaWdubWVudCB0byAnemVuZF9v
YmplY3Rfd3JpdGVfcHJvcGVydHlfdCcge2FrYQo+ICdzdHJ1Y3QgX3p2YWxfc3RydWN0ICogKCop
KHN0cnVjdCBfemVuZF9vYmplY3QgKiwgc3RydWN0IF96ZW5kX3N0cmluZyAqLAo+IHN0cnVjdCBf
enZhbF9zdHJ1Y3QgKiwgdm9pZCAqKiknfSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUg
J3ZvaWQKPiAoKikoenZhbCAqLCB6dmFsICosIHp2YWwgKiwgdm9pZCAqKiknIHtha2EgJ3ZvaWQg
KCopKHN0cnVjdCBfenZhbF9zdHJ1Y3QKPiAqLCBzdHJ1Y3QgX3p2YWxfc3RydWN0ICosIHN0cnVj
dCBfenZhbF9zdHJ1Y3QgKiwgdm9pZCAqKiknfQo+IFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5
cGVzXQo+ICAgODYyIHwgICAgICAgICBsdWFfb2JqZWN0X2hhbmRsZXJzLndyaXRlX3Byb3BlcnR5
ID0KPiBwaHBfbHVhX3dyaXRlX3Byb3BlcnR5Owo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiBsdWEuYzo4NjM6NDQ6IGVycm9yOiBhc3NpZ25t
ZW50IHRvICd6ZW5kX29iamVjdF9yZWFkX3Byb3BlcnR5X3QnIHtha2EKPiAnc3RydWN0IF96dmFs
X3N0cnVjdCAqICgqKShzdHJ1Y3QgX3plbmRfb2JqZWN0ICosIHN0cnVjdCBfemVuZF9zdHJpbmcg
KiwKPiBpbnQsICB2b2lkICoqLCBzdHJ1Y3QgX3p2YWxfc3RydWN0ICopJ30gZnJvbSBpbmNvbXBh
dGlibGUgcG9pbnRlciB0eXBlCj4gJ3p2YWwgKiAoKikoenZhbCAqLCB6dmFsICosIGludCwgIHZv
aWQgKiosIHp2YWwgKiknIHtha2EgJ3N0cnVjdAo+IF96dmFsX3N0cnVjdCAqICgqKShzdHJ1Y3Qg
X3p2YWxfc3RydWN0ICosIHN0cnVjdCBfenZhbF9zdHJ1Y3QgKiwgaW50LAo+IHZvaWQgKiosIHN0
cnVjdCBfenZhbF9zdHJ1Y3QgKiknfSBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KPiAg
IDg2MyB8ICAgICAgICAgbHVhX29iamVjdF9oYW5kbGVycy5yZWFkX3Byb3BlcnR5ICA9Cj4gcGhw
X2x1YV9yZWFkX3Byb3BlcnR5Owo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF4KPiBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjIxNDogbHVhLmxvXSBF
cnJvciAxCj4gCj4gVGhlIGVycm9yIGNhbiBiZSByZXByb2R1Y2VkIHdpdGggdGhlIGZvbGxvd2lu
ZyBtaW5pbWFsIGRlZmNvbmZpZzoKPiAKPiBCUjJfYXJtPXkKPiBCUjJfY29ydGV4X2E5PXkKPiBC
UjJfQVJNX0VOQUJMRV9ORU9OPXkKPiBCUjJfQVJNX0VOQUJMRV9WRlA9eQo+IEJSMl9BUk1fRlBV
X05FT049eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfQk9PVExJTj15Cj4gQlIyX1BBQ0tBR0VfTFVBPXkKPiBCUjJfUEFDS0FHRV9QSFA9eQo+IEJS
Ml9QQUNLQUdFX1BIUF9MVUE9eQo+IAo+IFRoaXMgYnVpbGQgZmFpbHVyZSBpcyB0aGUgcmVzdWx0
IG9mIHR3byBldmVudHMvY29uZGl0aW9uczoKPiAtIHRoZSB1cGRhdGUgdG8gUEhQOCBoYXMgY2hh
bmdlZCB0aGUgcHJvdG90eXBlIGZvcgo+ICAgemVuZF9vYmplY3RfcmVhZF9wcm9wZXJ0eV90IChz
ZWUgWzFdKS4gQnV0IGF0IHRoaXMgdGltZSwgcGhwLWx1YSBqdXN0Cj4gICBnZW5lcmF0ZWQgYSBu
ZXcgd2FybmluZyAoLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlcykKPiAtIHVzaW5nIGJvb3Rs
aW4gYmxlZWRpbmctZWRnZSB0b29sY2hhaW4gYnJpbmdzIGluIEdDQzE0LCB3aGljaCBub3cgdHVy
bnMKPiAgIHRoaXMgd2FybmluZyBpbnRvIGEgc3lzdGVtYXRpYyBlcnJvciAoc2VlIFsyXSkKPiAK
PiBUaGlzIGlzc3VlIGlzIHN0aWxsIHByZXNlbnQgb24gdGhlIHVwc3RyZWFtIHJlcG9zaXRvcnks
IGJ1dCBpdCBoYXMgYmVlbgo+IGZpeGVkIG9uIG9uZSBvZiBpdHMgZm9ya3MuIEJyaW5nIHRoZSBy
ZWxldmFudCBwYXRjaCBmcm9tIHRoZSBmb3JrIHRvCj4gYWxsb3cgYnVpbGRpbmcgcGhwLWx1YS4K
PiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3BocC9waHAtc3JjL2NvbW1pdC85MWVmNDEyNGU1
Ngo+IFsyXSBodHRwczovL2djYy5nbnUub3JnL2djYy0xNC9wb3J0aW5nX3RvLmh0bWwjaW5jb21w
YXRpYmxlLXBvaW50ZXItdHlwZXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kg
PGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSB1
cGRhdGUgY29tbWl0IHRpdGxlIAo+IC0gYWRkIG1vcmUgZGV0YWlscyBhYm91dCB0aGUgY29uZGl0
aW9ucyBsZWFkaW5nIHRvIHRoZSBidWlsZCBmYWlsdXJlCj4gLSBhZGQgbWluaW1hbCBkZWZjb25m
aWcKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA4MDYtcGhw
LWx1YS12MS0xLWUxZjUyNGZlZDBhNUBib290bGluLmNvbQo+IC0tLQo+ICAuLi4td3JpdGUtcHJv
cGVybHktcmVhZC1wcm9wZXJ0eS13YXMtY2hhbmdlZC5wYXRjaCB8IDc3ICsrKysrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9waHAtbHVhLzAwMDMtcGhwOC1TaWduYXR1cmUtb2Ytd3JpdGUtcHJvcGVy
bHktcmVhZC1wcm9wZXJ0eS13YXMtY2hhbmdlZC5wYXRjaCBiL3BhY2thZ2UvcGhwLWx1YS8wMDAz
LXBocDgtU2lnbmF0dXJlLW9mLXdyaXRlLXByb3Blcmx5LXJlYWQtcHJvcGVydHktd2FzLWNoYW5n
ZWQucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjBjNjhhNzA2MjQ1MWQ0MGEyZDYzMGMyNDI0NGFiMDAz
YmRmYjkzOTYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9waHAtbHVhLzAwMDMtcGhw
OC1TaWduYXR1cmUtb2Ytd3JpdGUtcHJvcGVybHktcmVhZC1wcm9wZXJ0eS13YXMtY2hhbmdlZC5w
YXRjaAo+IEBAIC0wLDAgKzEsNzcgQEAKPiArRnJvbSBkZTEwNjhkNjM0NTE5YWJmMjQ2MWRhYzk0
MjdiNWZmMjRiNjYwM2FmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBNaWtoYWls
IEdhbGFuaW4gPG1pa2hhaWwuZ2FsYW5pbkB0ZWFtLmJ1bWJsZS5jb20+Cj4gK0RhdGU6IFR1ZSwg
MjQgQXVnIDIwMjEgMDg6Mjg6NDcgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBwaHA4OiBTaWdu
YXR1cmUgb2Ygd3JpdGVfcHJvcGVydHkvcmVhZF9wcm9wZXJ0eSB3YXMgY2hhbmdlZAo+ICsgaW4g
aHR0cHM6Ly9naXRodWIuY29tL3BocC9waHAtc3JjL2NvbW1pdC85MWVmNDEyNGU1Ngo+ICsKPiAr
VGFrZW4gZnJvbSBodHRwczovL2dpdGh1Yi5jb20vYmFkb28vcGhwLWx1YS9wdWxsLzgKCkNoZWNr
LXBhY2thZ2Ugd2FybiBhYm91dCBtaXNzaW5nICJVcHN0cmVhbToiIGxpbmsuCgpTaW5jZSB0aGUg
cGF0Y2ggY29tZSBmcm9tIGEgZm9yaywgdXNpbmcgIlVwc3RyZWFtIiBsb29rcyB3cm9uZyBoZXJl
LgpNYXliZSBVcHN0cmVhbTogbi9hID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArU2lnbmVk
LW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiAr
LS0tCj4gKyBsdWEuYyB8IDI4ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiArIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYg
LS1naXQgYS9sdWEuYyBiL2x1YS5jCj4gK2luZGV4IGVkYzI4NjguLjMyYzE0NzEgMTAwNzU1Cj4g
Ky0tLSBhL2x1YS5jCj4gKysrKyBiL2x1YS5jCj4gK0BAIC0yMjksNDYgKzIyOSw0NiBAQCB6ZW5k
X29iamVjdCAqcGhwX2x1YV9jcmVhdGVfb2JqZWN0KHplbmRfY2xhc3NfZW50cnkgKmNlKQo+ICsg
Cj4gKyAvKioge3t7IHN0YXRpYyB6dmFsICogcGhwX2x1YV9yZWFkX3Byb3BlcnR5KHp2YWwgKm9i
amVjdCwgenZhbCAqbWVtYmVyLCBpbnQgdHlwZSkKPiArICovCj4gKy16dmFsICpwaHBfbHVhX3Jl
YWRfcHJvcGVydHkoenZhbCAqb2JqZWN0LCB6dmFsICptZW1iZXIsIGludCB0eXBlLCB2b2lkICoq
Y2FjaGVfc2xvdCwgenZhbCAqcnYpewo+ICstCWx1YV9TdGF0ZSAqTCA9IChaX0xVQVZBTF9QKG9i
amVjdCkpLT5MOwo+ICstCXplbmRfc3RyaW5nICpzdHJfbWVtYmVyOwo+ICsrenZhbCAqcGhwX2x1
YV9yZWFkX3Byb3BlcnR5KHplbmRfb2JqZWN0ICpvYmplY3QsIHplbmRfc3RyaW5nICptZW1iZXIs
IGludCB0eXBlLCB2b2lkICoqY2FjaGVfc2xvdCwgenZhbCAqcnYpewo+ICsrCWx1YV9TdGF0ZSAq
TCA9IHBocF9sdWFfb2JqX2Zyb21fb2JqKG9iamVjdCktPkw7Cj4gKyAKPiArIAlpZiAodHlwZSAh
PSBCUF9WQVJfUikgewo+ICsgCQlaVkFMX05VTEwocnYpOwo+ICsgCQlyZXR1cm4gcnY7Cj4gKyAJ
fQo+ICsgCj4gKy0Jc3RyX21lbWJlciA9IHp2YWxfZ2V0X3N0cmluZyhtZW1iZXIpOwo+ICsgI2lm
IChMVUFfVkVSU0lPTl9OVU0gPCA1MDIpCj4gKy0JbHVhX2dldGZpZWxkKEwsIExVQV9HTE9CQUxT
SU5ERVgsIFpTVFJfVkFMKHN0cl9tZW1iZXIpKTsKPiArKwlsdWFfZ2V0ZmllbGQoTCwgTFVBX0dM
T0JBTFNJTkRFWCwgWlNUUl9WQUwobWVtYmVyKSk7Cj4gKyAjZWxzZQo+ICstCWx1YV9nZXRnbG9i
YWwoTCwgWlNUUl9WQUwoc3RyX21lbWJlcikpOwo+ICsrCWx1YV9nZXRnbG9iYWwoTCwgWlNUUl9W
QUwobWVtYmVyKSk7Cj4gKyAjZW5kaWYKPiArLQl6ZW5kX3N0cmluZ19yZWxlYXNlKHN0cl9tZW1i
ZXIpOwo+ICsgCj4gKy0JcGhwX2x1YV9nZXRfenZhbF9mcm9tX2x1YShMLCAtMSwgb2JqZWN0LCBy
dik7Cj4gKysJenZhbCBsdWFfenZhbF9vYmplY3Q7Cj4gKysJWlZBTF9PQkooJmx1YV96dmFsX29i
amVjdCwgb2JqZWN0KTsKPiArKwo+ICsrCXBocF9sdWFfZ2V0X3p2YWxfZnJvbV9sdWEoTCwgLTEs
ICZsdWFfenZhbF9vYmplY3QsIHJ2KTsKPiArIAlsdWFfcG9wKEwsIDEpOwo+ICsrCj4gKyAJcmV0
dXJuIHJ2Owo+ICsgfQo+ICsgLyogfX19ICovCj4gKyAKPiArIC8qKiB7e3sgc3RhdGljIHZvaWQg
cGhwX2x1YV93cml0ZV9wcm9wZXJ0eSh6dmFsICpvYmplY3QsIHp2YWwgKm1lbWJlciwgenZhbCAq
dmFsdWUpCj4gKyAqLwo+ICstc3RhdGljIHZvaWQgcGhwX2x1YV93cml0ZV9wcm9wZXJ0eSh6dmFs
ICpvYmplY3QsIHp2YWwgKm1lbWJlciwgenZhbCAqdmFsdWUsIHZvaWQgKioga2V5KSB7Cj4gKy0J
bHVhX1N0YXRlICpMID0gKFpfTFVBVkFMX1Aob2JqZWN0KSktPkw7Cj4gKy0JemVuZF9zdHJpbmcg
KnN0cl9tZW1iZXIgPSB6dmFsX2dldF9zdHJpbmcobWVtYmVyKTsKPiArK3N0YXRpYyB6dmFsKiBw
aHBfbHVhX3dyaXRlX3Byb3BlcnR5KHplbmRfb2JqZWN0ICpvYmplY3QsIHplbmRfc3RyaW5nICpt
ZW1iZXIsIHp2YWwgKnZhbHVlLCB2b2lkICoqIGtleSkgewo+ICsrCWx1YV9TdGF0ZSAqTCA9IHBo
cF9sdWFfb2JqX2Zyb21fb2JqKG9iamVjdCktPkw7Cj4gKyAKPiArICNpZiAoTFVBX1ZFUlNJT05f
TlVNIDwgNTAyKQo+ICstCXBocF9sdWFfc2VuZF96dmFsX3RvX2x1YShMLCBtZW1iZXIpOwo+ICsr
CWx1YV9wdXNobHN0cmluZyhMLCBaU1RSX1ZBTCh2YWwpLCBaU1RSX0xFTih2YWwpKTsKPiArIAlw
aHBfbHVhX3NlbmRfenZhbF90b19sdWEoTCwgdmFsdWUpOwo+ICsgCj4gKyAJbHVhX3NldHRhYmxl
KEwsIExVQV9HTE9CQUxTSU5ERVgpOwo+ICsgI2Vsc2UKPiArIAlwaHBfbHVhX3NlbmRfenZhbF90
b19sdWEoTCwgdmFsdWUpOwo+ICstCWx1YV9zZXRnbG9iYWwoTCwgWl9TVFJWQUxfUChtZW1iZXIp
KTsKPiArKwlsdWFfc2V0Z2xvYmFsKEwsIFpTVFJfVkFMKG1lbWJlcikpOwo+ICsgI2VuZGlmCj4g
KyAKPiArLQl6ZW5kX3N0cmluZ19yZWxlYXNlKHN0cl9tZW1iZXIpOwo+ICsrCXJldHVybiB2YWx1
ZTsKPiArIH0KPiArIC8qIH19fSAqLwo+ICsgCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IDJmZDUy
MGM4ZDUyYjllMGVkNWUyNjM0MzgxM2ZkZDhkYmNhZGI0NWYKPiBjaGFuZ2UtaWQ6IDIwMjUwODA2
LXBocC1sdWEtMzk4OTVkNGZlMTc5Cj4gCj4gQmVzdCByZWdhcmRzLAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
