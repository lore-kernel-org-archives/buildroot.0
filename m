Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB478C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A58F980F14;
	Sat,  8 Jun 2024 13:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BO88ndekeZwN; Sat,  8 Jun 2024 13:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9399980E97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9399980E97;
	Sat,  8 Jun 2024 13:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C77A1BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA4C6808A0
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEGbWDyamJeQ for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4876A80BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4876A80BE8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4876A80BE8
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:33:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8D3D213F8B5;
 Sat,  8 Jun 2024 15:33:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Jun 2024 15:33:38 +0200
Date: Sat, 8 Jun 2024 15:33:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tom Mloduchowski <tom@mloduchowski.com>
Message-ID: <ZmRdsvpwzO4ZvirR@landeda>
References: <CAEpun2apyLPnG=4WcF6H_u9J28rCJTVXCKQXxAUujspi4aqoAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEpun2apyLPnG=4WcF6H_u9J28rCJTVXCKQXxAUujspi4aqoAg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717853623;
 bh=eImy1Hdh0S+hMhq/FHQwRNytsVLVFCcd0bA937I1BVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NGVXrBIFa0Kgc1q1PxM0uqClRDQTQigl0BwtwNmecOPkWZmnrEUWZSwttuKkoPpoL
 XPyd6OBCDbEnBOEgeXlmk+meDUHYKzmNlprbnrU1v2hxzstwaDFOLmt1kmY+BHs/he
 UGmhGrXcJ+Mb7JnYVeiD+LoXJw84XVXxjihKbZks9GbgRSBG02PCamhxwdxySpZ1XL
 vmH6jWYu0nTy4wNkz4khw1YdlXVo4/fl7PNAVm0hsQ3kp0n+bTRcUTGWIi53ur/9TE
 vo9UWAhDHyGOWc2z326YzljUxcImT+Fyzm9SgCW8Es5p4b9bhgSk4j38Sun0l7+Y8x
 fwrJBiawkpodQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NGVXrBIF
Subject: Re: [Buildroot] [PATCH] Provide hooks for host python sqlite
 support - for diskcache support in LLM/AI/ML
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG9tLCBBbGwsCgpPbiAyMDI0LTA2LTA3IDA3OjI4IC0wNzAwLCBUb20gTWxvZHVjaG93c2tpIHNw
YWtlIHRodXNseToKPiBIZWxsbyBldmVyeW9uZSwKPiAKPiBJIGhhdmUgYSBuZWVkIHRvIGFkZCBz
cWxpdGUgc3VwcG9ydCBvbiB0aGUgaG9zdC1weXRob24zIHNpZGUgKHRvCj4gc3VwcG9ydCBkaXNr
Y2FjaGUsIGZvciBzb21lIGVtYmVkZGVkIExMTSB3b3JrIEknbSBkb2luZyBmb3Iga3NjYWxlLmRl
dgo+IC0gc2VwYXJhdGUgZXh0ZXJuYWwgcmVwbykuCj4gCj4gSG9wZSBpdCdzIGFjY2VwdGFibGUg
dG8gcHJvdmlkZSBzdWNoIGhvb2tzIGZvciBwYWNrYWdlIGRldmVsb3BlcnMuCgpZZXMsIHBsZWFz
ZSBzZWUgYmVsb3cgZm9yIGEgY29tbWVudC4uLgoKWy0tU05JUC0tXQo+IEBAIC02Niw2ICs2NSwx
MiBAQCBlbHNlCj4gIEhPU1RfUFlUSE9OM19DT05GX09QVFMgKz0gLS1kaXNhYmxlLW9wZW5zc2wK
PiAgZW5kaWYKPiAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTjNfU1FMSVRFKSx5
KQoKVGhlcmUncyBjdXJyZW50bHkgbm8gc3VjaCBzeW1ib2wsIHNvIHlvdSdsbCBoYXZlIHRvIGFs
c28gYWRkIHRoYXQsIMOgLWxhCkJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OM19DVVJTRVMgZXQgYWwu
Cgo+ICtIT1NUX1BZVEhPTjNfREVQRU5ERU5DSUVTICs9IGhvc3Qtc3FsaXRlCgpZb3UnbGwgYWxz
byBuZWVkIHRvIGV4cGxpY2l0bHkgLS1lbmFibGUtc3FsaXRlMy4KClJlZ2FyZHMsCllhbm4gRS4g
TU9SSU4uCgo+ICtlbHNlCj4gK0hPU1RfUFlUSE9OM19DT05GX09QVFMgKz0gLS1kaXNhYmxlLXNx
bGl0ZTMKPiArZW5kaWYKPiArCj4gIFBZVEhPTjNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gCj4g
IGlmZXEgKCQoQlIyX1BBQ0tBR0VfUFlUSE9OM18yVE8zKSx5KQo+IC0tCj4gMi4zOS4zCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBB
U0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNv
ZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAg
fAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8g
fCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
