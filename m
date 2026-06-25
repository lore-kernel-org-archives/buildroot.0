Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF8CDE00B
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 23:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D240F60A6B;
	Thu, 25 Jun 2026 23:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-Z7T7ggzWLE; Thu, 25 Jun 2026 23:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00BAE60A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782429179;
	bh=gUN1ALnzzIGb055TvHr1VprKY2j3d4AG+RO3hrI4mOw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eyX0kGqzOfjOPsC9yk2QLV5eogOwPugpOyMm7zY+b+BX0/FIKxCSngOSiD7gcGpOU
	 JfYDlln8vHWHHd0IiRoWPBEBLayttnOlfpGzt4DKEs5NH795SgCerRNXtIGgRmFPwb
	 NlhOsRUwE9mQhsjgAXe1we8QDNRltNuS7BHG9UQ3TKsaB3Zs/O52Aa9zsqqnocEzLy
	 OF7WqRxg4ddRjQxK6oNMlXGAA17hxxoKBS2RYo9LbaeL7OlBJwBNTzKqQRsBpGs49d
	 wm4iBdv4m6fQsib3S+2G0eDkIq4cu/gbpgmStB2SHLZjOSprsXdLKCM9wiSUAOz3xt
	 +S4/1uFqtqlsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00BAE60A41;
	Thu, 25 Jun 2026 23:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ED17231
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C1C040EB8
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDIWiEwDf57x for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 23:12:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1D4340EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1D4340EB6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1D4340EB6
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 23:12:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJV6-1x6yrz2YwI-00pKCi; Fri, 26
 Jun 2026 01:12:53 +0200
Message-ID: <da125651-67b4-4333-b722-ad7897e7d3da@gmx.de>
Date: Fri, 26 Jun 2026 01:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260625212406.3148001-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260625212406.3148001-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:2QLVagiOz57c+TgkScVskgmIp0BMT4m22IAKhPOmcVJ4MxZRJkZ
 TA/sK7cP0sUnbnizV3EV5Fzq8LUf/2GASdogtMbEFG0mKP8AhHlW+nMV0ir+snefDWOc4ra
 5QLrQg/nO+38suGFHFO1ZAeas3pxOpktJg2eJraasw3NdtKzxxI8sFkJinM3z80/3QeBDq8
 WujN+GAbngz/3UpUedh0A==
