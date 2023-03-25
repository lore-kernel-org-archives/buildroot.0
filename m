Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DBCC76195
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 01:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B2FD41F69;
	Sat, 25 Mar 2023 01:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B2FD41F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0mzEfgdtlTs; Sat, 25 Mar 2023 01:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B32541BF0;
	Sat, 25 Mar 2023 01:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B32541BF0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5484E1BF2F2
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 01:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C26B41BF0
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 01:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C26B41BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F0HrmQHNhy56 for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 01:14:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CDC441BE9
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CDC441BE9
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 01:14:30 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id f23so2892281vsv.13
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 18:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679706870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VWm/mv51RZQC6GmFD7dL759cnMwIRylhJHhQVAMUU2s=;
 b=3uxEf9SsE3dI2Asn4pK1qJalT6MxgdOFKr+dGm5lp3EOM110JCz04NSeO9HEuSCJzR
 Cq8/wBHG6D7EspTg4wze5C55bMJoua0me98AXHXPx0UrAx1pp+E+aT1vBxKBjE/AhdHx
 YKMqJ2PNaZxCwftkaAgHZRF/dKT7uHPZhs8S4Vi0HKlEoEAS8Y0xqf70mrx3s2NLJNja
 mm9kOK+Az3TAP0e5QVw/eX7AenIClrpc0IUiZY6cEyyPWicICB4iKtVrQdbD2coS2d/s
 oaBPI1Ttl9e35uorwT4pQ+OcKvgyoMZCGiDFcp549y4rnrLCadhDP8IKYR14pbyniXqN
 JV5g==
X-Gm-Message-State: AAQBX9fC+HDuLqX/LhH3FhthKSQYU4fVk7g9Lu3jgmpmo3V0K3iAAzCH
 gtxoWYOIGdwGe21rfb/VsLHfqq0i3ZS01cr/AjI=
X-Google-Smtp-Source: AKy350bMd0Q0bk8bKxqyuC2M8N3NAFLwmwGeUxouBUG3TA50oACwpvTZuA5jG/4EkUjKAYdqraCXxktBuVf0k/psrU0=
X-Received: by 2002:a67:e019:0:b0:414:4ef3:839 with SMTP id
 c25-20020a67e019000000b004144ef30839mr2503302vsl.7.1679706869830; Fri, 24 Mar
 2023 18:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230322231511.551442-1-unixmania@gmail.com>
 <20230324111528.6fed9de7@windsurf>
In-Reply-To: <20230324111528.6fed9de7@windsurf>
From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 24 Mar 2023 22:14:18 -0300
Message-ID: <CAJ4jsadrHeiTbVE=2VaxFQOg+UKKPRqii3BqbRDkuDO9sUZjbg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679706870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWm/mv51RZQC6GmFD7dL759cnMwIRylhJHhQVAMUU2s=;
 b=acdcqcoFmI9TlZyr6bCXNS57t7fwtpLsvhrMaZIkVrlZvZ7oAL3f1nMi3Qc+kKHGG6
 a1wtagTRBaYxeVwoz3j6U9ASen20EkptgrXT6BYW08Q0qqzFJ51hnHVEFLvCngtzRP7q
 IyW5m1LefTfaCRaRv+BlSW4XzXPchywPoNGbtGV7OWfx5RwLqJo+bR8wq2noYJyojfJn
 aZ2091NK5OOpxfE5Z8vft3qiJd/2GMhTE69sTJgQoU3OA4dw4ubpw8RzSn4WAN+k8ijV
 Happl0jfGXHwEOABCn3YMStAQ8DTr0OBvhNv1ZrJCNDkofcWO8w8HJhCmENy8lkJbciR
 kM3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=acdcqcoF
