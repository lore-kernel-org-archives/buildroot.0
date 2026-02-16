Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB02E63F3D
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 13:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E6DE82316;
	Mon, 16 Feb 2026 13:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrK4ilzZ2qzm; Mon, 16 Feb 2026 13:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7003082323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771249119;
	bh=mY5bfIx7+P7WWJ5QO2ZVsanTceRhqyk2b82KPCXXgKQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qXKBUtfxATXkG93k5caywI30HRRwAgDZ2SR+Ry+zz1u9gucN+Ig2DX8laPGEO//Sv
	 8JO8dm3k7r8mNk0bL2VZBrM3MqENVLFYBcF0NG5Sps69BHux90jtaHwTt5hPPCUzv+
	 NshbVuvgOnegk0G3Qn9DcWNzmqRksFv1ACHQeywfk3Or/l0LJ8eiUvZGZyQS8iwY2x
	 IJBXnIq8dan0MAZL9+T6JjGYcShPcHi3H2G2VWQUVuLN83D1TGM/9cEtPK5pt1K7Rq
	 hWT8bPyNgXL4W1UiqJ8FE5iuaGQ1p+WQcTz1w/6TIY4gqz/7d/JKOndAHwMk1EvyQI
	 hNNH5hMKSk7vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7003082323;
	Mon, 16 Feb 2026 13:38:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5520135B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4656D40784
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 13:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2bwuhAMz7_6 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 13:38:37 +0000 (UTC)
X-Greylist: delayed 77193 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Feb 2026 13:38:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A73414076B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A73414076B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A73414076B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 13:38:34 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 98FE1C1252;
 Mon, 16 Feb 2026 14:38:31 +0100 (CET)
