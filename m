Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B0AD5B846
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 498784063B;
	Mon, 28 Oct 2024 22:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEtVp_R5cKWo; Mon, 28 Oct 2024 22:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE21C40632
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE21C40632;
	Mon, 28 Oct 2024 22:31:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC2D94EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B67F661098
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-B_6cW8OwDs for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:31:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D555760F7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D555760F7B
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D555760F7B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:31:12 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-50d2c02875cso902859e0c.2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730154671; x=1730759471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBQd253YhKrvPMbJWis8YwjBPzIimIgNbFfM2ReYW7I=;
 b=h9Bo9c8rlG7zP51ud5pVAPD2Q7ygMDovHUQgp5IO/rbECTscYe+T3MZNoSMtD9GfzS
 JW6gZlp2cOYIRdAu4oR4Xkp1+7XXHGmQo6QLIBkJkIaD/n8y8Ce9zSG9EiU9JO3Q3t9X
 l6NDkPq4YFvtPhX3oTYJgjKANtXBQfgkLdH37dPGefLTTz6zT77DVGWjltGVaeDtXJpF
 oRdGqzlHG33sSYCTfZJtVqjmb7IJ6FF+peyxoUKPFM4hYiO+D5yLe5tKzJ4B9nw0Y9Yw
 9PId113HNC1HCi23Y3SWq6pRWN6+ZF48mtjcXvt92p6phBNlNcmcBrxWvqpwqi9WDwcO
 Aq9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNO+mExYf2p8cN2KcVGQGyKbFsYogu0dDJemqh5MAcgNuvTzIFc+CpkUWSzNOuW1Pv53BuINxSyIA=@buildroot.org
X-Gm-Message-State: AOJu0Yx2mOgXxuTp/TWOy696Rw2JCoPeS6ZgzPOO1u5vOsymatA0e+cU
 1ORy/puZMz06d49JNteW4TsEYEpbxyOer68u39nJWB6qnOC+WGhDz76IC44HVYEWUA2cOH+zQWp
 hN3/MyAR9Q70Ct+aHdzp8xtJYCfE=
X-Google-Smtp-Source: AGHT+IGqwdVVmOcth+w198XqbngMWs9f1isKyjQYpQeDh/+yuT4U/SuBvm5bNOLmFSGwDzVmPVdfqsJesPczqnT0+T0=
X-Received: by 2002:a05:6122:459c:b0:50d:60fa:183e with SMTP id
 71dfb90a1353d-5101535c8bcmr6522169e0c.11.1730154671545; Mon, 28 Oct 2024
 15:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241028221045.3354144-1-james.hilliard1@gmail.com>
 <20241028231555.47e73fd0@windsurf>
 <CA+h8R2oDX1QNPg-f-rfJ52XDmsSV+E3YyMVe6T-zdkaWuegWgg@mail.gmail.com>
In-Reply-To: <CA+h8R2oDX1QNPg-f-rfJ52XDmsSV+E3YyMVe6T-zdkaWuegWgg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 16:31:01 -0600
Message-ID: <CADvTj4rc_xL84XuyKeNkeAypJD3q896yLZxE5wSvokME8xvKLw@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730154671; x=1730759471; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBQd253YhKrvPMbJWis8YwjBPzIimIgNbFfM2ReYW7I=;
 b=N0XxczX8d4+cQKSnbSJ0lpJCq/aTinZ2DzMp4/R+VqHPe850l/70SNTNzMMhGHNysX
 392s6trjzPyPJOtSSnGPnZXTlInCqtVSAdI1eKb1OMYB/rRyUsw10XrYrVFxEC//IctB
 flwiq+kPWJVCGYK0OvIYycSfaG5TU9tWGv80pBEwVNHFlUtT9OmuWJTkcB2CUbYZ+72b
 /jrm09epvGXgKafaYFcENyYz9sK4k2LblrA0Wp6XuPVAjAvjq8VA5zPV7m4XtYG9Vwn7
 WJsPpTv9K51r0n5l1llnuUI3/rMSXZhQEv2FQaFX/bG9yOUrFHOJR+UXg2YdeTQOR376
 PZjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N0XxczX8
