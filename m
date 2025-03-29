Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6192FC36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 10:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FF3740B77;
	Sat, 29 Mar 2025 10:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUtCFTgu16YJ; Sat, 29 Mar 2025 10:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73B4E40B92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73B4E40B92;
	Sat, 29 Mar 2025 10:16:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6CB619C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7BD660A93
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpDR0BUsvOaX for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 10:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DCF9606D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DCF9606D4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DCF9606D4
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:15:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 04A476013A;
 Sat, 29 Mar 2025 11:15:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37620])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Mar 2025 11:15:53 +0100
MIME-Version: 1.0
Date: Sat, 29 Mar 2025 11:15:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, Refik
 Tuzakli <tuzakli.refik@gmail.com>
In-Reply-To: <20250328-fix-g2d-header-install-v1-1-99768aa27b15@armadeus.com>
References: <20250328-fix-g2d-header-install-v1-1-99768aa27b15@armadeus.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <dc2421eaf5d95b8aa2d1ab82400aee08@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743243357;
 bh=mo2h7OuE22uh3tTixlRg+ATYuB7vuPnJMKvrytLVK2U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b+FHOk+c2t6gK7yw9/Q+3822xrVgeNZjIEafWg+mfKoZ6PmRfBxHSNn40jaGnv1W4
 hDvkjZ1RIDEMC87nJevq/6hbo7Mfa+wH5biLYnITlgEV6Zph6duLDZqaBgcWBMwsYE
 sUanUdfIy2aIJVwW6adTEYdZY1e7hMag39Eb6DVRdjkqxo+zDIpN3MGYSyKSdPQ8It
 MjbAgtY3jvIWHqyJjCpi8L5gcxuVENKvIp4UKZbsKr7SN5FPzJH4qDLQGFO2sKxHXe
 YfkfjZ88Vi153TgvDcTrMDH1M+gMxegHTFanOFsK2lpI1nlvYhyFa8VKI32YlTejqN
 5Mshmw/Ua9UPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b+FHOk+c
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/imx-gpu-g2d:
 re-install headers to staging
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjgvMDMvMjAyNSAyMjoyMywgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gQ29tbWl0
IDQ0MzU1Zjc5OTgwNSAoInBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZDogaW5zdGFs
bCB0aGUKPiBzcGVjaWZpYyBsaWJyYXJ5IGZvciBpLk1YOE1NIikgYWNjaWRlbnRhbGx5IHJlbW92
ZSB0aGUgaGVhZGVycycKPiBpbnN0YWxsYXRpb24gdG8gdGhlIHN0YWdpbmcgZGlyZWN0b3J5LiBG
aXggdGhhdC4KPiAKPiBGaXhlczogNDQzNTVmNzk5ODA1ICgicGFja2FnZS9mcmVlc2NhbGUtaW14
L2lteC1ncHUtZzJkOiBpbnN0YWxsIHRoZSAKPiBzcGVjaWZpYyBsaWJyYXJ5IGZvciBpLk1YOE1N
IikKPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1h
bnNraUBhcm1hZGV1cy5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
