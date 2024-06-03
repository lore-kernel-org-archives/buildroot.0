Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7AEC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DE43414C2;
	Mon,  3 Jun 2024 09:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wl6uMAZitD5e; Mon,  3 Jun 2024 09:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9549414C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9549414C8;
	Mon,  3 Jun 2024 09:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15B351BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DC7440689
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eibb7rNc0vUd for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAC6640648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC6640648
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAC6640648
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:21:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D3A4D13F8C2;
 Mon,  3 Jun 2024 11:21:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 11:21:19 +0200
Date: Mon, 3 Jun 2024 11:21:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zl2LD1oI4LbDPlIH@landeda>
References: <20240603071726.532652-1-peter@korsgaard.com>
 <20240603071726.532652-12-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603071726.532652-12-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717406483;
 bh=3M/grSV3uqFWXX2ebsSB04I0Ap1zcmDkD9CePQPBslE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VsJ80kpUxpVxTel2Bz9gxj4b0Dq70K+PhG7o33pgnvXHIPNrlDEbjNrtQJSEPR/PP
 gcQRIxNL6S0y16wSq10AtrX4vFZKTMT/ZxlNmY4WqT2+0yDbyKz/f7G7NWuw8p7+t5
 pSKMTHpEV6ryGazzphwLpbvPTFjRnuP1Ok6TxJHEtZJyEZFxd9NWcTnVW6EDndagUc
 XPsgIURXg8KREKgpYbpAnYFOmuht7L7lMvGt22HEUTYsfFn9zQJEm2LcDw/7ubrXfm
 LqftdQ88YzpHapxT7chBzQn2t1YdGk6Gx8PV8SVhIEpkX6A9LCMvJsS/NtJ5fxeMEr
 iWeXfeWtsGA9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VsJ80kpU
Subject: Re: [Buildroot] [PATCH 12/23] package/lynx: use http:// _SITE
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
Cc: Mario Lang <mlang@blind.guru>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIEFsbCwKCk9uIDIwMjQtMDYtMDMgMDk6MTcgKzAyMDAsIFBldGVyIEtvcnNnYWFyZCBz
cGFrZSB0aHVzbHk6Cj4gVGhlIGZ0cCBzZXJ2ZXIgZG9lcyBub3QgYWxsb3cgYW5vbnltb3VzIGxv
Z2luLCBjYXVzaW5nIHRoZSBkb3dubG9hZCB0byBmYWlsOgo+IAo+IHdnZXQgLS1wYXNzaXZlLWZ0
cCAtbmQgLXQgMyAtTyAnL2hvbWUvcGVrby9zb3VyY2UvYnVpbGRyb290L291dHB1dC1xdC9idWls
ZC8ubHlueDIuOC45cmVsLjEudGFyLmJ6Mi5YbGNkQ0svb3V0cHV0JyAnZnRwOi8vZnRwLmludmlz
aWJsZS1pc2xhbmQubmV0L2x5bngvdGFyYmFsbHMvbHlueDIuOC45cmVsLjEudGFyLmJ6MicKPiAt
LTIwMjQtMDYtMDIgMjI6MjE6NDktLSAgZnRwOi8vZnRwLmludmlzaWJsZS1pc2xhbmQubmV0L2x5
bngvdGFyYmFsbHMvbHlueDIuOC45cmVsLjEudGFyLmJ6Mgo+ICAgICAgICAgICAgPT4g4oCYL2hv
bWUvcGVrby9zb3VyY2UvYnVpbGRyb290L291dHB1dC1xdC9idWlsZC8ubHlueDIuOC45cmVsLjEu
dGFyLmJ6Mi5YbGNkQ0svb3V0cHV04oCZCj4gUmVzb2x2aW5nIGZ0cC5pbnZpc2libGUtaXNsYW5k
Lm5ldCAoZnRwLmludmlzaWJsZS1pc2xhbmQubmV0KS4uLiAyMTYuMTk0LjI1My4yOQo+IENvbm5l
Y3RpbmcgdG8gZnRwLmludmlzaWJsZS1pc2xhbmQubmV0IChmdHAuaW52aXNpYmxlLWlzbGFuZC5u
ZXQpfDIxNi4xOTQuMjUzLjI5fDoyMS4uLiBjb25uZWN0ZWQuCj4gTG9nZ2luZyBpbiBhcyBhbm9u
eW1vdXMgLi4uCj4gTG9naW4gaW5jb3JyZWN0Lgo+IAo+IEx1Y2tpbHkgdGhlIHRhcmJhbGwgaXMg
YWxzbyBhdmFpbGFibGUgb3ZlciBodHRwOi8vLCBzbyB1c2UgdGhhdCBpbnN0ZWFkLgoKSSd2ZSBz
d2l0Y2hlZCB0byBodHRwcyBpbnN0ZWFkLgoKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2Fh
cmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvbHlueC9seW54Lm1rIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9seW54L2x5bngubWsgYi9wYWNrYWdlL2x5bngvbHlueC5t
awo+IGluZGV4IGRhNTdlYjI2MDEuLjQxZjkxNjFmMTAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9s
eW54L2x5bngubWsKPiArKysgYi9wYWNrYWdlL2x5bngvbHlueC5tawo+IEBAIC02LDcgKzYsNyBA
QAo+ICAKPiAgTFlOWF9WRVJTSU9OID0gMi44LjlyZWwuMQo+ICBMWU5YX1NPVVJDRSA9IGx5bngk
KExZTlhfVkVSU0lPTikudGFyLmJ6Mgo+IC1MWU5YX1NJVEUgPSBmdHA6Ly9mdHAuaW52aXNpYmxl
LWlzbGFuZC5uZXQvbHlueC90YXJiYWxscwo+ICtMWU5YX1NJVEUgPSBodHRwOi8vaW52aXNpYmxl
LW1pcnJvci5uZXQvYXJjaGl2ZXMvbHlueC90YXJiYWxscy8KCkFzIGRpc3Vjc3NlZCBvbiBJUkM6
CgogICAgcGFja2FnZS9seW54L2x5bngubWs6NjA6ICoqKiBMWU5YX1NJVEUgKGh0dHBzOi8vaW52
aXNpYmxlLW1pcnJvci5uZXQvYXJjaGl2ZXMvbHlueC90YXJiYWxscy8pIGNhbm5vdCBoYXZlIGEg
dHJhaWxpbmcgc2xhc2guIFN0b3AuCgpTbyBJIGRyb3BwZWQgdGhlIHRyYWlsaW5nIHNsYXNoIHRv
by4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoK
PiAgTFlOWF9QQVRDSCA9IFwKPiAgCWh0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9seW54LXRlYW0v
bHlueC8tL3Jhdy9kZWJpYW4vMi45LjBkZXYuNi0zX2RlYjExdTEvZGViaWFuL3BhdGNoZXMvOTBf
Q1ZFLTIwMjEtMzgxNjUucGF0Y2gKPiAgIyA5MF9DVkUtMjAyMS0zODE2NS5wYXRjaAo+IC0tIAo+
IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