Message-ID: <03426961-94c3-49c9-a597-930d8dbbec61@grenoble.cnrs.fr>
Date: Mon, 16 Feb 2026 14:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
References: <41b16985-1bcd-46a7-8b85-30161dab2937@grenoble.cnrs.fr>
Content-Language: en-US, fr
In-Reply-To: <41b16985-1bcd-46a7-8b85-30161dab2937@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1771249111;
 bh=oXrnPCkc6/KOPDpm72Eh8ZL8L+GJxqvR02w/S37Cdfc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=guL0B2SsT73sEAVBE9Gj1jN6uYt3K8dpNHYKacyivaEn0qXYqo4Vs9GmJnJrmyjVH
 E1JtrWZlCgVqHni/JyO4pwT7FsE0gjS1eaKdLYBOqtW/S7jA3HraSnQdT21jAA3qmN
 72th69illo+hlVv+EMLPYBHBp2d6MaI2tOunFYw0hO4D+mDSaUEXT6A+JpYv84Y5s5
 KI1SbIqstDx7vJWmmzewZNh2ZRKzSBskCZQK6ct1yYKHZO7pH8vR+m4xgqxp6zgzWa
 cIvZeWLbAtzvYwpV8Ppuj5ijRNoyw9K3tUezxmdeN+ZC5jojv+a3/tYp4muVAEYQ80
 qe2eoZv9mj0sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=guL0B2Ss
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: remove
 at91bootstrap3 licence
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpPbiAyMDI2LTAyLTA4LCBJIHdyb3RlOgo+IFdoZW4gdXNpbmcgYSBzcGVjaWZpYyBn
aXQgcmVwbyBhbmQgdmVyc2lvbiBmb3IgYXQ5MWJvb3RzdHJhcDMsCj4gQlIyX1RBUkdFVF9BVDkx
Qk9PVFNUUkFQM19MSUNFTlNFX0ZJTEVTIGRlZmF1bHRzIHRvICJMSUNFTlNFUy9NSVQudHh0Ii4K
PiBIb3dldmVyIHRoZSBnaXQgdmVyc2lvbiB3ZSB1c2UgKG5hbWVseSB2My4xMC4zKSBkb2VzIG5v
dCBwcm92aWRlIHRoaXMKPiBmaWxlLiBBY3R1YWxseSwgaXQgZG9lcyBub3QgcHJvdmlkZSBhIGxp
Y2VuY2UgZmlsZSBhdCBhbGwuIFRoaXMgY2F1c2VzCj4g4oCYbWFrZSBsZWdhbC1pbmZv4oCZIHRv
IGZhaWwgd2l0aDoKPiAKPj4+PiBhdDkxYm9vdHN0cmFwMyB2My4xMC4zIENvbGxlY3RpbmcgbGVn
YWwgaW5mbwo+IHNoYTI1NnN1bTogL2J1aWxkcy9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9vdXRw
dXQvYnVpbGQvYXQ5MWJvb3RzdHJhcDMtdjMuMTAuMy9MSUNFTlNFUy9NSVQudHh0OiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5Cj4gRVJST1I6IHdoaWxlIGNoZWNraW5nIGhhc2hlcyBmcm9tIGJv
b3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMuaGFzaAo+IEVSUk9SOiBMSUNFTlNFUy9N
SVQudHh0IGhhcyB3cm9uZyBzaGEyNTYgaGFzaDoKPiBFUlJPUjogZXhwZWN0ZWQ6IDVhMzgwOWIx
YzJiYTEzYjcyNDI1NzIzMjI5NTEzMTFjNTg0NDE5ZjFmODUxNmY2NjVkNmMwNmYwNjY4ZDc4ZGUK
PiBFUlJPUjogZ290ICAgICA6Cj4gRVJST1I6IEluY29tcGxldGUgZG93bmxvYWQsIG9yIG1hbi1p
bi10aGUtbWlkZGxlIChNSVRNKSBhdHRhY2sKClRoaXMgaXNzdWUgYWZmZWN0cyBlaWdodCBvdGhl
ciBkZWZjb25maWdzLCBuYW1lbHk6CgogKiBhY21lc3lzdGVtc19hcmlhX2cyNV97MTI4LDI1Nn1t
Yl9kZWZjb25maWcKICogYWNtZXN5c3RlbXNfYXJpZXR0YV9nMjVfezEyOCwyNTZ9bWJfZGVmY29u
ZmlnCiAqIGF0OTFzYW05eDVla3ssX21tY317LF9kZXZ9X2RlZmNvbmZpZwoKVGhleSBhcmUgYWxs
IGZhaWxpbmcgd2l0aCB0aGUgc2FtZSBlcnJvciBvbiB0aGUgR2l0bGFiIENJLiBBbGwgdGhlc2UK
ZmFpbHVyZXMgY291bGQgYmUgZml4ZWQgYnkgYWRkaW5nCgogICAgQlIyX1RBUkdFVF9BVDkxQk9P
VFNUUkFQM19MSUNFTlNFX0ZJTEVTPSIiCgpsaWtlIGluIHRoaXMgcGF0Y2guIEkgYW0gYWRkaW5n
IHRoZSBtYWludGFpbmVycyBvZiB0aGVzZSBkZWZjb25maWdzIGFzCkNjIHRvIHRoaXMgbWVzc2Fn
ZS4KClJlZ2FyZHMsCgpFZGdhciBCb25ldC4KCj4gTGV0J3MgYmUgZXhwbGljaXQgdGhhdCB0aGVy
ZSBpcyBubyBsaWNlbmNlIGZpbGUgdG8gY2hlY2suCj4gCj4gRml4ZXM6Cj4gIC0gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjk5MjgxNTM4Ngo+ICAt
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTI5OTI4
MTUzOTAKPiBTaWduZWQtb2ZmLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5m
cj4KPiAtLS0KPiAgY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8yNTZtYl9kZWZjb25maWcg
fCAxICsKPiAgY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV81MTJtYl9kZWZjb25maWcgfCAx
ICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
Y29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8yNTZtYl9kZWZjb25maWcgYi9jb25maWdzL2Fj
bWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2RlZmNvbmZpZwo+IGluZGV4IGNhNGJhMjdhMjguLmYy
YWI2NjYzMWYgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9hY21lc3lzdGVtc19hY3F1YV9hNV8yNTZt
Yl9kZWZjb25maWcKPiArKysgYi9jb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzI1Nm1iX2Rl
ZmNvbmZpZwo+IEBAIC0yMyw2ICsyMyw3IEBAIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDM9eQo+
ICBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9HSVQ9eQo+ICBCUjJfVEFSR0VUX0FU
OTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1VSTD0iaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNh
bS9hdDkxYm9vdHN0cmFwLmdpdCIKPiAgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01f
UkVQT19WRVJTSU9OPSJ2My4xMC4zIgo+ICtCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xJQ0VO
U0VfRklMRVM9IiIKPiAgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19ERUZDT05GSUc9ImFjcXVh
LTI1Nm0iCj4gIEJSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15Cj4gIEJSMl9QQUNLQUdFX0hP
U1RfR0VOSU1BR0U9eQo+IGRpZmYgLS1naXQgYS9jb25maWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1
XzUxMm1iX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVm
Y29uZmlnCj4gaW5kZXggMjQwZGZjNDZiNi4uMTcyZWFlZjM5ZiAxMDA2NDQKPiAtLS0gYS9jb25m
aWdzL2FjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1iX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3Mv
YWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWJfZGVmY29uZmlnCj4gQEAgLTIzLDYgKzIzLDcgQEAg
QlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQMz15Cj4gIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNf
Q1VTVE9NX0dJVD15Cj4gIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJM
PSJodHRwczovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAuZ2l0Igo+ICBCUjJf
VEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1ZFUlNJT049InYzLjEwLjMiCj4gK0JS
Ml9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfTElDRU5TRV9GSUxFUz0iIgo+ICBCUjJfVEFSR0VUX0FU
OTFCT09UU1RSQVAzX0RFRkNPTkZJRz0iYWNxdWEtNTEybSIKPiAgQlIyX1BBQ0tBR0VfSE9TVF9E
T1NGU1RPT0xTPXkKPiAgQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
