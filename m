Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF2CCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 20:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07D9B60ADA;
	Wed, 11 Oct 2023 20:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07D9B60ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vs5-niCNA8GR; Wed, 11 Oct 2023 20:02:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DCF060F10;
	Wed, 11 Oct 2023 20:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DCF060F10
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 586CF1BF3E9
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 20:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EC3460F10
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 20:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC3460F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsmP9ktdYVt6 for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 20:02:38 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B80CD60C2B
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 20:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B80CD60C2B
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-991c786369cso33837766b.1
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 13:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697054555; x=1697659355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hh0WGwKf0o+phHcsEAP6Kf9bvor7nQPdzI7JpA12dTA=;
 b=PFcfnDD9xe0UKBylTtrzSGJAqX3NuAA9YqThviSyF3ewDZQI3b+otmIlM5o9S6IdJj
 5adYdqLXTYndM9vGQR+pCm5Ey4iopRcQ1WPDAe6UBHjWJ4yqJ7G2gj0BU1UVCWpqBRf5
 sdVNDeh1++ty8dG2u/K8eAVOgVQOCDlNRLcGBPk3TMaeTlapiUzDvth8oPUQlMB0nMTV
 +/mZpyH5EJqYAzPmJtmbHPh7z5s1ie1VGgjwOjXWOo+TzE2BjLrbsi1YkQjz6XOLolit
 c+0pi/a/bP8w8JMZ6FnlJhJkNbWBEvy9maiX8aRhxzjhOPa+EUAVa1mG3M9OLjSxR06/
 HZUA==
X-Gm-Message-State: AOJu0Yzcem4h+c40xbtfV+btg0cz7E/8WiqLuaXFlsOEfdrCnge1fDDI
 dukcgBw1NKCcSG98dFdyJrQQ+9HRYqxdPmxAd1GUkg==
X-Google-Smtp-Source: AGHT+IGqE+dOjWIwSwEXbr6pjT3K+omglf+CtBj6E4VNHViLAL8qNtNwWzd3K79MbKDWVXJvdxB+8Q==
X-Received: by 2002:a17:906:530c:b0:9ae:3d8e:b635 with SMTP id
 h12-20020a170906530c00b009ae3d8eb635mr18917149ejo.24.1697054555362; 
 Wed, 11 Oct 2023 13:02:35 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 c27-20020a17090603db00b009829d2e892csm10367853eja.15.2023.10.11.13.02.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 13:02:34 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-991c786369cso33833366b.1
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 13:02:34 -0700 (PDT)
X-Received: by 2002:a17:906:d3:b0:9b2:d64a:9ecd with SMTP id
 19-20020a17090600d300b009b2d64a9ecdmr19296322eji.66.1697054553955; Wed, 11
 Oct 2023 13:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231011114736.311388-1-peter@korsgaard.com>
