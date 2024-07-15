Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62236C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 21:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3FB605BE;
	Mon, 15 Jul 2024 21:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VC9ZSc1jFu6Z; Mon, 15 Jul 2024 21:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE5060832
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE5060832;
	Mon, 15 Jul 2024 21:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DDD51BF398
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 21:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9716281272
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 21:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9CDihdCys-H for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 21:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com;
 envelope-from=alistair23@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB207810C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB207810C7
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB207810C7
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 21:32:03 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-8100f08b5a8so1492575241.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721079122; x=1721683922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOWq9TUdQMAFz25prtBhrueMMN3tUPUqlZ22+cCVuwU=;
 b=fPCkl3gTGVsJj1DtljQK4CTQXSnBavX5++wDRAOufVtmGwvf5aT2hrqeYCMmM8GHPc
 4xtveQgIFM0EHNGMgXbR5nKKJSZI6L/btFX1Dhao2mGt9xXHPR5sniCsrCxh+5IoGt+R
 UPHZXNxJPqVU/BQvBKvPIIqT42zHHXjk+qEXuEcLh3IZWGXeFDqzk336T3TnklQahVHd
 H+zDqUn6z/KRdUMTd8BRmOlaMXLT63DPa8Q3X6wnOWs31gRJbc/EKIq9hNvASSk94Szn
 ko+KyBGzJiDAhSvFTUBAFGus7ixLfAG/YTktc0qe0tFz0HI+V4XwlGEozyIjpk1iVreC
 rNUQ==
X-Gm-Message-State: AOJu0YztEgh2LeooiaT7y51gbNLksRDRz6AoYAV4XZT7UBt5GeFDNMSg
 O8GsNrbna0Al32BQpCLJteNOdc8JM4Fzd2rzpdfi2B3GxGnhGnQZMt76lmgeoLQeco60dhUJKY8
 Wib6mKeRTDLk8oxMjQh58/hjBgLOQLFKcBws=
X-Google-Smtp-Source: AGHT+IFyIYbJEKUTKsetYCfmHvmPLP5x9nxZgpQUZxPNKnkje8pxztl8/hdS/v15lz6XftCr9M6Y5ZSziDh/ieATCfs=
X-Received: by 2002:a05:6122:2019:b0:4ed:53c:e0f6 with SMTP id
 71dfb90a1353d-4f4d07cbf53mr291006e0c.8.1721079122474; Mon, 15 Jul 2024
 14:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <YT2PR01MB4239F7AA538B4C2B46B13D7EF7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YT2PR01MB4239F7AA538B4C2B46B13D7EF7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jul 2024 07:31:36 +1000
Message-ID: <CAKmqyKNaX0mwdTRdb33X7Rc7VuDwadcm1p_j0-iWEsCJMvBFrA@mail.gmail.com>
To: Rajnesh Joshi <rajnesh_joshi@sfu.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721079122; x=1721683922; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOWq9TUdQMAFz25prtBhrueMMN3tUPUqlZ22+cCVuwU=;
 b=dlcad5P/1R1S9uNLa7fMSJMHrXj4kLf1nNr9MA17d5vRCLCNMiQN2O2nBHkgijazPs
 06VfZUwTNtjadQ/HAJdZ5U8KAT1FL9Fgmvrql3YCvpRTIpTR+TwN0Zou2cp21CCnepXg
 UmOt8sfCvlHkIkJJmuFeUXWBqBboe+0eIcV89Iyaz+GM/ylwPI3VZsreyr0SpQw9zSVO
 G7PfTJ61uhU4hQ4KZ9NJJ6GicU1ORDvScKirMrPttr4Om4/mD8EpFbQUK7s9f41LlHgy
 YydqORn5fAO7kO97zW0N9Xe1NBp6gc/BLP8Vkl+tw4hkKWnpVpl33vmIx6yM9oEg5bcM
 w31Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dlcad5P/
