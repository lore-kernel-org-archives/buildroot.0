Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8575CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94F6561747;
	Sun, 24 Aug 2025 14:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgdUIZ2KfqU5; Sun, 24 Aug 2025 14:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B922D61726
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B922D61726;
	Sun, 24 Aug 2025 14:16:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C16F1CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B26A084417
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HINNDLfp5fog for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEC818441E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC818441E
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEC818441E
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:15:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3c985f13d45so35003f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 07:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756044957; x=1756649757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1age0zcgOZi4cKimM6t4xrhCp96vlse6F1MYZ3QpE28=;
 b=p4lTNb83wQ10e6cdD3v8temkaSmQJAbHGGK35PsIMSgI45exDj+3u424wMP0C717Gs
 GkcOCO/KCfxuHD2HjvrRvo5EwR3QhmAMJbLwd33HpaoNE6IiifAKQtaxuA9/0NNHfyrp
 9Co4MC+PwBMfwsRJFVGvgvkJfT8zgD0lkpSdzYMp3CVm2z8akRpTDL4pXz+6Umq6xtj7
 0BhuDTcVJT3bqfDadpzLrPuut0S2BfNKI3KMVMo2AnE0TXCJG95tMa4HgVE2mVKR92vq
 nGLgfJiSFSJpsnV3YsmNfuXRUyWp/8aqb2DREPUnRabS8q4GvCzNPBwGcugssIHDyFNb
 iwdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBeAHa/OFlcTM4TyiLMDd7dxhn/DTGUl3tFa0hjzCM6EFetROgL1NM4+V0pxQQKrRyUnj0Y/XVwig=@buildroot.org
X-Gm-Message-State: AOJu0YwTnqP2ncj0xWCVN4FtoNQz8QMj5gNldkgZ0jEL775gQi8zjl6n
 yudyWtpg5nE00u2OD/pha//DzL8FfHnvV443G0niyiOD0bg74u9EWHUmekFN7GV+ngg9R7wdeE0
 hCzkm
X-Gm-Gg: ASbGncu0LCHY4ESW1MZENMSini52Ko+ZPTHekrTVIaPdgHTHyAxQ6fvaRcyOW4drBXe
 t620pagG5XbU+CaiiwxLOVswzCfwUqC19yyg8eeYHqutuTVQD2aviQPN1XwaNGEt2lGTH6/M1Ux
 GSpHrDpGqiybIw1qOBVH6TXeTaj9apMBOKZw0AzsM4WwZx7Z0arJJvu9KXED3G5D4Kx3qo5pm57
 Q0G464YnpW/53uHthO68/g4nlIF0QgGHuVdk8hdAbfBWuFueYXuADM/obJ5vbqcsjh2dZLFpbxW
 ZDqxqr3MLetHwUERUwX32eeL07JvEExtUwRnQ9sV0tfiF/uTGjG0knMJKRDfQBqugwVNfyNA2Uj
 5tBOq0tPNc4f8mQqN2IH+yWy/IuRrD0Xa7YYUjfihVhKGoTNAbazuonbeWD2WAtTiXdL4sFi+D5
 NplBejpz+fJj+Ig6EHo2eojLRdNyFpfnKehX/NwKnlpRmOUA073XLBb4BdBjYTGPc6zFLKU4I=
X-Google-Smtp-Source: AGHT+IHZ1gC4je9xt26iHv0eJQyoi7hmmm4As/lYRB+Z3kULJD3PJ+VOxOkbYAxbcb0dNEvH9sPe1Q==
X-Received: by 2002:a5d:5850:0:b0:3b7:95ac:6f55 with SMTP id
 ffacd0b85a97d-3c5d48fba9cmr5868031f8f.20.1756044956784; 
 Sun, 24 Aug 2025 07:15:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711abd15asm7692980f8f.56.2025.08.24.07.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 07:15:56 -0700 (PDT)
