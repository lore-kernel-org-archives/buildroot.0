Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528E2C71153
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 20:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C851140933;
	Mon, 28 Aug 2023 20:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C851140933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQyoePVw7fi0; Mon, 28 Aug 2023 20:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B857E40930;
	Mon, 28 Aug 2023 20:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B857E40930
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3BFF1BF2BC
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA61A4054B
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 20:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA61A4054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7j3aBg5HEGAF for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 20:31:18 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAE5D40546
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 20:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE5D40546
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4108ec645a1so23004921cf.0
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 13:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693254676; x=1693859476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbGn9GOohTz36SmOicTuhGPXJQVFVKQejTQ8rENj29U=;
 b=PJSqslZ2gQPyHIzbNoWa829nJugetOXWYyOOv9EuELVSy2ITndpvtVAKzdztB6cuZg
 9mjmRbadS/0Ee8UpIjLb5hhE4tqzmXJ0uQ3FavRDwmeTVdIUDBv0ADq1rZsu+Cjjg5BE
 Z0svfuk7rv+7iMqrjkQIQJH2hHLNwH37Jg/Zl4Qhf14uwJribN0pPKrgNr/ZcciBHbjL
 PBKgjX0wPANpRbUNvRfpqh9G+DNiiTOAAb62QD05a0fc8agp4EtE4HW4wWj9uUEG9zPJ
 /IVIKZbbKadeQ7lUOb+ngZmK6MnS/6AAiJc43siXCVloA3z5O928drB4N5ua9rUru95K
 IbPg==
X-Gm-Message-State: AOJu0YwB9LBvNd8Krtz54Pkmv9jHS+JBElTLxuYaJ8GRppIaPsrl0oHy
 ckoBhOTTlgbUxXIbqziZvXrH3VThdeo53xOde0U=
X-Google-Smtp-Source: AGHT+IEQaj6DGudv9CZq8+hJ19sOyjHa9SRCNui1VGZtFtVz1DfuI3TadCFc+dD9JvUmxFuw2YR01NMg+pcMFtoar0Y=
X-Received: by 2002:ac8:5903:0:b0:40f:dd5f:d36b with SMTP id
 3-20020ac85903000000b0040fdd5fd36bmr33051632qty.23.1693254676342; Mon, 28 Aug
 2023 13:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230827194003.3387773-1-james.hilliard1@gmail.com>
 <20230827194003.3387773-2-james.hilliard1@gmail.com>
 <20230828215741.44c239d9@windsurf>
In-Reply-To: <20230828215741.44c239d9@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Aug 2023 16:31:04 -0400
Message-ID: <CADvTj4o7G0t2CMmNKyOOJJcpOhFDSdZxtpiVUnw1=MbdNWoPHQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693254676; x=1693859476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbGn9GOohTz36SmOicTuhGPXJQVFVKQejTQ8rENj29U=;
 b=W74gWTRHMwt/9W5yrZc1f27u+rkROeZdNx5pb8AdISoV7i9g+ChGewwqJusHLpCj7x
 FC4bvPxqQsNEwxcGobXYbwDxjmx8HiMSALM66kArHohDhWn/XWaDVC6NxNKhK5JC7ACp
 L0AHPeVAciFfqGjIgwLPHlusyYtFrklMhE8uZJVZzm3sfP6Mg5gSv2nGXExRWMS1miK9
 UKX2ru5x6dnMZutyV2CQ/XeUTf3hjhkZ/4ISHQQUIrns2LFPj/EZWwD6xJ0hxwDrntiJ
 pfdo5dc7cNEY2hR+f6gKac8MkJq4PAEIbvDBUtHVRdF7NQH1q8r507Gc8B499N32lwfP
 8t3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W74gWTRH
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: add host-python-distlib
 dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMzo1N+KAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCAyNyBBdWcgMjAyMyAx
Mzo0MDowMyAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gVGhlIHFlbXUgZG9jdW1lbnRhdGlvbiByZWNvbW1lbmRzIGRlcGVuZGlu
ZyBvbiB0aGlzIHBhY2thZ2UuCj4KPiBSZWNvbW1lbmRzIGZvciB3aGF0PyBEb2VzIGl0IHdvcmsg
d2l0aG91dCBpdCwgb3Igbm90PyBJZiBpdCBpc24ndAo+IHRoZXJlLCB3aGF0IGlzIHRoZSBjb25z
ZXF1ZW5jZT8KClRoZSBkb2NzIGhlcmU6Cmh0dHBzOi8vd2lraS5xZW11Lm9yZy9DaGFuZ2VMb2cv
OC4xI0J1aWxkX0RlcGVuZGVuY2llcwoKSW5kaWNhdGU6Ckl0IGlzIHJlY29tbWVuZGVkIHRvIGlu
c3RhbGwgZGlzdGxpYiBhcyB3ZWxsLCBidXQgdGhlIGJ1aWxkIHByb2Nlc3MKdHJpZXMgdG8gY29w
ZSB3aXRoIGl0cyBhYnNlbmNlIGFuZCBpdCBzaG91bGRuJ3QgYmUgbmVjZXNzYXJ5LgoKSXQgZG9l
cyBhcHBlYXIgdG8gd29yayB3aXRob3V0IGl0IHdoZW4gSSB0ZXN0ZWQgYnV0IHNlZW1zIHdvdWxk
IGJlIGEKZ29vZCBpZGVhIHRvIGRlcGVuZCBvbiBpdC4KCj4KPiBUaGFua3MhCj4KPiBUaG9tYXMK
PiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
