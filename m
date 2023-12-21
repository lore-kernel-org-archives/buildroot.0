Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1C7C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 14:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB06D42504;
	Thu, 21 Dec 2023 14:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB06D42504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BclbtAeJvErM; Thu, 21 Dec 2023 14:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32CB74253F;
	Thu, 21 Dec 2023 14:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32CB74253F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87B0A1BF2EF
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 14:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C2A08131D
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 14:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C2A08131D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kj4zS9DMZG6s for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 14:43:50 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D63B80C2C
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 14:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D63B80C2C
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a22f59c6ae6so104591266b.1
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 06:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703169828; x=1703774628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ycLmS5UuQVKOusujJuOby5N6ApK2jlp8wQGI9OOaY8c=;
 b=RFk2zpannZhR9p8OUygtAos5J8hWa6OkSVPrx3XZKRQzNpyXxJiPtEXfz+dXzwg91L
 lqore5n4B9c5iMeCoCPR1So0RsnMbI9U/VWZU9dILzA1r6H+n8CZJCmhTXShotMoQcAf
 fbYVjES7EDXoVQlS0MLbtHBukHQgLCvDs5YL2/UUjAnPKD+Gxv0gQZdvfF7ttXE+2HVi
 F4kC2fcfxGBGI9I4Mzg98GAVctvDhtfbQ7qJH4uA6apW8Az8Iq+4nK+n6vph89kIo3Af
 c/I2Q3AYd3OwfuAtVUwbjfqAHrIJZqxu1wnqCilZLnkJRg/5QLpih3tBz31JDyH8ZHUG
 juog==
X-Gm-Message-State: AOJu0YxkMD1Om7rwU/IzvcnjLvNeDvQxvW/Ic4M1LPd1M9r7FtfiJpdM
 3fyHmX0zy41+isXRKCQSpyWhbrYCCcrg1UvTwxMR2JFZqPOG7dH1
X-Google-Smtp-Source: AGHT+IF6F23rwg4ufI3pO1PuJUtMtFhO/QCOPQ2izPwfKrPZxPaqFlYCnMRGVlyGuH/qvaz2+PN1Jdc+fTL+2C6s8ts=
X-Received: by 2002:a17:906:209:b0:a1c:966c:2962 with SMTP id
 9-20020a170906020900b00a1c966c2962mr5552336ejd.5.1703169828053; Thu, 21 Dec
 2023 06:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
 <20231221093159.6f50cc83@windsurf>
In-Reply-To: <20231221093159.6f50cc83@windsurf>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 21 Dec 2023 07:43:37 -0700
Message-ID: <CAHDQB6MUTQT4ebnxowo_7+DFVjA5wRY1O6hA_pK6N2d-cR-cRw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703169828; x=1703774628;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycLmS5UuQVKOusujJuOby5N6ApK2jlp8wQGI9OOaY8c=;
 b=O0PMu2Sj+z2WyHF/9fUIpGEK006SIV2eslF2aVF+VvmPCw8sv+hMwARN7hSBQWgAeX
 s1r41OV1N79NW6U24TKmDZKbK6KgBzkM1JeCAJrOBfBV/d0yhB4dpnJgF+pfUhUuF7RJ
 OGHFaoBmZ6Bb5estoKjNsxCbZyyZnpY89pSlg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O0PMu2Sj
Subject: Re: [Buildroot] [PATCH v3 01/10] package/wlroots: add hwdata and
 hwdata_pnp_ids as a dependency
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

SGVsbG8KCgpPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCAxOjMy4oCvQU0gVGhvbWFzIFBldGF6em9u
aQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDIwIERl
YyAyMDIzIDE3OjE5OjE1IC0wNzAwCj4gQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVs
YXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gPiBBcyBwZXIgYmFja2VuZC9kcm0vbWVzb24uYnVp
bGQ6MS03Cj4gPgo+ID4gaHdkYXRhID0gZGVwZW5kZW5jeSgnaHdkYXRhJywgcmVxdWlyZWQ6IGZh
bHNlLCBuYXRpdmU6IHRydWUpCj4gPiBpZiBod2RhdGEuZm91bmQoKQo+ID4gICAgICAgaHdkYXRh
X2RpciA9IGh3ZGF0YS5nZXRfdmFyaWFibGUocGtnY29uZmlnOiAncGtnZGF0YWRpcicpCj4gPiAg
ICAgICBwbnBfaWRzID0gZmlsZXMoaHdkYXRhX2RpciAvICdwbnAuaWRzJykKPiA+IGVsc2UKPiA+
ICAgICAgIHBucF9pZHMgPSBmaWxlcygnL3Vzci9zaGFyZS9od2RhdGEvcG5wLmlkcycpCj4gPiBl
bmRpZgo+Cj4gQnV0IGRvZXMgdGhhdCBtZWFuIHRoZXkgYXJlIGFjdHVhbGx5IHVzZWQsIHVuY29u
ZGl0aW9uYWxseSwgYnkgd2xyb290cz8KPiBZZXMsIHRoaXMgc2V0cyBhIHBhdGggaW4gbWVzb24s
IGFuZCB0aGVuPyBZZXMsIHRoZXkgKm1pZ2h0KiBiZSB1c2VkLAo+IGJ1dCBob3cgbWFuZGF0b3J5
IGFyZSB0aG9zZSBwbnAuaWRzPwo+ClRoZSBidWlsZCBmYWlscyB3aXRob3V0IGh3ZGF0YSBhbmQg
dGhlIHBucCBpZHMuCj4gVGhhbmtzLAo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
