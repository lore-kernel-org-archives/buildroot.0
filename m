Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5581FC41513
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 20:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C57181E84;
	Fri, 17 May 2024 20:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3CxzQE_3FtS; Fri, 17 May 2024 20:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0661E81E8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0661E81E8B;
	Fri, 17 May 2024 20:04:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9B241BF348
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 20:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C74CB81E8B
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 20:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-juLNI298kn for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 20:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CE9081E84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CE9081E84
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CE9081E84
 for <buildroot@buildroot.org>; Fri, 17 May 2024 20:04:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ED3A413F89A;
 Fri, 17 May 2024 22:04:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 22:04:13 +0200
Date: Fri, 17 May 2024 22:04:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Message-ID: <Zke4PWs-5ixL_bJ-@landeda>
References: <c3811011-d5b3-4eec-99a4-dc765b98afdc@grenoble.cnrs.fr>
 <ZkexT4gGzutfaeOM@debian> <Zke36n1I-Ox8X2bA@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zke36n1I-Ox8X2bA@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715976256;
 bh=sqCiuVZUbOlGBv4y8EK6LkF5mQXF0O2ETtE7WdH9+Us=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=afaub5zXciqk16U4uyD6M2GfQcQ0OjzcR+U93c6X9IG1Kn09oeEuQvVNw9fi7F2LQ
 CVR6wzipX5hTngu6Nsio1w4UP0SxW7Z95Jf2zzKTLFGz7AtDQpCqD7PagrEzqtX90q
 k/LPAwqf5KbAANYu9flS2W+DAdqhqJXPR4PRp5S8iPFtrrgKUQbx3IVtsPZFF+yQiy
 QVO9H2lbWOaEdhyyHe6hyFUZKG+1FAPswBvBmr9RW1F72qZYxflQaq8kSwJ/Xd6mHx
 w++sBEvwPM1+Ebh5xpXMdc+Jo0GWrG9ee51r8I/86Q/LVI/eLeO8t4P5m+pQ14rD9w
 RjNapwLW5M+fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=afaub5zX
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 14 version
 selection
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

RWRnYXIsIEFsbCwKCk9uIDIwMjQtMDUtMTcgMjI6MDIgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+IFZpbmNlbnQsIEVkZ2FyZCwgQWxsLAoKU29ycnkgZm9yIHRoZSB0eXBvIGlu
IHlvdXIgbmFtZS4uLiA6LSgKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IE9uIDIwMjQtMDUt
MTcgMjE6MzQgKzAyMDAsIFZpbmNlbnQgU3RlaGzDqSBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBGcmks
IE1heSAxNywgMjAyNCBhdCAwOToxODoyNUFNICswMjAwLCBFZGdhciBCb25ldCB3cm90ZToKPiA+
ID4gVGhpcyBwYXRjaCBhbGxvd3MgdG8gdXNlIGFuIGV4dGVybmFsIHRvb2xjaGFpbiBiYXNlZCBv
biBnY2MgMTQuCj4gPiAKPiA+IFRoYW5rcyBFZGdhcjsgdGhpcyB3b3JrcyBvbiBteSBzaWRlLgo+
ID4gCj4gPiBGV0lXLCBmZWVsIGZyZWUgdG8gYWRkIChvciBub3QpOgo+ID4gICAgIFRlc3RlZC1i
eTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IAo+IElmIHlvdSBk
byBub3QgaW5kZW50IHlvdXIgdGVzdGVkLWJ5IHRhZywgdGhlbiBwYXRjaHdvcmsgd2lsbAo+IGF1
dG9tYXRpY2FsbHkgY29sbGVjdCBpdCBpbiB0aGUgcGF0Y2gsIHNvIHRoYXQgaXQgaXMgYXV0b21h
dGljYWxseQo+IGFkZGVkIHRvIHRoZSBjb21taXQgd2hlbiB3ZSB1c2UgZ2l0LWFtLgo+IAo+IEFw
cGxpZWQgdG8gbWFzdGVyLCB3aXRoIFZpbmNlbnQncyB0ZXN0ZWQtYnkgdGFnIGFkZGVkLCB0aGFu
a3MuCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+ID4gPiAKPiA+ID4gU2lnbmVk
LW9mZi1ieTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4gPiA+IC0tLQo+
ID4gPiAgLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20vQ29uZmlnLmluLm9wdGlvbnMgICAg
ICAgICAgICAgICB8IDQgKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwv
dG9vbGNoYWluLWV4dGVybmFsLWN1c3RvbS9Db25maWcuaW4ub3B0aW9ucyBiL3Rvb2xjaGFpbi90
b29sY2hhaW4tZXh0ZXJuYWwvdG9vbGNoYWluLWV4dGVybmFsLWN1c3RvbS9Db25maWcuaW4ub3B0
aW9ucwo+ID4gPiBpbmRleCBmNzgyNWNiODhlLi4xYzRiMGQyNTU0IDEwMDY0NAo+ID4gPiAtLS0g
YS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20v
Q29uZmlnLmluLm9wdGlvbnMKPiA+ID4gKysrIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5h
bC90b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9tL0NvbmZpZy5pbi5vcHRpb25zCj4gPiA+IEBAIC00
Niw2ICs0NiwxMCBAQCBjaG9pY2UKPiA+ID4gIAkgIFNldCB0byB0aGUgZ2NjIHZlcnNpb24gdGhh
dCBpcyB1c2VkIGJ5IHlvdXIgZXh0ZXJuYWwKPiA+ID4gIAkgIHRvb2xjaGFpbi4KPiA+ID4gIAo+
ID4gPiArY29uZmlnIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfR0NDXzE0Cj4gPiA+ICsJYm9vbCAi
MTQueCIKPiA+ID4gKwlzZWxlY3QgQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTQKPiA+ID4g
Kwo+ID4gPiAgY29uZmlnIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfR0NDXzEzCj4gPiA+ICAJYm9v
bCAiMTMueCIKPiA+ID4gIAlzZWxlY3QgQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTMKPiA+
ID4gLS0gCj4gPiA+IDIuMzQuMQo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiA+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKPiAKPiAtLSAKPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1
NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUv
ICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxf
IHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoK
LS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1l
IEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMz
IDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBf
X18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0t
LTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
