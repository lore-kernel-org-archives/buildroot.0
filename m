Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150F8D637B2
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 10:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE1B140C9A;
	Sat, 20 Dec 2025 10:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xFJsI8Z38GD; Sat, 20 Dec 2025 10:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6DB640C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766227471;
	bh=Z/3N5q35UZD/pDUtc0bCDsIsFaF6S41AsjZlUtB7C5Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mbyx116zEOsb0TUVBAseXMplkXqY0Nj2G0VVFb3yRREQxc13U2gG/Mn3I0Ez1SrkX
	 dZMZmw7TCT8GNeisr1LsWyZxEJChDJOexnOofrpZvF4oR4BYsO65uvpgRqsgAEku0v
	 zbVvQwfO8PH+fLQRSvmYrxKZ9zq3LJ/h6jVELB//xJWbpXd3jzqF5XUk1A0kqw3uTy
	 +3PXVxUI8u2WnyJJQ31hFym0bQzYY12l1fYj67ehtallSHnnbOMpRJook13aDI9NfM
	 /7a34f/L/oCs5GdIkgfB4AK04WOz5bX0QAccBBeZeNlAQMX0zNFa2JPQ+UI99w4VQf
	 dXXWaIiAzmUSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DB640C29;
	Sat, 20 Dec 2025 10:44:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA9DB1A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 10:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8661403EE
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 10:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDKkrVdGj4T3 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 10:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BCE6E403DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCE6E403DC
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCE6E403DC
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 10:44:28 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7bc248dc16aso2235315b3a.0
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 02:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766227468; x=1766832268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+Iqqfco3ZVBadmQBLkVTDSgPafZqELOs5crsvWZRF8k=;
 b=GG9eY/oXVeyWfE03dTMJLZzzX+8VnBQLSn7YvAiJkA5wBkAh/Qt65ZtgnQ5+waShUt
 ON+Qt38HRxeB9wTK3lusMKp/0ZVS5AbjdLo5RHtXYWHsgfLqSPT4YGMxW1Iboi8MDZZC
 497ePoTsu/vFdUWnwHAUIGi406/slSTqmWKyesBMuEKhpq6p7wQwNEYRiLMWGp44oC8A
 kTitMWUcTPGm6i9de3xa2awK/FgCYWR7APA3mCYzIUZvG+JXvuy3FcLyf+bgYFgUjpE5
 pqrA6F6bZ+Uo8ZzoHWBogyQ2TIgtVWYrRriUg0iqR+tWHbl23taka/MContXYJUezVYu
 kmsQ==
X-Gm-Message-State: AOJu0YzJvTY8tlGULLNz9x6TQQdW4tM4r1xzmbXmAGg/++64Z2+FBebx
 x4bEMTkUd8lamcscrM90zEByEZ7xOeQK5s0gdmcQNt87mhSF78+jO/O4MGNd55OukBGDG/NU/M/
 WRibJAhT8jMZJJFgMDfQYE8sY1O6EVFI=
X-Gm-Gg: AY/fxX4/uAYmJ0P31tIjE0+vnvajwgbv7gsf6+UCcb/ZFeO1b5QIDKey1BrdrrwKDL3
 4VK5MznTfC2kA+ca1Fc3r6up8MZhQckvvUf1SrTIiosa8yQS7AfQU1JLwJV7mXgr2rvhZFGMlE1
 pdiOvQm6kvyS1lwww1jai4QiOxd28UdIhGA/94MGV4179QAQdmgMiqwsFCLaLT2ZM/sfzXVqWB1
 0g45WoU1hlgq0dnGP18I5gIAs4iF+8h3ZCQKGYucAO227nQR281y+1JThFoCntr+LVb3rI=
X-Google-Smtp-Source: AGHT+IEGPnW4EwTUp3A829vD1GO0TzTgVLY+iwI74+BM2Tz7M/fU60H1Fcmb3pBuk5LZCBP6oB53syF9NeEsCsADr4E=
X-Received: by 2002:a05:7022:3f0b:b0:11b:ceee:a46d with SMTP id
 a92af1059eb24-121722b80c7mr5703504c88.15.1766227467772; Sat, 20 Dec 2025
 02:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20251219224140.1318253-1-bernd@kuhls.net>
 <20251219224140.1318253-14-bernd@kuhls.net>
