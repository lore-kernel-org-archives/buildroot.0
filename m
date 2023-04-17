Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44144C77B76
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 13:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9840F40396;
	Mon, 17 Apr 2023 13:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9840F40396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9eF8ZqCOXMx; Mon, 17 Apr 2023 13:03:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E504F41D0A;
	Mon, 17 Apr 2023 13:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E504F41D0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4197E1C41AF
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 13:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26A9E61452
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 13:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A9E61452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxtdZNNb_cis for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 13:03:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B228D6144F
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B228D6144F
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 13:03:11 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-54fe3cd445aso110731147b3.5
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 06:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681736590; x=1684328590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeFzS+S5OXsWVqjATqIKbzHMMq0X/wIvZrO09n+0YoI=;
 b=IVI7JPON8JbyX/yU1MvaWBj017uotXNF/EH4wvUqwBJ+89fI7N7yVpu1KUu92CVIaw
 cCsUFPCe+8f12eeHqC3KN95DQvbXFRjgZ5dYtcYwu8td+qcbEi8wZb79GofF+eaWUmH5
 SgQ0ejouMOPIly1oQJWwYcCKRxLDOrLJyZU3eM/AtXm+BNVoKXaYw9IZil/T3UrbOQuT
 fclPo6TF+czGU0U5U3yCrRvH8tWA05KIqXpwIz7aqjf4HaeTQ8vQ1wN+fUjV3h2YGA2l
 Fpajh7KRXKEeRyU+IrcF/Wk8tK6mwJW5b/TxqRhdi9YylBdbxxucibgJNA142cy5SObp
 8mTQ==
X-Gm-Message-State: AAQBX9dVmztSOuX9gCL+K8wZWaQE7EszPiANoXPApFOwO5Y356p0Wj1X
 M9hxd5ZuL25Z9XdgpsGmOd2xt/tS0Q1BSZpKBAkEfQ==
X-Google-Smtp-Source: AKy350a5MpxAy0PnX/HgwE6oCv6kojemJzeFoz0QZlpLTugoSlKCPoy+kppXy3mUlETah62wtC+oxCnkle3A6TS2Qus=
X-Received: by 2002:a81:b50a:0:b0:54b:fd28:c5ff with SMTP id
 t10-20020a81b50a000000b0054bfd28c5ffmr9454917ywh.3.1681736590431; Mon, 17 Apr
 2023 06:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230413092055.3438333-1-witold.lipieta@thaumatec.com>
 <20230414203209.GA2819@scaer>
In-Reply-To: <20230414203209.GA2819@scaer>
From: Witold Lipieta <witold.lipieta@thaumatec.com>
Date: Mon, 17 Apr 2023 15:02:59 +0200
Message-ID: <CAPrXEUDvhgMHD34Ar7P_no1wAZVd7Gvg1SZjciqoMqU_3-xidA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1681736590; x=1684328590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeFzS+S5OXsWVqjATqIKbzHMMq0X/wIvZrO09n+0YoI=;
 b=mdkLHLkEciaEr/iTCKTiTz7w4gjJK+JOgEmvCPKATS6gTqNImJs2LMB8Yf9OLdTW2T
 fysyen6HPTNgBFBbTaP0RSFgIx4eN+Dr9jsslT8x6GH/PViRDJ8tJbHRneTv0IRMsa+c
 M6e6S7EM2vbNLFVDMw/XFJRlcQuezTJWc3au0lZ+GJU1t+oB1E6c20vZD7oS3B/F1+l3
 twJCopx1nFQCInr2Z0rFTOpgHLIsOhOUuM32oTeLkBqcZHJeWwFngU+Nl+CR1NLeqZ6a
 rB5IzQ5ilHzqaMrc+toDFZe2GFBFh0J4u7LVbOJV77GKfBB+nWrdrLjOYFOLRDwO1zvV
 gjAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20221208.gappssmtp.com
 header.i=@thaumatec-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=mdkLHLkE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-evdev: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmtzIGZvciB0aGUgcmV2aWV3LCBJIHdpbGwgcHVzaCB1cGRhdGVkIHBhdGNoIHNvb24KCnB0
