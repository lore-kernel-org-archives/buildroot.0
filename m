Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D94C0218D
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 01:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D5FC81036;
	Mon, 27 Jan 2025 01:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCg6pFrXGCY3; Mon, 27 Jan 2025 01:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CBE08103B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBE08103B;
	Mon, 27 Jan 2025 01:48:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E292594A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 01:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD42C4057D
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 01:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1htfCV86S-I for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 01:48:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B183B4056A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B183B4056A
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B183B4056A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 01:48:56 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-8641bc78952so842033241.0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737942535; x=1738547335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CNv4Q/UhpICJ3MUe6NVkn4WFnG19jajSY9Ephs/tYI=;
 b=mmE+zOm7PF2d0oErUufIxKv1ROjdHqoeHQ4QvwO0KCMC1ZfIHJI9dMfrXic/ZRxe4O
 Vv9MedejSpybjVVEqNsa70/e2Bt8PjgGw60hFw7hDooSko/1OTtlOjQmEFA2kP2fvcqs
 Ti0bDMH2sWICEXh2kNCzv50/DtkNeqw9Bxj/gC+2N3yh2kbdwghMyBlDVSuUDFCMF4N7
 mu8AzksPSRuI0PA+kcZTRKIBBbyzPxeX3AOZXBr+D9rp5gVG5k4BZkti3gchuLp5pG7r
 s7fWUUHuKCK18/lxBjUDlnHfkGbPe4kjMpnkRYtG3yppintT0JTYL+m9zJr/pNXy+F1p
 3ebw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1SixUh03SnTxt4aEzetQs/sGJaYJKnsXAA9WKvodg6uxWxwhjLCSfa5qcWViNUkQ6nqeY/ApH2BY=@buildroot.org
X-Gm-Message-State: AOJu0YyJ0IABrYIV9baYUZPuxVcwZBQKvFZEetvPSFGaqPBqcKiGKOM0
 qYSr9mgU1OSyB0V54Q7H0bOyBZJ3SVJ1r4Ml+5oj519clSNO+SpzxItyliCYcEcL8i5dod2Vc4e
 JHE3Zb4tAwL6gf/noP1TABGfnylY=
X-Gm-Gg: ASbGncs2Pt2lcoGr2A6WGXIIaCnIRCCKIy5SwLEN4aj+FHS4Nk+J+EUoU28UhE9JtDC
 RGtv+Th2wflhayLMi4argujD9kK9Bi3O+yYHE4/+qAiBsH/Gbcfdx8LPDX8atIA==
X-Google-Smtp-Source: AGHT+IFufJdeXaitgPPK2uz4J6Pivd5TYh89wVEBBm/Nnc+hmvrwu9YBCwcD/SEwGresrBN9uoZAId77vHgw0QiLwMM=
X-Received: by 2002:a05:6102:2911:b0:4b1:8b53:2987 with SMTP id
 ada2fe7eead31-4b690b7fd57mr32888249137.1.1737942534994; Sun, 26 Jan 2025
 17:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20241211191630.1414970-1-bernd@kuhls.net>
 <20241211191630.1414970-2-bernd@kuhls.net>
 <20241229221255.2138fc09@windsurf>
 <e327553b-93a3-44cc-9b70-48bab7497067@gmx.de>
 <PH1P110MB1603B3EEB73618CFAF45272D9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <25105903-5086-463e-847b-d4a392f0cbd0@gmx.de>
 <PH1P110MB1603F80585C666F0A6C9336A9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <048fbeab-8e9c-474f-a8a8-8921c09b26f0@kuhls.net>
In-Reply-To: <048fbeab-8e9c-474f-a8a8-8921c09b26f0@kuhls.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jan 2025 03:48:43 +0200
X-Gm-Features: AWEUYZnW6RFZCLTXgrcv_yF1CsKuHEsXwcjoLNF7eP6Bcw7zbFZV-hIJESyE37I
Message-ID: <CADvTj4pBcw1BjMSwjvzKS0ULq2CYu1D40aVZ5hQ5_0gOCbnJRg@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737942535; x=1738547335; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CNv4Q/UhpICJ3MUe6NVkn4WFnG19jajSY9Ephs/tYI=;
 b=ArOP64QWAPm/SEkpSYQin++DPYz0AHS7EzgMo8Q7QeGWI3IrQze/dsNQumcu5Tgp0V
 6aSWxUTvaeTogB63swhHafhAu5TRVg2CDAM9zf7Uzj2l4ENNfC8sUtAIx+WpBUhvUgad
 mpa0laN5lPO2dt0rjjDKHUXLZOXIYsOeb/ZQPDJfEp/hU8HoACTVsQ4cPty1KdiIXEIQ
 o0p7tENFe+r/BzGmHnu2PI+ZJXH2ArqJ4PumgdedoVeG1OLlPqo+ukDL/95VHrUbcQbx
 ZoHdkTCsWLlFt07nh2zPjdUXcxg0tiGaOzviFenoSL91wcT2mt1iRI7Kfnl3q+RMgKRV
 sX+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ArOP64QW
Subject: Re: [Buildroot] [External] - Re: [PATCH v2 2/2]
 package/python-emailproxy: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgMjo1N+KAr0FNIEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+IHdyb3RlOgo+Cj4gSGkgVmluY2VudCwKPgo+IEFtIDEzLjAxLjI1IHVtIDIwOjM4IHNj
