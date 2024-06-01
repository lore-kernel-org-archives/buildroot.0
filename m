Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA59C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 09:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D13C605E4;
	Sat,  1 Jun 2024 09:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqG-2Bq7uAIf; Sat,  1 Jun 2024 09:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BD7F605F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD7F605F4;
	Sat,  1 Jun 2024 09:51:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 439AD1BF841
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 09:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CD3F84448
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 09:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPvc55y2mwFS for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 09:51:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33D2084447
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D2084447
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33D2084447
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 09:51:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7F2F613F8B3;
 Sat,  1 Jun 2024 11:51:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 11:51:52 +0200
Date: Sat, 1 Jun 2024 11:51:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZlrvOE7b8M1YGuVq@landeda>
References: <20240530-s6-update-v1-1-8088e16a1cf4@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240530-s6-update-v1-1-8088e16a1cf4@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717235514;
 bh=2gdk3/TcYhYiQmasTWjfJfgEs5YW3Au5R+16zrse7so=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpNI0cpOQlZzkKWAfj6ozbXQoQhLQJCYj/yqTG8DZY1XUjl9gZQV5y4jg2n36qttY
 YA6Z4+nr056UUSxX7fkxGsT52oJdUGRKX9+zx4Awz1zOnDFu49EibgaKG/+p3kvlRP
 G5c72xGmk1d/lTvzc9JGaz0ns9uNqHV5xn/CiA28+6U0uRrkWlvyFEA1MxmS6U03HJ
 7lqyQLDizyh5mU5DCp2ifdqvW4z/DRv0iRpy7yVvf5/+63XfM3vZrB8FkkCeqmHXC5
 N0qiJHN/nMwhipmJpw0YvqA3r5nTmWsO3tBSIonD7b6++UGNwIJxHlgFziTgUs7MGL
 PVZHck7N5kDDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bpNI0cpO
