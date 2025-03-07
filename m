Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0245EC28B28
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 23:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B120F84021;
	Fri,  7 Mar 2025 23:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWYmIdWJiiws; Fri,  7 Mar 2025 23:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD7348401A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD7348401A;
	Fri,  7 Mar 2025 23:13:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7832FE26
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 23:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 495C24022B
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 23:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCEH6_9aAuFg for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 23:13:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16FC240179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16FC240179
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16FC240179
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 23:13:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so2842736e87.1
 for <buildroot@buildroot.org>; Fri, 07 Mar 2025 15:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741389203; x=1741994003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJ0yo6sJ0YMkdgFES9tw2k9U/wThQXV5jgeeWxER5Qw=;
 b=FhfdhMt07BuFiUhmXWEi80sydZyoFeMr2cJDIfzumz+xTK4Dq1CtRS21SzpK+ITogl
 ap5EnSZGe63LBmPi0Es8gA/Cv1/lSPregtIqiuUVx51GkTKPBvOLWbmh6bgddgNARnA4
 /JzsG3Y+ow7ijL9I8jcT2jhljPzOvA0j2xvOD92tEiKLWCq6+2iptU7qzLdY5tamUYxc
 lIbEzPFMT49UltNycoEyJHJLAJdXpipNjf88rZYryS3Rcex7rsnqvjikhiZM5jtZ/Tib
 K9q4ZDdQ7cpA1CMkjQCoMPvrbMxS9fMQ7QwtgZRoM4+t1GBQO/XtivQhR8G8AXjN99Rx
 pBxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUabqezOPx/ryI/3GOf9c5t7DAN01CNAD8Th6XpWe/5pMrgjNA/+T2mcqx+kDI9n8NTQOCDma9yWoM=@buildroot.org
X-Gm-Message-State: AOJu0YxQqTcfdJFBgFvrEeBSu6nPbI18saBLiS9vfvIqAM4Qijyhbi9D
 RgsLdeS0ucHVWwIG/m+jAhfdJTwc9YLPXhyQJtWlM3TQbFrRXq20KQfT71eqcHleHKixTeIxdr+
 lmLAxBTvCOgkgx4w+KY0wHxBvqBg=
X-Gm-Gg: ASbGncsED4D5ZgguZfJ+Ey7P5tXoeyMTFP6s8i2erv9eXTElpvKCiGKkfoRT42dJZJF
 oqlzv2phuWYkwlqzqLgp4g/dRYyC7mH07IVs7QFCwAx2wnbGzKu3wYkMCidJ85l4ziFnMArt1Hu
 qtQl1fvg40SUmpR3kBlV1Bz9ShZ6gYYEAI7XoPY0FHc0MgzIZi6FB3+L2acOPz
X-Google-Smtp-Source: AGHT+IE45U9mFa7XGg1cl8xDV+1j3kFDABaII5JzQWR692XGN/fHYYlfUA1c5lWDcJmQ4K/13u/lMa1hXake2eBHtFo=
X-Received: by 2002:a05:6512:3993:b0:549:792a:a382 with SMTP id
 2adb3069b0e04-549910b59bdmr1878482e87.32.1741389202553; Fri, 07 Mar 2025
 15:13:22 -0800 (PST)
MIME-Version: 1.0
References: <20250307140407.4091221-1-buildroot@bubu1.eu>
 <9d45738738592229d4409ed9200977f1@free.fr>
In-Reply-To: <9d45738738592229d4409ed9200977f1@free.fr>
Date: Sat, 8 Mar 2025 00:13:10 +0100
X-Gm-Features: AQ5f1JrFEYyXn5q4U0WlupynE19Xuku83hoPPn4sbpsxSpNhkfo9-WysGhjuVyM
Message-ID: <CAGm1_kv0CGjoyEPv=7eEPqV3hukab-p=mUSO82QQHPoiKDJRxQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1741389203; x=1741994003; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJ0yo6sJ0YMkdgFES9tw2k9U/wThQXV5jgeeWxER5Qw=;
 b=b5+H+B3Xb1jmkEXSDOI7LTAHUpUEUCgh+KlE3hnkZ2HqR4iMvB5XxsNdeaGKd7W3YJ
 eyKK6q2leKb3fOBQvfUoiFek2ng4avbNmjGM/kyiX8/1VbVZ+amrkM6XJ5WzRSxlg5L+
 Fq9JyO15Wf5D8H1qQoWsrG2SHfgFhzTO9hajixZFplqD3aILUSPVhUyOizCRCR5Rs0UO
 jDqQnW2qz1ibPqTYdIenfU44yycSJtD9PYXkGjqJJMw1D6eiWyltb/59uXnfI6jd80cC
 JkPccbs+DdvkmoVp1ZHQiDKF+8mwiw5nn19JMGeLkmTsMezbqOdAZiDOHeoKiXN3Oy4p
 n58Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b5+H+B3X
Subject: Re: [Buildroot] [PATCH] package/can-utils: bump to v2025.01
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIEZyaSwgTWFyIDcsIDIwMjUgYXQgOTo1N+KAr1BNIEp1bGllbiBPbGl2YWluIDxqdS5v
QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSGkgTWFyY3VzLAo+Cj4gT24gMDcvMDMvMjAyNSAxNTowNCwg
TWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiBQYXRjaGVzIGFyZSBub3cg
aW5jbHVkZWQgaW4gdXBzdHJlYW0gcmVsZWFzZS4KPiA+IFBhY2thZ2Ugc3dpdGNoZWQgZnJvbSBh
dXRvdG9vbHMgdG8gY21ha2UgYmFzZWQgYnVpbGQuCj4gPgo+ID4gUmVsZWFzZSBOb3RlczoKPiA+
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1jYW4vY2FuLXV0aWxzL3JlbGVhc2VzL3RhZy92MjAy
NS4wMQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1
YnUxLmV1Pgo+Cj4gVGVzdGluZyB0aGlzIHBhdGNoIG9uIHRoZSBuZXh0IGJyYW5jaCB3aXRoICJ0
ZXN0LXBrZyAtYSIgZ2VuZXJhdGVzCj4gZmV3IGJ1aWxkIGZhaWx1cmVzOgo+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGluZXMvMTcwNTU0ODc5MAo+Cj4gQ291
bGQgeW91IGhhdmUgYSBsb29rIHBsZWFzZT8KClRoaXMgcGF0Y2ggaXMgbWlzc2luZzoKaHR0cHM6
Ly9naXRodWIuY29tL2xpbnV4LWNhbi9jYW4tdXRpbHMvY29tbWl0LzJiOGM3YzVmNGI3MTcyNjgw
NmRlMGQ3MThjNGM1NmVlYmEyYzczMzIKClllZ29yCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
