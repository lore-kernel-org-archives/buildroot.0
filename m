Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAB1C0219F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FEBC40225;
	Sat, 14 Sep 2024 14:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBya_SWg-Qrm; Sat, 14 Sep 2024 14:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33B240235
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33B240235;
	Sat, 14 Sep 2024 14:37:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A22141BF28C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9138E81604
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4yCpIEjQgEf for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:37:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DA87815E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA87815E7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA87815E7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:37:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D6643780372;
 Sat, 14 Sep 2024 16:37:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 16:37:29 +0200
Date: Sat, 14 Sep 2024 16:37:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZuWfqbnSx23Qr9yB@landeda>
References: <20240911171937.10842-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911171937.10842-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726324654;
 bh=F1eX/s7E0YG2HCHYjitW7UFkXj8qR3MqyynPdZ+x4SI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wdp2F9JdkxbJg1I6DmHLwQlIFbUKrJmLYmeGNYhRWHJbAU/6q/fBcOw/xz97idDOU
 cSdgF/sDiYl+l9Sqh4SQPPQncnp2bMSrZ05PEcLRRGTtEzEfh0IPn5zWxhjU1XsGF5
 vz203TR4a4ZakTEoViyG3m/hmY8AuwU8/n4Z/UzVB+bTmgaWgImzBuc6TltJl96Hmp
 RY6+QmNZLnazJ+Pp89Fh6uyh1DauMllPsVxcPbU1yVLRCzAfEndewgfgSQbzH0j9oQ
 1CdQ28XuOlCQyh3TxjwYrNIpq7ZMGLh/8G0MV+ZYs2s8njJ1S/PmA+C9SGPx8S3pAh
 eEduyLxjR6lPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wdp2F9Jd
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: needs host-python3
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
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SnVsaWVuLCBBbGwsCgpPbiAyMDI0LTA5LTExIDE5OjE5ICswMjAwLCBKdWxpZW4gT2xpdmFpbiBz
cGFrZSB0aHVzbHk6Cj4gV2hlbiB0aGUgYnVpbGQgaG9zdCBkb2VzIG5vdCBoYXZlIGEgUHl0aG9u
IGludGVycHJldGVyIGluc3RhbGxlZCwKPiBob3N0LWdydWIyIGlzIGZhaWxpbmcgdG8gY29uZmln
dXJlIGR1ZSB0byB0aGlzIG1pc3NpbmcgaW50ZXJwcmV0ZXIuCj4gTm90ZSB0aGF0IGhvc3QtZ3J1
YjIgaXMgdGhlIGZpcnN0IHBhY2thZ2UgdG8gZmFpbCBiZWNhdXNlIGl0IGlzIGEKPiBkZXBlbmRl
bmN5IG9mIGdydWIyLiBUaGUgZ3J1YjIgdGFyZ2V0IHBhY2thZ2UgaGFzIHRoZSBzYW1lIGRlcGVu
ZGVuY3kKPiByZXF1aXJlbWVudC4KPiAKPiBUaGUgaXNzdWUgY2FuIGJlIHF1aWNrbHkgcmVwcm9k
dWNlZCBvbiBhIGhvc3Qgd2l0aG91dCBQeXRob24gd2l0aCB0aGUKPiBjb21tYW5kczoKPiAKPiAg
ICAgY2F0IDw8RU9GID4uY29uZmlnCj4gICAgIEJSMl9hYXJjaDY0PXkKPiAgICAgQlIyX1RBUkdF
VF9HUlVCMj15Cj4gICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ICAgICBFT0YKPiAgICAg
bWFrZSBvbGRkZWZjb25maWcKPiAgICAgbWFrZSBncnViMgo+IAo+IGdydWIyIGF1dG90b29scyBj
b25maWd1cmUuYWMgc2VhcmNoIGZvciBhIFB5dGhvbiBpbnRlcnByZXRlciBzaW5jZQo+IHVwc3Ry
ZWFtIGNvbW1pdCBbMV0gOGI0Njc4NDRlICJweXRob246IFVzZSBBTV9QQVRIX1BZVEhPTiB0byBk
ZXRlcm1pbmUKPiBpbnRlcnByZXRlciBmb3IgZ2VudHBsLnB5IiwgZmlyc3QgaW5jbHVkZWQgaW4g
Z3J1YiB2Mi4wNCByZWxlYXNlZAo+IG9uIDIwMTktMDctMDQuIEZvciByZWZlcmVuY2UsIGdydWIy
IGhhcyBiZWVuIHVwZGF0ZWQgdG8gdGhhdCB2ZXJzaW9uCj4gaW4gY29tbWl0IFsyXSBlYTdlYzQx
YyAiYm9vdC9ncnViMjogYnVtcCB0byB2ZXJzb24gMi4wNCIuCj4gCj4gVGhpcyBjb21taXQgZml4
ZXMgdGhlIGlzc3VlIGJ5IGFkZGluZyB0aGUgaG9zdC1weXRob24zIGRlcGVuZGVuY3kgdG8KPiBo
b3N0LWdydWIyIGFuZCBncnViMi4KPiAKPiBGaXhlczoKPiAKPiAgICAgY2hlY2tpbmcgZm9yIGEg
UHl0aG9uIGludGVycHJldGVyIHdpdGggdmVyc2lvbiA+PSAyLjYuLi4gbm9uZQo+ICAgICBjb25m
aWd1cmU6IGVycm9yOiBubyBzdWl0YWJsZSBQeXRob24gaW50ZXJwcmV0ZXIgZm91bmQKPiAKPiBb
MV0gaHR0cHM6Ly9naXQuc2F2YW5uYWguZ251Lm9yZy9naXR3ZWIvP3A9Z3J1Yi5naXQ7YT1jb21t
aXRkaWZmO2g9OGI0Njc4NDRlMTExNzAwNzdjOGNhNzI3YzM5ZDJiZDM2ZWViNWYwOAo+IFsyXSBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZWE3ZWM0
MWNmNjRlODZhNjkyYWM0NWUwZDAxMmM2ZTgxOTllZjExMAo+IAo+IFJlcG9ydGVkLWJ5OiBWaW5j
ZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgYm9vdC9ncnViMi9ncnViMi5tayB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9ib290L2dydWIyL2dydWIyLm1rIGIvYm9vdC9ncnViMi9ncnViMi5t
awo+IGluZGV4IDEyNjNjNjNjZmQuLjdjOTVhZGM3MzkgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9ncnVi
Mi9ncnViMi5tawo+ICsrKyBiL2Jvb3QvZ3J1YjIvZ3J1YjIubWsKPiBAQCAtOSw4ICs5LDggQEAg
R1JVQjJfU0lURSA9IGh0dHA6Ly9mdHAuZ251Lm9yZy9nbnUvZ3J1Ygo+ICBHUlVCMl9TT1VSQ0Ug
PSBncnViLSQoR1JVQjJfVkVSU0lPTikudGFyLnh6Cj4gIEdSVUIyX0xJQ0VOU0UgPSBHUEwtMy4w
Kwo+ICBHUlVCMl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+IC1HUlVCMl9ERVBFTkRFTkNJRVMg
PSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LWdhd2sgaG9zdC1ncnViMgo+IC1IT1NUX0dSVUIy
X0RFUEVOREVOQ0lFUyA9IGhvc3QtYmlzb24gaG9zdC1mbGV4IGhvc3QtZ2F3awo+ICtHUlVCMl9E
RVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LWdhd2sgaG9zdC1ncnViMiBo
b3N0LXB5dGhvbjMKPiArSE9TVF9HUlVCMl9ERVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3Qt
ZmxleCBob3N0LWdhd2sgaG9zdC1weXRob24zCj4gIEdSVUIyX0lOU1RBTExfSU1BR0VTID0gWUVT
Cj4gIAo+ICAjIENWRS0yMDE5LTE0ODY1IGlzIGFib3V0IGEgZmxhdyBpbiB0aGUgZ3J1YjItc2V0
LWJvb3RmbGFnIHRvb2wsIHdoaWNoCj4gLS0gCj4gMi40Ni4wCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
