Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837B8CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8EEF8119D;
	Sun, 22 Sep 2024 10:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-s6Z4y64oSp; Sun, 22 Sep 2024 10:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B1A811A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B1A811A0;
	Sun, 22 Sep 2024 10:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FDB51BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B231403C9
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUfDQEOFghNB for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B327D403BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B327D403BD
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B327D403BD
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:49:14 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-846c44bfbe7so655248241.3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727002153; x=1727606953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wSoLEXcGGEwh4tMT+SZaMnEgbFagGKvvzO2sQ1reNs=;
 b=uhNKCJuWhf9baniWh1xafmgSYo78ln8X5otKcyFJNrOyjgW/CF9e7GlGgt8zNMuqwG
 3lm9Th2u60GT3cqVpChQ21ZHuVmuOgzypCvoFQd/Z5jKboiVrdTffn+gdaHBiB4FMRrs
 1tigwVEqCQ315Agcql3Jdh6r4O9WfVNSahgbpaDtl/WSzShYdvnT3zCUvwgWiFYhs8fH
 7q/XV7odC9HE8cGNFOnKAdHGRJlIEdx+6/5c1d2amcBwcjMneWMTbuBkZvLKav+i6lzP
 iixWf/7Fw3PrmEyG8HdV182mEYYe9/YCnq1MIipzurDKY70u8KA5JQTLRU35zKCpvKMB
 M1kQ==
X-Gm-Message-State: AOJu0Yxu2ElFngYcckj7XxhrFNYckDJg67C17kjECJJvx9mrFAHxYQD2
 7YcbsgaCEng7yeLlHRzBBF/oLAhsfF8WrOTQyWokTgZueViP2HhZ4yKlcY5JfAk59oC7qyoSlun
 QtuWQvpz9ZNtSSTQsdbsJd1Z48GE=
X-Google-Smtp-Source: AGHT+IEgIyJ4w+p3bQzeFGJzmZA4Wfb1E+hwzbAgmDKmg/wY6EPJPHSQKJEecs3FWRWcQcrlG57MfkkU51newxkBtdM=
X-Received: by 2002:a05:6122:907:b0:4f5:2c0c:8528 with SMTP id
 71dfb90a1353d-503e05501f1mr4957361e0c.11.1727002153310; Sun, 22 Sep 2024
 03:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240922054607.946074-1-james.hilliard1@gmail.com>
 <Zu_ypqLrKDtSYD4U@landeda>