In-Reply-To: <20231011114736.311388-1-peter@korsgaard.com>
Date: Wed, 11 Oct 2023 13:02:22 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oDuTBC+v2bjO=E8jQR4aPgHT+u360VxoETygy3cYJpiQ@mail.gmail.com>
Message-ID: <CA+h8R2oDuTBC+v2bjO=E8jQR4aPgHT+u360VxoETygy3cYJpiQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1697054555; x=1697659355; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hh0WGwKf0o+phHcsEAP6Kf9bvor7nQPdzI7JpA12dTA=;
 b=mre2FiZe/HMI43bDNpoD/aD+RMID5Bn2W5fCKyfAr6OzcRPRvwZGsMAf1NRHRXIC01
 FlFkGZsaT9s9tRua/gATtRuIhImp2WSMvm8D3AiQ4yH8EfPAY8VLRAiHmYr4IACsWzFq
 o3WkUeuI7ytBPcqmeunUvMlS+ofNqXUXo7cNySU85mNvY7CwcHw60QqS8lR5Ld11GHvM
 7im9duG8nlPhDuqlfWIipvuJBIL6tXhfxoN0F51rsU5QfqM4C7BIU7ridd+5lpT8jiIa
 SzAwUtmiOwCMJU1B8HuVTfxKRD1vz/TaKW4cWvA8xX32g5N38DTKFJHr7NW6bjEc96Hv
 I50w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=mre2FiZe
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.21.3
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBXZWQsIE9jdCAxMSwgMjAyMyBhdCA0OjQ34oCvQU0gUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+IEZpeGVzIENWRS0yMDIzLTM5MzI1
OiByYXBpZCBzdHJlYW0gcmVzZXRzIGNhbiBjYXVzZSBleGNlc3NpdmUgd29yawo+Cj4gQSBtYWxp
Y2lvdXMgSFRUUC8yIGNsaWVudCB3aGljaCByYXBpZGx5IGNyZWF0ZXMgcmVxdWVzdHMgYW5kIGlt
bWVkaWF0ZWx5Cj4gcmVzZXRzIHRoZW0gY2FuIGNhdXNlIGV4Y2Vzc2l2ZSBzZXJ2ZXIgcmVzb3Vy
Y2UgY29uc3VtcHRpb24uICBXaGlsZSB0aGUKPiB0b3RhbCBudW1iZXIgb2YgcmVxdWVzdHMgaXMg
Ym91bmRlZCB0byB0aGUgaHR0cDIuU2VydmVyLk1heENvbmN1cnJlbnRTdHJlYW1zCj4gc2V0dGlu
ZywgcmVzZXR0aW5nIGFuIGluLXByb2dyZXNzIHJlcXVlc3QgYWxsb3dzIHRoZSBhdHRhY2tlciB0
byBjcmVhdGUgYQo+IG5ldyByZXF1ZXN0IHdoaWxlIHRoZSBleGlzdGluZyBvbmUgaXMgc3RpbGwg
ZXhlY3V0aW5nLgo+Cj4gZ28xLjIxLjMgKHJlbGVhc2VkIDIwMjMtMTAtMTApIGluY2x1ZGVzIGEg
c2VjdXJpdHkgZml4IHRvIHRoZSBuZXQvaHR0cAo+IHBhY2thZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uv
Z28vZ28uaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9nby9nby5tayAgIHwgMiArLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2dvL2dvLmhhc2ggYi9wYWNrYWdlL2dvL2dvLmhhc2gKPiBpbmRleCBhMmVjNmI1
OTIzLi45NDk5ZjUwOTY0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ28vZ28uaGFzaAo+ICsrKyBi
L3BhY2thZ2UvZ28vZ28uaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIEZyb20gaHR0cHM6Ly9n
by5kZXYvZGwKPiAtc2hhMjU2ICA0NWU1OWRlMTczYmFlYzM5NDgxODU0NDkwZDY2NWI3MjZjZWMz
ZTViMTU5ZjZiNDE3MmU1ZWM3NzgwYjJjMjAxICBnbzEuMjEuMi5zcmMudGFyLmd6Cj4gK3NoYTI1
NiAgMTg2ZjJiNmY4YzhiNzA0ZTY5NjgyMWIwOWFiMjA0MWE1YzFlZTEzZGNiYzMxNTZhMTNhZGNm
NzU5MzFlZTQ4OCAgZ28xLjIxLjMuc3JjLnRhci5nego+ICBzaGEyNTYgIDJkMzY1OTdmNzExN2Mz
OGIwMDY4MzVhZTdmNTM3NDg3MjA3ZDhlYzQwN2FhOWQ5OTgwNzk0YjIwMzBjYmMwNjcgIExJQ0VO
U0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9nby5tayBiL3BhY2thZ2UvZ28vZ28ubWsKPiBp
bmRleCAyYzMyZTkwODE3Li5lZjI3ZjMyODM1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ28vZ28u
bWsKPiArKysgYi9wYWNrYWdlL2dvL2dvLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+IC1HT19WRVJTSU9OID0gMS4yMS4yCj4gK0dPX1ZFUlNJ
T04gPSAxLjIxLjMKPiAgR09fU0lURSA9IGh0dHBzOi8vc3RvcmFnZS5nb29nbGVhcGlzLmNvbS9n
b2xhbmcKPiAgR09fU09VUkNFID0gZ28kKEdPX1ZFUlNJT04pLnNyYy50YXIuZ3oKClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgoKVGhhbmtzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
