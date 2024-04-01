Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85CACD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BEED607CE;
	Mon,  1 Apr 2024 14:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-1nHTwRM9LC; Mon,  1 Apr 2024 14:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 573A960833
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 573A960833;
	Mon,  1 Apr 2024 14:17:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1FD1BF33E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1698C80F59
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8VQtm-4Zzfb for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03D3580F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D3580F58
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03D3580F58
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 14:17:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ADB1513F81D;
 Mon,  1 Apr 2024 16:17:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 16:17:32 +0200
Date: Mon, 1 Apr 2024 16:17:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <ZgrB_CpdJbJOmv3T@landeda>
References: <20240328174052.8677-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328174052.8677-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711981055;
 bh=60cUUsteQYZeIR7EpRE6PqfixpygRJVzBmS4qSrFgrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OG1ELBMvnleRWo4lJWum5+DUJLBLjBK7xI//ZyFicWQopaKXmIYV0mYKzo43fhYZx
 uz/sPThpYa2nH5c4w1Y8bdhfrvyFGKiAqYyxXOYsMFQcEGLmKCSp8fnSzM3/bJmzzp
 WDLv6yMghQ2Pztmxsnzt0sD9N+Yv5tfBIEEqhDOIuMdx8IleBBhl+Ikd15CNnRhqhv
 OXUW0St0FyBvYINhx4YuSJII+Ddndv3Tqs9j0F1K/Dpkyo+16j0WwsIyemSFZbZrUN
 qdUblNymPbzjOTbOYl0wd7xcXHOKP5Uu/w/Y83uKAe8M3ND2JCYKCi+H1CCHLffGkc
 zFAf8Q9tv6GRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OG1ELBMv
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.8.4
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTAzLTI4IDE4OjQwICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQWdhaW4sIHlpb3VyIEZyb20gYW5kIFNvQiBkbyBub3QgbWF0
Y2g6IGZwZXJyYWRAZ21haWwuY29tIHZzLgpmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmcuCgpUaGlz
IGFwcGxpZXMgdG8gb3RoZXIgcGF0Y2hlcywgdG9vOgoKICAgIHBhY2thZ2UvZ3JhcGhlbmU6IG5l
dyBwYWNrYWdlCiAgICBwYWNrYWdlL2xpYmd0azQ6IG5ldyBwYWNrYWdlCiAgICBwYWNrYWdlL2xt
ZGI6IG5ldyBwYWNrYWdlCiAgICBwYWNrYWdlL2x1YS1saWdodG5pbmdtZGI6IG5ldyBwYWNrYWdl
CiAgICBwYWNrYWdlL2x1YS1sZ2RibTogbmV3IHBhY2thZ2UKICAgIHBhY2thZ2UvbHVhLWxzZGJ1
czogbmV3IHBhY2thZ2UKICAgIHBhY2thZ2UvbGlidG9tbWF0aDogYnVtcCB0byB2ZXJzaW9uIDEu
My4wCgpDYW4geW91IGZpeCBhbmQgcmVzcGluLCBwbGVhc2U/CgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKPiAtLS0KPiAgcGFja2FnZS9saWJyZXNzbC9saWJyZXNzbC5oYXNoIHwgMiArLQo+ICBw
YWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYnJlc3NsL2xpYnJlc3NsLmhhc2ggYi9wYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLmhhc2gK
PiBpbmRleCA0MGI0OWRiYjguLjVkM2I1NGVhOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnJl
c3NsL2xpYnJlc3NsLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3NsLmhhc2gK
PiBAQCAtMSw0ICsxLDQgQEAKPiAgIyBGcm9tIGh0dHBzOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9P
cGVuQlNEL0xpYnJlU1NML1NIQTI1Ngo+IC1zaGEyNTYgIDZkNGI4ZDViYmIyNWExZjgzMzY2Mzll
NTZlYzUwODgwNTJkNDNhOTUyNTY2OTdhODVjNGNlOTEzMjNjMjU5NTQgIGxpYnJlc3NsLTMuOC4y
LnRhci5nego+ICtzaGEyNTYgIGMwY2VmOWNmZTE3NGFjMzY2Y2U0ODJmNTQyZmRkYjA3NzIxZTdm
YTBjYWZhY2UzNGI0OWE4NzIwZmEzN2ZlN2QgIGxpYnJlc3NsLTMuOC40LnRhci5nego+ICAjIExv
Y2FsbHkgY29tcHV0ZWQKPiAgc2hhMjU2ICA1YzYzNjEzZjAwOGYxNmE5YzAwMjVjMDk2YmJkNzM2
Y2VjZjcyMDQ5NGQxMjFiNWM1MjAzZTBlYzZlNTk1NWIxICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbGlicmVzc2wvbGlicmVzc2wubWsgYi9wYWNrYWdlL2xpYnJlc3NsL2xpYnJlc3Ns
Lm1rCj4gaW5kZXggYjcyZjNiMzhjLi4xZDkwYWE4NTMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9s
aWJyZXNzbC9saWJyZXNzbC5tawo+ICsrKyBiL3BhY2thZ2UvbGlicmVzc2wvbGlicmVzc2wubWsK
PiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAt
TElCUkVTU0xfVkVSU0lPTiA9IDMuOC4yCj4gK0xJQlJFU1NMX1ZFUlNJT04gPSAzLjguNAo+ICBM
SUJSRVNTTF9TSVRFID0gaHR0cHM6Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0QvTGlicmVT
U0wKPiAgTElCUkVTU0xfTElDRU5TRSA9IElTQyAobmV3IGFkZGl0aW9ucyksIE9wZW5TU0wgb3Ig
U1NMZWF5IChvcmlnaW5hbCBPcGVuU1NMIGNvZGUpCj4gIExJQlJFU1NMX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HCj4gLS0gCj4gMi40MC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
