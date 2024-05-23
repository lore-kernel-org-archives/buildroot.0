Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C208CC25B7A
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 17:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78231823F6;
	Thu, 23 May 2024 17:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IHIrvNLvoXL; Thu, 23 May 2024 17:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 420A082404
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 420A082404;
	Thu, 23 May 2024 17:42:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9581CE701
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 17:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83E334072C
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 17:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W364B-UUFrWo for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 17:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E614C405B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E614C405B6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E614C405B6
 for <buildroot@buildroot.org>; Thu, 23 May 2024 17:42:02 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52449b7aa2bso5454059e87.3
 for <buildroot@buildroot.org>; Thu, 23 May 2024 10:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716486121; x=1717090921;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dac+zD6QxNfNvkeKALcBYwckbK/IFbVF2kabFut/X8I=;
 b=UvpCAFEGmTDpCWy2idJ0suk+P8FazLrPxrG/yv6axy83hPsPofowyN1XP6wklHkO6/
 qVuPwMc/TV2CAaJ/DdGG+o+ZV04ATAjzu/oiRQxL62SdR7PNHTS99Fqy6wXvx3v0ZT4o
 HIaTs/e9jv5UlQ1O0MpTZVUJgTcXoxfpbEJh7Lqe0jOgY7bhv7epi0yT1Q06qJXypPxf
 MkwlmoQALtcmpbEdSjeRoiF1PzIxneccOnXezwUTmSLhI8rJo8c33Nf1uuC2ksT888Nw
 AQqMGxFZuNzM3neRv+snRvGlB2yS4D/cqmbxK5Lu6AF5Z0nysjmfz1DxcfqZG9ZYRKjJ
 e5YQ==
X-Gm-Message-State: AOJu0YwKGdtuDe9VoTsok37LrqAuZVNhU+XBEfu4W6F6OqFB91lmQgRv
 kUwRxa/XDAQveggDIXkRrbYwlPzXRNwXNaIlMaNvJd8xt9w9SYgu9h1xJcfVhr09MQAlmV6vOzj
 Mo/PFiRLUIZNetLCsqL+/qNmhKGs=
X-Google-Smtp-Source: AGHT+IEplCOgSe4jibA5QOAlQEtYETVbFANZEVH9d19+vBIQd/1R4AxV8Gnk1rs8YZM2pDHlf4KrjAKwxHE1Pe1RkyI=
X-Received: by 2002:a05:6512:33d4:b0:529:37be:ffad with SMTP id
 2adb3069b0e04-52937bf0065mr229274e87.49.1716486120358; Thu, 23 May 2024
 10:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240523170006.1488807-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240523170006.1488807-1-fontaine.fabrice@gmail.com>
Date: Thu, 23 May 2024 19:41:47 +0200
Message-ID: <CAGm1_ks3-3BVqgQ3wsn_+rGg44JcZrqax2uG=wPWvWJUo-8R3g@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1716486121; x=1717090921; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dac+zD6QxNfNvkeKALcBYwckbK/IFbVF2kabFut/X8I=;
 b=BCEO3upcZxRsuMfxkK6Gmc4h8Nflg51RLz4h5MXL+4OnvGbM9W5+tHCYSEEUIBInQL
 rZqU+SZDgsuZNfRHcnIQHtvoq/EVzy0UuAwZJco1PxAimRG402P9wOSP1dDd5jEPuKP7
 ndvlzJMEDVJOxDdumEF+d6CicvQXt749EkSo1u0o9aAa2KY2SX4eWqbA+wDNs22VxecN
 ViNf5LWBa1JLDTgrxRxcxPaGiwSxAzIFFn40113MQhzL/3s6C2T+PFAPEUSiJLjHZZ2Y
 gZ2oKDGzgEgxdOPmelM5jFTor7FTyXa9ZuohTtbM8SwAWuR/YSdOKfZpDlJQuNXqWUC9
 B0+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BCEO3upc
