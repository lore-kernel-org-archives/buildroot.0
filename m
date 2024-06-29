Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72D7C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 10:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 446B081EE0;
	Sat, 29 Jun 2024 10:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQvXkjyD6cFL; Sat, 29 Jun 2024 10:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1E0881B04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E0881B04;
	Sat, 29 Jun 2024 10:40:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 313321BF380
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 10:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D15F405E7
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 10:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5xySYIxELgg for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 10:40:52 +0000 (UTC)
X-Greylist: delayed 541 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 29 Jun 2024 10:40:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFB1240476
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFB1240476
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFB1240476
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 10:40:51 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:a5fd:d515:41dc:59b0] (unknown
 [IPv6:2a01:e0a:12:eba0:a5fd:d515:41dc:59b0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 47C0BBFB1A
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 12:31:46 +0200 (CEST)
Message-ID: <8b78273f-c47c-4810-8a49-eed4e79f86ad@grenoble.cnrs.fr>
Date: Sat, 29 Jun 2024 12:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1719657106;
 bh=nrog7OH3k1/dj4Exvrhii49TvECKOaG6slfRbzF2CKg=;
 h=Date:Subject:To:From:From;
 b=F19YSzFd3289hRjnK0qtCDdymsLAsjWAuV5mHprUBTSaNhZ51VG071wyMIBUXERUr
 bffUbBJxtxvaLuBjtUZPTHZU5suGOqp5gaFhCUtow9OKMmgb2hSF+GIJHpz99zb5ko
 sS2/buC4pV8EuebqQxsqe55Uf1umlhE/Xp9HB0n3adQY47jqJqXvO1Vd3tBOQSagR2
 FwiPL6YLPDDbl52QUa65VG8F10wrzbbwqvhAB9F3nlxUNfab6+dFNY21jngcnatiEQ
 L2U/cphsYWZflpQjkl5XqCgTmBHfyHDMlJg9uhGcIGfGP6m9lg2IxS2Zq1qC1vu93J
 +PeHd6PMKlxvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=F19YSzFd
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2024-06-28
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQnVpbGRyb290IGNvbW11bml0eSEKClRoZSBDSSBidWlsZCBib3Qgd3JvdGU6Cj4gRGV0
YWlsIG9mIGRlZmNvbmZpZyBmYWlsdXJlcyBmb3IgbWFzdGVyCj4gWzIxOSBmYWlsdXJlc10KCkkn
dmUgY2hlY2tlZCBzb21lIG9mIHRoZXNlIGJ1aWxkIGZhaWx1cmVzLCBhbmQgaXQgYXBwZWFycyB0
aGF0IHF1aXRlIGEKZmV3IG9mIHRoZW0gYXJlIGZhaWx1cmVzIHRvIGRvd25sb2FkIEdDQyAxMzoK
CiAgICBbd2dldCBmb2xsb3dpbmcgYSByZWRpcmVjdDpdCiAgICBSZXNvbHZpbmcgbWlycm9yLmli
Y3AuZnIgKG1pcnJvci5pYmNwLmZyKS4uLiAxOTQuMjU0LjI0NS4xNDUsIDIwMDE6NjYwOjUwMGI6
MjQ1OjoxNDUKICAgIENvbm5lY3RpbmcgdG8gbWlycm9yLmliY3AuZnIgKG1pcnJvci5pYmNwLmZy
KXwxOTQuMjU0LjI0NS4xNDV8OjgwLi4uIGZhaWxlZDogQ29ubmVjdGlvbiB0aW1lZCBvdXQuCiAg
ICBDb25uZWN0aW5nIHRvIG1pcnJvci5pYmNwLmZyIChtaXJyb3IuaWJjcC5mcil8MjAwMTo2NjA6
NTAwYjoyNDU6OjE0NXw6ODAuLi4gZmFpbGVkOiBDYW5ub3QgYXNzaWduIHJlcXVlc3RlZCBhZGRy
ZXNzLgogICAgW1JldHJ5aW5nIHVudGlsIGl0IGdpdmVzIHVwLCB0aGVuOl0KICAgIENvbm5lY3Rp
bmcgdG8gc291cmNlcy5idWlsZHJvb3QubmV0IChzb3VyY2VzLmJ1aWxkcm9vdC5uZXQpfDE3Mi42
Ny43Mi41Nnw6NDQzLi4uIGNvbm5lY3RlZC4KICAgIEhUVFAgcmVxdWVzdCBzZW50LCBhd2FpdGlu
ZyByZXNwb25zZS4uLiA0MDQgTm90IEZvdW5kCgpJIGZvdW5kIHRoZSBlcnJvciBtZXNzYWdlIOKA
nENhbm5vdCBhc3NpZ24gcmVxdWVzdGVkIGFkZHJlc3PigJ0gYSBiaXQKc3VzcGljaW91cy4gVGhp
cyBpcyBFQUREUk5PVEFWQUlMIHdoaWNoLCBhY2NvcmRpbmcgdG8gY29ubmVjdCgyKSwKaGFwcGVu
cyB3aGVuCgogICAgVGhlIHNvY2tldCBbLi4uXSBoYWQgbm90IHByZXZpb3VzbHkgYmVlbiBib3Vu
ZCB0byBhbiBhZGRyZXNzCiAgICBhbmQsIHVwb24gYXR0ZW1wdGluZyB0byBiaW5kIGl0IHRvIGFu
IGVwaGVtZXJhbCBwb3J0LCBpdCB3YXMKICAgIGRldGVybWluZWQgdGhhdCBhbGwgcG9ydCBudW1i
ZXJzIGluIHRoZSBlcGhlbWVyYWwgcG9ydCByYW5nZQogICAgYXJlIGN1cnJlbnRseSBpbiB1c2Uu
CgpJdCBzZWVtcyBkdWJpb3VzIHRoYXQgdGhlIENJIHJ1bm5lciBleGhhdXN0ZWQgYWxsIHRoZSBw
b3J0cyBhdmFpbGFibGUKZm9yIGVwaGVtZXJhbCBiaW5kaW5nLiBBbHNvLCBpdCBhcHBlYXJzIHRo
YXQgdGhlc2UgZXJyb3JzIGhhcHBlbiB3aGVuCmFuZCBvbmx5IHdoZW4gYXR0ZW1wdGluZyB0byBy
ZWFjaCBhbiBJUHY2IGFkZHJlc3MuIEkgYWxzbyBjaGVja2VkIGEKc3VjY2Vzc2Z1bCBidWlsZFsx
XSBhbmQgZm91bmQgdGhlIHNhbWUgc2l0dWF0aW9uOiBhbGwgYXR0ZW1wdHMgb2Ygd2dldAp0byBj
b25uZWN0IHRvIGFuIElQdjYgYWRkcmVzcyAoYW5kIG9ubHkgdGhvc2UpIGZhaWwgd2l0aCBFQURE
Uk5PVEFWQUlMLgoKTXkgZ3Vlc3MgaXMgdGhhdCB0aGUgSVB2NiBjb25uZWN0aXZpdHkgb2YgdGhl
IGJ1aWxkZXJzIGlzIGJyb2tlbi4KClJlZ2FyZHMsCgpFZGdhci4KClsxXSBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzcxOTg4OTEyODIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