Subject: Re: [Buildroot] [PATCH] {skalibs, execline, mdevd, s6, s6-{rc,
 linux-init, {linux, portable}-utils, networking}}: bump
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Si4gQWxsLAoKT24gMjAyNC0wNS0zMCAyMjozMiArMDIwMCwgSi4gTmV1c2Now6RmZXIgdmlhIGJ1
aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gVXBkYXRlIGFsbCBza2FybmV0Lm9yZyBwYWNrYWdlcyB0
byB0aGVpciBjdXJyZW50IHVwc3RyZWFtIHZlcnNpb24uCgpJIHNob3Rlcm5lZCB0aGUgY29tbWl0
IHRpdGxlLCBhbmQgbW92ZWQgdGhlIHBhY2thZ2UgbGlzdCBpbiB0aGUgY29tbWl0CmxvZyBpbnN0
ZWFkLCBpdCdzIGEgbGl0dGxlIGJpdCBjbGVhbmVyLi4uCgo+IGRpZmYgQ09QWUlORyAoc2xpZ2h0
bHkgZGlmZmVyZW50IGJldHdlZW4gcGFja2FnZXMpOgo+IC1Db3B5cmlnaHQgKGMpIDIwMTEtMjAy
MiBMYXVyZW50IEJlcmNvdCA8c2thLXNrYXdhcmVAc2thcm5ldC5vcmc+Cj4gK0NvcHlyaWdodCAo
YykgMjAxMS0yMDI0IExhdXJlbnQgQmVyY290IDxza2Etc2thd2FyZUBza2FybmV0Lm9yZz4KCkdh
aCwgd2hlbiBJIGFwcGxpZWQsIHRoYXQgZ290IGludGVycHJldGVkIGFzIGEgZGlmZiwgd2hpY2gg
dGhyb3cgZ2l0LWFtCm9mZiwgYW5kIEkgaGFkIHRvIG1hbnVhbGx5IGZpeCBpdCB1cCwgYW5kIEkg
Zm9yZ290IHRvIGFtZW5kIHRoZSBjb21taXQKbG9nIHdpdGggdGhlIGV4cGxhbmF0aW9ucyBmb3Ig
dGhlIGxpY2Vuc2UgY2hhbmdlLiBEYW1uIG1lLgoKPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jD
pGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+IC0tLQo+IFRoaXMgcGF0Y2goc2V0KSB1cGRh
dGVzIHRoZSBwYWNrYWdlcyBmcm9tIHNrYXJuZXQub3JnLiBJdCBpcyBvbmUgY29tbWl0Cj4gdG8g
YXZvaWQgYnVpbGQgZmFpbHVyZXMgZHVlIHRvIGluY29tcGF0aWJsZSB2ZXJzaW9uczogRm9yIGV4
YW1wbGUsIHdoZW4KPiBJIG9ubHkgdXBkYXRlIHNrYWxpYnMgdG8gMi4xNC4xLjEgYW5kIGxlYXZl
IHRoZSByZXN0IGFzIGlzLCBleGVjbGluZQo+IGZhaWxzIHRvIGJ1aWxkLgoKSSd2ZSBtb3ZlZCB0
aGF0IHBhcmFncmFwaCB0byB0aGUgY29tbWl0IGxvZywgYW5kIHNsaWdodGx5IHJld29yZGVkIGFu
ZApleHRlbmRlZCBpdCwgYXMgZGlzY3Vzc2VkIGluIHRoZSByZXZpZXcuCgpbLS1TTklQLS1dCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvczYtbGludXgtdXRpbHMvMDAwMS1zcmMtczYtbGludXgtdXRp
bHMtcm5nc2VlZC5jLWZpeC1idWlsZC13aXRoLWdsaWJjLnBhdGNoIGIvcGFja2FnZS9zNi1saW51
eC11dGlscy8wMDAxLXNyYy1zNi1saW51eC11dGlscy1ybmdzZWVkLmMtZml4LWJ1aWxkLXdpdGgt
Z2xpYmMucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAyZGY4YTk5NzAw
Li4wMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9zNi1saW51eC11dGlscy8wMDAxLXNyYy1zNi1s
aW51eC11dGlscy1ybmdzZWVkLmMtZml4LWJ1aWxkLXdpdGgtZ2xpYmMucGF0Y2gKPiArKysgL2Rl
di9udWxsCj4gQEAgLTEsMzkgKzAsMCBAQAoKVGhhdCBodW5rIGZhaWxlZCB0byBhcHBseSwgYW5k
IEkgd2FzIHdvbmRlcmluZyB3aHksIHVudGlsIEkgd3JvdGUgdGhpcwpyZXBseSwgYW5kIHJlbWVt
YmVyZWQgdGhlICdkaWZmIENPUFlJTkcnIGFib3ZlLiBUaGF0IHBzZXVkby1kaWZmIGh1bmsKZW5k
ZWQgdXAgaW4gdGhpcyBodW5rLCB3aGljaCBpcyB3aGF0IG1hZGUgZ2l0LWFtIHRocm93IHVwIGl0
cyBoYW5kcyBhbmQKbGVhdmUgbWUgaGFuZGxlIHRoZSBicmVha2FnZS4uLgoKQWxzbzoKCiAgICAk
IC4vdXRpbHMvZG9ja2VyLXJ1biBjaGVjay1wYWNrYWdlCiAgICAuY2hlY2twYWNrYWdlaWdub3Jl
OjEzODM6IGlnbm9yZWQgZmlsZSBwYWNrYWdlL3M2LWxpbnV4LXV0aWxzLzAwMDEtc3JjLXM2LWxp
bnV4LXV0aWxzLXJuZ3NlZWQuYy1maXgtYnVpbGQtd2l0aC1nbGliYy5wYXRjaCBpcyBtaXNzaW5n
CgpTbyBJIGFsc28gZml4ZWQgdGhhdC4KCkFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