Subject: Re: [Buildroot] [PATCH 1/2] package/go/go-cf: new package
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

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgNDoyNOKAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSGkgVGhvbWFzLCBKYW1lcywKPgo+IE9uIE1v
biwgT2N0IDI4LCAyMDI0IGF0IDM6MTXigK9QTSBUaG9tYXMgUGV0YXp6b25pCj4gPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgMjggT2N0IDIwMjQg
MTY6MTA6NDQgLTA2MDAKPiA+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPiB3cm90ZToKPiA+Cj4gPiA+IFRoaXMgaXMgYSBmb3JrIG9mIGdvIG5lZWRlZCBmb3IgY2xv
dWRmbGFyZWQgdG8gd29yayBwcm9wZXJseS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPgo+ID4gVGhpcyBpcyBy
ZWFsbHkgbnV0cy9jcmF6eS4gQXJlIHdlIGdvaW5nIHRvIGhhdmUgdG8gcGFja2FnZSBhIGRpZmZl
cmVudAo+ID4gR28gY29tcGlsZXIgZm9yIGVhY2ggYW5kIGV2ZXJ5IHByb2plY3Q/Cj4KPiBUaGUg
bWFpbnRlbmFuY2Ugb3ZlcmhlYWQgb2YgYWRkaW5nIG11bHRpcGxlIEdvIGNvbXBpbGVycyBzZWVt
cyBub3Qgd29ydGggaXQuCgpJc3N1ZSBoZXJlIGlzIGNsb3VkZmxhcmVkIGRvZXNuJ3QgcmVhbGx5
IHdvcmsgb3RoZXJ3aXNlIHNvIG5vdCBzdXJlCndoYXQgb3RoZXIgYXBwcm9hY2hlcyB3b3VsZCB3
b3JrLgoKPgo+IEkgc2VlIGZyb20gdGhlIENsb3VkZmxhcmUgZm9yayBvZiBHbyB0aGF0IGl0IGhh
cyB0aGVzZSBjaGFuZ2VzIHRvIFRMUzoKPgo+IC0gRW5jcnlwdGVkIENsaWVudEhlbGxvIChFQ0gp
Cj4gLSBQb3N0LXF1YW50dW0ga2V5IGFncmVlbWVudAo+IC0gRGVsZWdhdGVkIENyZWRlbnRpYWxz
Cj4gLSBQb3N0LXF1YW50dW0gY2VydGlmaWNhdGVzLgo+IC0gQ29uZmlndXJhdG9uIG9mIGtleXNo
YXJlcyBzZW50IGluIENsaWVudEhlbGxvIHdpdGgKPiB0bHMuQ29uZmlnLkNsaWVudEN1cnZlR3Vl
c3MuCj4KPiBUaGUgY29uY2VwdCBvZiBoYXZpbmcgYSBmb3JrZWQgR28gaW4gaXRzZWxmIGlzIG5v
dCB0aGF0IGNyYXp5Lgo+Cj4gV2hhdCBtYWtlcyB0aGlzIGRpZmZpY3VsdCAvIG5vdCB3b3J0aCBp
dCBpcyBob3cgY29tcGxleCB0aGUgR28KPiBpbmZyYXN0cnVjdHVyZSBpcy4KCk5vdCBzdXJlIGhv
dyBlbHNlIHRvIG1ha2UgY2xvdWRmbGFyZWQgd29yayBwcm9wZXJseSBzaW5jZSB0aGVyZSBhcmUK
cnVudGltZSBpc3N1ZXMgd2l0aG91dCB0aGVzZSBmZWF0dXJlcy4KCj4KPiBKdXN0IGxvb2sgYXQg
dGhpcyBwYXRjaCBhbmQgYWxsIHRoZSBsaW5lcyBhZGRlZDogVEFSR0VUX0VOViwgZXRjLiBEbwo+
IHdlIGhhdmUgdG8ga2VlcCB1cGRhdGluZyB0aGVzZSBldmVyeSB0aW1lIHdlIGNoYW5nZSB0aGUg
R28KPiBpbmZyYXN0cnVjdHVyZT8KCldlbGwgd2UgaGF2ZSBhIGJ1bmNoIG9mIHRoZXNlIGR1cGxp
Y2F0ZWQgZm9yIGdvIGJvb3RzdHJhcHBpbmcgYWxyZWFkeSwgSQpraW5kIG9mIGp1c3QgZm9sbG93
ZWQgdGhhdCBleGlzdGluZyBwYXR0ZXJuLgoKPgo+IElzIHRoZXJlIHNvbWUgd2F5IHdlIGNhbiBy
ZXVzZSBtb3N0IG9mIHRoZSBjb2RlIGZyb20gdGhlIEdvIGluZnJhIGZvciB0aGlzPwoKSG1tLCBt
YXliZSB0aGVyZSdzIGEgd2F5IHRvIHRlbXBsYXRlIHRoZSBkaXJlY3RvcmllcyBiZXR0ZXI/IE1p
Z2h0IGhlbHAKd2l0aCB0aGUgYm9vdHN0cmFwcGluZyBzdGFnZXMgYXMgd2VsbC4KCj4KPiBCZXN0
IHJlZ2FyZHMsCj4gQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