UI-OutboundReport: notjunk:1;M01:P0:4i74DeKc1QQ=;MbAryRTfTSsgPayvE5zc2MInRZ3
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782429173; x=1783033973; i=fiona.klute@gmx.de;
 bh=5tLJZVeXkFqgvYyP4OK9+u3Ppp3a1qFGNci+RJRB7r8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KVtPcxAzA83gOW8z3D4mMTn4EaEcQha5t7O3gC/Q21dPc4alNLEQFEy7vP3tu6gx
 7JJYb+XFBXAMms5mIg7Ac89CD0NBQWUe6DciH7bCIrW7l7fMVTzPe+yuuojLQVuo8
 5iE2bbLNu/m8q8NH0I5yK6vveppbw2tP0cCIwBcSvAkYzvBTyrkqrZHbjVpgnbk1W
 kN+t0/3WM4pk4Lp+00wpJmCJKH4UUy/ny5E8LUxYmHMBfDcQHfT1X3jyFgtFdJVTO
 2rJmfG32ISY4hIBch1GeIxHgj9Lpf+Opd0MTOtoXyC7fU5JYxqFqMuVRbLaaF5u3E
 2s+5XnTRZ0Co7tYBEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KVtPcxAz
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMjUuMDYuMjYgdW0gMjM6MjQgc2NocmllYiBCZXJuZCBLdWhsczoKPiBodHRwczovL2dpdGh1
Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvYmxvYi9SXzJfOF8yL2V4cGF0L0NoYW5nZXMKPiBodHRw
czovL2Jsb2cuaGFydHdvcmsub3JnL3Bvc3RzL2V4cGF0LTItOC0yLXJlbGVhc2VkLwo+IAo+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgQ1ZFczoKPiAKPiAgICAgIENWRS0yMDI2LTUwMjE5IOKAlCBtaXNz
aW5nIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgY2hlY2tzCj4gICAgICBDVkUtMjAyNi01NjEzMSDi
gJQgbWlzc2luZyBjb250cm9sIGZsb3cgaW50ZWdyaXR5IGNoZWNrcwo+ICAgICAgQ1ZFLTIwMjYt
NTYxMzIg4oCUIG91dC1vZi1ib3VuZHMgd3JpdGUKPiAgICAgIENWRS0yMDI2LTU2NDAzIOKAlCBp
bnRlZ2VyIG92ZXJmbG93Cj4gICAgICBDVkUtMjAyNi01NjQwNCDigJQgaW50ZWdlciBvdmVyZmxv
dwo+ICAgICAgQ1ZFLTIwMjYtNTY0MDUg4oCUIGludGVnZXIgb3ZlcmZsb3cKPiAgICAgIENWRS0y
MDI2LTU2NDA2IOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAgICBDVkUtMjAyNi01NjQwNyDigJQg
aW50ZWdlciBvdmVyZmxvdwo+ICAgICAgQ1ZFLTIwMjYtNTY0MDgg4oCUIGludGVnZXIgb3ZlcmZs
b3cKPiAgICAgIENWRS0yMDI2LTU2NDA5IOKAlCBpbnRlZ2VyIG92ZXJmbG93Cj4gICAgICBDVkUt
MjAyNi01NjQxMCDigJQgaW50ZWdlciBvdmVyZmxvdwo+ICAgICAgQ1ZFLTIwMjYtNTY0MTEg4oCU
IGludGVnZXIgb3ZlcmZsb3cKPiAgICAgIENWRS0yMDI2LTU2NDEyIOKAlCBtaXNzaW5nIGNvbnRy
b2wgZmxvdyBpbnRlZ3JpdHkgY2hlY2tzCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMg
PGJlcm5kQGt1aGxzLm5ldD4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFuayB5b3UhCgo+IC0tLQo+
ICAgcGFja2FnZS9leHBhdC9leHBhdC5oYXNoIHwgNCArKy0tCj4gICBwYWNrYWdlL2V4cGF0L2V4
cGF0Lm1rICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9leHBhdC9leHBhdC5oYXNoIGIv
cGFja2FnZS9leHBhdC9leHBhdC5oYXNoCj4gaW5kZXggNWQzNGFkZmM4ZC4uMjA4NzEzMzM4MiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lmhhc2gKPiArKysgYi9wYWNrYWdlL2V4
cGF0L2V4cGF0Lmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBGcm9tIGh0dHBzOi8vZ2l0aHVi
LmNvbS9saWJleHBhdC9saWJleHBhdC9yZWxlYXNlcy90YWcvUl8yXzhfMQo+IC1zaGEyNTYgIDEw
YjE5NWVlNzgxNjBhOTA4Mzg4MTgwYThmZTM2MDNkNGU5YTEyZjQ3NTVmYmY1ZjM4MTZiMjNhOWQ3
NTBkYTAgIGV4cGF0LTIuOC4xLnRhci54ego+ICsjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL2xp
YmV4cGF0L2xpYmV4cGF0L3JlbGVhc2VzL3RhZy9SXzJfOF8yCj4gK3NoYTI1NiAgM2FkODliODU4
OGU2NjQ0YmQ0ZTQ5OTgxNDgwZDQ4YjIxMjg5ZWViYmNkNGYwYTFhNGFmYjFjMjlmOTliNmFiNCAg
ZXhwYXQtMi44LjIudGFyLnh6Cj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICAgc2hhMjU2ICAz
MWIxNWRlODJhYTE5YTg0NTE1NjE2OWExN2E1NDg4YmY1OTdlNTYxYjJjMzE4ZDE1OWVkNTgzMTM5
YjI1ZTg3ICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXhwYXQvZXhwYXQubWsgYi9w
YWNrYWdlL2V4cGF0L2V4cGF0Lm1rCj4gaW5kZXggM2I1MjljMzM5MC4uZmIyNWE0YTQ3YiAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lm1rCj4gKysrIGIvcGFja2FnZS9leHBhdC9l
eHBhdC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiAgIAo+IC1FWFBBVF9WRVJTSU9OID0gMi44LjEKPiArRVhQQVRfVkVSU0lPTiA9IDIuOC4y
Cj4gICBFWFBBVF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3Jl
bGVhc2VzL2Rvd25sb2FkL1JfJChzdWJzdCAuLF8sJChFWFBBVF9WRVJTSU9OKSkKPiAgIEVYUEFU
X1NPVVJDRSA9IGV4cGF0LSQoRVhQQVRfVkVSU0lPTikudGFyLnh6Cj4gICBFWFBBVF9JTlNUQUxM
X1NUQUdJTkcgPSBZRVMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
