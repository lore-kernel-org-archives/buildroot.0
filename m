Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C8BC3DA7F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 01:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF13810C6;
	Tue,  6 Aug 2024 01:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAXEtgAgYzpU; Tue,  6 Aug 2024 01:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 641158111C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 641158111C;
	Tue,  6 Aug 2024 01:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 254CD1BF339
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 01:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 136E18111C
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 01:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9sPyNgqBWye for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 01:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6B9E810C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6B9E810C6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6B9E810C6
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 01:07:53 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so272113e87.0
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 18:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722906471; x=1723511271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Cvqk7K/LS4hl9Y3+O4Wb6E4hZupvGSNjEC2USS9MYk=;
 b=tZa7dpTiXU3JYZlVrHm0Vv3V9uWVOKPBqbZP/2HRT7LMGY3XQHEFAwlPi55UzhYkx1
 qK16dlr5We9i9QhzaKwNaDCxijKqTg3XcL3laIoZph8p7KzAPXqNzSTiQbL1L7tfxgtz
 MJApFezysczgfB3UX/ByFu0UeoExQAOKHjfbFzOW8UB+bcRrTE35/VCNncvckYYTaCF0
 +QGMrD17BcVYVbJtQvFqA7DzijbqwkPxszugKScDJgek9vbsUCck7k/FwL7njU2m8dIq
 p7w682n9thQ7gxqz9eTAOMbwSTiKL05ODKBpdflSP5WlThucplmDB8DtWtLXOTFw87De
 QHHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiVy8f/FeabHTUzaM2sYoPFZUBJEtFBXqRM9S+OgHnEhlO9PGJtK9gzFEfke1VmVCiSJjN8fjEJ5+8HYQxcF6jMcEVyKsMFw==
X-Gm-Message-State: AOJu0YxTIXYo09umTpgjxfv07rEgpuN1NiobMQYt9/8lkFAdwih9vNUj
 4g03mbGLTOvo74Qpf+qps0emVrcGae/m33WJHWHwfjJ1qbqJS1zuMZIcgTwxMQfxCOWs3H7TFBG
 wiStqig==
X-Google-Smtp-Source: AGHT+IFjCMwqd7FYiUgyNAsbvD4SjuwBPHkzArZmVdEOMs1rV3XAWwdHz4s3Ixs5x0isVh95kJrV/w==
X-Received: by 2002:a05:6512:2308:b0:52c:9ae0:beed with SMTP id
 2adb3069b0e04-530bb3bc202mr11176123e87.52.1722906469802; 
 Mon, 05 Aug 2024 18:07:49 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba1102bsm1300207e87.97.2024.08.05.18.07.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 18:07:49 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so187991e87.1
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 18:07:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWjyauRk6v00VFWL4sbcnbW6TEvH5QnsPvU/j6EAY/KfY7xHaOZBeU24eUuAYWh1dmkL+KUv33ilUbfRnCZmd6EDuq/+oIZxQ==
X-Received: by 2002:a05:6512:ea4:b0:52c:e119:7f1 with SMTP id
 2adb3069b0e04-530bb3bc063mr12161972e87.51.1722906468421; Mon, 05 Aug 2024
 18:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
