Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB657C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 09:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41F4C81764;
	Sun, 21 Nov 2021 09:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhMPTTVKjeI6; Sun, 21 Nov 2021 09:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 964638102A;
	Sun, 21 Nov 2021 09:30:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EAF61BF2EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 09:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E165403E7
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 09:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJLw34d2RLyv for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 09:30:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1039403D4
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:30:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y26so65517035lfa.11
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 01:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mDap8SzAHE8uzHNx7o8k1gLMy+jfmDishTgrMx+UVP4=;
 b=IdKY4YORFQQR9udM6yL81RZBbCINYixtGoqOHvi7g+1XsUPUGxZlGy3234Ne/G6dWC
 9bupRxshJ4czRyGJlEWhk4LP3iudw4QEq2B2Miq/KfYyy02b7wwG+hmGz2ztIROYyc5+
 Q28/klO95WGCnz0ntO8v0YbVn7YYoZAeqnCx5X2rTXqEaFRQKAT0Wd3LQ/zOk478Tqjg
 TQc63ijEsUox0BcKPAYBdvxm++o7ohu8LyOEjlqjHQEcun92hBzCUvVSap6EKWVnrV5Z
 32+DH9wsNI1ckc39IKjNWsF/aJPvKCaTduE+8kz960Tl7PgxhadlIRak6JsJiw236gOG
 tx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mDap8SzAHE8uzHNx7o8k1gLMy+jfmDishTgrMx+UVP4=;
 b=AsJTMDX56bZXEKgOP0zWcuksi329bStTa5U/utC/S9tbQYF9fyrsQ5sp3iHVToFr/H
 f4GN8peB5kd7Dg8HRMSScKLZGBZNaOfzJSWFRs4blyysb0oOhtgdJGmrKsQ5ll+wFiNc
 Tp0MmzpD69qrPbi2mCyHZhBbAKKUbexu3WojCfgtOqd/pbv1ggoFMTMHeucaYYhuIpxZ
 H6gP00AaggnhUKXO0tqXo2swZDm6WxTRpVfo1APgeicaLGU1cy8Dp8G3h3xcJGbrQaga
 IKlhIKT4CJUd/nHE3DiILUVv52+3ySAbdih10aYAU9EXKo2eP6264IGlisagKdoEYZfI
 pn7A==
X-Gm-Message-State: AOAM530VxX0KbMyWfbXkZGZq0odATZHsjuE8/709H0oERhISIPM1WlC7
 N3/74i1OT/g5EfeEuHqX/CJ5cB16YJ+y0t4nvms=
X-Google-Smtp-Source: ABdhPJxaBvMlqHsoXfX3Btmifz4+TQTUf7YXO6E7VzOXWR4K4TtYWtsLYCaW75G2lyNCXmJBVfLCNhP8Thk25Kn3nDc=
X-Received: by 2002:a2e:b947:: with SMTP id 7mr42292176ljs.89.1637487042843;
 Sun, 21 Nov 2021 01:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20211120222857.3110528-1-fontaine.fabrice@gmail.com>
 <20211121072211.GU247986@scaer>
In-Reply-To: <20211121072211.GU247986@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Nov 2021 10:28:17 +0100
Message-ID: <CAPi7W821JT3=jukPMGRTumeBJYLDk-1RM6KNbiF0MxQgsH=4Zw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: mount /sys
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIGRpbS4gMjEgbm92LiAyMDIxIMOgIDA4OjIyLCBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24g
MjAyMS0xMS0yMCAyMzoyOCArMDEwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4g
PiBGaXhlczoKPiA+ICAtIGh0dHBzOi8vYnVncy5idWlsZHJvb3Qub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xNDM1MQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9idXN5Ym94L2luaXR0YWIg
fCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9idXN5Ym94L2luaXR0YWIgYi9wYWNrYWdlL2J1c3lib3gvaW5pdHRhYgo+
ID4gaW5kZXggZmYxNzI1Yzc3NS4uMjJlNjNkMTYwMyAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uv
YnVzeWJveC9pbml0dGFiCj4gPiArKysgYi9wYWNrYWdlL2J1c3lib3gvaW5pdHRhYgo+Cj4gWW91
IG1pc3NlZCBwYWNrYWdlL3N5c3Zpbml0L2luaXR0YWIKPgo+IEJ1dCB3ZSBhbHJlYWR5IGhhdmUg
L3N5cyBpbiBwYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdi9za2VsZXRvbi9ldGMvZnN0YWIKPiBz
byBob3cgaXMgZ29pbmcgdG8gcGxheSB0b2dldGhlcj8KPgo+IEFkbiBmaW5hbHlsLCB0aGUgMS1j
ZW50IHF1ZXN0aW9uIChJIGNhbid0IGFmZm9yZCB0aGUgb25lLW1pbGxpb24gZG9sbGFyCj4gcXVl
c3Rpb24pOiBob3cgZG9lcyB0aGluZyBoYXBwZW4gd2l0aCBzeXN0ZW1kPyBXaXRoIG9wZW5yYz8K
SW5kZWVkLCBJJ2xsIGJhY2twb3J0IHRoZSB0d28gdXBzdHJlYW0gcGF0Y2hlcyBvbiB1dGwtbGlu
dXggaW5zdGVhZCBvZgptb3VudGluZyAvc3lzLgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklO
Lgo+Cj4gPiBAQCAtMTUsNiArMTUsNyBAQAo+ID4KPiA+ICAjIFN0YXJ0dXAgdGhlIHN5c3RlbQo+
ID4gIDo6c3lzaW5pdDovYmluL21vdW50IC10IHByb2MgcHJvYyAvcHJvYwo+ID4gKzo6c3lzaW5p
dDovYmluL21vdW50IC10IHN5c2ZzIHN5c2ZzIC9zeXMKPiA+ICA6OnN5c2luaXQ6L2Jpbi9tb3Vu
dCAtbyByZW1vdW50LHJ3IC8KPiA+ICA6OnN5c2luaXQ6L2Jpbi9ta2RpciAtcCAvZGV2L3B0cyAv
ZGV2L3NobQo+ID4gIDo6c3lzaW5pdDovYmluL21vdW50IC1hCj4gPiAtLQo+ID4gMi4zMy4wCj4g
Pgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+
IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwt
VGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+
IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAg
ICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCkJlc3QgUmVnYXJk
cywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