In-Reply-To: <20251219224140.1318253-14-bernd@kuhls.net>
From: =?UTF-8?Q?Zolt=C3=A1n_Gyarmati?= <mr.zoltan.gyarmati@gmail.com>
Date: Sat, 20 Dec 2025 11:44:16 +0100
X-Gm-Features: AQt7F2qdETAFjLevEvORvRAv3cx7_WhWflHxtfFC4E5jQUSx9vX78u7vYKNGjag
Message-ID: <CA+LtECAyVkz5raF8-giotDMT3h1vn2z8cAH9gGQyQKP2ENYhyQ@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, 
 Simon Dawson <spdawson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766227468; x=1766832268; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Iqqfco3ZVBadmQBLkVTDSgPafZqELOs5crsvWZRF8k=;
 b=nMN7dRfiYzja7jJ7Mo4fdPMcjbFjIASyI20LGzH0W+N4voXU342DIR0C3lBFr07/B2
 pPHWp0jsyLNP4gcB7bGL2+5Q+rz8t4izSZmxhj3+TECNkLgR2k5lUMF+Tx11YY++vICd
 hNwVeGrdS5pRdOlfP48NXGSIRRs3uppOWLQTWe+L6xv2g7dBPU68+2Qqve1T6zAaiejE
 vNtiZJNpFrEEuHemIcmnPB7Itzt+DhwToNQRaBMi0uVBYNSnY3y1uAmc/8jfTFzEMBRI
 7ZK0b68EqtnhfiRWvgRdcn26tJGTVqbTzPMIqce9doUnLaNAp0ZObRY8FN4uYx7/sWjU
 YO3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nMN7dRfi
