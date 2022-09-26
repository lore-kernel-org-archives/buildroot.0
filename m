Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D14C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 07:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B602360F29;
	Mon, 26 Sep 2022 07:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B602360F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdILWEWAbkLw; Mon, 26 Sep 2022 07:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9EAA60E1B;
	Mon, 26 Sep 2022 07:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9EAA60E1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDB601BF315
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 07:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B696F401C9
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 07:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B696F401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BL3DsadRm1Cr for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 07:56:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0908A40359
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0908A40359
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 07:56:23 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bk15so1104976wrb.13
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 00:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WtsetrTXezbyBORkVu5WBN+2hXFuJzJlPjeBiVOt9Zk=;
 b=XmGb/efqEwNEvViIbCnXN3VeTILy51EfIQ0G225ekIadorDbDKZqCk0QypoDGqRvFs
 XXCmFypKDZO2aRN+HGi+8CqALkYE3jvU2GPkcTrXRsW7n9iiQ3O1cF+B1aN2H7meac2N
 g/DxCKM/SKw/Sxum1cmWxMBGXu4pqYvGQC/PiXwZarS8e3a5szaTyUuspCB9w05LlYwy
 utzO2ZLLojfUUhJ5yaX+eLT1jNZVBMXoR/TmTAqzgr3WkCS02hKp7ATznaT470xR/nHm
 qb7O8Jx1QZs9cmDkkEa4PjHl5DvAEc2wF+IxTTvn/rWK2d4SqMcogwH/MBeGC+MBViex
 hBNw==
X-Gm-Message-State: ACrzQf2KaLuoOB7OdqjnjRcJ94E44Zlg1UQVlHpO6dbawyLvv7VmeWSn
 Y18P30rMCOfiEGGvU7hXb4TXHr9wNQUkHLgDqHI=
X-Google-Smtp-Source: AMsMyM6DtUcjYHIVW5b3KjCwUktcHzlBhxKdo6vmZvWOFZx8czYn305/W5tF8jSE8uXA236l3vUtstTLLY3RYmwAZf8=
X-Received: by 2002:a5d:5f0a:0:b0:228:dff9:5f7e with SMTP id
 cl10-20020a5d5f0a000000b00228dff95f7emr11872528wrb.601.1664178981957; Mon, 26
 Sep 2022 00:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
 <20220925204030.1661583-2-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220925204030.1661583-2-thomas.petazzoni@bootlin.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Mon, 26 Sep 2022 10:56:10 +0300
Message-ID: <CA+U=DsrR9+WK3gWR=N3FRiOokuLzLWt=mYeWMbRU-Pme=wJN_Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=WtsetrTXezbyBORkVu5WBN+2hXFuJzJlPjeBiVOt9Zk=;
 b=JE8FASghT1GFNadWLktSpoIT5W1OmnGUJ6sRhrNfP4RGOPMoeLZJYl3o/0zyjwMYBI
 11EZ3sLj8PanqTukZ1oy3Ee0pXbsJjpCTgGlRWFRu5uDQVBiAPiPPRzUM1skItCThOa/
 vmjSD+MF3G8QzMdVTEHFgFLd+shP7VG2pZbHGDpC8O9Si+pIBKV37T/jP0AVALlGSwOh
 qd8KfzKl8HB02crN7614oNHzS47J5i2NiYJ5QmD9EsZ2h6K7hdW8S5tjzWAejegVIMoI
 JYyjFMUeCVBqYT4cu7cX0JypdQNLUDmqhdM5OgWX6e8i34vaE9jzUzoE3THPronFm+MI
 TYAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JE8FASgh
