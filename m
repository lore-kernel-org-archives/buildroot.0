Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5877EC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 09:14:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CA061104
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 09:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0CA061104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B509605E9;
	Sat,  7 Aug 2021 09:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dx6KxzvAI8JL; Sat,  7 Aug 2021 09:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4541605BE;
	Sat,  7 Aug 2021 09:14:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD3751BF5E0
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 09:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9B518378A
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 09:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0xBfRfoNCMB for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 09:13:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA7478249E
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 09:13:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5EBB413F8AE;
 Sat,  7 Aug 2021 11:13:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628327635;
 bh=rVu7eeEv25ZF6dO4prmEtSVcdnA41SXz723J/lnnNXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZepLeCzu/9IUDl5RrTjdfarzJnpAj9eze2ZwafIZPABPM4lMnHXqr3qLdOOlhOt5r
 mcfRWCC1cBd60d4MeL1dm5ZJRYUAIISL35gmQZBGlp0dQf2Jj2JDN7y7dyAazRxEHF
 ygVd0PhcLbp6R5PpaYom5/5vEHY7ZmUYeamn7OAnLhQUuniMU1XE4/5KENR+r9zFEY
 xepECFVFT6x8oYWGp6uc94siRrIBHI9fE8tkdqGEHZRe8bJMzO+1nTdzNdsGRb/mu1
 QzYs7JUeeNBLTw+OthOUNFCbEO/o4SloBfLDVnnP1QAy47CxJmgGYNpzFpqE8rgRNS
 kCaBTdzswZIuA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 11:13:47 +0200
Date: Sat, 7 Aug 2021 11:13:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
Message-ID: <20210807091347.GX27036@scaer>
References: <20210804134635.262095-1-francois.perrad@gadz.org>
 <379b58ad-76ee-8601-d5b6-8a6cdf294818@mind.be>
 <CAB0FRstwhGpbUDDKzDR2AgR9DCbC+QwRd2oEAJ+kTSubcdr9vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB0FRstwhGpbUDDKzDR2AgR9DCbC+QwRd2oEAJ+kTSubcdr9vQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/2] package/lua-lunix: fix build with
 recent gcc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot <buildroot@busybox.net>, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIxLTA4LTA3IDEwOjU1ICswMjAwLCBGcmFuw6dvaXMgUGVy
