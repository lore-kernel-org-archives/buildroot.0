Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11615C3DA6E
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 00:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88266811BB;
	Tue, 26 Dec 2023 00:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88266811BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZP4tHfl5qF5j; Tue, 26 Dec 2023 00:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB2A813C4;
	Tue, 26 Dec 2023 00:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB2A813C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88D5E1BF3A3
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 00:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ABEC60A65
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 00:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABEC60A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4v4EmamIfvV7 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 00:47:14 +0000 (UTC)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 446E1607AA
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 00:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446E1607AA
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5942259ca62so2486891eaf.3
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 16:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703551633; x=1704156433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BvcQ/1iHX5NYUYeyM6i6D5QMZoQ/STHAfupbB0jl0bk=;
 b=XmKRldB0gkIpoGTNHDZIMaP/DzWakSzA1vrq6nNIwabMXgzjGzKQ+2H7WBGl8ZBpva
 LSAz6cWqT2GgxVqy/cBNPmCHoCzELLmOpPC6LoxMj944AGL8Xu73KTjHxwCzy1SUNKKe
 0P88PSnq0hF2iBvFr0xpQQPTa2rHoal8roR5ZvbZBGwgqOe3FNlMO2+xFRU2dYrOCXR4
 a28EEEfS8TsKBBMCwvUKO48eYDpYCv1hX7anKzxXfnTPCI9vRGBSWm8WKa1H43cIjJbt
 CtC0TFCGJDYhvxHcBhBiRNOU9r3CzgMy7xqbkHPga382Uw2sgQNShw+y//U52fCvwgLU
 QCIw==
X-Gm-Message-State: AOJu0Yzpr9H/06orSWFr0CG1Hsh0rF/gqBIYQ0E97p2u4505i/W4JPNS
 KEd9D7o6f9ODcp62tsAN9TBxkmfpJAcgXmDg7k8znpcHyoXioA==
X-Google-Smtp-Source: AGHT+IGi6KcO+dwi3WzcG7FJLNsDtUTfaWCYjxQXzd3BWdqECgclta7laDyre2einGd5SVbgGNUbnAg+lXmOxu5mglw=
X-Received: by 2002:a05:6358:103:b0:174:dc1b:29f2 with SMTP id
 f3-20020a056358010300b00174dc1b29f2mr3143460rwa.11.1703551632665; Mon, 25 Dec
 2023 16:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
 <20231214165420.181703-6-james.hilliard1@gmail.com>
 <20231225212415.3e6b7621@windsurf>
In-Reply-To: <20231225212415.3e6b7621@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 25 Dec 2023 17:47:01 -0700
Message-ID: <CADvTj4qyLnC=L0bn18cE6sNDEw9bWX=785E8ncJek9=G0VQxyQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703551633; x=1704156433; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvcQ/1iHX5NYUYeyM6i6D5QMZoQ/STHAfupbB0jl0bk=;
 b=fOMfrW/Kb1awxVZzrx9zAf2i7tw936e/CWl1azEIO3Zoee9//5/zTave1sBulI/x/i
 Nyf9KQUnPx0BYJqTUHMWtC+Hj8dvpWAY+IuEI7MRURcTzoI0msqamS9mD0tU9G1752Xw
 Dn7uZuxyQK6t9AmKMo7O8wAOAP4uhKIXpF3tmH6b5nksK4SRhoS5vGBVhj7es5usz8Tm
 GLJqdTFH1jpWrwGhK+i2QunNL4dBd+7IsoOo/LwjM2utcy5pcgiXHN6EWKBXzpR7ORLo
 /ZGfHnCxw89KUsxJOqlcntOHVglwzhEFssJptHJyuxsvb85XELf6aQgtvBHXP9cj262L
 aVGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fOMfrW/K
