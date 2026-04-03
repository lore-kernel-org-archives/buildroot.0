Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332F8E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 18:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA6FE6114C;
	Fri,  3 Apr 2026 18:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mZivrerPXLr; Fri,  3 Apr 2026 18:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 668E5610E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775239398;
	bh=kEWN+5ZdlgaPfyeKi8Wy/3EziE83tiBQnz/RfrPs7Tk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i1EmsfmYq2ayRkYs9gPWELb1khDYKu0jAuytYGZ5dSvsxEsjKkvJRq1UvdaUTgJbR
	 hNkV9mnvRBUZm0gQnYQiTmjQYPRG0x2F0EVsZpYKHsM63q0VQUPPsExD7k0uVzwCvb
	 RdIUfEUJoJjiYd2/7XD0avAWno8CuEMiUGoZvufbxjDH9dnLpzgCNkymH05mnEo6T8
	 g9jtU/t2PVYQ9ygmaXZy4PDnuiDEiJWU20/EaYJ6OIkMJu/0H0kEv55xkG3i8maitZ
	 hDH0diwFvo7dvmxMoCXRpEbG5pQUyoaeztB6D6y8Zahf7dj6tcId4eQi3H//8CDlee
	 X5xWAApA3JmCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 668E5610E6;
	Fri,  3 Apr 2026 18:03:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F0F1AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5654E40229
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IEgv-qUspgk for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 18:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 08C8640226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C8640226
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08C8640226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:03:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 082662003DE;
 Fri,  3 Apr 2026 20:03:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 20:03:09 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 20:03:09 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <6b1475adada2414a1bdf9321c4352be6@free.fr>
References: <20260403-openscap_bump-v2-1-dd4242ff402e@bootlin.com>
 <6b1475adada2414a1bdf9321c4352be6@free.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <23497d25f46611f800f019eebbad6ca3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775239393;
 bh=6FN3q0jDrFnKECLdcOnUziWp+wP62BZcJVfEMZ/fTr8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bRUTzGwNfG0ErnveWII+DTCY8xcwYnqZT6kk6mSM+EhRznmJvAMeN9/Ct2zezf59v
 oq+unTiRQlICLW0GhiQb15pebxbzgulI3qXNrnldjjDow8dT0p2lNNqOrh9COUTbYe
 24HffGsmXjdUXWnKrZwng38bBNwUNQpqm/t/ZYuIzGNxmBLDcTusL0E8ncByYhtAJH
 ohOf62ILwrwXgZofPtT/Ugb7Uw91pKXUnKmwv0kEEa+hYH79d1av2RYkfY3o7Fxtyk
 ZrSP14dcSCyzZK2Igs+rjSf0H4Yl9iCTzAA5corxL8dGdDXSW6yZ/CjA5E61rPtSdU
 3mJeAQf7CidNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bRUTzGwN
Subject: Re: [Buildroot] [PATCH v2] package/openscap: bump to version 1.4.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMDQvMjAyNiAxOTo1NiwgSnVsaWVuIE9saXZhaW4gdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBPbiAwMy8wNC8yMDI2IDE0OjM4LCBBbGV4aXMgTG90aG9yw6kgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPj4gVGhlIGN1c3RvbSBwYXRjaCB0byBlbmZvcmNlIHByb2plY3QgYXMgQyBwcm9qZWN0IGhh
cyBiZWVuIG1lcmdlZCAKPj4gdXBzdHJlYW0KPj4gc2luY2UgdGhlbiwgYnV0IGl0IGlzIG5vdCBy
ZWxlYXNlZCB5ZXQuIFRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIHBhdGNoIAo+PiB0bwo+PiBhcHBs
eSBpdCBvbiB0b3Agb2YgMS40LjMsIGFuZCB1c2UgdGhlIG9wcG9ydHVuaXR5IHRvIGZpeCB0aGUg
cGF0Y2ggCj4+IGZpbGUKPj4gbmFtZSB0byBtYXRjaCB0aGUgY29tbWl0IHRpdGxlLgo+PiAKPj4g
U2luY2UgdmVyc2lvbiAxLjQuMCwgb3BlbnNjYXAgZGVwZW5kcyBvbiBQQ1JFMiByYXRoZXIgdGhh
biBQQ1JFCj4+IAo+PiBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNjYXAvY29tcGFy
ZS8xLjMuMTIuLi4xLjQuMwo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxh
bGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LiBGb3IgaW5mbywgSSByZW1vdmVkIHRoZQo+ICJzZWxlY3QgQlIyX1BBQ0tBR0VfUENSRV9VVEYi
IGluIENvbmZpZy5pbiwgd2hpY2ggd2FzIGdlbmVyYXRpbmcgYQo+IEtjb25maWcgd2FybmluZy4g
VGhpcyBjb21wbGV0ZXMgdGhlIHN3aXRjaCB0byBwY3JlMi4gU2VlOgo+IGh0dHBzOi8vZ2l0bGFi
LmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9jZThmOTA1YmFjMjE4NGJkZmM0
NjZiMDcyZDJlNWNjNWJiZDFlMTQ5CgpGb3IgaW5mbywgSSBhcHBsaWVkIHRoZSB2MSBvZiB0aGUg
cGF0Y2guIFNvcnJ5IGFib3V0IHRoYXQuCgo+IEJlc3QgcmVnYXJkcywKPiAKPiBKdWxpZW4uCgpK
dWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