Message-ID: <eb54b0cf-01a2-4d3f-bbf1-f2f87da30663@smile.fr>
Date: Sun, 24 Aug 2025 16:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: Justin Maggard <jmaggard@netgear.com>
References: <20250816213446.22359-1-fl@n621.de>
Content-Language: fr
In-Reply-To: <20250816213446.22359-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756044957; x=1756649757; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1age0zcgOZi4cKimM6t4xrhCp96vlse6F1MYZ3QpE28=;
 b=JmwTLEo7CheWXIBGV+m5ygjxCAr+SRJTy6nIzLKuxhGi+tJ3CaZqAQP2W4WGwo03NJ
 6B8pzqO/+JV5xqXNObpESXoREHRyuGVC8JXFUa/bJqQ866dVOQNQ6G4k7k4mJWUBy4FY
 mFa4920yT6GZQ8q7K5W7U4jMP4B6lIoFhgvGU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=JmwTLEo7
Subject: Re: [Buildroot] [PATCH 1/1] package/dtach: fix GCC 15 build
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

SGVsbG8gRmxvcmlhbiwgQWxsLAoKTGUgMTYvMDgvMjAyNSDDoCAyMzozNCwgRmxvcmlhbiBMYXJ5
c2NoIGEgw6ljcml0wqA6Cj4gR0NDIDE1IG1ha2luZyBDMjMgdGhlIGRlZmF1bHQgY2F1c2VzIHRo
ZSBkdGFjaCBidWlsZCB0byBmYWlsLiBJbXBvcnQgdGhlCj4gdXBzdHJlYW0gcGF0Y2ggdGhhdCBm
aXhlcyBpdC4KPiAKPiBGaXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1
bHRzLzFhYi8xYWIyZWVhZDgzMDljMTM4YWQ3YTUxOTBlMjQ4OWUwODZjM2Q2NzZkCgpBcHBsaWVk
IHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IFNpZ25lZC1vZmYt
Ynk6IEZsb3JpYW4gTGFyeXNjaCA8ZmxAbjYyMS5kZT4KPiAtLS0KPiAgcGFja2FnZS9kdGFjaC8w
MDAxLWZpeC1nY2MtMTUtYnVpbGQucGF0Y2ggfCAyNyArKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9kdGFjaC8wMDAxLWZpeC1nY2MtMTUtYnVpbGQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9kdGFjaC8wMDAxLWZpeC1nY2MtMTUtYnVpbGQucGF0Y2ggYi9wYWNrYWdlL2R0
YWNoLzAwMDEtZml4LWdjYy0xNS1idWlsZC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uNGRhNmFiYjQ0ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL2R0YWNoLzAwMDEtZml4LWdjYy0xNS1idWlsZC5wYXRjaAo+IEBAIC0wLDAgKzEsMjcgQEAK
PiArRnJvbSA2ZDgwOTA5YThjMGZkMTk3MTcwMTBhM2M3NmZlYzU2MGY5ODhjYTQ4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNv
bT4KPiArRGF0ZTogTW9uLCA5IERlYyAyMDI0IDEyOjM1OjA5ICswMDAwCj4gK1N1YmplY3Q6IFtQ
QVRDSF0gZml4IGdjYy0xNSBidWlsZAo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNv
bS9jcmlnbGVyL2R0YWNoL2NvbW1pdC82ZDgwOTA5YThjMGZkMTk3MTcwMTBhM2M3NmZlYzU2MGY5
ODhjYTQ4Cj4gK1NpZ25lZC1vZmYtYnk6IEZsb3JpYW4gTGFyeXNjaCA8ZmxAbjYyMS5kZT4KPiAr
LS0tCj4gKyBhdHRhY2guYyB8IDIgKy0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2F0dGFjaC5jIGIvYXR0YWNoLmMK
PiAraW5kZXggNDFhNjk2Yy4uZTRhNDZiZCAxMDA2NDQKPiArLS0tIGEvYXR0YWNoLmMKPiArKysr
IGIvYXR0YWNoLmMKPiArQEAgLTk2LDcgKzk2LDcgQEAgZGllKGludCBzaWcpCj4gKyAKPiArIC8q
IFdpbmRvdyBzaXplIGNoYW5nZS4gKi8KPiArIHN0YXRpYyBSRVRTSUdUWVBFCj4gKy13aW5fY2hh
bmdlKCkKPiArK3dpbl9jaGFuZ2UoaW50IHNpZykKPiArIHsKPiArIAlzaWduYWwoU0lHV0lOQ0gs
IHdpbl9jaGFuZ2UpOwo+ICsgCXdpbl9jaGFuZ2VkID0gMTsKPiArLS0gCj4gKzIuNTAuMQo+ICsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
