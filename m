Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF83C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 08:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB2560B45;
	Mon, 10 Apr 2023 08:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBB2560B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiG4gWrMsYPU; Mon, 10 Apr 2023 08:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDD6C6FE75;
	Mon, 10 Apr 2023 08:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDD6C6FE75
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C38CE1C3B02
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 08:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D27140195
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 08:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D27140195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7G7fJu5v6IXY for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 08:44:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C64BB40017
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C64BB40017
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 08:44:38 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id w13so23326259oik.2
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 01:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681116277; x=1683708277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hagx5muMzZ6tDbPrbKxvvlXnGRLkwAxdTr/lmSRhjqk=;
 b=G8jKxaQM7wkl8al2xVOiL7uIGE8xdhLsmDfv6JfXcd0FPOew2BizW9KpUoS/ikGE5Q
 i3VUZZQIYPOSOFEdx6fBpuH8T6reryfNSGyP8s6wqJlpXdHYZKXYTfMCnoPxMD8ERSh/
 TVgFYMAAr1yvN0hd+2/WrykhgAkUHd/yK0/KcO41b5K5MM0yNEzTI1yNdY/Ql4GzrBpo
 pbtSix94+1A0mkr+Y3xsSoIrwsFIuPVUhXs84V1xz8vFWpV+qHtxcgDgA/6e4m+w4ElO
 AEf4mar9HUwtJ/Ynbmy09AHYcc2e+N0O8uar1bnktBDHSb8fv4kJvg3uTkmYv05Ykk8B
 S80Q==
X-Gm-Message-State: AAQBX9fNgbSaoGkBiDz2xJ+tJnc932SggrfMIdNPPloIhVqWPMVm4fLO
 yYLPCzfHFJM7znom+1flIwltOQESY6jN/hLZHBB/efLrO+h9Gw==
X-Google-Smtp-Source: AKy350a8cyWIAT6hK3gmB2+ikjtUTmcGD/VLY5UrrY/URXy2v7crgOfp+J0C+E/KUgR7YDusOeE2er+PvKr0eljC/CU=
X-Received: by 2002:a54:450b:0:b0:386:d8a5:d80b with SMTP id
 l11-20020a54450b000000b00386d8a5d80bmr1153145oil.4.1681116277281; Mon, 10 Apr
 2023 01:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220724020144.1012252-1-james.hilliard1@gmail.com>
 <ebe61366-15fc-6e69-b187-f884312206e2@mind.be>
 <6eb9eac2-0e2c-a919-6ca1-ba1e3a51bdb2@mind.be>
In-Reply-To: <6eb9eac2-0e2c-a919-6ca1-ba1e3a51bdb2@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Apr 2023 02:44:26 -0600
Message-ID: <CADvTj4rk8Xv2qEs-i+GMpdjrKgURGqqk_0SQt=K-0ywNE8jmwA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681116277; x=1683708277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hagx5muMzZ6tDbPrbKxvvlXnGRLkwAxdTr/lmSRhjqk=;
 b=FoyyHKFe1GeTdfC9yljf+KYdo42viw5Wi83WFk+Mj8L/uuVrAIvUa35pskP5vt0Sg8
 dGcNVGJpwFOqTh5booZtP3r8uZ3IFZ2t4MHq25RzWxglNSOt3vrv0q1Jb/4Ub32brJo4
 NMmBpK1aQ0gRWPrdnEEpbkeUix+lygWOPfrOYGyjpFTF1V3vXgrjX+MVrymEPRozbPnb
 gH1XKQ/2AHRJ129W9fHwEgAtF/deGfirxRWCz8MNkBtVL3tjuM4GYf1sVqm895Rpg2J2
 ezccJX3hbLXz5BJZNu30QNKIqjJVa/+O4RyKwve9a4N2qCGNPoJVlZFhISa6jlljYENw
 WO9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FoyyHKFe
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo: ensure host/target
 rustflags are properly split
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBcHIgOSwgMjAyMyBhdCAxOjQz4oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4gT24gMjQvMDcvMjAyMiAyMjo1OCwgQXJub3V0IFZh
bmRlY2FwcGVsbGUgd3JvdGU6Cj4gPgo+ID4KPiA+IE9uIDI0LzA3LzIwMjIgMDQ6MDEsIEphbWVz
IEhpbGxpYXJkIHdyb3RlOgo+IFtzbmlwXQo+ID4+IEBAIC01MSw3ICs1Niw4IEBAIFBLR19DQVJH
T19FTlYgPSBcCj4gPj4gICAjIGFuZCBzaG91bGQgYmUgcmVtb3ZlZCB3aGVuIGZpeGVkIHVwc3Ry
ZWFtCj4gPj4gICAjCj4gPj4gICBpZmVxICgkKE5PUk1BTElaRURfQVJDSCksYXJtKQo+ID4+IC0g
ICAgUEtHX0NBUkdPX0VOViArPSBSVVNURkxBR1M9Ii1DbGluay1hcmc9LVdsLC0tYWxsb3ctbXVs
dGlwbGUtZGVmaW5pdGlvbiIKPiA+PiArICAgIFBLR19DQVJHT19FTlYgKz0gXAo+ID4+ICsgICAg
ICAgIENBUkdPX1RBUkdFVF8kKGNhbGwKPiA+PiBVUFBFUkNBU0UsJChSVVNUQ19UQVJHRVRfTkFN
RSkpX1JVU1RGTEFHUz0iLUNsaW5rLWFyZz0tV2wsLS1hbGxvdy1tdWx0aXBsZS1kZWZpbml0aW9u
Igo+ID4KPiA+ICBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMgaXMgbmVlZGVkLiBXZSBkb24n
dCBzZXQgUlVTVEZMQUdTIGFueXdoZXJlIGVsc2UsCj4gPiBzbyBpdCBzaG91bGQgYmUgZmluZT8g
T3IgaXMgaXQgYmVjYXVzZSBSVVNURkxBR1MgaXMgYWxzbyB1c2VkIGZvciBuYXRpdmUgYnVpbGQK
PiA+IGV2ZW4gaWYgQ0FSR09fSE9TVF9SVVNURkxBR1MgaXMgc2V0Pwo+ID4KPiA+ICAoQW55d2F5
LCB0aGlzIGh1bmsgY2FuIHByb2JhYmx5IGJlIHJlbW92ZWQsIHRoZSBidWcgdGhhdCB0cmlnZ2Vy
ZWQgaXQgaXMgZml4ZWQuKQo+Cj4gICBZb3UgbmV2ZXIgcmVwbGllZCB0byB0aGlzLiBJZiBpbmRl
ZWQgdGhpcyBwYXJ0IHNldHRpbmcgUlVTVEZMQUdTIGNhbiBiZQo+IHJlbW92ZWQsIHRoZW4gd2Ug
ZG9uJ3Qgc2V0IFJVU1RGTEFHUyBhbnl3aGVyZSwgc28gdGhpcyBwYXRjaCBzaG91bGRuJ3QgYmUK
PiBuZWVkZWQsIHJpZ2h0PwoKVGhlIGlzc3VlIHN0aWxsIGFwcGVhcnMgdG8gYmUgb3BlbiBzbyBJ
J20gYXNzdW1pbmcgaXQncyBzdGlsbCBuZWVkZWQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxh
bmcvY29tcGlsZXItYnVpbHRpbnMvaXNzdWVzLzQyMAoKPgo+Cj4gICBSZWdhcmRzLAo+ICAgQXJu
b3V0Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
