Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEE3C77B6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 08:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5482427AD;
	Fri, 14 Apr 2023 08:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5482427AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcthmM5V7113; Fri, 14 Apr 2023 08:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD07427B3;
	Fri, 14 Apr 2023 08:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBD07427B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE9D61BF390
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 08:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A51AD405A0
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 08:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A51AD405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjPZwe306E-Z for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 08:12:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A35BE400F8
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A35BE400F8
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 08:12:45 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id bx15so16142054ljb.7
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 01:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681459963; x=1684051963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Edxi29py0Y0aazo59d6a4WCy/2jYtEUwY7p1futWVg=;
 b=dazXoFnxYKuaFgTZdTu8RJjuV2VHTrqbpIawmV9sFXoUQx+8nnt7VCtqF7WhUUoTJk
 i0s85vz0q424nTzhCKbPhzUmDdLoJNTAMS9DI6O8KgWqWooQ79Ri+s+u2BL2Mca/90sf
 CKbneCl3S8LSKQXaUq3AHPEdyJkLyvy5jr5VgO2yJn/yJA32XOQkQq8HncJRSB1wdGs0
 Pq3UGHboTmtswWBsJFR7M31fCS3B3UeRv3Xmv1sjMdlbh9PFSZYAQX9+cYg10kraWu8Q
 LX7t5eJnQK/WsJXb4aeHmQOZs9TkfvEOvAACNjMG2/R6HK6k65n/nES0C0kNpOdJoYSh
 V3Bw==
X-Gm-Message-State: AAQBX9fnkbHbXSIpYVaFb+PJkDjtds6xXJ+fHQ+oDBuJwRGK0gTDtvFA
 nEy5TVN2w3rcYUd84fF9kLnSVxCAPAq6Bw==
X-Google-Smtp-Source: AKy350Y+NJ79k1oqS4ccti3AnzKMykmyAY/HQoch8VcqXTdQf3eqW2izQcUNrd6VYNgJ0Ok6sS9lSg==
X-Received: by 2002:a2e:8450:0:b0:2a8:a89c:bee0 with SMTP id
 u16-20020a2e8450000000b002a8a89cbee0mr772404ljh.11.1681459963200; 
 Fri, 14 Apr 2023 01:12:43 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 y14-20020a2e95ce000000b002a8ac166e55sm230894ljh.44.2023.04.14.01.12.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:12:43 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id m4so22213587lfj.13
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 01:12:42 -0700 (PDT)
X-Received: by 2002:ac2:551b:0:b0:4ea:e5e3:7eb0 with SMTP id
 j27-20020ac2551b000000b004eae5e37eb0mr1598280lfk.10.1681459962436; Fri, 14
 Apr 2023 01:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <CACXRmJjkgX6iek7DyuqDbc29QF+N0ALjS5w7qfPEaU=O-fmw+A@mail.gmail.com>
 <20230414005434.GB370828@igalia.com>
In-Reply-To: <20230414005434.GB370828@igalia.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 14 Apr 2023 10:12:31 +0200
X-Gmail-Original-Message-ID: <CACXRmJj3mK2ZSokb-LCZ9+=Jh5=4ssnt_EXVyW_1DeqEXBe0CQ@mail.gmail.com>
Message-ID: <CACXRmJj3mK2ZSokb-LCZ9+=Jh5=4ssnt_EXVyW_1DeqEXBe0CQ@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: allow both X11 and
 Wayland
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJIHNhdyB5b3VyIGNvbW1pdCwgZG9uJ3QgZm9yZ2V0IHRvIHVwZGF0ZSB0aGUgY29tbWVu
dCAiY29tbWVudAoid2Via2l0Z3RrIG5lZWRzIC4uLiIsCnRoZXJlIGlzIGFsc28gYSBtZW50aW9u
IG9mIHRoZSBHQ0MgdmVyc2lvbiB0aGVyZS4KCktyLAoKVGhvbWFzCgpPcCBkbyAxMyBhcHIgMjAy
MyBvbSAyMzo1NCBzY2hyZWVmIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEu
Y29tPjoKPgo+IEhpIFRob21hcywKPgo+IE9uIFRodSwgMTMgQXByIDIwMjMgMjM6MTQ6MjMgKzAy
MDAgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiB3cm90ZToKPgo+ID4gSSBo
YXZlIGEgc2VyaWUgb2YgcGF0Y2hlcyB3aGljaCBhcmUgc3RpbGwgb3BlbiwgcmVsYXRlZCB0byB0
aGF0IGF0ayBicmlkZ2UuCj4gPgo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzQzODAxCj4KPiBBaCwgaW50ZXJlc3RpbmcsIEkg
d2lsbCB0YWtlIGEgbG9vayB0b21vcnJvdy4KPgo+ID4gSSB3YXMgYWxzbyBwbGFubmluZyB0byBt
YWtlIGEgcGF0Y2ggd2l0aCB3ZWJraXRndGsgMi40MCwgYnV0IGRpZG4ndCBkbyB0aGF0Cj4gPiBz
aW5jZSBteSBvdGhlciBwYXRjaGVzIGFyZW4ndCBtZXJnZWQgeWV0LiBJZiB5b3UgZG8gaXQsIGtu
b3cgdGhhdCBJIGFscmVhZHkKPiA+IHVwc3RyZWFtZWQgdGhlIGhvc3QtdW5pZmRlZiBwYWNrYWdl
IGFuZCB0aGF0IHRoZSBtaW5pbXVtIHJlcXVpcmVkIEdDQwo+ID4gdmVyc2lvbiBuZWVkIHRvIGJl
IGJ1bXBlZCBhcyB3ZWxsLgo+Cj4gTmljZSwgeW91IHNhdmVkIG1lIGZyb20gaGF2aW5nIHRvIGRv
IGhvc3QtdW5pZmRlZiBteXNlbGYuIEkgaGF2ZSBhbHJlYWR5IGEKPiBwYXRjaCBbMV0gZm9yIHRo
ZSAyLjQwLjAgdXBkYXRlLCB3aGljaCBpcyBub3cgcmVjZWl2aW5nIGEgcm91bmQgb2YgdGVzdGlu
Zwo+IGJlZm9yZSBJIHN1Ym1pdCBpdCA6KQo+Cj4gQ2hlZXJzLAo+IOKAlEFkcmnDoW4KPgo+IC0t
LQo+IFsxXSBodHRwczovL2dpdC5zci5odC9+YXBlcmV6ZGMvYnVpbGRyb290L2NvbW1pdC8xNWUz
ZmZlYWJlYzUxNWYwNzEwODA3OTY2MGEyNmFiYTAyNWEzOWY2Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
