Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17E5E748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 03:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2912B8291D;
	Sun,  1 Oct 2023 03:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2912B8291D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7LroPvJ5v2RC; Sun,  1 Oct 2023 03:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881A9828F8;
	Sun,  1 Oct 2023 03:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881A9828F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 804811BF5F5
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 03:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 562CE828F8
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 03:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 562CE828F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0Ybrlei_6qR for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 03:37:57 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A6DF828EF
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 03:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A6DF828EF
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6907e44665bso13988511b3a.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696131476; x=1696736276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgSFCOWB4G8zjScXqPAbjG5Q5dBmDvKcoHG8gXtfCzc=;
 b=sgg4RN2XsiYxPGZXo8/BJ6LGQSu4+VXByIhOC+kFAsI9qbxfqXUD554REVd2eq9x41
 zFM0j/rroz/xJfAv1ATv8NB9xxUQyjiRYUjOfbZfy+LnxZf+6Dg3IZA7mKRPerB8Nk8C
 okJGib15Xet0vewYcdGxugnvg1wQ1tjRWkbGI/A5nEdmtNx/eHgFKV410gfQ/zaCavRr
 Us2m0q9ke84Yzg6IENtq6YAInxLebEYrN/YQlgTioCRHXZBABPV0UkRcZPl0dhPUWhzM
 7/yL91QPRVFS3S0cReYjhX4IGRw+MdgHyOMYLfrauXda5AKmEtVf8brGdpHWFLUE/EXi
 ZBnA==
X-Gm-Message-State: AOJu0YxKjmNTdHt7TZ8pNCRY7sHGbagDq6KuHcv+XjaW1Ue7+CCA1h36
 0QdCEBKdQYNQh6+YZtOWCNIONoDVNb+MQL0xu7qmv5kwk2kLNA==
X-Google-Smtp-Source: AGHT+IER01ZBe0n9BP635STHtAIcAq/NDDdb/MeiQvSsinQhMlW4q95ILKQh6NimF4mqYbsICjqFblwEpfz0VF7wsRA=
X-Received: by 2002:a05:6a21:183:b0:132:ff57:7fab with SMTP id
 le3-20020a056a21018300b00132ff577fabmr11180144pzb.2.1696131476205; Sat, 30
 Sep 2023 20:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231001032945.12820-1-takumiiinn@gmail.com>
In-Reply-To: <20231001032945.12820-1-takumiiinn@gmail.com>
From: Takumi Takahashi <takumiiinn@gmail.com>
Date: Sun, 1 Oct 2023 12:37:20 +0900
Message-ID: <CAP+4GiL8tMzfqBremCvb94pSi=cdmMvLfMbRApA+MFvdSPcDiA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696131476; x=1696736276; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgSFCOWB4G8zjScXqPAbjG5Q5dBmDvKcoHG8gXtfCzc=;
 b=KDop6PQl8PDu5GU5ujHuna3ihCocMD70A1DuNQo7cH4REREVhN8COmcE55cGXq94eU
 ap5c2Mlf0zSX6YGfG0E8N6cZV1GibaAol6JKmN5N9Dntfr4VauWLAPPSuTodg0bdD9ih
 Fg7dz7KUbq8LWpcM0i7WgaJJpRFDg/vK58JvtE7GN1pInxg4KzuQLgfkBOaQyaUH1GXX
 IrVt63xCoKFhITz01LQ1NPYzyQxZ2/BeHhIaQp/bh4QFR/19ve+JVeP0MyFr1UPJ65Eh
 UXkoFlakr6+wupiEzXtJ1a9FYyhVVm7BLi/xEyugaRwoxLr2HB19aCiLReeVCMh01TGN
 4dGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KDop6PQl
Subject: Re: [Buildroot] [PATCH] package/python-pygments: support host
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U29ycnksIEknbSBub3QgZmFtaWxpYXIgd2l0aCBHaXQgb3BlcmF0aW9ucyBhbmQgZm9yZ290IHRv
IGFkZCB0aGUgcGF0Y2ggdmVyc2lvbi4KR2l2ZSB0aGUgbmV3IHBhdGNoIHZlcnNpb24gYW5kIHN1
Ym1pdCBhZ2Fpbi4KCjIwMjPlubQxMOaciDHml6Uo5pelKSAxMjoyOSBUYWt1bWkgVGFrYWhhc2hp
IDx0YWt1bWlpaW5uQGdtYWlsLmNvbT46Cj4KPiBUaGUgcmVhc29uIHRoaXMgcGF0Y2ggaXMgbmVl
ZGVkIGlzIGJlY2F1c2UgZ3RrLWRvYyByZXF1aXJlcyBweWdtZW50cy4KPiBUaGUgZmluYWwgZ29h
bCBpcyB0byBzdWJtaXQgYSBwYXRjaCBmb3IgbGlnaHRkbSwgYnV0IHNpbmNlIGd0ay1kb2MgaXMK
PiByZXF1aXJlZCB0byBidWlsZCBsaWdodGRtLCBweWdtZW50cyB3aWxsIGFsc28gYmUgcmVxdWly
ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUYWt1bWkgVGFrYWhhc2hpIDx0YWt1bWlpaW5uQGdtYWls
LmNvbT4KPiAtLS0KPiAgcGFja2FnZS9weXRob24tcHlnbWVudHMvcHl0aG9uLXB5Z21lbnRzLm1r
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcHl0aG9uLXB5Z21lbnRzL3B5dGhvbi1weWdtZW50cy5tayBiL3BhY2thZ2UvcHl0
aG9uLXB5Z21lbnRzL3B5dGhvbi1weWdtZW50cy5tawo+IGluZGV4IGYxNTFmMDA2MWIuLmU2ZDVi
YTI1ZjUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tcHlnbWVudHMvcHl0aG9uLXB5Z21l
bnRzLm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tcHlnbWVudHMvcHl0aG9uLXB5Z21lbnRzLm1r
Cj4gQEAgLTE0LDMgKzE0LDQgQEAgUFlUSE9OX1BZR01FTlRTX0NQRV9JRF9QUk9EVUNUID0gcHln
bWVudHMKPiAgUFlUSE9OX1BZR01FTlRTX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4KPiAgJChl
dmFsICQocHl0aG9uLXBhY2thZ2UpKQo+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkK
PiAtLQo+IDIuNDIuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