Subject: Re: [Buildroot] 32-bit RISCV build error
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgNjo1OeKAr0FNIFJham5lc2ggSm9zaGkgPHJham5lc2hf
am9zaGlAc2Z1LmNhPiB3cm90ZToKPgo+IEkgYW0gcmVzZW5kaW5nIHRoaXMgZW1haWwgYXMgQnVp
bGRyb290IEF1dG9tYXRlZCBFbWFpbCB0b2xkIG1lIHRoYXQgSSB3YXMgbm90IHN1YnNjcmliZWQg
dG8gdGhlIG1haWxpbmcgbGlzdCwgYW5kIHRoZXJlZm9yZSwgY291bGQgbm90IHNlbmQgdG8gaXQu
IEkgZG91YmxlLWNoZWNrZWQsIGFuZCBJIGFtIGEgcGFydCBvZiB0aGUgbWFpbGluZyBsaXN0LCBi
dXQgdGhpcyBlbWFpbCB0ZWNobmljYWxseSBoYXMgdHdvIGFsaWFzZXMgc28gSSBhZGRlZCB0aGUg
b3RoZXIgb25lLiBMZXQncyB0cnkgdGhpcyBhZ2Fpbi4gU29ycnkgZm9yIHRoZSBkb3VibGUgbWVz
c2FnZSBpbiBjYXNlLgo+Cj4gRGVhciBNYWlsaW5nIExpc3QgUmVhZGVycywKPgo+IEkgYW0gdHJ5
aW5nIHRvIGJ1aWxkIGEgMzItYml0IExpbnV4IEtlcm5lbCB1c2luZyB0aGUgdWNsaWJjIGxpYnJh
cnkgZm9yIGEgc29mdC1jb3JlIENQVSwgdXNpbmcgYSBjdXN0b20gTGludXggZm9yay4KPgo+IElu
IG15IC5jb25maWcsIEkgaGF2ZSB0aGUgZm9sbG93aW5nIGxpbmVzOiBCUjJfVE9PTENIQUlOX0dD
Q19BVF9MRUFTVF8xMj15IHdoaWNoIEkgYmVsaWV2ZSBpcyB0aGUgcGF0Y2ggZm9yIHRoaXMgaXNz
dWUsIGJ1dCBpdCBpcyBub3Qgd29ya2luZyBmb3Igc29tZSByZWFzb24uCj4KPiBJIGFtIGdldHRp
bmcgdGhlIGZvbGxvd2luZyBlcnJvcnMgd2hlbiBCdWlsZHJvb3QgY29tcGxldGVzIGRvd25sb2Fk
aW5nIHRoZSBMaW51eCBLZXJuZWwgYW5kIGJlZ2lucyBidWlsZGluZyB0aGUgTGludXgga2VybmVs
Lgo+Cj4KPgo+IFRvIHByb3ZpZGUgbW9yZSBjb250ZXh0LCBoZXJlIGlzIG15IGRlZmNvbmZpZyBm
b3IgdGhlICJib2FyZC4iCj4KPiBCUjJfcmlzY3Y9eQo+IEJSMl9yaXNjdl9jdXN0b209eQoKVGhl
IHByb2JsZW0gaXMgdGhhdCB5b3UgYXJlbid0IHVzaW5nIFJWMzJHLCBzbyB5b3UgbmVlZCB0byBt
YW51YWxseQpzYXkgeW91IHN1cHBvcnQgdGhlIFppQ3NyIGFuZCB0aGUgWmlmZW5jZWkgZXh0ZW5z
aW9ucy4KClNlZSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YtY29sbGFiL3Jpc2N2LWdudS10b29s
Y2hhaW4vaXNzdWVzLzEyNjIKZm9yIGFuIGV4YW1wbGUgb2YgaG93IHRvIGRvIHRoaXMuCgpJJ20g
bm90IHN1cmUgaG93IHlvdSBjYW4gZG8gaXQgd2l0aCBidWlsZHJvb3QgdGhvdWdoLiBZb3UgbWln
aHQgbmVlZAp0byBwYXRjaCBidWlsZHJvb3QgdG8gYWxsb3cgc3BlY2lmeWluZyBjdXN0b20gZXh0
ZW5zaW9ucwoKQWxpc3RhaXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
