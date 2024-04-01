Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59843CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10182400DC;
	Mon,  1 Apr 2024 13:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahz8Fir4G0yY; Mon,  1 Apr 2024 13:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CA3A401E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CA3A401E1;
	Mon,  1 Apr 2024 13:55:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DF3D1BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 074BD81779
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JV1gNQ9s_wHB for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0738081770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0738081770
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0738081770
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 13:55:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5A1C713F88E;
 Mon,  1 Apr 2024 15:55:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 15:55:42 +0200
Date: Mon, 1 Apr 2024 15:55:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <Zgq83ujyEo6ZF9Oy@landeda>
References: <20240401131242.511203-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401131242.511203-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711979744;
 bh=Hd2CkvxBt38SRxV+7VnpRWA7wywpKrFAufudhlot3kg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NOE5vNDrKl5k9ODbYkkEb76xhQoFkYnBM4DON33nckTamMQY7uSc81d9GutxfXX4e
 XsGCHbKzUjeqv+ScxoO1nuw2JugDToUTZlnG81IqEpzWuR+CPxuty7KkoqvoNtxe+H
 RKcfQX/Dv3m2EV/SgltQlmbnpVDHo5k2VRP6NYBHZWN6hSJa/ZB13EfWzjsNYj7kGP
 yctW6hNs/iC4JhYCM5Hz+CnZp2BfJFj9l5G4PsGK4KQp+A2gDXzDg6hF6pxFFHYDXC
 CSyQIKVWiYfu5xOE1mX8NQu7pI2DBm05R2ksRDEPkdYnh4Brms+1uIvh0aX8rCUpTR
 wO8ZnM8Vbj3ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NOE5vNDr
Subject: Re: [Buildroot] [PATCH] package/fakeroot: bump to version 1.34
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA0LTAxIDE1OjEyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClNlZSBhbHNv
IGJlbG93Li4uCgo+IC0tLQpbLS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmFrZXJv
b3QvZmFrZXJvb3QubWsgYi9wYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lm1rCj4gaW5kZXggMWEw
YWQ3MGMxLi4xYTA5OTZjYTEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9mYWtlcm9vdC9mYWtlcm9v
dC5tawo+ICsrKyBiL3BhY2thZ2UvZmFrZXJvb3QvZmFrZXJvb3QubWsKPiBAQCAtNCw5ICs0LDkg
QEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtRkFLRVJPT1RfVkVSU0lP
TiA9IDEuMzIuMQo+ICtGQUtFUk9PVF9WRVJTSU9OID0gMS4zNAo+ICBGQUtFUk9PVF9TT1VSQ0Ug
PSBmYWtlcm9vdF8kKEZBS0VST09UX1ZFUlNJT04pLm9yaWcudGFyLmd6Cj4gLUZBS0VST09UX1NJ
VEUgPSBodHRwczovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4vMjAyMzA3MjRU
MTYwNDI5Wi9wb29sL21haW4vZi9mYWtlcm9vdAo+ICtGQUtFUk9PVF9TSVRFID0gaHR0cHM6Ly9z
bmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMjQwNDAxVDA4NDQzOFovcG9vbC9t
YWluL2YvZmFrZXJvb3QKClJhdGhlciB0aGFuIHVzaW5nIHRoZSBkZWJpYW4gYXJjaGl2ZSwgd2hp
Y2ggaXMgZ29pbmcgdG8gY2hhbmdlIGV2ZXJ5CnRpbWUgd2UgY2hhbmdlIHRoZSB2ZXJzaW9uLCBj
YW4gd2UganVzdCBzd2l0Y2ggdG8gdXNpbmcgdGhlIG9mZmlpY2FsCmdpdCB0cmVlICh3aGljaCBo
YXBwZW5zIHRvIGJlIGhvc3RlZCBhdCBEZWJpYW4ncyBnaXRsYWIgaW5zdGFuY2UpCmluc3RlYWQ/
CgogICAgaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2NsaW50L2Zha2Vyb290CgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAgSE9TVF9GQUtFUk9PVF9ERVBFTkRFTkNJRVMgPSBob3N0LWFjbAo+
ICAjIEZvcmNlIGNhcGFiaWxpdGllcyBkZXRlY3Rpb24gb2ZmCj4gLS0gCj4gMi40MC4xCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
