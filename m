Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8FECAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 21:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABF2B4134B;
	Tue, 16 Sep 2025 21:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzPraGdqX_oE; Tue, 16 Sep 2025 21:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B5F4132A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B5F4132A;
	Tue, 16 Sep 2025 21:50:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBA55AF1
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C96CA4132A
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8xld-jI_9Aa for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 21:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A2CE41329
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A2CE41329
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A2CE41329
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:50:10 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-352e19bd72fso33434161fa.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758059408; x=1758664208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rz4tXbdFlj15AJIAEc+Hh5yjQMc666qIHK4DD367Kb0=;
 b=EaVQGTv18GRPPTC+EtnWdmhYg0lFfEBB4U0JmIGTiH/mDlTKrjaMJ9/PPmPlvBrkPU
 mGf7SbDf4k1p4rhHfwuGwENUcL2bLhmjq3NBsY6G34tyvgP0T23VD2Qk/+g3jhGj7+HQ
 2HJ39RsNbEbCmo9UtR/MbpIXh2E3j5tt8ukCluh8wDnktj3jUCOrURVk1xXhR7PP2tvv
 EQ6h4gapTuvO2CGe5zp+Kr9qM0oWiLJu48DzklYpq4KPq6b5vZzYisxYV6pG8rnZT3JL
 YwZC/1GvMYorxg0MtLYcwRiJzUcmzGS5fyP6Y7rINl/1p9N36UuQcpUMDZm8VQAo1yTh
 5Fhg==
X-Gm-Message-State: AOJu0YwmciGAzaegCOEqUc/k9QTIbBDdz+xIM8ZDT5VtTsnbsOdVGZw8
 w6f1Y9F9E3wKx/smH/+iPhbsZBk7GR25VpJaPW/EUYdLHME9tBJqh7IkCDpB047Yjd/m8ZZ+VJF
 wZAmOTmRhbg==
X-Gm-Gg: ASbGncvB1jQilhnaJzp60+hkvwtJ16z3mdOk10udWqLOkiBNxXGaPhm9E0bNjRMXfjI
 rJWD4dbwF1k2+xJRhw2cWo6aY8cz6Ceepw/QY4FN1uqwTTvY1tbd3nFDrauQqA55efu1jpCwwwk
 gKAu2CNKjxHotvmwi7kCy66FEFGDYq0cxQMlbJ0MpKGJh5B4WbxUS99Esajq3JGOJqh+C5zJBCl
 eGAlQKeyeZrCzLDd87/NpRKhyK69Zk5INNzHdU5x4MEj+sjC7HtNZ6f9yPxKpz1K7GF8awKEPNZ
 mn5tGe+mXpd8acFExMjSzosF10G0CR0kxx4fS8NSA5TsHvnw+vzUy3HfxlNy/o1GTbBwUf9TPh7
 2I+Q96l0xSpKC908TSYvMqb4RDPDagfRNFpOZS4wGUnXM3I4aZ7+lZ8sDS17Gog==
X-Google-Smtp-Source: AGHT+IFUgZhHjlJWNCOCAp3AqCweQg05aUsI7VoqmNuXnL90WsTu/2kHYRR2/E5xBC125fBrw8kMJA==
X-Received: by 2002:a2e:ae0a:0:10b0:332:1de5:c513 with SMTP id
 38308e7fff4ca-35f612edf0dmr182771fa.4.1758059407835; 
 Tue, 16 Sep 2025 14:50:07 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-356cf10d020sm21328101fa.12.2025.09.16.14.50.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 14:50:07 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5774901b1aaso393877e87.0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 14:50:06 -0700 (PDT)
X-Received: by 2002:a05:651c:234c:20b0:336:853d:27fe with SMTP id
 38308e7fff4ca-35f612ee441mr235151fa.6.1758059406287; Tue, 16 Sep 2025
 14:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183458.1288165-1-james.hilliard1@gmail.com>
In-Reply-To: <20250910183458.1288165-1-james.hilliard1@gmail.com>
Date: Tue, 16 Sep 2025 14:49:54 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rLpT2bpJ6L2VEkLzKmOQoZ2+AAXEZ0qF2bMNz1-yRgyA@mail.gmail.com>
X-Gm-Features: AS18NWDZqxtO365Ttnb-qSLUMmnfDTfGnlzqgqSJeHdBUZT9Tfyqw3PW8CFX1FE
Message-ID: <CA+h8R2rLpT2bpJ6L2VEkLzKmOQoZ2+AAXEZ0qF2bMNz1-yRgyA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1758059408; x=1758664208; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rz4tXbdFlj15AJIAEc+Hh5yjQMc666qIHK4DD367Kb0=;
 b=H+mqL0vowPdYLqImrPbxrd7YScIlC/RnGzQoLjI8s1HCufnhoetZJNeOw565RR+JVv
 gyh/qEuBYSxWCsHZA6Utl8t5ceRmXRKkFEt1s8cP3CGe4whnCQMSI1Ne1Be5JicvydrG
 miBUM/C7InipN9tc2VJdN0bhuTygfjbVzwf3UJveXcdJq6G1p/fqVxO6Kko1bIcxdGq4
 kdb7j6BMfxgatRZ/7kYsZA4GJCQXAzAlaB5NQCGghCVwWKObu9qIAn/LSMHRBsPux2EU
 PJnfiJ6RbZTCB8+YYTSu60hMqK+bveC79BCaJgEwhk1GUcWsjek137Ur8WSl1rcqMJ/Z
 dYRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=H+mqL0vo
