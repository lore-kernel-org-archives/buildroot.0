Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF712C25B77
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 20:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A57834CB;
	Fri, 17 May 2024 20:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EegtQQ6H5oeK; Fri, 17 May 2024 20:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19FCE83506
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19FCE83506;
	Fri, 17 May 2024 20:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 699BD1BF348
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 20:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5483560790
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 20:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Gk3B_g6PgDP for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 20:02:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E680E60762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E680E60762
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E680E60762
 for <buildroot@buildroot.org>; Fri, 17 May 2024 20:02:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BAECC13F89A;
 Fri, 17 May 2024 22:02:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 22:02:50 +0200
Date: Fri, 17 May 2024 22:02:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Message-ID: <Zke36n1I-Ox8X2bA@landeda>
References: <c3811011-d5b3-4eec-99a4-dc765b98afdc@grenoble.cnrs.fr>
 <ZkexT4gGzutfaeOM@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZkexT4gGzutfaeOM@debian>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715976172;
 bh=BGcbk25xPFc8g00ToxnQJiiw04gi83jsfVo+0VN0K84=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Vs7IyFzBTSYOHEItuj+XGbEuKqAxhTBk7YliLNgWJF7wOyIavnkoVSP/0KxQD0DSk
 hwrzZIIDRjU+cSnfsz99NvRkOA8oppqUWXkGzelwAo5ddxPWJwOE6nmr0cRTX6jBb9
 4bh2qF9m20ERlXCe1x98Ebn/d1tWbc2jmUqqiJNL1zXaJ8W3SVEkXUi7AwC1Ca9Cwu
 nYgX6vdSvC61/WeCsuYxb5iF0wG/dc0mwfP94ofv4atUUnqbg0OsB/qpkd21uP7/9t
 J4k0BpLNjrgFny5awjnD+qWJgXNXslXul99bRbjhTvL0rc15VPVvryElcdYx0PUe1F
 08BeFYEQKR88g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vs7IyFzB
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

VmluY2VudCwgRWRnYXJkLCBBbGwsCgpPbiAyMDI0LTA1LTE3IDIxOjM0ICswMjAwLCBWaW5jZW50
IFN0ZWhsw6kgc3Bha2UgdGh1c2x5Ogo+IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDA5OjE4OjI1
QU0gKzAyMDAsIEVkZ2FyIEJvbmV0IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhbGxvd3MgdG8gdXNl
IGFuIGV4dGVybmFsIHRvb2xjaGFpbiBiYXNlZCBvbiBnY2MgMTQuCj4gCj4gVGhhbmtzIEVkZ2Fy
OyB0aGlzIHdvcmtzIG9uIG15IHNpZGUuCj4gCj4gRldJVywgZmVlbCBmcmVlIHRvIGFkZCAob3Ig
bm90KToKPiAgICAgVGVzdGVkLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFy
bS5jb20+CgpJZiB5b3UgZG8gbm90IGluZGVudCB5b3VyIHRlc3RlZC1ieSB0YWcsIHRoZW4gcGF0
Y2h3b3JrIHdpbGwKYXV0b21hdGljYWxseSBjb2xsZWN0IGl0IGluIHRoZSBwYXRjaCwgc28gdGhh
dCBpdCBpcyBhdXRvbWF0aWNhbGx5CmFkZGVkIHRvIHRoZSBjb21taXQgd2hlbiB3ZSB1c2UgZ2l0
LWFtLgoKQXBwbGllZCB0byBtYXN0ZXIsIHdpdGggVmluY2VudCdzIHRlc3RlZC1ieSB0YWcgYWRk
ZWQsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4KPiA+IC0tLQo+ID4gIC4u
Li90b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9tL0NvbmZpZy5pbi5vcHRpb25zICAgICAgICAgICAg
ICAgfCA0ICsrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3Rvb2xjaGFpbi1leHRl
cm5hbC1jdXN0b20vQ29uZmlnLmluLm9wdGlvbnMgYi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVy
bmFsL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20vQ29uZmlnLmluLm9wdGlvbnMKPiA+IGluZGV4
IGY3ODI1Y2I4OGUuLjFjNGIwZDI1NTQgMTAwNjQ0Cj4gPiAtLS0gYS90b29sY2hhaW4vdG9vbGNo
YWluLWV4dGVybmFsL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20vQ29uZmlnLmluLm9wdGlvbnMK
PiA+ICsrKyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvdG9vbGNoYWluLWV4dGVybmFs
LWN1c3RvbS9Db25maWcuaW4ub3B0aW9ucwo+ID4gQEAgLTQ2LDYgKzQ2LDEwIEBAIGNob2ljZQo+
ID4gIAkgIFNldCB0byB0aGUgZ2NjIHZlcnNpb24gdGhhdCBpcyB1c2VkIGJ5IHlvdXIgZXh0ZXJu
YWwKPiA+ICAJICB0b29sY2hhaW4uCj4gPiAgCj4gPiArY29uZmlnIEJSMl9UT09MQ0hBSU5fRVhU
RVJOQUxfR0NDXzE0Cj4gPiArCWJvb2wgIjE0LngiCj4gPiArCXNlbGVjdCBCUjJfVE9PTENIQUlO
X0dDQ19BVF9MRUFTVF8xNAo+ID4gKwo+ID4gIGNvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFM
X0dDQ18xMwo+ID4gIAlib29sICIxMy54Igo+ID4gIAlzZWxlY3QgQlIyX1RPT0xDSEFJTl9HQ0Nf
QVRfTEVBU1RfMTMKPiA+IC0tIAo+ID4gMi4zNC4xCj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
