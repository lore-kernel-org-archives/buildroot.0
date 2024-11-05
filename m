Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9277D2C115
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9505608A0;
	Tue,  5 Nov 2024 14:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nX71ptO4obnZ; Tue,  5 Nov 2024 14:37:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B3D608B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B3D608B1;
	Tue,  5 Nov 2024 14:37:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 969D23B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 757A9608CA
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16nzvEPQRaX7 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 14:37:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f44; helo=mail-qv1-xf44.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30BA8608A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30BA8608A0
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30BA8608A0
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:37:42 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id
 6a1803df08f44-6cbe90c7c95so41263566d6.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 06:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730817462; x=1731422262;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCgdliHSmZJzOXFcbH4b4a6yXVlwrh3dZSw7k8dRt/U=;
 b=WiyrkYHXTnpB/AO2TY71Nc+SQQEuB76buGbigTD+DcHEJZSHzm6thzfO/ELL+YH3gh
 RcwxzNbLGiHeVOc6nqzu5Xx1bSn4EBMTo3ZxEuj2A1FNnBdNwLnZMaPYbjkg5guIXX4L
 9emHpaXSKthItP2aJ2iDZXHTH6LkARHv9pB4LpcEqShXCmIAf3HhCVGKQ61rwXX7oWSq
 dyODnA7+Yj4U+E5xpLYG375fVRhY70uvDe2AuRyIaoTEyIkEKEkroD6ulV0+5GICIlIx
 KL0tD+grlqUGnPtxttF1lgJNvjuH6fFWojgb2wt7DcP6X2qKENWgQJ9WHo4WUQ63zzvV
 PqWw==
X-Gm-Message-State: AOJu0Yy7f4+sk0WOuViN7H+hCJjt5hDflWlXaR+FLVJUwr8zw7R5m9GC
 t/HKZMZGgqrpz2509ct7oQHBWaA8SO+F6aGzg9U3ZUakFj0C4sqd6/VbL+2VvVA=
X-Google-Smtp-Source: AGHT+IEq0q8Lbu5rz3lQhoJn9/szwR6QpvrC1DAFkbpKjEjtsnXcoKHA1aBO5bq6rRxv8ZS1MWS9IQ==
X-Received: by 2002:a05:6214:5789:b0:6cb:c9e0:c299 with SMTP id
 6a1803df08f44-6d35c15b285mr268259526d6.27.1730817460225; 
 Tue, 05 Nov 2024 06:37:40 -0800 (PST)
Received: from smtpclient.apple ([2601:190:500:79d0:509f:e1f2:c3a1:6402])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d35415b1edsm60149466d6.75.2024.11.05.06.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 06:37:39 -0800 (PST)
From: Patricia Holden <pholden@nklabs.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 5 Nov 2024 09:37:29 -0500
Message-Id: <BC522489-C318-4E43-9D24-F80D82D82322@nklabs.com>
References: <20241105110503.4b1e1f64@windsurf>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20241105110503.4b1e1f64@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (21G93)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1730817462; x=1731422262; darn=buildroot.org;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kCgdliHSmZJzOXFcbH4b4a6yXVlwrh3dZSw7k8dRt/U=;
 b=VS7DS63M/SdBGc6uN3PEhRvftvosYbamSOrhzqaphhNmYO8Bw4FF/uYhr1/ne4rW2G
 yCDXxZkfFoFVie1LnuEckFIIj5t1H+pA0XwkN4lXWzbzwv9Euq+AqswXUHwDE7y3oOUL
 9UiDFq1UOJsX0Sq1sodbNne9bHJwXRclib77bd47UIZxnOURv3xgCPD5aJDsIPaLRRVU
 LR9xWdQcWATGid29fXGDVwT/ote08NcbWeL1K2fFuNPUctoTEu5wcYFwf/g7E9QYV54f
 IsZuiyquwbezhj2XPImIV2tDMoIWnvCW6N0t+IOQBOEgy5UOZ0ULWRrfsCsvX8ojIHeC
 3ECg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=VS7DS63M
Subject: Re: [Buildroot] libwpe error with 2024.08.1
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