Subject: Re: [Buildroot] [PATCH v5 13/20] package/qjson: remove package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMTE6NDTigK9QTSBCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PiB3cm90ZToKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9mbGF2aW8vcWpzb24vY29tbWl0
LzZkMTg4Y2IxOTlhNTI0ODg4OTY4OWJkOTJiNzU3Y2YwYzE3Y2ZhMjcKPiAiVGhpcyBwcm9qZWN0
IGlzIGFyY2hpdmVkLiBRSnNvbiB3YXMgb3JpZ2luYWxseSBjcmVhdGVkIHdoZW4gUXQzIGFuZCBR
dDQKPiAgbGFja2VkIHJvYnVzdCBKU09OIHN1cHBvcnQuCj4KPiAgU2luY2UgUXQ1LCBKU09OIHN1
cHBvcnQgaXMgaW5jbHVkZWQgaW4gdGhlIG5hdGl2ZSBRdCBsaWJyYXJ5IFNESywgbWFraW5nCj4g
IHRoaXMgcHJvamVjdCBvYnNvbGV0ZS4iCj4KPiBUaGUgcGFja2FnZSBpcyBicm9rZW4gd2l0aCBj
bWFrZSA0IGFuZCBubyBvdGhlciBwYWNrYWdlIGRlcGVuZHMgb24gaXQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgpBY2tlZC1ieTogWm9sdGFuIEd5YXJt
YXRpIDxtci56b2x0YW4uZ3lhcm1hdGlAZ21haWwuY29tCj4gQ2M6IFpvbHRhbiBHeWFybWF0aSA8
bXIuem9sdGFuLmd5YXJtYXRpQGdtYWlsLmNvbT4KPiAtLS0KPiAgQ29uZmlnLmluLmxlZ2FjeSAg
ICAgICAgIHwgIDYgKysrKysrCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICB8ICAxIC0KPiAg
cGFja2FnZS9Db25maWcuaW4gICAgICAgIHwgIDEgLQo+ICBwYWNrYWdlL3Fqc29uL0NvbmZpZy5p
biAgfCAgOCAtLS0tLS0tLQo+ICBwYWNrYWdlL3Fqc29uL3Fqc29uLmhhc2ggfCAgMyAtLS0KPiAg
cGFja2FnZS9xanNvbi9xanNvbi5tayAgIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAgNiBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9xanNvbi9Db25maWcuaW4KPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcWpzb24vcWpzb24uaGFzaAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xanNvbi9x
anNvbi5tawo+Cj4gZGlmZiAtLWdpdCBhL0NvbmZpZy5pbi5sZWdhY3kgYi9Db25maWcuaW4ubGVn
YWN5Cj4gaW5kZXggMWU1NDkzMDQwNS4uNmFhY2UyY2ExMiAxMDA2NDQKPiAtLS0gYS9Db25maWcu
aW4ubGVnYWN5Cj4gKysrIGIvQ29uZmlnLmluLmxlZ2FjeQo+IEBAIC0xNDYsNiArMTQ2LDEyIEBA
IGVuZGlmCj4KPiAgY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBpbiAyMDI2LjAyIgo+
Cj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9RSlNPTgo+ICsgICAgICAgYm9vbCAicWpzb24gaGFzIGJl
ZW4gcmVtb3ZlZCIKPiArICAgICAgIHNlbGVjdCBCUjJfTEVHQUNZCj4gKyAgICAgICBoZWxwCj4g
KyAgICAgICAgIHFqc29uIHdhcyBkZXByZWNhdGVkIHVwc3RyZWFtIGFuZCBoYXMgYmVlbiByZW1v
dmVkCj4gKwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfT1BFTlRSQUNJTkdfQ1BQCj4gICAgICAgICBi
b29sICJvcGVudHJhY2luZy1jcHAgaGFzIGJlZW4gcmVtb3ZlZCIKPiAgICAgICAgIHNlbGVjdCBC
UjJfTEVHQUNZCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXgg
OTNmZjdjZWE0Yy4uYTkwNDE4OTBmNCAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIv
REVWRUxPUEVSUwo+IEBAIC0zNTI3LDcgKzM1MjcsNiBAQCBGOiAgICAgICAgcGFja2FnZS9saWJ1
c2IvCj4gIEY6ICAgICBwYWNrYWdlL2xpYnVzYi1jb21wYXQvCj4gIEY6ICAgICBwYWNrYWdlL3By
b2ovCj4gIEY6ICAgICBwYWNrYWdlL3B5dGhvbi1pbmlwYXJzZS8KPiAtRjogICAgIHBhY2thZ2Uv
cWpzb24vCj4gIEY6ICAgICBwYWNrYWdlL3F0Ni9xdDZjb3JlNWNvbXBhdC8KPiAgRjogICAgIHBh
Y2thZ2UvcXVhemlwLwo+ICBGOiAgICAgcGFja2FnZS9zaGFwZWxpYi8KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDRlYWE2ODk0ZTUu
LmJhNGVmY2M4YjIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNr
YWdlL0NvbmZpZy5pbgo+IEBAIC0zODEsNyArMzgxLDYgQEAgY29tbWVudCAiUVQgbGlicmFyaWVz
IGFuZCBoZWxwZXIgbGlicmFyaWVzIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL2dyYW50bGVl
L0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9rZjUvQ29uZmlnLmluIgo+ICAg
ICAgICAgc291cmNlICJwYWNrYWdlL3FleHRzZXJpYWxwb3J0L0NvbmZpZy5pbiIKPiAtICAgICAg
IHNvdXJjZSAicGFja2FnZS9xanNvbi9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2th
Z2UvcXVhemlwL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9xd3QvQ29uZmln
LmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3NpbXBsZS1tYWlsL0NvbmZpZy5pbiIKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9xanNvbi9Db25maWcuaW4gYi9wYWNrYWdlL3Fqc29uL0NvbmZp
Zy5pbgo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGFkYjA2Y2RkYzAuLjAwMDAw
MDAwMDAKPiAtLS0gYS9wYWNrYWdlL3Fqc29uL0NvbmZpZy5pbgo+ICsrKyAvZGV2L251bGwKPiBA
QCAtMSw4ICswLDAgQEAKPiAtY29uZmlnIEJSMl9QQUNLQUdFX1FKU09OCj4gLSAgICAgICBib29s
ICJxanNvbiIKPiAtICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUVQ1Cj4gLSAgICAgICBo
ZWxwCj4gLSAgICAgICAgIFFKc29uIGlzIGEgUXQtYmFzZWQgbGlicmFyeSB0aGF0IG1hcHMgSlNP
TiBkYXRhIHRvCj4gLSAgICAgICAgIFFWYXJpYW50IG9iamVjdHMgYW5kIHZpY2UgdmVyc2EuCj4g
LQo+IC0gICAgICAgICBodHRwOi8vcWpzb24uc291cmNlZm9yZ2UubmV0Cj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcWpzb24vcWpzb24uaGFzaCBiL3BhY2thZ2UvcWpzb24vcWpzb24uaGFzaAo+IGRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGFiMjIzNTBlNjEuLjAwMDAwMDAwMDAKPiAt
LS0gYS9wYWNrYWdlL3Fqc29uL3Fqc29uLmhhc2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMyAr
MCwwIEBACj4gLSMgbG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIGU4MTI2MTc0NzdmM2MyYmI5
OTA1NjE3NjdhNGNkOGIxZDM4MDNhNTIwMThkNDg3OGRhMzAyNTI5NTUyNjEwZDQgIHFqc29uLTAu
OS4wLnRhci5nego+IC1zaGEyNTYgIDc1OGEwY2Q0OGQyYmVjNTljYmQwNGFiNjE2NzM3YjdhYTBj
ZGNlYWM4NzUwOGFkYmM5NDY4NzE1YWM5MDcyMmIgIENPUFlJTkcubGliCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcWpzb24vcWpzb24ubWsgYi9wYWNrYWdlL3Fqc29uL3Fqc29uLm1rCj4gZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggNzE4ZDY2MjJhOC4uMDAwMDAwMDAwMAo+IC0tLSBh
L3BhY2thZ2UvcWpzb24vcWpzb24ubWsKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMTQgKzAsMCBA
QAo+IC0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+IC0jCj4gLSMgcWpzb24KPiAtIwo+IC0jIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+IC0KPiAtUUpTT05fVkVSU0lPTiA9IDAuOS4wCj4gLVFKU09O
X1NJVEUgPSAkKGNhbGwgZ2l0aHViLGZsYXZpbyxxanNvbiwkKFFKU09OX1ZFUlNJT04pKQo+IC1R
SlNPTl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtUUpTT05fREVQRU5ERU5DSUVTID0gcXQ1YmFz
ZQo+IC1RSlNPTl9MSUNFTlNFID0gTEdQTC0yLjEKPiAtUUpTT05fTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcubGliCj4gLQo+IC0kKGV2YWwgJChjbWFrZS1wYWNrYWdlKSkKPiAtLQo+IDIuNDcuMwo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