Subject: Re: [Buildroot] [PATCH RFC 2/4] package/nodejs-bin: new package
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBTZXAgMjUsIDIwMjIgYXQgMTE6NDAgUE0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBGb3Igbm93LCBpdCBpcyBub3QgZXhw
b3NlZCBpbiBhbnkgd2F5LCBidXQgaW4gdGhlIG5leHQgY29tbWl0LCBpdCB3aWxsCj4gYmUgb2Zm
ZXJlZCBhcyBhbiBhbHRlcm5hdGl2ZSB0byBidWlsZCBob3N0LW5vZGVqcyBmcm9tIHNvdXJjZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9v
dGxpbi5jb20+Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCj4gIHBhY2thZ2Uvbm9kZWpzLWJpbi9ub2RlanMtYmluLmhhc2ggfCAgNyArKysrKysKPiAg
cGFja2FnZS9ub2RlanMtYmluL25vZGVqcy1iaW4ubWsgICB8IDM0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvbm9kZWpzLWJpbi9ub2RlanMtYmluLmhhc2gKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvbm9kZWpzLWJpbi9ub2RlanMtYmluLm1rCj4KPiBkaWZm
IC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCBmODI0NzJiYmI1Li41NjRh
YjJhZTcyIDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAg
LTI5MDMsNiArMjkwMyw3IEBAIEY6ICAgICAgICBwYWNrYWdlL211c2wvCj4gIEY6ICAgICBwYWNr
YWdlL211c2wtZnRzLwo+ICBGOiAgICAgcGFja2FnZS9uZTEwLwo+ICBGOiAgICAgcGFja2FnZS9u
b2RlanMvCj4gK0Y6ICAgICBwYWNrYWdlL25vZGVqcy1iaW4vCj4gIEY6ICAgICBwYWNrYWdlL3Br
Zy1weXRob24ubWsKPiAgRjogICAgIHBhY2thZ2UvcGtnLWF1dG90b29scy5tawo+ICBGOiAgICAg
cGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25vZGVqcy1iaW4v
bm9kZWpzLWJpbi5oYXNoIGIvcGFja2FnZS9ub2RlanMtYmluL25vZGVqcy1iaW4uaGFzaAo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNTFkZDA4MjcxMAo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9wYWNrYWdlL25vZGVqcy1iaW4vbm9kZWpzLWJpbi5oYXNoCj4gQEAg
LTAsMCArMSw3IEBACj4gKyMgRnJvbSBodHRwczovL25vZGVqcy5vcmcvZGlzdC92MTYuMTcuMS9T
SEFTVU1TMjU2LnR4dC5hc2MKPiArc2hhMjU2ICAzZGZiOGZkOGY2Yjk3ZGY2OWNkYzU2NTI0YWJj
OTA2YzUwZWYxZDBiZjA5MTE4ODYxNjgwMmU2YzdjNzMxMzg5ICBub2RlLXYxNi4xNy4xLWxpbnV4
LWFybTY0LnRhci54ego+ICtzaGEyNTYgIGEwMzVjZWVmYjVlMTZmNWZjZTk4YzhkZGZkZjcyMWI5
NmVlYzIwNTQyYzcyZmI4NzgxYmNiYjZlZjIwYzU1NTAgIG5vZGUtdjE2LjE3LjEtbGludXgtYXJt
djdsLnRhci54ego+ICtzaGEyNTYgIDcwMzA1OTM0NjYxZjg5ZmNhNjQwNTNiODUzMTdhNzVmMjMz
ZDVlM2ZkYjJjYWE2NTQ2YTE5MjYyYTUxOWNmMjAgIG5vZGUtdjE2LjE3LjEtbGludXgtcHBjNjRs
ZS50YXIueHoKPiArc2hhMjU2ICAwNmJhMmViMzRhYTM4NTk2N2Y1ZjU4Yzg3YTQ0NzUzZjgzMjEy
ZjZjY2NlYTg5MmIzM2Y4MGEyZTdmZGE4Mzg0ICBub2RlLXYxNi4xNy4xLWxpbnV4LXg2NC50YXIu
eHoKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICA2OTA5MGU4NjVhZmE3YzYyNzE1
Yjk3ZjA3MTI2MzJkMjkyM2JkN2E1ZmFiYTkxZjk0ZTRlNzVhMmY5MjE5ZDVlICBMSUNFTlNFCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm9kZWpzLWJpbi9ub2RlanMtYmluLm1rIGIvcGFja2FnZS9u
b2RlanMtYmluL25vZGVqcy1iaW4ubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjVlYmQ4NzYwYzAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ub2Rl
anMtYmluL25vZGVqcy1iaW4ubWsKPiBAQCAtMCwwICsxLDM0IEBACj4gKyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gKyMKPiArIyBub2RlanMtYmluCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiArCj4gKyMga2VlcCBpbiBzeW5jIHdpdGggcGFja2FnZS9ub2RlanMvbm9kZWpzLm1r
Cj4gK05PREVKU19CSU5fVkVSU0lPTiA9IDE2LjE3LjEKClNpbGx5IHF1ZXN0aW9uKHMpIGZyb20g
bWUuClRoaXMgbWF5IGdvIGFnYWluc3Qgc29tZSBCUiBndWlkZWxpbmVzLgoKQnV0LCB3aGF0IGlm
IHlvdSB3ZXJlIHRvIGFkZCBhICdwYWNrYWdlL25vZGVqcy92ZXJzaW9uJyBmaWxlIGFuZAppbmNs
dWRlIGl0IGhlcmUgbGlrZSBgaW5jbHVkZSAuLi9wYWNrYWdlL25vZGVqcy92ZXJzaW9uYCA/CgpB
bm90aGVyIGlkZWEgd291bGQgYmUgdG8gbWF5YmUgYWRkIGEgbmV3IGZvbGRlciBzdWItbGV2ZWwg
bGlrZQoncGFja2FnZS9ub2RlanMvbm9kZWpzLzx0aGUgY3VycmVudCBvbmU+JyAmCidwYWNrYWdl
L25vZGVqcy9ub2RlanMtYmluLzx0aGlzIG5ldyBvbmU+JyBhbmQgaGF2ZSBhCidwYWNrYWdlL25v
ZGVqcy9ub2RlanMubWsnIHdoaWNoIGluY2x1ZGVzIHRoZSBtayBmaWxlcyBmcm9tIHRoZQpzdWIt
ZGlycy4KQnV0IMKvXF8o44OEKV8vwq8KU3RpbGwgZG9uJ3Qga25vdyBpZiBpdCBnb2VzIGFnYWlu
c3QgQlIgZ3VpZGVsaW5lcy4KCj4gK05PREVKU19CSU5fU0lURSA9IGh0dHBzOi8vbm9kZWpzLm9y
Zy9kaXN0L3YkKE5PREVKU19CSU5fVkVSU0lPTikKPiArCj4gK2lmZXEgKCQoSE9TVEFSQ0gpLGFh
cmNoNjQpCj4gK05PREVKU19CSU5fQVJDSCA9IGFybTY0Cj4gK2Vsc2UgaWZlcSAoJChIT1NUQVJD
SCksYXJtKQo+ICsjIFdlIGFzc3VtZSB0aGF0IGlmIHNvbWVvbmUgZG9lcyBhIGJ1aWxkIG9uIEFS
TSwgaXQgd2lsbCBiZSBvbiBhbgo+ICsjIEFSTXY3IG1hY2hpbmUKPiArTk9ERUpTX0JJTl9BUkNI
ID0gYXJtdjdsCj4gK2Vsc2UgaWZlcSAoJChIT1NUQVJDSCkscHBjNjRsZSkKPiArTk9ERUpTX0JJ
Tl9BUkNIID0gcHBjNjRsZQo+ICtlbHNlIGlmZXEgKCQoSE9TVEFSQ0gpLHg4Nl82NCkKPiArTk9E
RUpTX0JJTl9BUkNIID0geDY0Cj4gK2VuZGlmCj4gKwo+ICtOT0RFSlNfQklOX1NPVVJDRSA9IG5v
ZGUtdiQoTk9ERUpTX0JJTl9WRVJTSU9OKS1saW51eC0kKE5PREVKU19CSU5fQVJDSCkudGFyLnh6
Cj4gK05PREVKU19CSU5fTElDRU5TRSA9IE1JVCAoY29yZSBjb2RlKTsgTUlULCBBcGFjaGUgYW5k
IEJTRCBmYW1pbHkgbGljZW5zZXMgKEJ1bmRsZWQgY29tcG9uZW50cykKPiArTk9ERUpTX0JJTl9M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICtOT0RFSlNfQklOX0NQRV9JRF9WRU5ET1IgPSBub2Rl
anMKPiArTk9ERUpTX0JJTl9DUEVfSURfUFJPRFVDVCA9IG5vZGUuanMKPiArCj4gK2RlZmluZSBI
T1NUX05PREVKU19CSU5fSU5TVEFMTF9DTURTCj4gKyAgICAgICByc3luYyAtYSAtLWV4Y2x1ZGU9
Q0hBTkdFTE9HLm1kIC0tZXhjbHVkZT1MSUNFTlNFIC0tZXhjbHVkZT1SRUFETUUubWQgXAo+ICsg
ICAgICAgICAgICAgICAkKEBEKS8qICQoSE9TVF9ESVIpLwo+ICtlbmRlZgo+ICsKPiArJChldmFs
ICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQo+IC0tCj4gMi4zNy4zCj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
