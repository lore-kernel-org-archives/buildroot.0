Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF05C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 20:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 897B9845CF;
	Fri,  7 Jun 2024 20:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsExtf3EY2dy; Fri,  7 Jun 2024 20:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C4181024
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C4181024;
	Fri,  7 Jun 2024 20:51:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3B371BF473
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B143E6083D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zfu_qdTtgKKJ for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 20:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E5A6606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5A6606ED
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E5A6606ED
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 20:50:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9ADC113F86E;
 Fri,  7 Jun 2024 22:50:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 22:50:52 +0200
Date: Fri, 7 Jun 2024 22:50:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bryan Brattlof <bb@ti.com>
Message-ID: <ZmNyrBsiNN-QGXdA@landeda>
References: <20240607093712.2880785-1-yann.morin.1998@free.fr>
 <20240607172617.s42p343dw4ijgck4@bryanbrattlof.com>
 <ZmNNKV_vaTkG0JpW@landeda>
 <20240607190634.salcy2c3jnpjzs57@bryanbrattlof.com>
 <ZmNdLpmIeiA83M9B@landeda>
 <20240607203427.feo5giguhthammt2@bryanbrattlof.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607203427.feo5giguhthammt2@bryanbrattlof.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717793456;
 bh=UDTelYhFqt7ImV3/lZ4ED5KfwoxQkNn+aKgXa4QZHAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BjuKyORrb7tDLpXV4ChCNQm1ho/y8isocm2QiO0OpqSVozrR/+yJQ4psPHyF6dUfy
 fbAIzHJd9hKjUOzhXHQigosfI+yh+5+kRky0/8763kCBTuUm0DTMnt8vamOTELgUQ5
 rK8L9apQmidoELKLfRSsqIRss2SDsSu9X4/radmDxkX6VFsvRlAt8tboY5oeFBPfJY
 mOSasGYvlG1Nqc0WKQ/AUrC9LVYXAeWGw6yM+YnGAzf7BwM/gdsaTi27QfuGeEY8rr
 HYRlXq/TAWddcjdChfyzUprgVL14QHwl4F+6subBLoIItge2d2wlppQlwD4RkGhQHL
 aTs116WgF6Grg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BjuKyORr
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: share download files
 with uboot
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnJ5YW4sIEFsbCwKCk9uIDIwMjQtMDYtMDcgMTU6MzQgLTA1MDAsIEJyeWFuIEJyYXR0bG9mIHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IE9uIEp1bmUgIDcsIDIwMjQgdGh1cyBzYXlldGgg
WWFubiBFLiBNT1JJTjoKWy0tU05JUC0tXQo+ID4gT2gsIHNvIHdvdWxkIGl0IG1ha2Ugc2Vuc2Ug
dG8gY29tcGxldGVseSBkcm9wIHRoYXQgYmlnIGNob2ljZSwgYW5kIGp1c3QKPiA+IGFsd2F5cyB1
c2UgdGhlIHNhbWUgdmVyc2lvbiBhcyB1Ym9vdCwgYWx3YXlzPwpbLS1TTklQLS1dCj4gVGhlcmUg
aXMgdGhlIGZhbGNvbiBtb2RlIG9wdGlvbiBidXQgSSBoYXZlbid0IHR5cGVkIG91dCB0aGUgc3Vw
cG9ydCBmb3IgCj4gYW55IEszIFNvQ3MgeWV0IChvbiBteSB0by1kbyBzb29uIGxpc3QpIGFuZCBJ
IGhhdmVuJ3Qgc2VlbiBhbnlvbmUgdXNlIGEgCj4gc2VwYXJhdGUgZml0aW1hZ2UgbWFkZSBvdXRz
aWRlIG9mIFUtQm9vdCBmb3IgZmFsY29uIG1vZGUuIEJ1dCB0aGF0IAo+IGRvZXNuJ3QgZWxpbWlu
YXRlIHRoZSBwb3NzaWJpbGl0eSBvZiBhIGZ1dHVyZSBwYWNrYWdlIGJlaW5nIGludHJvZHVjZWQg
Cj4gdG8gZG8gdGhhdC4KClRoYW5rcyBmb3IgdGhlIGludGVyZXN0aW5nIGZlZWRiYWNrLiDwn5GN
Cgo+IElmIHlvdSdyZSBPSyB3aXRoIGl0LCBJIHdvdWxkIHByb2JhYmx5IG1ha2UgdGktazMtcjUt
bG9hZGVyLyBkZXBlbmQgb24gCj4gdWJvb3QvIGFuZCB0aWUgdGhlIHZlcnNpb25zIHRvZ2V0aGVy
IHVudGlsIHRoYXQgbXl0aGljYWwgZmFsY29uIG1vZGUgCj4gcGFja2FnZSBhcnJpdmVzLgoKWWVz
LCBwbGVhc2UuIEJld2FyZSB0aGF0IHlvdSdsbCBuZWVkIHRvIGJlIGNhcmVmdWwgb24gd2hhdCB2
YXJpYWJsZXMgeW91CmV2YWx1YXRlIGFuZCB3aGVuOgoKICAtIHNvbWUgdmFyaWFibGVzIGFyZSB1
c2VkIHRvIGRlZmluZSBtYWtlIGRlcGVuZGVuY2llczsgZS5nLiBfVkVSU0lPTjsKCiAgLSB1Ym9v
dCBzb3J0cyBhZnRlciB0aS1rMy1yNS1sb2FkZXIsIHNvIHlvdSBjYW4ndCByZWx5IG9uIHZhcmlh
YmxlcwogICAgdGhhdCBhcmUgX2NvbXB1dGVkXyBpbiB1Ym9vdC5taywgYnV0IG9ubHkgb24gdGhv
c2UgdGhhdCBjb21lIGZyb20KICAgIEtjb25maWc7CgogIC0gdmFyaWFibGVzIHRoYXQgYXJlIGV2
YWx1YXRlZCBpbiBfQ01EIGJsb2NrcyBjYW4gYmUgYW55dGhpbmcsIGJlY2F1c2UKICAgIHRob3Nl
IGFyZSBldmFsdWF0ZWQgJ2xhdGUnLgoKSSB3b3VsZCBkaXJlY3QgeW91IHRvIHRoZSBkb2MgYWJv
dXQgdGhhdCwgaWYgdGhlcmUgd2FzIG9uZS4uLiA6LSgKSSB0aGluayBfVkVSU0lPTiBpcyB0aGUg
b25seSB0aGF0IHJlYWxseSBtYXR0ZXJzLCB0aG91Z2gsIGJ1dCBsb29rIGF0CmhvdyBpdCdzIGRv
bmUgZm9yIGxpbnV4LWhlYWRlcnMgdnMgbGludXgsIHRoaXMgaXMgdGhlIGtpbmQgb2YgdWdsaW5l
c3MKd2lsbCBuZWVkIGhlcmUgdG9vLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
