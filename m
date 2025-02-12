Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7E5C0219E
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 06:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6265C40734;
	Wed, 12 Feb 2025 06:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GKqbmVhvf_s; Wed, 12 Feb 2025 06:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3525E407E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3525E407E9;
	Wed, 12 Feb 2025 06:04:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DE7F194
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 06:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3684403C0
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 06:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJm8hs5Z-0cW for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 06:04:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F43A4045C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F43A4045C
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F43A4045C
 for <buildroot@uclibc.org>; Wed, 12 Feb 2025 06:04:37 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-545064389d3so3961891e87.0
 for <buildroot@uclibc.org>; Tue, 11 Feb 2025 22:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739340275; x=1739945075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+SibtiESk3IA+J+C7Ep9oSk6QGLVSM+nmGRH2a2W+u0=;
 b=d2rKYqRvYBZ/WajpXLdN2NRTN9ZWbbrv7svplXDubLt2pK3MR/Xtentg7HpidLQaH9
 2RTLbM/RbKZ63yRtVigv1tF1iIGzoSJMxb06ESZsKfPvbDriPyXYy5x6hxqtxjziYa3Q
 b/wYA0wNFMOTVqsjLfermyZ36nh+VwhNqzYKIaG8pKwQfizYyus5xidHjJxkvL0Sxa6C
 LShi4t+tWvTp6waFxypSVgBGzNGHhDmV4nUe59bZ9wfXSUFDMOsME7/VElkcYiCNdocQ
 JkFzsh6/Fs9832v5MqO1nWCo8wmeRFUqD9Nf+FAn/NqGvSZarhffmsWFmS1T7UWPedft
 HY8w==
X-Gm-Message-State: AOJu0Yxwl1WmNipwJCnsmR3TFN7MznaJOvlgH+xvrcatxIXeZvKJG/uC
 juO2eDcIddhimtzb7EoaQpHK0nqSjct7mGNLwXbv0KfhPZpB6HnJFQiZKAAGyVUla6ZKmipsu6w
 KHEscaf0eAfbahhhzZt4FkIDTSXw=
X-Gm-Gg: ASbGncuz0QCA62S9iINjUc+1bHNPhdvIoDbMCXcQYhQZGk7309o+5wpAV37ugtccUmc
 SPr34XCghkt2Ot2lXZ2MdSISBGGIicsRYxtHxkOW7Xmkxs6eLA/Oka6pAMuHcjxWI+939AlvxNA
 ==
X-Google-Smtp-Source: AGHT+IHsecx35LB60qGwys90EUAO0j/wI4N58ecRlwZq9WD+GKNBZAYM5SIr6l63zz1hTqGn/c/R8nKTEC+qeAxuNfQ=
X-Received: by 2002:a05:6512:3c9c:b0:545:bda:f0d with SMTP id
 2adb3069b0e04-5451815a1ccmr489969e87.37.1739340274472; Tue, 11 Feb 2025
 22:04:34 -0800 (PST)
MIME-Version: 1.0
References: <20250210022648.1634973-1-fancp2007__48543.0357208074$1739154457$gmane$org@gmail.com>
 <pan$2c183$bf7fddbb$580230b4$48c2eea8@ID-313208.user.individual.net>
In-Reply-To: <pan$2c183$bf7fddbb$580230b4$48c2eea8@ID-313208.user.individual.net>
From: Scott Fan <fancp2007@gmail.com>
Date: Wed, 12 Feb 2025 14:04:21 +0800
X-Gm-Features: AWEUYZkvQ4u9qvC-bvLnlK3c8rgh5H2sFZ1tbXZJ5eeyRjCEf59zNDBFIdu9S1w
Message-ID: <CAFkzVZas4H_PYmmSkhVAiQjBfzZzdSF8EcgAVEn=6JE_bVv1yQ@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739340275; x=1739945075; darn=uclibc.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SibtiESk3IA+J+C7Ep9oSk6QGLVSM+nmGRH2a2W+u0=;
 b=N6q4qg4R+5Q5DE7PX62VJ7GmpaKbVv8ueDYWQmIOb+hLqYk80JWxxIELh0g7WAU3Iw
 0ONexIng5/mcjNUGR2zlAsdqibX20TegRXEoLMaQ05cfuDhIMscD96h0Cy0OryDOtIuS
 E5rXnVQXxS8U7A9xakbq4/oj7pLE3LSQ6cI6h7dAoCPm7/tWbXsJLCesRgExJCNt5Ubg
 1CR87d4oA8Hy0vuwepPptftQEHH6yU7ksif4EBTczrHy7CCXmGuKNI8gC3W4Ck1CXlO6
 4XM5fDTmIKqK+KdOd+VYLqqBUEt3XKqj3ewoqGl9xxgyF58IH2JxNgcSU8PHjBz6kfqv
 izDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N6q4qg4R
Subject: Re: [Buildroot] [PATCH] package/sqlite: bump version to 3.49.0
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

V2hlbiBJIGZvdW5kIHRoZSBjb21waWxhdGlvbiBlcnJvciBtZXNzYWdlLCBJIGltbWVkaWF0ZWx5
IGNoYW5nZWQgdGhlCnBhdGNoIHRoYXQgaGFkIGJlZW4gc2VudCB0byBwYXRjaHdvcmsgdG8gdGhl
IENoYW5nZXMgUmVxdWVzdGVkIHN0YXRlCnRvIHByZXZlbnQgaXQgZnJvbSBiZWluZyBtZXJnZWQg
aW50byB0aGUgbWFpbmxpbmUsIGJ1dCBJIGRvbid0IGtub3cKd2h5IGl0IHdhcyBmaW5hbGx5IG1l
cmdlZC4KClNjb3R0IEZhbgoKT24gV2VkLCBGZWIgMTIsIDIwMjUgYXQgNDozNOKAr0FNIEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+IHdyb3RlOgo+Cj4gQW0gTW9uLCAxMCBGZWIgMjAyNSAx
MDoyNjozOCArMDgwMCBzY2hyaWViIFNjb3R0IEZhbjoKPgo+ID4gUmVsZWFzZSBub3RlczogaHR0
cHM6Ly93d3cuc3FsaXRlLm9yZy9yZWxlYXNlbG9nLzNfNDlfMC5odG1sCj4KPiBIaSBTY290dCwK
Pgo+IHRoaXMgYnVtcCBjYXVzZXMgYnVpbGQgZXJyb3JzOgo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvP3JlYXNvbj1zcWxpdGUtMy40OS4wCj4KPiBtb3N0IGxpa2VseSBkdWUgdG8g
dGhpcyBxdW90ZSBmcm9tIHJlbGVhc2Ugbm90ZXM6Cj4gIlJlcGxhY2UgQXV0b3Rvb2xzIHdpdGgg
QXV0b3NldHVwIGZvciB0aGUgY29uZmlndXJlIHNjcmlwdCB1c2VkIGluIHRoZQo+IHByZWNvbXBp
bGVkIGFtYWxnYW1hdGlvbiB0YXJiYWxsLiIKPgo+IERpZCB5b3UgYnVpbGQtdGVzdCB0aGUgcGFj
a2FnZT8KPgo+IFJlZ2FyZHMsIEJlcm5kCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