Subject: Re: [Buildroot] [PATCH 1/2] package/go: bump to version 1.25.1
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

SmFtZXMsCgpPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAxMTozNOKAr0FNIEphbWVzIEhpbGxpYXJk
CjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+IEJ1aWxkaW5nIEdvIDEuMjQg
YW5kIGxhdGVyIHJlcXVpcmVzIEdvIDEuMjIuNiBvciBsYXRlciBmb3IgYm9vdHN0cmFwLgo+Cj4g
VG8gc3VwcG9ydCB0aGlzIHdlIHVzZSBvdXIgcHJldmlvdXMgR28gdmVyc2lvbiAxLjIzLjEyIGFz
IHRoZSB2ZXJzaW9uCj4gZm9yIGdvLWJvb3RzdHJhcC1zdGFnZTQgYW5kIGhhdmUgdGhlIGJ1aWxk
IGZvciBHbyAxLjI1LjEgZGVwZW5kIG9uCj4gZ28tYm9vdHN0cmFwLXN0YWdlNC4KPgo+IEdvIHZl
cnNpb24gMS4yMy4xMiBpcyB0aGUgbGF0ZXN0IGdvIHZlcnNpb24gd2UgY2FuIGJ1aWxkIHVzaW5n
Cj4gZ28tYm9vdHN0cmFwLXN0YWdlMy4KPgo+IFRoZSBwYWNrYWdlIGJ1aWxkIGZvciBnby1ib290
c3RyYXAtc3RhZ2U0IGlmIGVmZmVjdGl2ZWx5IGlkZW50aWNhbCB0bwo+IGdvLWJvb3RzdHJhcC1z
dGFnZTMgd2l0aCBvbmx5IHRoZSBHbyB2ZXJzaW9uIGFuZCBzdGFnZSBudW1iZXIgY2hhbmdlZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPgo+IC0tLQo+ICBwYWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAgICAg
ICAgfCAgOSArLS0KPiAgLi4ubGR2Y3MtZmFsc2Utd2hlbi1idWlsZGluZy1nby1ib290c3RyLnBh
dGNoIHwgNzEgKysrKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1z
dGFnZTQvQ29uZmlnLmluLmhvc3QgfCAgNCArKwo+ICAuLi4vZ28tYm9vdHN0cmFwLXN0YWdlNC5o
YXNoICAgICAgICAgICAgICAgICAgfCAgMyArCj4gIC4uLi9nby1ib290c3RyYXAtc3RhZ2U0Lm1r
ICAgICAgICAgICAgICAgICAgICB8IDU0ICsrKysrKysrKysrKysrCj4gIHBhY2thZ2UvZ28vZ28t
c3JjL2dvLXNyYy5tayAgICAgICAgICAgICAgICAgICB8ICA0ICstCj4gIHBhY2thZ2UvZ28vZ28u
aGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE0ICsrLS0KPiAgcGFja2FnZS9nby9n
by5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgOCBmaWxlcyBjaGFu
Z2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTQvMDAwMS1jbWQtZGlzdC1zZXQtYnVp
bGR2Y3MtZmFsc2Utd2hlbi1idWlsZGluZy1nby1ib290c3RyLnBhdGNoCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTQvQ29uZmlnLmluLmhvc3QKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28tYm9vdHN0cmFwLXN0YWdlNC9nby1ib290
c3RyYXAtc3RhZ2U0Lmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28tYm9v
dHN0cmFwLXN0YWdlNC9nby1ib290c3RyYXAtc3RhZ2U0Lm1rCgoKQWZ0ZXIgc29tZSBmdXJ0aGVy
IHRlc3RpbmcuLi4KCmdvLWJpbiBpcyB3b3JraW5nIGZpbmUsIGdvLXNyYyBoYXMgYSBoYXNoIG1p
c21hdGNoOgoKaHR0cHM6Ly9naXRodWIuY29tL3NraWZmb3MvU2tpZmZPUy9hY3Rpb25zL3J1bnMv
MTc3NjExMzYzMDAvam9iLzUwNDczOTcxMDE1I3N0ZXA6ODo2MzcyMQoKc2VlIG1ha2UgaG9zdC1n
by1zcmMtbGVnYWwtaW5mbwoKWW91IHNob3VsZCBhcHBseSB0aGlzIGNoYW5nZSB0byB5b3VyIHBh
dGNoOgoKLXNoYTI1NiAgMmQzNjU5N2Y3MTE3YzM4YjAwNjgzNWFlN2Y1Mzc0ODcyMDdkOGVjNDA3
YWE5ZDk5ODA3OTRiMjAzMGNiYzA2NwogTElDRU5TRQoKK3NoYTI1NiAgOTExZjhmNTc4MjkzMTMy
MGY1YjhkMTE2MGE3NjM2NWI4M2FlYTY0NDdlZTZjMDRmYTZkNTU5MTQ2N2RiOWRhZAogTElDRU5T
RQoKVGhhbmtzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
