Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26957C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 07:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB47140353;
	Sun,  4 Aug 2024 07:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_Vk_u6DH-Kh; Sun,  4 Aug 2024 07:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EAAF40355
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EAAF40355;
	Sun,  4 Aug 2024 07:03:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53F3A1BF418
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 07:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CF7581254
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 07:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vAQaTMG7msL for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 07:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52DB281250
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52DB281250
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52DB281250
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 07:03:32 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f035ae0fe0so109057011fa.3
 for <buildroot@buildroot.org>; Sun, 04 Aug 2024 00:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722755010; x=1723359810;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wBwNmXKXIi3fNxeetQ0WygiLiVz2vnVHqu9iRvDmA5E=;
 b=D2R/wxCp1E5Eza5QL9fwLwhHYywbeIPM88FWnzJkcMjDJml1QKYWwSYKzrUHpOriRZ
 PanLZJbvhh1XtFvS6lD9mZ5Jg0Cx+W4pdlmYAnYDLFVtmCfDfA4TuZHbgtTi+Ia+Y5SW
 ARi87cYm7/fakomkvQiWSQgqsPUQqrJRPsU1yDOg8rVFYBBF362EPHss/YRIHyk0cDeZ
 RsDBze+FnD82+tEb92fg6OY/edNQ0Og7UT/8Zp5ffAn3vGqLGedFb1xvf2u0vP0rxAIi
 PiKKS1qc937r/StwLBA58T0yQmHW2iGr5w/r46k8TDZj/I0V8agHoLYc7ZM1FhX//yDo
 ulNQ==
X-Gm-Message-State: AOJu0Yye0ZNmYLZ719QhJm6gxFDkHk7jiVSiKWRYA6EBeQxIIxNEd28R
 yJZIoPc8goFcEATbGL/ec8k1BkxK88mlC6/sb1TAf/vR9c5MTqrA
X-Google-Smtp-Source: AGHT+IHr5AaLZY1RbQWWds7uUT+kTSOhvnSuCUkMCh6iouxT/Xt8j4GrysrwAI2CUBNKikWIQvjcoA==
X-Received: by 2002:a05:651c:555:b0:2f1:6821:d15c with SMTP id
 38308e7fff4ca-2f16821d231mr44116971fa.38.1722755010059; 
 Sun, 04 Aug 2024 00:03:30 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e18647bsm6471531fa.8.2024.08.04.00.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Aug 2024 00:03:29 -0700 (PDT)
Message-ID: <cb878a7bb1e238e4b712670b6d52216bcc63fd67.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 04 Aug 2024 09:03:28 +0200
In-Reply-To: <87ttg03j2n.fsf@tarshish>
References: <20240804060003.735172-1-troglobit@gmail.com>
 <87ttg03j2n.fsf@tarshish>
Organization: Addiva Elektronik
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722755010; x=1723359810; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wBwNmXKXIi3fNxeetQ0WygiLiVz2vnVHqu9iRvDmA5E=;
 b=P7SYTaDFVKn1cnsIic9KOhRyv4Lhbvu6broKCfFnfFK4wzEq17feHZUffUG88E+G0U
 KIjg2LhvoPwC/jCHVa2YrYxaX1O7KnZ4r+OlzNzpt7ealj+OJjiBCFpWeczd8dSmFiea
 RnLGkcgaMhOaewqt9DECxVSU2nWQkwPgTVkbNql29Rpb5j469uQ/yt7JdfjZ4SsjIVhA
 JYkeWdaMWvXIZeWL4Af7ahsH2e6YF9eYbvY67GHwicfMbnvq266mWpYyIRnv+BpB9k74
 Y1W0RpJGMdQVxngLjFKJhhuha7IrWrUTdInzMv7cyuVAQPBBQCBxsapW0x3uldBKBiO4
 ERSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P7SYTaDF
Subject: Re: [Buildroot] [PATCH 1/1] package/spdlog: add menuconfig option
 to use bundled fmt
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

SGkgQmFydWNoIQoKT24gU3VuLCAyMDI0LTA4LTA0IGF0IDA5OjIwICswMzAwLCBCYXJ1Y2ggU2lh
Y2ggd3JvdGU6Cj4gSGkgSm9hY2hpbSwKPiBPbiBTdW4sIEF1ZyAwNCAyMDI0LCBKb2FjaGltIFdp
YmVyZyB3cm90ZToKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfU1BETE9HX0ZNVF9FWFRFUk5BTAo+
ID4gKwlib29sICJVc2UgZXh0ZXJuYWwgZm10IGxpYnJhcnkiCj4gPiArCWRlZmF1bHQgeQo+ID4g
KwloZWxwCj4gPiArCcKgIFVzZSBleHRlcm5hbCBvciBidW5kbGVkIGZtdCBsaWJyYXJ5LCBkZWZh
dWx0IGV4dGVybmFsLgo+IFdoYXQgaXMgdGhlIGFkdmFudGFnZSBvZiBidW5kbGVkIGxpYnJhcnk/
IFRoZSBjb21taXQgbG9nIHNob3VsZAo+IGV4cGxhaW4gdGhhdC4KCldlJ3JlIHRyeWluZyB0byBw
YWNrYWdlIFJvdXNldHRlIChSRVNUQ09ORiBmb3Igc3lzcmVwbyksIGl0IHJlcXVpcmVzCnRoZSBi
dW5kbGVkIGZtdCBpbnN0ZWFkLiAgIEknbGwgdXBkYXRlIHRoZSBwYXRjaCwgdGhhbmtzIQoKPiBB
bHNvLCB5b3Ugc2hvdWxkIHByb2JhYmx5IG1vdmUgJ3NlbGVjdCBCUjJfUEFDS0FHRV9GTVQnIGhl
cmUuIFdlCj4gZG9uJ3QgaGF2ZSB0byBidWlsZCBmbXQgaWYgc3BkbG9nIGRvZXNuJ3QgdXNlIGl0
LgoKQWgsIG9mIGNvdXJzZSwgdGhhbmtzIQoKPiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1NQRExP
R19GTVRfRVhURVJOQUwpLHkpCj4gPiArU1BETE9HX0NPTkZfT1BUUyArPSAtRFNQRExPR19GTVRf
RVhURVJOQUw9T04KPiAKPiBmbXQgZGVwZW5kZW5jeSBzaG91bGQgYWxzbyBtb3ZlIGhlcmUuCgpH
b3QgaXQhCgpCZXN0IHJlZ2FyZHMKIC9Kb2FjaGltCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