Subject: Re: [Buildroot] [PATCH v3 6/8] package/python-fastapi-sessions: new
 package
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBEZWMgMjUsIDIwMjMgYXQgMToyNOKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBU
aHUsIDE0IERlYyAyMDIzIDA5OjU0OjE4IC0wNzAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IEkgYW0gYXBwbHlpbmcgdGhpcyBz
ZXJpZXMsIGFuZCBJIGhhdmUgYSBmZXcgcXVlc3Rpb25zIG9uIHRoaXMgcGF0Y2guCj4gVGhleSB3
b24ndCBwcmV2ZW50IGFwcGx5aW5nIHRoZSBwYXRjaCwgdGhleSBhcmUgbW9yZSBmb3IgbXkKPiBj
dXJpb3NpdHkvdW5kZXJzdGFuZGluZy4KPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LWZhc3RhcGktc2Vzc2lvbnMvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tZmFzdGFwaS1zZXNz
aW9ucy9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAw
MDAwLi5hNTRiMDcyZjA5Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL3B5dGhv
bi1mYXN0YXBpLXNlc3Npb25zL0NvbmZpZy5pbgo+ID4gQEAgLTAsMCArMSwxMCBAQAo+ID4gK2Nv
bmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fRkFTVEFQSV9TRVNTSU9OUwo+ID4gKyAgICAgYm9vbCAi
cHl0aG9uLWZhc3RhcGktc2Vzc2lvbnMiCj4gPiArICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMgIyBweXRob24tcHlkYW50aWMgLT4gcHl0
aG9uLXB5ZGFudGljLWNvcmUKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fRkFT
VEFQSSAjIHJ1bnRpbWUKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fSVRTREFO
R0VST1VTICMgcnVudGltZQo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9QWURB
TlRJQyAjIHJ1bnRpbWUKPgo+IEkgaW5kZWVkIHNlZSBweWRhbnRpYyBpbXBvcnRlZCBpbiB0d28g
cGxhY2VzOgo+Cj4gJCBncmVwIC1yIHB5ZGFudGljICoKPiBmYXN0YXBpX3Nlc3Npb25zL2JhY2tl
bmRzL3Nlc3Npb25fYmFja2VuZC5weTpmcm9tIHB5ZGFudGljLm1haW4gaW1wb3J0IEJhc2VNb2Rl
bAo+IGZhc3RhcGlfc2Vzc2lvbnMvZnJvbnRlbmRzL2ltcGxlbWVudGF0aW9ucy9jb29raWUucHk6
ZnJvbSBweWRhbnRpYy5tYWluIGltcG9ydCBCYXNlTW9kZWwKPgo+IEhvd2V2ZXIsIGl0J3Mgbm90
IGxpc3RlZCBpbiBzZXR1cC5weSBvciBweXByb2plY3QudG9tbCwgZXZlbiBhcyBhbgo+IG9wdGlv
bmFsIGRlcGVuZGVuY3kuIElzIHRoaXMgYW4gdXBzdHJlYW0gImJ1ZyIgPwoKSSBzZWUgaXQgaW4g
c2V0dXAucHkgaGVyZToKaHR0cHM6Ly9naXRodWIuY29tL2pvcmRhbmlzYWFjcy9mYXN0YXBpLXNl
c3Npb25zL2Jsb2IvYmU0MTI2OTM4MDExYWJkNzA5ZmExOGU5ZDlmYzhhNTRjNjZhMjEzMC9zZXR1
cC5weSNMMTIKCj4KPgo+ID4gK1BZVEhPTl9GQVNUQVBJX1NFU1NJT05TX1ZFUlNJT04gPSAwLjMu
Mgo+ID4gK1BZVEhPTl9GQVNUQVBJX1NFU1NJT05TX1NPVVJDRSA9IGZhc3RhcGktc2Vzc2lvbnMt
JChQWVRIT05fRkFTVEFQSV9TRVNTSU9OU19WRVJTSU9OKS50YXIuZ3oKPiA+ICtQWVRIT05fRkFT
VEFQSV9TRVNTSU9OU19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2th
Z2VzLzFkLzg5L2RhODNiYTQ3YmQ3MDEwMWUxNGVjYTBhYzU3YzdmMzAwYjA1NWI3MDEwNDQ0NmJh
ZGZkYzFkY2JlODEzZgo+ID4gK1BZVEhPTl9GQVNUQVBJX1NFU1NJT05TX1NFVFVQX1RZUEUgPSBz
ZXR1cHRvb2xzCj4KPiBJIHNlZSB5b3UncmUgdXNpbmcgcGxhaW4gb2xkIHNldHVwdG9vbHMsIGJ1
dCB0aGlzIHBhY2thZ2UgaGFzIGEKPiBweXByb2plY3QudG9tbCwgdGhvdWdoIGl0IGRvZXNuJ3Qg
ZGVmaW5lIGEgW2J1aWxkLXN5c3RlbV0uIElzIHRoaXMgd2h5Cj4geW91IGNhbid0IHVzZSBwZXA1
MTc/CgpBIHBhY2thZ2Ugd2l0aCBubyBbYnVpbGQtc3lzdGVtXSBzZWN0aW9uIGluIHB5cHJvamVj
dC50b21sIHBlciBwZXA1MTcKZmFsbHMgYmFjayB0byB0aGUgc2V0dXB0b29scyBidWlsZCBiYWNr
ZW5kLgoKV2UgY2FuIHVzZSBhIHBlcDUxNyBmcm9udGVuZCB3aXRoIHNldHVwdG9vbHMgcGFja2Fn
ZXMsIHNlZToKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDIzMTEyNjE4MDg0MC4yMDgxOTQ1LTUtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8K
Cj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
