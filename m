Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9BCC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 19:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F40D1400A4;
	Mon, 16 Sep 2024 19:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45Mm3Z1xT53D; Mon, 16 Sep 2024 19:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA8DA40433
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA8DA40433;
	Mon, 16 Sep 2024 19:16:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 834EA1BF2B3
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 19:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F67660ABC
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 19:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXlVEPlkZjim for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 19:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17BED60AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17BED60AB9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17BED60AB9
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 19:16:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.96.237])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0595378035B;
 Mon, 16 Sep 2024 21:16:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 21:16:17 +0200
Date: Mon, 16 Sep 2024 21:16:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andy Yan <andyshrk@163.com>
Message-ID: <ZuiEAeBfrMsUWAjC@landeda>
References: <20240822181546.64900-1-bernd@kuhls.net>
 <20240822181546.64900-5-bernd@kuhls.net>
 <2a21a576.8037.191efc37b94.Coremail.andyshrk@163.com>
 <19f56d2a.1aaa.191f9e145f6.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19f56d2a.1aaa.191f9e145f6.Coremail.andyshrk@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726514188;
 bh=SP+sw1oYrD9xPX9SMxJ6Ys31onOlKD8v3UQJR2l1OlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVaJXxlxzJZM4afp8ES/C6sOXkeS5OxW0MmVUYrHaNXAJ6Cpi0Dm7cNyx32ycUJwJ
 bd0Og30pzqGeibiaVLyZlidAxiUmaMJzQ+VTs5ixmLDzKkt1ZZfozyNrVFfYBZbObl
 Gpf57nw3Tog6NmeOpJg/YwvDlLC1Ao/IQi7hDiV3GmDqvOwrAzKM6D4vo6t0EqV5QF
 KEJeUnkQ5LQZuIls5Vh2TqXlaTqvPrCBNHknwcKrAr7/VVN/fG4mLb00Y2eji7eTaW
 sxS037N9UvOr8NhdznmqvRWvVlcHgRcblulj17VV88f1Ha89QibZP6aZzxMUE7vI/i
 aY7w9i0W9xLsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FVaJXxlx
Subject: Re: [Buildroot] [PATCH/next 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <dalang@gmx.at>,
 Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW1uZGksIEFsbCwKCk9uIDIwMjQtMDktMTYgMTY6MDkgKzA4MDAsIEFuZHkgWWFuIHNwYWtlIHRo
dXNseToKPiBBdCAyMDI0LTA5LTE0IDE3OjAwOjUxLCAiQW5keSBZYW4iIDxhbmR5c2hya0AxNjMu
Y29tPiB3cm90ZToKPiA+SSBnZXQgYSBidWlsZCBlcnJvciBvbiBVYnVudHUgMjIuMDTvvJoKPiA+
Cj4gPm91dHB1dC9idWlsZC9tZXNhM2QtMjQuMi4wL21lc29uLmJ1aWxkOjE3MTogV0FSTklORzog
YGdhbGxpdW0tZHJpdmVycz1zd3Jhc3RgIGlzIGEgZGVwcmVjYXRlZCBhbGlhcyBmb3IgYGdhbGxp
dW0tZHJpdmVycz1zb2Z0cGlwZSxsbHZtcGlwZWAgYW5kIHdpbGwgYmUgcmVtb3ZlZCBpbiB2ZXJz
aW9uIDI1LjAKPiA+b3V0cHV0L2J1aWxkL21lc2EzZC0yNC4yLjAvbWVzb24uYnVpbGQ6NTAyOiBX
QVJOSU5HOiBjYW5ub3QgYXV0by1kZXRlY3QgLW10bHMtZGlhbGVjdCB3aGVuIGNyb3NzLWNvbXBp
bGluZywgdXNpbmcgY29tcGlsZXIgZGVmYXVsdAo+ID5EZXBlbmRlbmN5IGxpYmdsdm5kIHNraXBw
ZWQ6IGZlYXR1cmUgZ2x2bmQgZGlzYWJsZWQKPiA+RGVwZW5kZW5jeSB2ZHBhdSBza2lwcGVkOiBm
ZWF0dXJlIGdhbGxpdW0tdmRwYXUgZGlzYWJsZWQKPiA+UHJvZ3JhbSBnbHNsYW5nVmFsaWRhdG9y
IGZvdW5kOiBOTwo+ID5EZXBlbmRlbmN5IGxpYnZhIHNraXBwZWQ6IGZlYXR1cmUgZ2FsbGl1bS12
YSBkaXNhYmxlZAo+ID5Qcm9ncmFtIHB5dGhvbjMgZm91bmQ6IFlFUyAoL3Nydi9Xb3JrU3BhY2Uv
b3BlbnNvdXJjZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL3B5dGhvbjMpCj4gPgo+ID5vdXRw
dXQvYnVpbGQvbWVzYTNkLTI0LjIuMC9tZXNvbi5idWlsZDo5Njc6MjogRVJST1I6IFByb2JsZW0g
ZW5jb3VudGVyZWQ6IFB5dGhvbiAoMy54KSB5YW1sIG1vZHVsZSAoUHlZQU1MKSByZXF1aXJlZCB0
byBidWlsZCBtZXNhLgpbLS1TTklQLS1dCj4gSSBmb3VuZCB0aGUgYnVpbGQgZXJyb3Igd2FzIGdv
bmUgd2hlbiBJIGFkZCAgaG9zdC1weXRob24tcHl5YW1sICB0byBNRVNBM0RfREVQRU5ERU5DSUVT
77yMCj4gU2hvdWxkIHRoaXMgYmUgYWRkZWQgdGhlcmUg77yfCgpJdCBzaG91bGQgaW5kZWVkIHBy
b2JhYmx5IGJlIGFkZGVkLCBidXQgY29uZGl0aW9uYWxseSwgaS5lLiBvbmx5IHdoZW4KdGhlIGFm
ZmVjdGVkIGRyaXZlciBpcyBlbmFibGVkLCBzb21uZXRoaW5nIGxpa2U6CgogICAgaWZlcSAoJChC
UjJfUEFDS0FHRV9NRVNBM0RfWFhYWCkseSkKICAgIE1FU0EzRF9ERVBFTkRFTkNJRVMgKz0gaG9z
dC1weXRob24tcHl5YW1sCiAgICAuLi4KICAgIGVuZGlmCgpSZXVzZSBhbiBleGlzdGluZyBjb25k
aXRpb25hbCBibG9jay4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwg
QVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBT
b2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAg
IHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAg
ICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
