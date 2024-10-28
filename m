Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D036D5B845
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4864B61091;
	Mon, 28 Oct 2024 22:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjW9DnQ3liKL; Mon, 28 Oct 2024 22:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4988461097
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4988461097;
	Mon, 28 Oct 2024 22:24:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDFBE4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC8DC80F65
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50TfHe6_yG-H for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2F8180E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F8180E19
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2F8180E19
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:24:02 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-28847f4207dso2170441fac.0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730154241; x=1730759041;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pgc4B+Z1v2clFbAWjvWBNXqJjBQYXrsUF9+c9HtnVHI=;
 b=iSaaOEc2INnlEoLZPai3tqSz5b0IpyMB3aYTJUB+Zvny6V88+2CXoOqkds93NlkUOq
 s1LWB1whkR2dTQ9WrwNzl2ZbYPMNh0cTq3lvU5bcmknrWSyeftrsSCaE1NGPDEuHY9cA
 Ny0cXDUKsoAq1p0H1nsdA/sGIFIAI+87D0y2vHRbOeSRg1StLaKGXeUvfH4nVf36B1Xg
 rItiyLrR1vG7j4qB0rn66F/4DtgGlj8NChCDwQCtqC18XpUTO1bOQHImEggjpFQkib15
 ZYRawEALngXZYeOrO/IgDmtdS7zOLA0f5akcqk3w205pkQdlIp4eWRAo2s3L00IwNpmw
 Mg0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Ge4PGk/5Aj/+FVM2l6dcbAo2sXTI10Dq0bsaH7mcJ6UywWaFD8G8boOmpS7aoGN4dS+owtxmOn4=@buildroot.org
X-Gm-Message-State: AOJu0Yy1HczCe8xDlMbJ8iGe/BOBZWcnTSh9PWAKY02rg4vq7Vh7dt0Q
 AZHyoOY5/APn5l8T2r6W7Jwr+vxw614N+OCKMS+97HSkQz5Ypk5qHbapPfL+K6k7Ev2tmAEL1AG
 J
X-Google-Smtp-Source: AGHT+IE0QrLNhlAnv3pT5n1Md8ZBh8MT+/Cg9tJZWTzRutHw6X3Mr/15eD1FaXniCk+MfA65EA1cLA==
X-Received: by 2002:a05:6871:7a3:b0:27b:61df:2160 with SMTP id
 586e51a60fabf-29051da0bdamr9017259fac.31.1730154241553; 
 Mon, 28 Oct 2024 15:24:01 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com.
 [209.85.210.43]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-718656913e5sm1609288a34.74.2024.10.28.15.24.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 15:24:01 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-718186b5c4eso2298658a34.2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXST4z44sfaJguQEl9QOtR2ceRJOFNaeSfjwfqihElE6GaPGOjO982bCuLFLtjyujEE+/J0hKNwK40=@buildroot.org
X-Received: by 2002:a05:6870:56aa:b0:278:209d:49c8 with SMTP id
 586e51a60fabf-29051c48cccmr8470845fac.27.1730154240986; Mon, 28 Oct 2024
 15:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241028221045.3354144-1-james.hilliard1@gmail.com>
 <20241028231555.47e73fd0@windsurf>