In-Reply-To: <Zu_ypqLrKDtSYD4U@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Sep 2024 04:49:02 -0600
Message-ID: <CADvTj4rGDMMjQ68RwWBbUoXt=pVe50UyR_Ej9zyruYrcE71vyg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727002153; x=1727606953; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wSoLEXcGGEwh4tMT+SZaMnEgbFagGKvvzO2sQ1reNs=;
 b=Z4OCDRE1ORfnTYo5mWsQZN95mVJw5GFr3uGCBHGB3MMOghqi7DfB2sHUBmHeWwRx99
 Q/DrK86PP5KagcJW0Lw3Ey5RNWb6HLqSQezMq0ksHXdqMIeAyDMIh+xcgIJgGGgM/rMn
 kwAKvV4V6PMaABvF4GgWZf2lQlPZG7FSCM+4NvS01TXt9Mh94R2HYl1d4YiMSowWktjH
 XNG+0g1Rn3cgindnzahLlS4SIMTACzL+TLer8rCbZ84YKNLobbBsjbZ5sXQNHXMC3uZU
 PfGoIjJeEmUD4ZOGO7MYOHGJIUA/cMPrUoKyoACl53HpO08gfgYf1PuNJCmeOkltY5nc
 R3lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z4OCDRE1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-types-python-dateutil:
 bump to version 2.9.0.20240906
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBTZXAgMjIsIDIwMjQgYXQgNDozNOKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTA5LTIx
IDIzOjQ2IC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gIC4uLi9weXRob24tdHlwZXMtcHl0aG9uLWRhdGV1dGlsLmhhc2ggICAgICAgICAgICAgICAg
ICAgICAgICAgfCA0ICsrLS0KPiA+ICAuLi4vcHl0aG9uLXR5cGVzLXB5dGhvbi1kYXRldXRpbC5t
ayAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLXR5cGVzLXB5dGhvbi1kYXRldXRpbC9weXRob24tdHlwZXMtcHl0aG9uLWRh
dGV1dGlsLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi10eXBlcy1weXRob24tZGF0ZXV0aWwvcHl0aG9u
LXR5cGVzLXB5dGhvbi1kYXRldXRpbC5oYXNoCj4gPiBpbmRleCBlZjVlOTM4MGNmLi40YTJkY2Vj
NTAyIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9weXRob24tdHlwZXMtcHl0aG9uLWRhdGV1dGls
L3B5dGhvbi10eXBlcy1weXRob24tZGF0ZXV0aWwuaGFzaAo+ID4gKysrIGIvcGFja2FnZS9weXRo
b24tdHlwZXMtcHl0aG9uLWRhdGV1dGlsL3B5dGhvbi10eXBlcy1weXRob24tZGF0ZXV0aWwuaGFz
aAo+ID4gQEAgLTEsMyArMSwzIEBACj4gPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlw
aS5vcmcvcHlwaS90eXBlcy1weXRob24tZGF0ZXV0aWwvanNvbgo+ID4gLW1kNSAgNTgwNzI5MjJh
YzBjNzQwMTIxZTMxMWU5NzBmMDAzYmYgIHR5cGVzLXB5dGhvbi1kYXRldXRpbC0yLjguMTkuMTQu
dGFyLmd6Cj4gPiAtc2hhMjU2ICAxZjRmMTBhYzk4YmI4YjE2YWRlOWRiZWUzNTE4ZDlhY2UwMTc4
MjFkOTRiMDU3YTQyNWIwNjlmODM0NzM3ZjRiICB0eXBlcy1weXRob24tZGF0ZXV0aWwtMi44LjE5
LjE0LnRhci5nego+ID4gK21kNSAgMGQ5MTQyMmU5MjAwMGU3N2Q2MzNhOGFkZmYzMDM5ZTcgIHR5
cGVzLXB5dGhvbi1kYXRldXRpbC0yLjkuMC4yMDI0MDkwNi50YXIuZ3oKPiA+ICtzaGEyNTYgIDk3
MDZjM2I2ODI4NGMyNWFkZmZjNDczMTllY2M3OTQ3ZTViYjg2YjM3NzNmODQzYzczOTA2ZmQ1OThi
YzE3NmUgIHR5cGVzLXB5dGhvbi1kYXRldXRpbC0yLjkuMC4yMDI0MDkwNi50YXIuZ3oKPgo+IFRo
ZXJlJ3Mgbm8gbGljZW5zZSBmaWxlIGlkZW50aWZpZWQsIGFuZCBubyBoYXNoIGZvciBpdC4gQ291
bGQgeW91IHNlbmQKPiBhIGZvbGxvdy11cCBwYXRjaCBhZGRpbmcgdGhvc2UsIHBsZWFzZT8KCldl
bGwuLi5pc3N1ZSBpcyB0aGF0IHRoZXJlJ3Mgbm8gbGljZW5zZSBmaWxlIGluIHRoZSBzZGlzdCwg
d2hpY2ggYXBwZWFycyB0bwphbHNvIGJlIGF1dG9nZW5lcmF0ZWQgYnkgaHR0cHM6Ly9naXRodWIu
Y29tL3B5dGhvbi90eXBlc2hlZC4KCkxvb2tzIGxpa2UgdGhlcmUncyBhbHJlYWR5IGFuIG9wZW4g
cmVxdWVzdCB1cHN0cmVhbToKaHR0cHM6Ly9naXRodWIuY29tL3R5cGVzaGVkLWludGVybmFsL3N0
dWJfdXBsb2FkZXIvaXNzdWVzLzg5Cgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdHlwZXMtcHl0aG9uLWRhdGV1dGlsL3B5dGhv
bi10eXBlcy1weXRob24tZGF0ZXV0aWwubWsgYi9wYWNrYWdlL3B5dGhvbi10eXBlcy1weXRob24t
ZGF0ZXV0aWwvcHl0aG9uLXR5cGVzLXB5dGhvbi1kYXRldXRpbC5tawo+ID4gaW5kZXggYjIzMDM5
NDEyMC4uYzIxMGQ3MWIwYyAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXR5cGVzLXB5
dGhvbi1kYXRldXRpbC9weXRob24tdHlwZXMtcHl0aG9uLWRhdGV1dGlsLm1rCj4gPiArKysgYi9w
YWNrYWdlL3B5dGhvbi10eXBlcy1weXRob24tZGF0ZXV0aWwvcHl0aG9uLXR5cGVzLXB5dGhvbi1k
YXRldXRpbC5tawo+ID4gQEAgLTQsOSArNCw5IEBACj4gPiAgIwo+ID4gICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gPgo+ID4gLVBZVEhPTl9UWVBFU19QWVRIT05fREFURVVUSUxfVkVSU0lPTiA9
IDIuOC4xOS4xNAo+ID4gK1BZVEhPTl9UWVBFU19QWVRIT05fREFURVVUSUxfVkVSU0lPTiA9IDIu
OS4wLjIwMjQwOTA2Cj4gPiAgUFlUSE9OX1RZUEVTX1BZVEhPTl9EQVRFVVRJTF9TT1VSQ0UgPSB0
eXBlcy1weXRob24tZGF0ZXV0aWwtJChQWVRIT05fVFlQRVNfUFlUSE9OX0RBVEVVVElMX1ZFUlNJ
T04pLnRhci5nego+ID4gLVBZVEhPTl9UWVBFU19QWVRIT05fREFURVVUSUxfU0lURSA9IGh0dHBz
Oi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8xYi8yZC9mMTg5ZTVjMDNjMjI3MDBj
NGNlNWFlY2U0YjUxYmI3M2ZhOGFkY2ZkNzg0ODYyOWRlMGZiNzhhZjVmNmYKPiA+ICtQWVRIT05f
VFlQRVNfUFlUSE9OX0RBVEVVVElMX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5v
cmcvcGFja2FnZXMvM2UvZDkvOWM5ZWMyZDg3MGFmN2FhOWI3MjJjZTRmZDU4OTBiYjU1YjFkMTg4
OThkZjdmMWQwNjljYWIxOTRiYjJhCj4gPiAgUFlUSE9OX1RZUEVTX1BZVEhPTl9EQVRFVVRJTF9T
RVRVUF9UWVBFID0gc2V0dXB0b29scwo+ID4gIFBZVEhPTl9UWVBFU19QWVRIT05fREFURVVUSUxf
TElDRU5TRSA9IEFwYWNoZS0yLjAKPiA+Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