In-Reply-To: <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
Date: Mon, 5 Aug 2024 18:07:37 -0700
X-Gmail-Original-Message-ID: <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
Message-ID: <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1722906471; x=1723511271; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Cvqk7K/LS4hl9Y3+O4Wb6E4hZupvGSNjEC2USS9MYk=;
 b=qZx7SAFmc8//hwx04U9QkiKLmaMc+uAxAjh2W9Up89DWRn0NfCVZPkM/RFNg5olkQa
 ohDH529jUPK2ZBmacsWuawXKFDpK5F8hSww0TJJKGJXqLMpBmFHrRdCVGiXPLPrexfYl
 A6DtUEQ59Es4bPFclFQStdRwvUFzsLe2RUZt5mBG0NteE66smUPCAwDI5uPI+9D5m9j2
 vAdsSKlnVryfZWGSNx90e+GoWxxkfKte8j7yMkMMdp2BsfmHZVI3Ux9IQnAkbGHFBfqG
 abxTCGeTRVNgR4HC8KY9vdLhiIQ9Sj62EuqMKTANRvFPMMiAZyNn663Dbr6u+wbeHRl5
 x5lA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=qZx7SAFm
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIFRob21hcywKCk9uIE1vbiwgQXVnIDUsIDIwMjQgYXQgMzowMeKAr1BNIEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiBPbiBNb24sIEF1
ZyA1LCAyMDI0IGF0IDI6MzHigK9QTSBUaG9tYXMgUGV0YXp6b25pCj4gPHRob21hcy5wZXRhenpv
bmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCA1IEF1ZyAyMDI0IDEwOjM0OjQ0IC0w
NzAwCj4gPiBDaHJpc3RpYW4gU3Rld2FydCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRy
b290Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gPiBJIHN0aWxsIGhpZ2hseSBkaXNhZ3JlZSB3aXRoIHNl
dHRpbmcgR09QUk9YWSBwZXIgcGFja2FnZS4KPiA+ID4KPiA+ID4gSSBoYXZlIGJlZW4gd29ya2lu
ZyB3aXRoIHRoZSB0YWlsc2NhbGUgZGV2cyB0byBmaXggdGhlIGRlcGVuZGVuY3kgaXNzdWVzLgo+
ID4gPiBXZSBmaXhlZCBtb3N0IG9mIGl0Lgo+ID4gPgo+ID4gPiBBZGRpdGlvbmFsbHkgSSdtIHdh
aXRpbmcgZm9yIHRoZSBhbmNob3JlL3F1aWxsIGRldmVsb3BlcnMgdG8gZ2V0IGJhY2sgdG8gbWUK
PiA+ID4gYWJvdXQgcmVtb3Zpbmcgc29tZSBHaXQgTEZTIGZpbGVzIGZyb20gdGhlaXIgbW9kdWxl
IHRoYXQgYWxzbyBicmVhayBHT1BST1hZLgo+ID4gPgo+ID4gPiBUaGUgZGVjaXNpb24gdG8gdXNl
IHRoZSBwcm94eSBvciBub3QgKHJ1biBieSBHb29nbGUpIHNob3VsZCBiZSB1cCB0byB0aGUKPiA+
ID4gdXNlci4gSWYgSSB3YW50IHRvIGRvd25sb2FkIGV2ZXJ5dGhpbmcgZnJvbSBHaXQsIHRoYXQg
c2hvdWxkIGJlIGZ1bGx5Cj4gPiA+IHBvc3NpYmxlLiAoQW5kIHVzdWFsbHkgaXMgd2l0aCBHT1BS
T1hZIGRpcmVjdCkKPgo+IFNvIHRoaXMgYWxsb3dzIHBhY2thZ2VzIHRvIGNob29zZSB0aGUgR09Q
Uk9YWSBzZXR0aW5ncywgcHJldmlvdXNseQo+IHRoYXQgd2FzIG5vdCBwb3NzaWJsZSBhcyBpdCB3
YXMgaGFyZC1jb2RlZCBhcyBkaXJlY3QuCj4KPiBJIGRvbid0IHJlYWxseSBzZWUgbXVjaCB3cm9u
ZyB3aXRoIHNpbXBseSBzZXR0aW5nIGNvbXBhdGlibGUgR09QUk9YWQo+IHNldHRpbmdzIGFzIHJl
cXVpcmVkIGZvciBhIHNwZWNpZmljIHBhY2thZ2UuIEl0J3Mgbm90IHJlYWxseSBtdWNoIGRpZmZl
cmVudAo+IGZyb20gc2V0dGluZyB0aGUgZG93bmxvYWQgbG9jYXRpb25zIGluIGdlbmVyYWwgZm9y
IHBhY2thZ2VzIElNTy4KPgo+ID4gPgo+ID4gPiBJJ2xsIGZvbGxvdyB1cCB3aXRoIHRob3NlIEdp
dEh1YiBpc3N1ZXMgdG9kYXkgYW5kIHNlZSBpZiBJIGNhbiBnZXQgdGhlIGJhbGwKPiA+ID4gcm9s
bGluZyBvbiBhbm90aGVyIHRhaWxzY2FsZSByZWxlYXNlIHdpdGggZml4ZWQgZGVwZW5kZW5jaWVz
Lgo+ID4KPiA+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBmZWVkYmFjay4gV2hlbiBzZWVpbmcgdGhl
IG5ldyBpdGVyYXRpb24gZnJvbQo+ID4gSmFtZXMsIG15IGluaXRpYWwgcmVhY3Rpb24gd2FzICJJ
IG5lZWQgdGhlIGZlZWRiYWNrIGZyb20gQ2hyaXN0aWFuIG9uCj4gPiB0aGlzIiwgYW5kIHlvdSBo
YWQgYWxyZWFkeSBnaXZlbiB5b3VyIGZlZWRiYWNrLgo+ID4KPiA+IFRoYXQgYmVpbmcgc2FpZDog
c2hvdWxkIHdlIHN0aWxsIGhhdmUgYSB3YXkgdG8gcGF0Y2gvZml4IHRob3NlIGtpbmQgb2YKPiA+
IGlzc3VlcyBvbiBvdXIgc2lkZSwgdW50aWwgdXBzdHJlYW0gZml4ZXMgaXQ/IE15IHVuZGVyc3Rh
bmRpbmcgaXMgdGhhdAo+ID4gdGhpcyBjb3VsZCBiZSBmaXhlZCBvbiBvdXIgc2lkZSBpZiB3ZSB3
ZXJlIGFibGUgdG8gYXBwbHkgYSBwYXRjaCBiZWZvcmUKPiA+IHRoZSBHbyB2ZW5kb3JpbmcgaGFw
cGVucy4gSXMgdGhhdCBjb3JyZWN0Pwo+Cj4gV2VsbCBJIHRoaW5rIHNpbmNlIHVwc3RyZWFtcyBv
ZnRlbiBleHBlY3QgdGhlIGdvb2dsZSBnb3Byb3h5IHRoZW4gaXQncwo+IGVhc2llc3QgdG8ganVz
dCBoYXZlIHVzIHNldCB0aGF0IHdoZW4gcmVxdWlyZWQgcmF0aGVyIHRoYW4gdHJ5IGFuZCBwYXRj
aAo+IHByaW9yIHRvIHZlbmRvcmluZy4KCk15IHN1Z2dlc3Rpb24gaXMgdG8gZWl0aGVyIHNldCBH
T1BST1hZPWRpcmVjdCBmb3IgYWxsIHBhY2thZ2VzLCBvciBmb3IKbm9uZSBvZiB0aGVtLgoKV2Ug
Y291bGQgZGVmYXVsdCB0byBzZXR0aW5nIEdPUFJPWFkgdG8gZW1wdHksIHdoaWNoIHVzZXMgdGhl
IGRlZmF1bHQKR29vZ2xlIHByb3h5LgoKVGhlIGJlc3QgYXBwcm9hY2ggaXMgbGlrZWx5IHRvIGFk
ZCBhIENvbmZpZy5pbiBvcHRpb246CgpTb21ldGhpbmcgbGlrZTogSE9TVF9HT19HT1BST1hZCgpU
aGVuIHdlIGNhbiBkZWZhdWx0IHRoYXQgdG86ICJodHRwczovL3Byb3h5LmdvbGFuZy5vcmcsZGly
ZWN0IgoKV2hpY2ggaXMgdGhlIGRlZmF1bHQgdmFsdWUgaW4gdGhlIEdvIHNvdXJjZSBjb2RlLgoK
SSB0aGluayB0aGlzIHdvdWxkIGJlIHRoZSBiZXN0IGFwcHJvYWNoIGlmIHdlIGRvIHdhbnQgdG8g
ZW5hYmxlCkdPUFJPWFkuIFRoaXMgd2F5LCB1c2VycyB0aGF0IGRvbid0IHdhbnQgdG8gdXNlIHRo
ZSBwcm94eSBjYW4gb3ZlcnJpZGUKSE9TVF9HT19HT1BST1hZIHRvICJkaXJlY3QiCgpXZSBjb3Vs
ZCBrZWVwIGl0IGFzICJkaXJlY3QiIG9uY2UgdGhpcyBpc3N1ZSBpcyBjbG9zZWQ6Cmh0dHBzOi8v
Z2l0aHViLmNvbS90YWlsc2NhbGUvdGFpbHNjYWxlL2lzc3Vlcy8xMjg1OQoKQmVzdCByZWdhcmRz
LApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
