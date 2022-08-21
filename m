Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDA8C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 21:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEFD660B28;
	Sun, 21 Aug 2022 21:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEFD660B28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhh1Y54Q_KVV; Sun, 21 Aug 2022 21:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D878E60B05;
	Sun, 21 Aug 2022 21:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D878E60B05
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5EF1BF5B3
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 21:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49EC2409A4
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 21:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49EC2409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6EfTm2UI4-x for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 21:56:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B35140933
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B35140933
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 21:56:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso6807303wma.2
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 14:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=C9eSsOu07JZTHAUHWnKfBZx9goMiLh1H+q4cvGJnqg4=;
 b=Uj9U7mQ8wJW+ouXxx9OTI807BYtBQtZibjQ0lAsRSUBb46vveovflf0tyzPfq+E/8M
 zHjX03+1ygi3UCVvZpiSee3rea8YDesUxDS0g0Ej5o9OZORjNbCaPto5ybRIxs1lCnQX
 RGH2/DfivIQtJO4om8ZG1vUs5b8ZBw5guTlcIdzJtaLyls/xrjrtF1VFsJUQxMwjxfwF
 y8ojHrtnQGOo0KQ5VSKOxNAFHq52hL2ls02itF2ouKPwtfUwKKQEZubmELR078JW3kJA
 LWVjAj5cvUAR2m6bSaAydjMl6aPbxCiG1xTz8bS+NAteuoJsSVsIGikDlE0XyWjSFjAe
 UkWA==
X-Gm-Message-State: ACgBeo3Jwf6zdQdXv/qYyMkfOgLE8RI+X5Mv4byDbRxi1pPm+QmXCoxi
 90HQFiQtonhdyy6GcfpO+Lo=
X-Google-Smtp-Source: AA6agR6OYEg6yo63xpKAxBhp69Rty7r3Xo+6esoPNoB67lg78MFxU6gCjsXdVt/Lb6U8L97jpiAUYg==
X-Received: by 2002:a05:600c:1d08:b0:3a5:b7ee:91c9 with SMTP id
 l8-20020a05600c1d0800b003a5b7ee91c9mr11103131wms.114.1661118982331; 
 Sun, 21 Aug 2022 14:56:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1cf406000000b003a2f2bb72d5sm18576894wma.45.2022.08.21.14.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Aug 2022 14:56:21 -0700 (PDT)
Message-ID: <2a8f7591-1ee7-f0e0-1fb6-43635272c258@gmail.com>
Date: Sun, 21 Aug 2022 23:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220821153104.239709-1-romain.naour@gmail.com>
 <20220821153104.239709-2-romain.naour@gmail.com>
 <20220821230351.69cee603@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220821230351.69cee603@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=C9eSsOu07JZTHAUHWnKfBZx9goMiLh1H+q4cvGJnqg4=;
 b=WTYX+9WV5HL9pI9oWO6KC6X7L0BOg1TpwVAfxauYypSlFOzTJr7EHR90y5DOpSdsTd
 TIqoS2hVmCXR0qwwEpbc3itglZ95nzKQbLbL6sz9tzZ3vvVFRRcQp70mesI6FbsmNLhM
 N9EEngTITCH75ZDANvtnD1EqDCmXUi8oBnT57yxGdzHXYop8W19Za+duOhEuGHKrTwIy
 RPLbvTFEB7XKLIlz3V1AuyTV1vSykaYO+5vfemN/GAGOsMf6t9d4krsPGxxiddCk57N8
 GPgzJlbUy255KpZ39BxAfhkNd4EcaSMi8rk1oi247DS+QSdivzqsJlSVpElbKrpwf1JZ
 7u3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WTYX+9WV
Subject: Re: [Buildroot] [for-next] configs: select uclibc when needed
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

SGVsbG8gVGhvbWFzLAoKTGUgMjEvMDgvMjAyMiDDoCAyMzowMywgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEhlbGxvLAo+IAo+IE9uIFN1biwgMjEgQXVnIDIwMjIgMTc6MzE6MDQgKzAy
MDAKPiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+IAo+PiBG
b2xsb3dpbmcgdGhlIHN3aXRjaCB0byBHbGliYyBhcyB0aGUgZGVmYXVsdCBsaWJjIGluIEJ1aWxk
cm9vdCBbMV0sCj4+IGFsbCBkZWZjb25maWdzIGV4cGVjdGluZyB1Q2xpYmMgd2l0aCB3Y2hhciAo
b3IgYW55IG90aGVyIHVDbGliYwo+PiBzcGVjaWZpYyBvcHRpb24pIG11c3Qgbm93IHNlbGVjdCBC
UjJfVE9PTENIQUlOX0JVSUxEUk9PVF9VQ0xJQkMgdG9vLgo+Pgo+PiBTb21lIGRlZmNvbmZpZ3Mg
cHJvdmlkZWQgYnkgQnVpbGRyb290IHNlbGVjdCBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9XQ0hB
Ugo+PiB3aXRob3V0IHNlbGVjdGluZyBCUjJfVE9PTENIQUlOX0JVSUxEUk9PVF9VQ0xJQkMuCj4g
Cj4gSSB0aGluayB3ZSBzaG91bGQgcmF0aGVyIHN3aXRjaCB0aG9zZSBkZWZjb25maWdzIHRvIHVz
ZSB0aGUgbmV3Cj4gZGVmYXVsdCwgaS5lIGdsaWJjLgoKSSdtIGFncmVlIG9uIHRoZSBwcmluY2lw
bGUgdG8gc3dpdGNoIHRoZW0gdG8gZ2xpYmMgYnV0IGJvYXJkcyBkZWZjb25maWcgd2hlcmUKb25s
eSBydW50aW1lIHRlc3RlZCB3aXRoIHVjbGliYy4gQWxzbyB3ZSBtYXkgbmVlZCB0byBpbmNyZWFz
ZSB0aGUgZmlsZSBzeXN0ZW0KaW1hZ2UgKEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRSkgd2hl
biBuZWVkZWQuVGhhdCdzIHdoeSBJIGNob29zZSB0byBrZWVwCnVjbGliYyBpbiB0aGlzIHBhdGNo
LgoKQnV0IGFsbCBvdGhlciBkZWZjb25maWcgc3dpdGNoZWQgYWxyZWFkeSB0byBnbGliYy4uLiBt
YXliZQpCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9NjBNIGlzIG5vdyB0b28gc21hbGwgZm9y
IHNvbWUgY2FzZT8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4g
Cj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