cmFkIHNwYWtlIHRodXNseToKPiBMZcKgamV1LiA1IGFvw7t0IDIwMjEgw6DCoDE5OjA1LCBBcm5v
dXQgVmFuZGVjYXBwZWxsZSA8IFsxXWFybm91dEBtaW5kLmJlPiBhIMOpY3JpdMKgOgpbLS1TTklQ
LS1dCj4gICDCoFVubGVzcyB0aGlzIHBhdGNoIGlzIGFjY2VwdGVkIHVwc3RyZWFtICh1bmxpa2Vs
eSwgZ2l2ZW4gdGhhdCB0aGVyZSB3YXMgbm8KPiAgIG1haW50YWluZXIgYWN0aXZpdHkgb24gWzFd
IHNpbmNlIG1vcmUgdGhhbiBhIG1vbnRoKSwgYSBtdWNoIGJldHRlciB3YXkgSU1ITyBpcwo+ICAg
dG8gc2V0IGl0IGZyb20gdGhlIC5tayBmaWxlOgo+IAo+ICAgTFVBX0xVTklYX0JVSUxEX09QVFMg
PSBDRkxBR1M9IiQoVEFSR0VUX0NGTEFHUykgLURIQVZFX1NZU19TWVNDVExfSD0wIgo+IAo+IEl0
IGxvb2tzIGVsZWdhbnQgYnV0IGl0IGRvZXNuJ3Qgd29yaywgYmVjYXVzZSBDRkxBR1MgaXMgYWxy
ZWFkeSBzZXQgaW4gWzZdcGtnLWx1YXJvY2tzLm1rCgpJIHdvdWxkIGFyZ3VlIHRoYXQgbHVhIHBh
Y2thZ2VzIHNob3VsZCBoYXZlIGEgd2F5IHRvIHByb3ZpZGUgdGhlaXIgb3duCkNGTEFHUyB0aGF0
IHdvdWxkIGJlIGFibGUgdG8gb3ZlcnJpZGUgc2V0dG5nLCBwcm9iYWJseSBzb21ldGhpbmcgbGlr
ZToKCiAgICBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctbHVhcm9ja3MubWsgYi9wYWNrYWdlL3Br
Zy1sdWFyb2Nrcy5tawogICAgaW5kZXggZmQ3OTg1NTg3OC4uNDIzMDc4M2FmMCAxMDA2NDQKICAg
IC0tLSBhL3BhY2thZ2UvcGtnLWx1YXJvY2tzLm1rCiAgICArKysgYi9wYWNrYWdlL3BrZy1sdWFy
b2Nrcy5tawogICAgQEAgLTExNyw3ICsxMTcsNyBAQCBkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdF
VF9DTURTCiAgICAgCQkJTFVBX0xJQkRJUj0iJCQoU1RBR0lOR19ESVIpL3Vzci9saWIiIFwKICAg
ICAJCQlDQz0kJChUQVJHRVRfQ0MpIFwKICAgICAJCQlMRD0kJChUQVJHRVRfQ0MpIFwKICAgIC0J
CQlDRkxBR1M9IiQkKExVQVJPQ0tTX0NGTEFHUykiIFwKICAgICsJCQlDRkxBR1M9IiQkKExVQVJP
Q0tTX0NGTEFHUykgJCQoJCgyKV9MVUFST0NLU19DRkxBR1MpIiBcCiAgICAgCQkJTElCRkxBRz0i
LXNoYXJlZCAkJChUQVJHRVRfTERGTEFHUykiIFwKICAgICAJCQkkJCgkKDIpX0JVSUxEX09QVFMp
ICQkKCQoMilfUk9DS1NQRUMpCiAgICAgZW5kZWYKCkNvdWxkIHlvdSBwbGVhc2UgaGF2ZSBhIGxv
b2sgaW50byB0aGlzPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gVGhlIGZpbGUgbHVuaXgt
MjAxNzA5MjAtMS5yb2Nrc3BlYyBpcyBub3QgYSBwYXJ0IG9mIHRoZSB1cHN0cmVhbSBwcm9qZWN0
ICgKPiBbN11odHRwczovLzI1dGhhbmRjbGVtZW50LmNvbS9+d2lsbGlhbS9wcm9qZWN0cy9yZWxl
YXNlcy9sdW5peC0yMDE3MDkyMC50Z3ogb3IgWzhdaHR0cHM6Ly9naXRodWIuY29tL3dhaGVybi9s
dW5peCkuCj4gSXQgd2FzIGNyZWF0ZWQgYnkgdGhlIGF1dGhvciBvZiBMdWFyb2NrcyBwYWNrYWdl
LCBpdCBpcyBvbmx5IGF2YWlsYWJsZSBvbiBbOV1odHRwczovL2x1YXJvY2tzLm9yZy9tb2R1bGVz
L2RhdXJuaW1hdG9yL2x1bml4Cj4gU28sIG15IHBhdGNoIGNhbm5vdCBiZSB1cHN0cmVhbWVkLCBi
dXQgaXQgaXMgY3VycmVudGx5IHRoZSBvbmx5IHdheSB0byBkby4KPiAKPiBGcmFuw6dvaXMKPiDC
oAo+IAo+ICAgKFRoaXMgbWF5IG5vdCB3b3JrIHRob3VnaCwgZGVwZW5kaW5nIG9uIHRoZSBvcmRl
ciBvZiB0aGUgZmxhZ3MgYWRkZWQgYnkgbHVhcm9ja3MuKQo+IAo+ICAgwqBSZWdhcmRzLAo+ICAg
wqBBcm5vdXQKPiAKPiAgID4gKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoAo+ICAgfTsKPiAgID4gKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB9Owo+ICAgPiArK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IH07Cj4gICA+ICsrwqAgwqAgwqAgwqAgwqAgwqAgfTsKPiAgID4gK8KgIMKgIMKgfTsKPiAgID4g
KyB9Cj4gICA+ICstLQo+ICAgPiArMi4zMC4yCj4gICA+ICsKPiAgID4KPiAgIF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gICBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gICBbMTBdYnVpbGRyb290QGJ1c3lib3gubmV0Cj4gICBbMTFdaHR0cDovL2xpc3Rz
LmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gTGlua3M6Cj4gMS4g
bWFpbHRvOmFybm91dEBtaW5kLmJlCj4gMi4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvNzQ5YTExZDUyODljNmZlYzNiMmYyMzZiOTA3M2ZjMWFiNzMwZDA5MC8KPiAzLiBt
YWlsdG86ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnCj4gNC4gbWFpbHRvOmZyYW5jb2lzLnBlcnJh
ZEBnYWR6Lm9yZwo+IDUuIG1haWx0bzpmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmcKPiA2LiBodHRw
Oi8vcGtnLWx1YXJvY2tzLm1rCj4gNy4gaHR0cHM6Ly8yNXRoYW5kY2xlbWVudC5jb20vfndpbGxp
YW0vcHJvamVjdHMvcmVsZWFzZXMvbHVuaXgtMjAxNzA5MjAudGd6Cj4gOC4gaHR0cHM6Ly9naXRo
dWIuY29tL3dhaGVybi9sdW5peAo+IDkuIGh0dHBzOi8vbHVhcm9ja3Mub3JnL21vZHVsZXMvZGF1
cm5pbWF0b3IvbHVuaXgKPiAxMC4gbWFpbHRvOmJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+IDExLiBo
dHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1c3lib3gubmV0Cj4gaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