V291bGQgeW91IGxpa2UgdGhlIGNvbmZpZyBJIGFtIHVzaW5nPyAgIE1heWJlIHlvdSBjYW4gY3Jv
c3MgcmVmZXJlbmNlIGl0IGFnYWluc3QgdGhlIGNvbmZpZyB5b3UgaGF2ZSB0aGF0IGV4aGliaXRz
IHRoZSBwcm9ibGVtIGFuZCBpc29sYXRlIHRoZSBzb3VyY2U/CgpMZXQgbWUga25vdy4KClNlbnQg
ZnJvbSBteSBpUGhvbmUKCj4gT24gTm92IDUsIDIwMjQsIGF0IDU6MDXigK9BTSwgVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4g77u/SGVs
bG8gUGF0cmljaWEsCj4gCj4gK0FkcmlhbiBpbiBDYy4KPiAKPj4gT24gTW9uLCA0IE5vdiAyMDI0
IDE4OjMwOjE5IC0wNTAwCj4+IFBhdHJpY2lhIEhvbGRlbiA8cGhvbGRlbkBua2xhYnMuY29tPiB3
cm90ZToKPj4gCj4+IEkgYW0gaW4gdGhlIHByb2Nlc3Mgb2YgbWlncmF0aW5nIGEgY2xpZW50IHBy
b2plY3QgZnJvbSAyMDI0LjAyIHRvIDIwMjQuMDgKPj4gaW4gb3JkZXIgdG8gcGljayB1cCBRVDYg
cGFja2FnZXMuICBUaGUgaGFyZHdhcmUgcGxhdGZvcm0gaXMgQU02MlguCj4+IAo+PiBVbmZvcnR1
bmF0ZWx5LCBJIGVuZCB1cCB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3Igd2hpbGUgbGlid3BlIGlz
IGJ1aWxkaW5nOgo+PiAKPj4gbG9hZGVyLXN0YXRpYy5jOigudGV4dCsweDIwKTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgX3dwZV9sb2FkZXJfaW50ZXJmYWNlJwo+PiAvaG9tZS9waG9sZGVuL1By
b2plY3RzL0Vkdm9RdDYvZWR2b3Rlay1lZHZvY3ljbGVyMy9idWlsZHJvb3QtMjAyNC4wOC4xL291
dHB1dC9ob3N0L2xpYi9nY2MvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251LzEzLjMuMC8uLi8u
Li8uLi8uLi9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOgo+PiBsb2FkZXItc3Rh
dGljLmM6KC50ZXh0KzB4MjQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfd3BlX2xvYWRlcl9p
bnRlcmZhY2UnCj4+IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwo+
PiBuaW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29tbWFuZCBmYWlsZWQuCj4+IG1ha2VbMV06ICoq
KiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyODk6Cj4+IC9ob21lL3Bob2xkZW4vUHJvamVjdHMv
RWR2b1F0Ni9lZHZvdGVrLWVkdm9jeWNsZXIzL2J1aWxkcm9vdC0yMDI0LjA4LjEvb3V0cHV0L2J1
aWxkL2xpYndwZS0xLjE2LjAvLnN0YW1wX2J1aWx0XQo+PiBFcnJvciAxCj4+IG1ha2U6ICoqKiBb
TWFrZWZpbGU6ODM6IF9hbGxdIEVycm9yIDIKPj4gWzFdLSAgRG9uZSAgICAgICAgICAgICAgICAg
ICAgZW1hY3MgcGFja2FnZS9saWJ3cGUvbGlid3BlLm1rICAod2Q6Cj4+IH4vUHJvamVjdHMvRWR2
b1F0Ni9lZHZvdGVrLWVkdm9jeWNsZXIzL2J1aWxkcm9vdC0yMDI0LjA4LXJjMykKPj4gKHdkIG5v
dzogfi9Qcm9qZWN0cy9FZHZvUXQ2L2Vkdm90ZWstZWR2b2N5Y2xlcjMvYnVpbGRyb290LTIwMjQu
MDguMSkKPj4gWzJdKyAgRG9uZSAgICAgICAgICAgICAgICAgICAgZW1hY3MgZWR2b19idWlsZHJv
b3RfaW5zdGFsbC5zaCAgKHdkOgo+PiB+L1Byb2plY3RzL0Vkdm9RdDYvZWR2b3Rlay1lZHZvY3lj
bGVyMykKPj4gCj4+IEhhcyBhbnlvbmUgc2VlbiB0aGlzIG9yIG1heWJlIGhhdmUgYW4gaW5rbGlu
ZyBhcyB0byB3aHkgSSdtIGdldHRpbmcgdGhpcwo+PiBlcnJvcj8KPiAKPiBUaGFua3MgZm9yIHlv
dXIgYnVnIHJlcG9ydCwgYW5kIHNvcnJ5IHRvIGhlYXIgdGhhdCB5b3UndmUgZW5jb3VudGVyZWQK
PiBzb21lIGlzc3Vlcy4gRG8geW91IGhhdmUgYSByZWFzb25hYmx5IG1pbmltYWwgQnVpbGRyb290
IGNvbmZpZ3VyYXRpb24KPiB0aGF0IGV4aGliaXRzIHRoZSBwcm9ibGVtIChhbmQgdGhhdCB3ZSBj
YW4gYnVpbGQpID8KPiAKPiBPbiB0aGUgb3RoZXIgaGFuZCwgaXQgbG9va3MgbGlrZSB0aGlzIGlz
c3VlIGhhcyBiZWVuIHNlZW4gaW4gb3VyCj4gYXV0b2J1aWxkZXJzOgo+IAo+ICBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85M2IvOTNiZGFmMWY2ZTRkYTVhMzk1ZmI2Y2Yy
MTQ4ZDExNGRmMGViMTRiZC9idWlsZC1lbmQubG9nCj4gCj4gU28gd2UgZG8gaGF2ZSBhIGNvbmZp
Z3VyYXRpb24gdGhhdCByZXByb2R1Y2VzIHRoaXMuCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IFRo
b21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+
IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