aHJpZWIgVmluY2VudCBGYXppbzoKPiA+Pj4+IEFtIDI5LjEyLjI0IHVtIDIyOjEyIHNjaHJpZWIg
VGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290Ogo+ID4+Pj4+IEkgYW0gc3RpbGwgbm90IGhh
cHB5IHdpdGggaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5IGhvc3QtCj4gPj4+Pj4gcHl0aG9uLXB5
YXN5bmNvcmUgYmVpbmcgZGVwZW5kZW5jaWVzLCB3aGlsZSB0aGV5IGRlZmluaXRlbHkKPiA+Pj4+
PiBzaG91bGRuJ3QgYmUgbmVlZGVkLiBJIGtub3cgSmFtZXMgYXNrZWQgeW91IHRvIHVzZSAtLXNr
aXAtCj4gPj4+Pj4gZGVwZW5kZW5jeS1jaGVjaywgYW5kIGl0IGFwcGFyZW50bHkgd2Fzbid0IHdv
cmtpbmcgd2l0aDoKPiA+Cj4gPiBJZiB3ZSB3YW50ZWQgdG8gcmVseSBvbiBzZXR1cHRvb2xzJyBk
ZXBlbmRlbmN5IHJlc29sdXRpb24sIHdlIG5lZWQKPiA+IHRvIHJlbW92ZSB0aGUgYC0tbm8taXNv
bGF0aW9uYCBmbGFnIGluIHRoZSBidWlsZCwgb3RoZXJ3aXNlIGl0Cj4gPiBhc3N1bWVzIHRoZSBk
ZXBlbmRlbmNpZXMgYXJlIGF2YWlsYWJsZSB3aXRoaW4gaG9zdC1weXRob24gKHdoaWNoIGlzCj4g
PiB3aHkgdGhlIGhvc3QgcGFja2FnZXMgYXJlIG5lY2Vzc2FyeSkuIEkgdGVzdGVkIGRyb3BwaW5n
IGAtbmAgZnJvbQo+ID4gdGhlIGJ1aWxkIGNvbW1hbmQgYW5kIGl0IHdvcmtlZCBPSy4gSSdtIGd1
ZXNzaW5nIHdlIGRvIHRoaXMgc28gdGhhdAo+ID4gQlIgaXMgYW4gaXNsYW5kIGFuZCBzZWxmLWNv
bnRhaW5lZC4KPgo+IHRoYW5rcyBmb3IgdGhlIGhpbnQuIFllcywgcmVtb3ZpbmcgIi1uIiBmcm9t
IFBLR19QWVRIT05fUEVQNTE3X0JVSUxEX0NNRAo+IGZpeGVzIHRoZSBidWlsZCBvZiBweXRob24t
ZW1haWxwcm94eSBidXQgYnJlYWtzIGRvemVucyBvZiBvdGhlciBweXRob24KPiBwYWNrYWdlcy4g
QWRkaW5nICItbiIgdG8gX0JVSUxEX09QVFMgb2YgdGhlc2UgcGFja2FnZXMgZml4ZXMgdGhlbSBi
dXQgaXQKPiB3aWxsIHJlcXVpcmUgbG90cyBvZiBwYXRjaGVzLgoKWWVhaCwgc28gSSBkb24ndCB0
aGluayByZW1vdmluZyAtbiBpcyB0aGUgY29ycmVjdCBhcHByb2FjaCBoZXJlIHNpbmNlIHdlCndh
bnQgdG8gbWFuYWdlIGFsbCB0aGUgYnVpbGQgZGVwZW5kZW5jaWVzIGFzIHBhcnQgb2YgYnVpbGRy
b290LgoKPgo+ID4gSWYgd2Ugd2FudGVkIHRvIGF2b2lkIHRoZSBob3N0IGRlcGVuZGVuY2llcywg
d2UgY291bGQganVzdCBwYXRjaCB0aGUKPiA+IHB5cHJvamVjdCB0byBoYXJkY29kZSB0aGUgdmVy
c2lvbiBhbmQgbm90IHJlbHkgb24gc2V0dXB0b29scycKPiA+IGR5bmFtaWMgYXR0cmlidXRlIHJl
c29sdXRpb24sIHRob3VnaCBpdCBtaWdodCBiZSBiZXN0IHRvIGRvIHRoaXMgb24KPiA+IHRoZSBs
YXRlc3QgdGFnIGFuZCBub3QgMjAyNC45LjEyPwo+IERpZCBub3QgdGVzdCBpdCB5ZXQgYnV0IHdv
dWxkIHN1Y2ggYSBwYXRjaCBiZSBhY2NlcHRlZCBieSBidWlsZHJvb3QKPiB3aXRob3V0IHNlbmRp
bmcgaXQgdXBzdHJlYW0/CgpXYXMgdGhpcyBhIGJ1ZyBpbiB0aGUgc2V0dXB0b29scyBhc3QgcGFy
c2VyIG1heWJlPyBUaGVzZSBkeW5hbWljCmF0dHJpYnV0ZSByZXNvbHZlcnMgdXN1YWxseSB0cnkg
YXN0IHBhcnNpbmcgZm9yIHZlcnNpb25zIGFuZCBmYWxsYmFjayB0bwp0cmFkaXRpb25hbCBpbXBv
cnRzIG9ubHkgaWYgdGhlIGFzdCBwYXJzaW5nIGZhaWxzLgoKPgo+IFJlZ2FyZHMsIEJlcm5kCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
