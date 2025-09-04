Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B375CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 04:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD146F5BA;
	Thu,  4 Sep 2025 04:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOpE2fUD24yK; Thu,  4 Sep 2025 04:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F376F5B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19F376F5B6;
	Thu,  4 Sep 2025 04:59:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93CCC111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 04:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D4AF6F5B6
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 04:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nrc9Dlo9q9rn for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 04:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40E746F5B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E746F5B3
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40E746F5B3
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 04:59:13 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-71d60504bf8so6543357b3.2
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 21:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756961952; x=1757566752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xAzde5j4HihaIeH7K/ysHnNkzeJ6mGmZbxW3b//eqVE=;
 b=DMDSWoX8z3vY9MNE97BkqQ3QuOjcbUqxwf9ybBSokwZOc6EDLGzO21kvMmDRZinOtl
 v0QEZ5f6iZg5xDYciye9KBvBXXvRYPttRkph/dKvlmzODWEVdeA5ROoei2z38fGtvTsI
 2zjtz5L0jqmep32sVpMjh4Fmz1ztb4TeRBnB6B3o6les2uzs3QGib/fneac53khBQfgd
 1oDn7vkmMKTQefGGl7JChDPGpgDU4XPUkJNPQAmXrxxYzoN9nPz+Jwpg5iSTQ6z2PfH8
 XKjvyMTm0r9f6I6qv7J3NsYDrAccs+EEFErsfh64idMlQ0ti4+9YzZGPpViCetySqFkT
 JwHA==
X-Gm-Message-State: AOJu0YywXFU6mvBkLEfSTz3ijnPRrFqE3oWWGjzF2caH51R5nMZb6kTZ
 HTQoQ4guTFGTyUP5uX0luShgyXcOb/ZuCQoDABghY/9d6DID0UNzR7OsukyAjOmz/C3ExnuxzCk
 Awvrv6Knu1kUDkKpu9w2ECEPDBlX0+HtQyaHb
X-Gm-Gg: ASbGncvDyWVlnmzoWOEIps0U8TRPHQekd51GyYDeNbpC71QU7dkZ6wjexRRyrZq70qy
 Rw6G9b+jCILUE17owXcSwbw4+NVXPAg9jLGPKEMrXUDnBRZaS76zXzVXCqASA+dUvAyGB9pIp4q
 tvELf+8yi6Po/h86bOjDIXVqwlKTuZ6JHjmYmwQCNwoFJ1CyomQFJK8FteEO8D9QbL8MRe557pR
 BO8mvI=
X-Google-Smtp-Source: AGHT+IHZecZondpyQoaDofdD+hZGJT9XlFnQTYLFfP/noTDu/Y9FM97iz6wjiCRUyhRLlYLoPpmcUq539kU0CQFWQvg=
X-Received: by 2002:a05:690c:648a:b0:720:c65:eee0 with SMTP id
 00721157ae682-722764052b0mr208384297b3.19.1756961951802; Wed, 03 Sep 2025
 21:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-2-clg@kaod.org>
 <CACPK8XdQnx822DzoWLGrE6PyfcL=e=ZP4kAaAgOE40+Zazpctg@mail.gmail.com>
 <6e35067b-0403-49d9-b706-d47ca3eb519b@kaod.org>
In-Reply-To: <6e35067b-0403-49d9-b706-d47ca3eb519b@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Sep 2025 14:29:00 +0930
X-Gm-Features: Ac12FXzuObbv9NbufMIE6mVW9FkxwOkpxeLKoHY5DDPwERUJHa7dFNhPoLA3QQY
Message-ID: <CACPK8XeRG6AaF9TzjNqG7-UyEHECKfL9usPP--_owwDixsXJZw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1756961952; x=1757566752; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xAzde5j4HihaIeH7K/ysHnNkzeJ6mGmZbxW3b//eqVE=;
 b=GzbRGMQCj9Rx0WISRZABO2BH9Po6EM00mQgr5zq39B8nPfrRaCGUMYRr2l5/LNDYMi
 +yMXCTBgg607zLRQnKTfmlyCe+pAnU4nP8zhAAsIQfXnlbW9JCdAbnmhN47xRkozC376
 QhHxsWjh7XB6F9xbX1RDdJSlXQETxFQyU9400=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jms.id.au
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=GzbRGMQC
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed-*: bump Linux to 6.16.4
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

T24gV2VkLCAzIFNlcHQgMjAyNSBhdCAxNDozMiwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBPbiA5LzMvMjUgMDE6MDEsIEpvZWwgU3RhbmxleSB3cm90ZToKPiA+
IE9uIFN1biwgMzEgQXVnIDIwMjUgYXQgMjI6MTEsIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2Fv
ZC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gU2luY2UgTGludXggNi41IG1vdmVkIC5kdHMgZmlsZXMg
dG8gdmVuZG9yIHN1Yi1kaXJlY3RvcmllcywgYWRqdXN0IHRoZQo+ID4+IHBvc3QtaW1hZ2Uuc2gg
c2NyaXB0IHRvIHRha2UgaW50byBhY2NvdW50IHRoZSAnYXNwZWVkLycgcHJlZml4IGluIC5kdHMK
PiA+PiBmaWxlIG5hbWVzLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0
ZXIgPGNsZ0BrYW9kLm9yZz4KPiA+Cj4gPiBJcyBpdCBjdXN0b21hcnkgdG8gdXNlIGEgc3BlY2lm
aWMgdmVyc2lvbj8gSWYgbm90LCBsZWF2aW5nIHRoZXNlCj4gPiBib2FyZHMgdG8gdXNlIHRoZSBk
ZWZhdWx0cyB3b3VsZCBtYWtlIHNlbnNlIGFuZCBzYXZlIGhhdmluZyB0byB1cGRhdGUKPiA+IHRo
ZW0gaW4gdGhlIGZ1dHVyZS4KPgo+IEFsbCBrZXJuZWxzIGFib3ZlIHY2LjUgbmVlZCBpdCBhbmQg
SSBkb3VidCBvbmUgd291bGQgd2FudCB0byB1c2UKPiBhbnl0aGluZyBiZWxvdyB2Ni42LiB2Ni42
IGhhcyBiZWVuIHRoZSBiYXNlIHZlcnNpb24gb2YgdGhlIFNESwo+IGFuZCBPcGVuQk1DIGtlcm5l
bCBmb3IgYSB3aGlsZSBub3cuCgpJIHdhcyBzdWdnZXN0aW5nIHdlIGRvbid0IHNwZWNpZnkgdGhl
IHZlcnNpb24gaW4gdGhlIGFzcGVlZCBjb25maWdzLgpJdCB3b3VsZCB0aGVuIHBpY2sgdXAgdGhl
IGRlZmF1bHQgd2hpY2ggaXMgNi4xNiBhdCB0aGUgbW9tZW50LCBidXQKd291bGQgbW92ZSBmb3J3
YXJkIHdpdGhvdXQgaW50ZXJ2ZW50aW9uIChhIHBvc2l0aXZlIHRoaW5nKS4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