In-Reply-To: <20241028231555.47e73fd0@windsurf>
Date: Mon, 28 Oct 2024 15:23:49 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oDX1QNPg-f-rfJ52XDmsSV+E3YyMVe6T-zdkaWuegWgg@mail.gmail.com>
Message-ID: <CA+h8R2oDX1QNPg-f-rfJ52XDmsSV+E3YyMVe6T-zdkaWuegWgg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org, 
 Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1730154241; x=1730759041; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pgc4B+Z1v2clFbAWjvWBNXqJjBQYXrsUF9+c9HtnVHI=;
 b=nRQCpQJ+yg29ji99wRaM3wYCTNrw156LJeWBOZeWe5d9h2mS1hXntEPgWkWDS66Vle
 DTESzBdw8Y7oIUyo9TEwwTjL9aUdO73zYN/PHhIcCAi/wHcuxIhgUWP9m3tNQ4Z6XDhs
 Kw4xjqLgEXsZDN2aQzsmtnyp2Zl+yPdIc2D1D7TkBKIXmwA9kwwlwR2mbErGMn5YHAc3
 hNJ0pZPUep9mJFDWDlH2xAjNlvE0JAtEFmrm7SW0GI0GX+fJ6KMDa/sqegjH0vMktF/8
 erMiM7ZH1/OMEV7bcwPgKwP4+lQNYjGoVn7UHOmQwqcZRk+l4h+VCsjjsQGesBHtTKU4
 wGlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=nRQCpQJ+
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBKYW1lcywKCk9uIE1vbiwgT2N0IDI4LCAyMDI0IGF0IDM6MTXigK9QTSBUaG9t
YXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9u
IE1vbiwgMjggT2N0IDIwMjQgMTY6MTA6NDQgLTA2MDAKPiBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IFRoaXMgaXMgYSBmb3JrIG9mIGdvIG5l
ZWRlZCBmb3IgY2xvdWRmbGFyZWQgdG8gd29yayBwcm9wZXJseS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IFRoaXMg
aXMgcmVhbGx5IG51dHMvY3JhenkuIEFyZSB3ZSBnb2luZyB0byBoYXZlIHRvIHBhY2thZ2UgYSBk
aWZmZXJlbnQKPiBHbyBjb21waWxlciBmb3IgZWFjaCBhbmQgZXZlcnkgcHJvamVjdD8KClRoZSBt
YWludGVuYW5jZSBvdmVyaGVhZCBvZiBhZGRpbmcgbXVsdGlwbGUgR28gY29tcGlsZXJzIHNlZW1z
IG5vdCB3b3J0aCBpdC4KCkkgc2VlIGZyb20gdGhlIENsb3VkZmxhcmUgZm9yayBvZiBHbyB0aGF0
IGl0IGhhcyB0aGVzZSBjaGFuZ2VzIHRvIFRMUzoKCi0gRW5jcnlwdGVkIENsaWVudEhlbGxvIChF
Q0gpCi0gUG9zdC1xdWFudHVtIGtleSBhZ3JlZW1lbnQKLSBEZWxlZ2F0ZWQgQ3JlZGVudGlhbHMK
LSBQb3N0LXF1YW50dW0gY2VydGlmaWNhdGVzLgotIENvbmZpZ3VyYXRvbiBvZiBrZXlzaGFyZXMg
c2VudCBpbiBDbGllbnRIZWxsbyB3aXRoCnRscy5Db25maWcuQ2xpZW50Q3VydmVHdWVzcy4KClRo
ZSBjb25jZXB0IG9mIGhhdmluZyBhIGZvcmtlZCBHbyBpbiBpdHNlbGYgaXMgbm90IHRoYXQgY3Jh
enkuCgpXaGF0IG1ha2VzIHRoaXMgZGlmZmljdWx0IC8gbm90IHdvcnRoIGl0IGlzIGhvdyBjb21w
bGV4IHRoZSBHbwppbmZyYXN0cnVjdHVyZSBpcy4KCkp1c3QgbG9vayBhdCB0aGlzIHBhdGNoIGFu
ZCBhbGwgdGhlIGxpbmVzIGFkZGVkOiBUQVJHRVRfRU5WLCBldGMuIERvCndlIGhhdmUgdG8ga2Vl
cCB1cGRhdGluZyB0aGVzZSBldmVyeSB0aW1lIHdlIGNoYW5nZSB0aGUgR28KaW5mcmFzdHJ1Y3R1
cmU/CgpJcyB0aGVyZSBzb21lIHdheSB3ZSBjYW4gcmV1c2UgbW9zdCBvZiB0aGUgY29kZSBmcm9t
IHRoZSBHbyBpbmZyYSBmb3IgdGhpcz8KCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFuIFN0ZXdhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
