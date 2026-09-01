Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC600C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CDC60823;
	Tue,  1 Sep 2026 21:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cg0GDSX4yYbB; Tue,  1 Sep 2026 21:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788297355;
	bh=Yaj3OwX7t0dX69YBpRp6ZdNdu4TQt01rc7oJkxx57Z4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XRPzNDkb/KY/md0kMiU4LDPkKScV990UhEK/h8NAjSOjra7oVnL6A8sSBj809oux7
	 gAzCRjeIGosOdvVTVED/sPfG3cBrwMMjKxAJVY/lFP/KvBFfJX6yBpiXEYDnD3z/ts
	 G9DFPiultxvDRAmIjWUn0xDmnfhdvS/wB164CxhUabttW9rg7V4O1s1NAeZico/a6n
	 x4UqV57pqvLjkqtSdl08p11M+gN8LZYPYvXbtEhEh7ZwnKrgxXVexcjGoP23toBfYY
	 vbcflo3vFN095PBYxtNzKU4hafO42WqioaIl1oE9PTPSdgW/tXH0NdsCdR3MNuIeUl
	 HkXHpUiGtxcVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C08960802;
	Tue,  1 Sep 2026 21:15:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB048127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0C0760802
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iqx-PuJSLImv for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C828607AE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:15:53 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4843f205a5bso274543f8f.1
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 14:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788297351; x=1788902151;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wpPXST+ia7/bcfjU+jK02P1P2IsRntB4fMisgdVyfUc=;
 b=WMzKv7KZur911r7U9S8MBqZI7pQwaMenhriV4+D6ocd71rglgUuOWMjAmf9e8r241E
 96HM6lSENgL5itT/zYvZvyzvNobcVziIexIMSz4ZgGqMeC7XBWf2G4Ed0kxn8BZAQrrO
 Ju1nxM6sezBZT6l5ir7LLc5yJrPJ5ML7ey8zzra7cftcmgvNrpF/8shyYxWFFt2feZ0G
 silSK78Hg2ARAKmwnjHHHLfK/RlWlrOEkwQxaQ2RPyy82/Bfs7N4i3yqO035/87jjrIr
 FfWFq9GIPPl1jUO9VdJbSJtfEqt0oMUorESKZueRbvOLTG9eXeYrft2Oxwkvgz++IzPf
 cmpQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrjHtlj+6pmJWhaYDEo5rHkg57pqxdscatcLehm1hNL85Ag1N6/RXQr7HscrJip684fNIIZ4Bo/wkI=@buildroot.org
X-Gm-Message-State: AFuF++kwiDGpFWBAGhXJo5iGJ4rjLNnWx1o3/cdc07R9vvIUmb826JIg
 LjmyR5Q891XAlpiex83A9n9CJI73JHiy64yxS2Vx2w/VMkQ7eM6dPi46N200n7J2cPk=
X-Gm-Gg: AR+sD10Ii7KHJCsz/8Gt/BsoFn9aHIQ/n1uEQYcUFiOgAqujuEaECAR3MDg0uuxAIWI
 Sf4Jcp8QwgwiM029PkVe2fvS8hxq14o1jBS4CQS26M9khhWHOJ4sgcH1XpLWrtOeJiHBL4bQhlq
 TpiV58jiPPGzdT5pXLyv1D7zst0i2Vi44FJ3DW1vKTIw0SUhUkfDrA9mjM4QpUUbRZ9kxSORBUz
 zs5ZJAdxiLfz/0ifQN/IqHxbpDjbm0EEmqlnBUyJEiHHNL+KxQAOYcgXBP528MmNH9RcLUrDvqd
 x1BydFP2TuZ/Xb9l2Irf387jny9dz4Tx4Yit31Iqi1yFoCx0eZg5YkD6rXf3OQ4JdG5Uxf8EbdI
 Hfn1AgbK0zF7V1ymxpRjPVPmc3bvYnmHk03l6pMCe4suV/Kz9yUT7Wf1bRBnXXquFFxYgxswfUt
 KdEzDTYLPLDNSO70Q8dHBQcE4TrnDQbgtRjT2kLvYY1GtflcPttR1NGzWOY8RfPEpeOMNm7acvU
 B6VZvf0w+QRjEKJsZrfU5npf0C+sAY/KMDXr3Wkm3zWcn7mdNotkpDvVGr8ZorEquedjIBmIsty
 P0TKwgDDY9TgfhPcEvUe6V88PqsfxHEONvD9hw==