Subject: Re: [Buildroot] [PATCH] package/qemu: allow building only the guest
 agent
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgNzoxNeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAyMiBNYXIgMjAyMyAy
MDoxNToxMSAtMDMwMAo+IHVuaXhtYW5pYUBnbWFpbC5jb20gd3JvdGU6Cj4KPiA+IC0gICAgIHNl
bGVjdCBCUjJfUEFDS0FHRV9RRU1VX1RPT0xTIGlmICFCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSAm
JiAhQlIyX1BBQ0tBR0VfUUVNVV9MSU5VWF9VU0VSCj4KPiBJcyB0aGUgYnVpbGQgd29ya2luZyBP
SyBpZiBuZWl0aGVyIHRoZSB0b29scywgbm9yIHFlbXUtc3lzdGVtLCBub3IKPiBxZW11LXVzZXIg
bm9yIHFlbXUtcWEgYXJlIGVuYWJsZWQ/Cj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAtLQo+IFRo
b21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5j
b20KClllcy4gSXQganVzdCBkb2VzIG5vdCBpbnN0YWxsIGFueXRoaW5nIHVzZWZ1bDoKCiQgY2F0
IGJ1aWxkL3FlbXUtNy4yLjAvLmZpbGVzLWxpc3QudHh0CnFlbXUsLi91c3Ivc2hhcmUvcWVtdS9r
ZXltYXBzL3NsCnFlbXUsLi91c3Ivc2hhcmUvcWVtdS9rZXltYXBzL3N2CnFlbXUsLi91c3IvaW5j
bHVkZS9xZW11LXBsdWdpbi5oCnFlbXUsLi91c3Ivc2hhcmUvcWVtdS9rZXltYXBzL2FyCnFlbXUs
Li91c3Ivc2hhcmUvcWVtdS9rZXltYXBzL2JlcG8KcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1h
cHMvY3oKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvZGEKcWVtdSwuL3Vzci9zaGFyZS9x
ZW11L2tleW1hcHMvZGUKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvZGUtY2gKcWVtdSwu
L3Vzci9zaGFyZS9xZW11L2tleW1hcHMvZW4tZ2IKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1h
cHMvZW4tdXMKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvZXMKcWVtdSwuL3Vzci9zaGFy
ZS9xZW11L2tleW1hcHMvZXQKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvZmkKcWVtdSwu
L3Vzci9zaGFyZS9xZW11L2tleW1hcHMvZm8KcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMv
ZnIKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvZnItYmUKcWVtdSwuL3Vzci9zaGFyZS9x
ZW11L2tleW1hcHMvZnItY2EKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvZnItY2gKcWVt
dSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvaHIKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1h
cHMvaHUKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvaXMKcWVtdSwuL3Vzci9zaGFyZS9x
ZW11L2tleW1hcHMvaXQKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvamEKcWVtdSwuL3Vz
ci9zaGFyZS9xZW11L2tleW1hcHMvbHYKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvbHQK
cWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvbWsKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tl
eW1hcHMvbmwKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvbm8KcWVtdSwuL3Vzci9zaGFy
ZS9xZW11L2tleW1hcHMvcGwKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvcHQKcWVtdSwu
L3Vzci9zaGFyZS9xZW11L2tleW1hcHMvcHQtYnIKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1h
cHMvcnUKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvdGgKcWVtdSwuL3Vzci9zaGFyZS9x
ZW11L3RyYWNlLWV2ZW50cy1hbGwKcWVtdSwuL3Vzci9zaGFyZS9xZW11L2tleW1hcHMvdHIKClRo
ZSBrZXltYXBzIHNob3VsZCBub3QgYmUgaW5zdGFsbGVkIGlmIG5vIHFlbXUtc3lzdGVtIGlzIGJ1
aWx0LiBJCmFscmVhZHkgc2VudCBhIHBhdGNoIHVwc3RyZWFtIGF0dGVtcHRpbmcgdG8gZml4IHRo
ZSBwcm9ibGVtIGJ1dCB0aGUKcHJvYmxlbSBpcyBzdGlsbCB0aGVyZToKCmh0dHBzOi8vbGlzdHMu
Z251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIzLTAxL21zZzAwMDg0Lmh0bWwKCkkg
YWxzbyBoYXZlIGEgcGF0Y2ggdG8gaW5zdGFsbCB0cmFjZS1ldmVudHMtYWxsIG9ubHkgaWYgbmVj
ZXNzYXJ5LgpVbmZvcnR1bmF0ZWx5LCBtYWtpbmcgdGhlc2UgY2hhbmdlcyBoYXBwZW4gaW4gcWVt
dSB0YWtlcyBhIGxvbmcgdGltZS4KCi0tIApDYXJsb3MgU2FudG9zIDx1bml4bWFuaWFAZ21haWwu
Y29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