Subject: Re: [Buildroot] [PATCH 1/1] package/atftp: fix build with pcre2 >=
 10.43
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgNzowMOKAr1BNIEZhYnJpY2UgRm9udGFpbmUKPGZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmUgcmFpc2VkIHNpbmNlIGJ1bXAgb2YgcGNyZTIgdG8gdmVyc2lvbgo+IDEwLjQzIGlu
IGNvbW1pdCBmYTllNTc1Nzc2ZWUzZDNkNDdhMzFmZWUzYzA5YTk0NzUzYzc3Y2M3IGFuZAo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9QQ1JFMlByb2plY3QvcGNyZTIvY29tbWl0LzAxNGM4MmQ3YmNjMjg3
M2NkYjFmM2FiYzVlNTM0ODU4N2Y0NzdiYTQ6Cj4KPiB0ZnRwZF9wY3JlLmM6IEluIGZ1bmN0aW9u
ICd0ZnRwZF9wY3JlX29wZW4nOgo+IHRmdHBkX3BjcmUuYzoxMDk6Mzc6IGVycm9yOiBwYXNzaW5n
IGFyZ3VtZW50IDEgb2YgJ3BjcmUyX3N1YnN0cmluZ19saXN0X2ZyZWVfOCcgZnJvbSBpbmNvbXBh
dGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+ICAgMTA5
IHwgICAgICAgICAgIHBjcmUyX3N1YnN0cmluZ19saXN0X2ZyZWUoKGNvbnN0IFBDUkUyX1VDSEFS
ICoqKXN1YnN0cmxpc3QpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IFBDUkUyX1VDSEFSOCAqKiB7YWthIGNvbnN0IHVuc2ln
bmVkIGNoYXIgKip9Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHRmdHBkX3BjcmUuaDoyNCwKPiAg
ICAgICAgICAgICAgICAgIGZyb20gdGZ0cGRfcGNyZS5jOjM1Ogo+IC9ob21lL2F1dG9idWlsZC9h
dXRvYnVpbGQvaW5zdGFuY2UtMTAvb3V0cHV0LTEvaG9zdC9wb3dlcnBjNjRsZS1idWlsZHJvb3Qt
bGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvcGNyZTIuaDo5NDk6MTogbm90ZTogZXhwZWN0
ZWQgJ1BDUkUyX1VDSEFSOCAqKicge2FrYSAndW5zaWduZWQgY2hhciAqKid9IGJ1dCBhcmd1bWVu
dCBpcyBvZiB0eXBlICdjb25zdCBQQ1JFMl9VQ0hBUjggKionIHtha2EgJ2NvbnN0IHVuc2lnbmVk
IGNoYXIgKionfQo+ICAgOTQ5IHwgUENSRTJfVFlQRVNfU1RSVUNUVVJFU19BTkRfRlVOQ1RJT05T
Cj4gICAgICAgfCBeCj4KPiBGaXhlczogZmE5ZTU3NTc3NmVlM2QzZDQ3YTMxZmVlM2MwOWE5NDc1
M2M3N2NjNwo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzQ2NTY1
YzgzNGE4MTYyYTY1MTk0NDg4NTEwNDAyNzYxMGE2NWY5YzMKPgo+IFNpZ25lZC1vZmYtYnk6IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6
IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KCj4gLS0tCj4gIC4u
LnBkX3BjcmUuYy1maXgtYnVpbGQtd2l0aC1wY3JlMi0xMC40My5wYXRjaCB8IDQ1ICsrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvYXRmdHAvMDAwMS10ZnRwZF9wY3JlLmMtZml4LWJ1aWxkLXdp
dGgtcGNyZTItMTAuNDMucGF0Y2gKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2F0ZnRwLzAwMDEt
dGZ0cGRfcGNyZS5jLWZpeC1idWlsZC13aXRoLXBjcmUyLTEwLjQzLnBhdGNoIGIvcGFja2FnZS9h
dGZ0cC8wMDAxLXRmdHBkX3BjcmUuYy1maXgtYnVpbGQtd2l0aC1wY3JlMi0xMC40My5wYXRjaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjVkMTA5NzMwZAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2F0ZnRwLzAwMDEtdGZ0cGRfcGNyZS5jLWZpeC1i
dWlsZC13aXRoLXBjcmUyLTEwLjQzLnBhdGNoCj4gQEAgLTAsMCArMSw0NSBAQAo+ICtGcm9tIGU3
NWQ2NTZlMWUzNDY1ZGVhMWZkZjYwNWNiOGZlN2UyNTI4NmJkZDMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4gK0Zyb206IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tPgo+ICtEYXRlOiBTdW4sIDEyIE1heSAyMDI0IDE4OjI5OjA5ICswMjAwCj4gK1N1YmplY3Q6
IFtQQVRDSF0gdGZ0cGRfcGNyZS5jOiBmaXggYnVpbGQgd2l0aCBwY3JlMiA+PSAxMC40Mwo+ICsK
PiArRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSByYWlzZWQgc2luY2UgcGNyZTIgPj0g
MTAuNDMgYW5kCj4gK2h0dHBzOi8vZ2l0aHViLmNvbS9QQ1JFMlByb2plY3QvcGNyZTIvY29tbWl0
LzAxNGM4MmQ3YmNjMjg3M2NkYjFmM2FiYzVlNTM0ODU4N2Y0NzdiYTQ6Cj4gKwo+ICt0ZnRwZF9w
Y3JlLmM6IEluIGZ1bmN0aW9uICd0ZnRwZF9wY3JlX29wZW4nOgo+ICt0ZnRwZF9wY3JlLmM6MTA5
OjM3OiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAxIG9mICdwY3JlMl9zdWJzdHJpbmdfbGlzdF9m
cmVlXzgnIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdpbmNvbXBhdGlibGUtcG9p
bnRlci10eXBlc10KPiArICAxMDkgfCAgICAgICAgICAgcGNyZTJfc3Vic3RyaW5nX2xpc3RfZnJl
ZSgoY29uc3QgUENSRTJfVUNIQVIgKiopc3Vic3RybGlzdCk7Cj4gKyAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiArICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gKyAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgUENSRTJfVUNI
QVI4ICoqIHtha2EgY29uc3QgdW5zaWduZWQgY2hhciAqKn0KPiArSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIHRmdHBkX3BjcmUuaDoyNCwKPiArICAgICAgICAgICAgICAgICBmcm9tIHRmdHBkX3BjcmUu
YzozNToKPiArL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xMC9vdXRwdXQtMS9o
b3N0L3Bvd2VycGM2NGxlLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9w
Y3JlMi5oOjk0OToxOiBub3RlOiBleHBlY3RlZCAnUENSRTJfVUNIQVI4ICoqJyB7YWthICd1bnNp
Z25lZCBjaGFyICoqJ30gYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ2NvbnN0IFBDUkUyX1VDSEFS
OCAqKicge2FrYSAnY29uc3QgdW5zaWduZWQgY2hhciAqKid9Cj4gKyAgOTQ5IHwgUENSRTJfVFlQ
RVNfU1RSVUNUVVJFU19BTkRfRlVOQ1RJT05TCj4gKyAgICAgIHwgXgo+ICsKPiArRml4ZXM6Cj4g
KyAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzQ2NTY1YzgzNGE4MTYy
YTY1MTk0NDg4NTEwNDAyNzYxMGE2NWY5YzMKPiArCj4gK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICtVcHN0cmVhbTogaHR0cHM6
Ly9naXRodWIuY29tL21hZG1hcnRpbi9hdGZ0cC9wdWxsLzEKPiArLS0tCj4gKyB0ZnRwZF9wY3Jl
LmMgfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiArCj4gK2RpZmYgLS1naXQgYS90ZnRwZF9wY3JlLmMgYi90ZnRwZF9wY3JlLmMKPiAraW5k
ZXggMjRiMjc3MC4uN2IzZDBlMyAxMDA2NDQKPiArLS0tIGEvdGZ0cGRfcGNyZS5jCj4gKysrKyBi
L3RmdHBkX3BjcmUuYwo+ICtAQCAtMTA2LDcgKzEwNiw3IEBAIHRmdHBkX3BjcmVfc2VsZl90ICp0
ZnRwZF9wY3JlX29wZW4oY2hhciAqZmlsZW5hbWUpCj4gKyAgICAgICAgICAgICAgICBsb2dnZXIo
TE9HX0RFQlVHLCJmaWxlOiAlcyBsaW5lOiAlZCBzdWJzdHJpbmc6ICVkIHZhbHVlOiAlcyIsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgZmlsZW5hbWUsIGxpbmVjb3VudCwgc3VibnVtLCBzdWJz
dHJsaXN0W3N1Ym51bV0pOwo+ICsgICAgICAgICAgIH0KPiArLSAgICAgICAgICBwY3JlMl9zdWJz
dHJpbmdfbGlzdF9mcmVlKChjb25zdCBQQ1JFMl9VQ0hBUiAqKilzdWJzdHJsaXN0KTsKPiArKyAg
ICAgICAgICBwY3JlMl9zdWJzdHJpbmdfbGlzdF9mcmVlKHN1YnN0cmxpc3QpOwo+ICsKPiArICAg
ICAgICAgICBpZiAobWF0Y2hlcyAhPSAzKQo+ICsgICAgICAgICAgIHsKPiArLS0KPiArMi40My4w
Cj4gKwo+IC0tCj4gMi40My4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