X-Received: by 2002:a05:600c:3496:b0:493:f5bf:4dc6 with SMTP id
 5b1f17b1804b1-49ce57fb12cmr6961555e9.7.1788297351003; 
 Tue, 01 Sep 2026 14:15:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce10153sm103123055e9.4.2026.09.01.14.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 14:15:50 -0700 (PDT)
Message-ID: <d6573706-511f-4139-908e-64c90dc886b8@smile.fr>
Date: Tue, 1 Sep 2026 23:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
References: <20260831205703.3909457-1-romain.naour@smile.fr>
 <20260831205703.3909457-2-romain.naour@smile.fr>
 <9d071a34-5e26-4a04-9419-14754ccadc51@gmx.de>
Content-Language: en-US
In-Reply-To: <9d071a34-5e26-4a04-9419-14754ccadc51@gmx.de>
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: TestMdnsd: improve
 test reliability
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

SGVsbG8gRmlvbmEsIEFsbCwKCkxlIDAxLzA5LzIwMjYgw6AgMjI6MTEsIEZpb25hIEtsdXRlIGEg
w6ljcml0wqA6Cj4gQW0gMzEuMDguMjYgdW0gMjI6NTcgc2NocmllYiBSb21haW4gTmFvdXIgdmlh
IGJ1aWxkcm9vdDoKPj4gVGhlIG1kbnNkIHJ1bnRpbWUgdGVzdCBjYW4gcmFuZG9tbHkgZmFpbCBv
biBzbG93IHJ1bm5lcnMuCj4+Cj4+IEl0J3MgaGFyZCB0byByZXByb2R1Y2UgbG9jYWxseSAob25s
eSBvbmUgZmFpbHVyZSBhZnRlciBhIGZldyBhdHRlbXB0cykKPj4gYnV0IHdlIGNhbiByZXByb2R1
Y2UgaXQgZWFzaWx5IGJ5IHJlbW92aW5nIHRoZSB3aGlsZSBsb29wIGVudGlyZWx5Lgo+Pgo+PiBJ
dCB0dXJucyBvdXQgdGhhdCBtZG5zZCBpcyBzdGFydGVkIGJ5IFM1MG1kbnNkIGJlZm9yZSB0aGUK
Pj4gZW11bGF0b3IubG9naW4oKSBjaGFuZ2UgdGhlIHN5c3RlbSBkYXRlOgo+Pgo+PiDCoMKgIFtC
UlRFU1QjIGRhdGUgLXMgQDE3ODgwMzI4NjQKPj4gwqDCoCBTYXQgQXVnIDI5IDE5OjQ3OjQ0IFVU
QyAyMDI2Cj4+Cj4+IFNpbmNlIHRoZSBtaW5pbWFsIHJvb3Rmcy5jcGlvIGdlbmVyYXRlZMKgwqDC
oCBmb3IgVGVzdE1kbnNkIGRvZXNuJ3QgaGF2ZSBhbnkKPj4gbnRwIGNsaWVudCBpbnN0YWxsZWQs
IGl0IHN0YXJ0IHdpdGggIkphbnVhcnkgMSwgMTk3MCIuCj4+Cj4+IFRoZSBkYXRlIGNoYW5nZSBt
YXkgY2F1c2Ugc29tZSBpc3N1ZSB0byB0aGUgbWRuc2QgZGFlbW9uIHdoaWNoIGJsb2Nrcwo+PiBh
bnkgcmVzcG9uc2UgZnJvbSBtcXVlcnkgY29tbWFuZC4KPj4KPj4gV2hlbiB0aGUgcHJvYmxlbSBv
Y2N1cnMsICJtcXVlcnkgLVQgX2h0dHAuX3RjcCIgcmVwbHkgaXMgZW1wdHk6Cj4+Cj4+IMKgwqAg
IyBtcXVlcnkgLVQgX2h0dHAuX3RjcAo+PiDCoMKgIFF1ZXJ5aW5nIF9odHRwLl90Y3AubG9jYWwu
IGZvciBQVFIgKDEyKSAuLi4gcHJlc3MgQ3RybC1DIHRvIHN0b3AKPj4KPj4gVG8gd29ya2Fyb3Vu
ZCB0aGUgaXNzdWUsIHJlc3RhcnQgbWRuc2QgbWFudWFsbHkuCj4gCj4gVGhhbmtzIGZvciB0aGUg
d29ya2Fyb3VuZCEgSWYgbWRuc2QgZ2V0cyBzdHVjayBpZiB0aGVyZSdzIGEgdGltZSBqdW1wLCB0
aGF0Cj4gc291bmRzIGxpa2UgYW4gaXNzdWUgdGhhdCBzaG91bGQgYWxzbyBiZSByZXBvcnRlZCB1
cHN0cmVhbSAoYW5kIGhvcGVmdWxseSBmaXhlZAo+IHRoZXJlKS4gRXZlbiB3aXRoIGFuIE5UUCBj
bGllbnQgaW5zdGFsbGVkIHRoZXJlJ2QgYmUgbm8gZ3VhcmFudGVlIHRoZSB0aW1lIHdvdWxkCj4g
aGF2ZSBiZWVuIHNldCBiZWZvcmUgbWRuc2Qgc3RhcnRzLgoKSSBqdXN0IGNyZWF0ZWQgYSBuZXcg
aXNzdWUgb24gR2l0aHViOgpodHRwczovL2dpdGh1Yi5jb20vdHJvZ2xvYml0L21kbnNkL2lzc3Vl
cy85OQoKSG9wZWZ1bGx5IHRoaXMgaXMgdGhlIGxhc3QgaXNzdWUgZm9yIHRoZSBydW50aW1lIHRl
c3RzdWl0ZSBmb3IgdGhlIHVwY29taW5nCjIwMjYuMDggcmVsZWFzZSEKCkJlc3QgcmVnYXJkcywK
Um9tYWluCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBGaW9uYQo+IAo+PiBGaXhlczoKPj4gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNjE4NTk0ODU1NQo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4K
Pj4gLS0tCj4+IMKgIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbWRuc2QucHkg
fCA0ICsrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tZG5zZC5weSBiL3N1
cHBvcnQvdGVzdGluZy8KPj4gdGVzdHMvcGFja2FnZS90ZXN0X21kbnNkLnB5Cj4+IGluZGV4IDIx
NGVlYTdkZDkuLmViYjg5NzFlMzggMTAwNjQ0Cj4+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfbWRuc2QucHkKPj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9tZG5zZC5weQo+PiBAQCAtMjMsNiArMjMsMTAgQEAgY2xhc3MgVGVzdE1kbnNk
KGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICItbmV0IiwgInVz
ZXIiXSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuZW11bGF0b3IubG9naW4oKQo+PiDCoCAr
wqDCoMKgwqDCoMKgwqAgIyBSZXN0YXJ0IG1kbnNkIGFmdGVyIHNldHRpbmcgdGhlIGRhdGUgaW4g
ZW11bGF0b3IubG9naW4oKSBzZXR1cC4KPj4gK8KgwqDCoMKgwqDCoMKgIGNtZCA9ICIvZXRjL2lu
aXQuZC9TNTBtZG5zZCByZXN0YXJ0Igo+PiArwqDCoMKgwqDCoMKgwqAgc2VsZi5hc3NlcnRSdW5P
ayhjbWQsIHRpbWVvdXQ9MzApCj4+ICsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgICMgV2UgY2hlY2sg
dGhlIHByb2dyYW0gY2FuIGV4ZWN1dGUuCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLmFzc2Vy
dFJ1bk9rKCJtZG5zZCAtdiIpCj4+IMKgIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