LiwgMTQga3dpIDIwMjMgbyAyMjozMiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJl
ZS5mcj4gbmFwaXNhxYIoYSk6Cj4KPiBXaXRvbGQsIEFsbCwKPgo+IE9uIDIwMjMtMDQtMTMgMTE6
MjAgKzAyMDAsIFdpdG9sZCBMaXBpZXRhIHNwYWtlIHRodXNseToKPiA+IGV2ZGV2IDEuNi4xIGh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9ldmRldi8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXaXRv
bGQgTGlwaWV0YSA8d2l0b2xkLmxpcGlldGFAdGhhdW1hdGVjLmNvbT4KPiA+IC0tLQo+IFstLVNO
SVAtLV0KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ldmRldi9Db25maWcuaW4gYi9w
YWNrYWdlL3B5dGhvbi1ldmRldi9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
PiBpbmRleCAwMDAwMDAwMDAwLi5mNmMwMjFlNjk0Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysg
Yi9wYWNrYWdlL3B5dGhvbi1ldmRldi9Db25maWcuaW4KPiA+IEBAIC0wLDAgKzEsNyBAQAo+ID4g
K2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fRVZERVYKPiA+ICsgICAgIGJvb2wgInB5dGhvbi1l
dmRldiIKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJFVkRFViAjIHJ1bnRpbWUKPgo+
IEkgY291bGQgbm90IGZpbmQgd2hlcmUgdGhhdCBkZXBlbmRlbmN5IGlzIHVzZWQgaW4gdGhlIGNv
ZGUuIENhbiB5b3UKPiBkb3VibGUgY2hlY2ssIHBsZWFzZT8KClJpZ2h0LCBpdCB3YXMgZGVwZW5k
ZW5jeSBpbiBteSBhcHBsaWNhdGlvbgoKPiBIb3dldmVyLCBpdCB1c2VzIGlucHV0LWV2ZW50LWNv
ZGVzLmgsIHdoaWNoIHdhcyBvbmx5IGluY2x1ZGVkIGluIGxpbnV4Cj4gNC40LCBzbyBpdCBzaG91
bGQgZGVwZW5kIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzQuCgpHb29kIGNh
dGNoCgo+IFstLVNOSVAtLV0KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ldmRldi9w
eXRob24tZXZkZXYubWsgYi9wYWNrYWdlL3B5dGhvbi1ldmRldi9weXRob24tZXZkZXYubWsKPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi4zM2ZlMDcxOTE2Cj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1ldmRldi9weXRob24tZXZk
ZXYubWsKPiA+IEBAIC0wLDAgKzEsMTggQEAKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ID4gKyMKPiA+ICsjIHB5dGhvbi1ldmRldgo+ID4gKyMKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ID4gKwo+ID4gK1BZVEhPTl9FVkRFVl9WRVJTSU9OID0gMS42LjEKPiA+ICtQWVRIT05f
RVZERVZfU09VUkNFID0gZXZkZXYtJChQWVRIT05fRVZERVZfVkVSU0lPTikudGFyLmd6Cj4gPiAr
UFlUSE9OX0VWREVWX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvMDUvNTAvNjI5YjAxMWE3ZjYxY2IyZmNhNzU0ZWE4NjMxNTc1Nzg0YmY4NjA1YTFlYzRkNjk3
MGEwMTBiYzU0ZTJiCj4gPiArUFlUSE9OX0VWREVWX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4g
PiArUFlUSE9OX0VWREVWX0xJQ0VOU0UgPSBSZXZpc2VkIEJTRCBMaWNlbnNlCj4gPiArUFlUSE9O
X0VWREVWX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiArCj4gPiArUFlUSE9OX0VWREVWX0JV
SUxEX09QVFMgPSBcCj4gPiArICAgICBidWlsZF9lY29kZXMgXAo+ID4gKyAgICAgLS1ldmRldi1o
ZWFkZXJzICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL2xpbnV4L2lucHV0Lmg6JChTVEFHSU5H
X0RJUikvdXNyL2luY2x1ZGUvbGludXgvaW5wdXQtZXZlbnQtY29kZXMuaAo+Cj4gc2V0dXAucHkg
YWxzbyBsaXN0cyAvdXNyL2luY2x1ZGUvbGludXgvdWlucHV0LmgsIHNvIG1heWJlIHdlIHdhbnQg
dG8KPiBhbHNvIGluY2x1ZGUgdGhhdD8KCkxvb2tzIGxpa2UgaW5zdHJ1Y3Rpb25zIGFyZSBub3Qg
dXAgdG8gZGF0ZSBpbiB0aGUgZG9jcywgSSB3aWxsIGFwcGVuZAp0aGlzIHBhdGggdG9vLgoKPiBS
ZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICskKGV2YWwgJChweXRob24tcGFja2FnZSkp
Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZ
YW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBF
cmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
