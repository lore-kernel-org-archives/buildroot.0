Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F9DC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:55:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049446102A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 049446102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB78C60699;
	Tue, 17 Aug 2021 21:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSxdApxlneQ0; Tue, 17 Aug 2021 21:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44221606DF;
	Tue, 17 Aug 2021 21:55:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1C21BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DEEB402AC
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EfiNtsgBW37 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 427C7402A9
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:55:40 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q21so1236065ljj.6
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ihdu/eGnDW9YJPyUomlztt9qNAzMt6pGpqDJxAqxqnY=;
 b=UikOBF4Ljo365uGT8xziVtMgz7tMgmfYJ7pc3J95jSuovTM+oKSqQkUsbVAzC5lIOL
 asnvncequHOCKP+LH42V+wjaO7Riu9ho9eTfEzUIb1d+DTcqrYyschTpAQc7r+SarEan
 0P6dctRClflnJxEP/GTajT6m5b5IqmSd6NDJpL1bUL7JYvM4pMHS+0YQCOw2+PEbabUJ
 icDw0FzhIEGi74nzdgzKztGHb7CGL9CQlcLarZbHY/6FEfNXMpz0/q+mRMH0qZPYupUY
 hS1GNAPNZd3HPHkFWyljK0VEfITOLfwQLlckKlTPYmnmOmC/Loc91Qxj4elE/N1/ygO/
 HFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ihdu/eGnDW9YJPyUomlztt9qNAzMt6pGpqDJxAqxqnY=;
 b=MwL4bUUrYtN5BHtNXDiycq9/2rBBR9GyE17DaqqVsmiXeNdAcmnzBFf5o6Pvhwdmy7
 T7tb3CszWHWAxY2uFdOccRZV8oVX0XTSM2tYF5hYtH1eau6XJgy5eB4UbCKVWdWR+zul
 3YjS9iOqgfmhWWlWnnrHqwp32c9oCFL4lu6pBtQKGgv1zzZSZPtNwWwmj0LugoOJ4R/f
 FiwLEbt+v5TRIhnQRHB3BTnIueBx46N09ycWGEFO9jzKN02irBpc7fm2Sc8IaC7YjpjG
 Pl4FydcSU08lPelnRnT6C3/TELhmr0+/riiV20wcRpO4DjrzMYmeTfNDMLP1s7V0syrB
 Qusg==
X-Gm-Message-State: AOAM532sSPIja1NGnx799zVTq7otXPymq5e6HbJ89fOOfzqvg0wyVuXl
 FRppVlti6R63TaB5Syd+t9kbCUzPjyfwwTR6V6Q=
X-Google-Smtp-Source: ABdhPJw+XOf/ZuocFYNFUbAFgaRGeERXZXfOVS+nuui//wgPmjA43lBOesbaaRjzVyIeoKhzFj0Qm/h/uOE9tX0Aa3w=
X-Received: by 2002:a05:651c:39c:: with SMTP id
 e28mr4919532ljp.498.1629237338222; 
 Tue, 17 Aug 2021 14:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210816065458.1726927-1-fontaine.fabrice@gmail.com>
 <20210817210213.GX27036@scaer>
In-Reply-To: <20210817210213.GX27036@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Aug 2021 23:55:27 +0200
Message-ID: <CAPi7W815HbP04Exnor7NsoXijP4c-kNfN0HgWf3K+utddf9LWg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: disable with libressl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?B?QW5kcsOpIFp3aW5n?= <nerv@dawncrow.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

WWFubiwKCkxlIG1hci4gMTcgYW/Du3QgMjAyMSDDoCAyMzowMiwgWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEZhYnJpY2UsIEFsbCwKPgo+IE9u
IDIwMjEtMDgtMTYgMDg6NTQgKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+
ID4gbGlia3JiNSBkb2VzIG5vdCBidWlsZCB3aXRoIGxpYnJlc3NsIHNpbmNlIGNvbW1pdAo+ID4g
YjdhNWI5ZDA2ZDQ4NDcwMGZjNGZjYmQzNTRmMmMxNWUwNDIyNjg4YyBhbmQgdXBzdHJlYW0gaXMg
bm90IGludGVyZXN0ZWQKPiA+IGluIGZpeGluZyB0aGlzIGlzc3VlIGFzIGEgUFIgaXMgb3BlbmVk
IGZvciBtb3JlIHRoYW4gNCB5ZWFycwo+ID4gKGh0dHBzOi8vZ2l0aHViLmNvbS9rcmI1L2tyYjUv
cHVsbC82MDcpOgo+ID4KPiA+IHBraW5pdF9jcnlwdG9fb3BlbnNzbC5jOiBJbiBmdW5jdGlvbiAn
Y21zX3NpZ25lZGRhdGFfdmVyaWZ5JzoKPiA+IHBraW5pdF9jcnlwdG9fb3BlbnNzbC5jOjE3MDA6
MjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnT0JKX2dldDBfZGF0
YSc7IGRpZCB5b3UgbWVhbiAnQklPX2dldF9kYXRhJz8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb25dCj4gPiAgMTcwMCB8ICAgICAgICAgcHJpbnRfYnVmZmVyKE9CSl9nZXQw
X2RhdGEoZXR5cGUpLCBPQkpfbGVuZ3RoKGV0eXBlKSk7Cj4gPiAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
QklPX2dldF9kYXRhCj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvcmVzdWx0cy9lNjIzZjRlMWQ2YjYwMDRlOTg4MTViOGI3ZGEzOTM4MjM4ODkwYmQ4
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5tayB8IDIg
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJrcmI1L2xpYmtyYjUubWsgYi9wYWNrYWdlL2xp
YmtyYjUvbGlia3JiNS5tawo+ID4gaW5kZXggODlmMjE5ZDkxMy4uNWIzMGZiYmEyYyAxMDA2NDQK
PiA+IC0tLSBhL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rCj4gPiArKysgYi9wYWNrYWdlL2xp
YmtyYjUvbGlia3JiNS5tawo+ID4gQEAgLTQxLDcgKzQxLDcgQEAgZWxzZQo+ID4gIExJQktSQjVf
Q09ORl9PUFRTICs9IC0td2l0aG91dC1sZGFwCj4gPiAgZW5kaWYKPiA+Cj4gPiAtaWZlcSAoJChC
UjJfUEFDS0FHRV9PUEVOU1NMKSx5KQo+ID4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCT1BFTlNT
TCkseSkKPgo+IERvbid0IGZvcmdldCB0aGF0IGFuIG9wZW5zc2wgcHJvdmlkZXIgY2FuIGJlIHBy
b3ZpZGVkIGJ5IGEgYnIyLWV4dGVybmFsCj4gdHJlZS4gSWYgd2UgZm9yY2UgdGhlIGNvbmRpdGlv
biB0byBCUjJfUEFDS0FHRV9MSUJPUEVOU1NMLCB0aGVuIGl0Cj4gcHJldmVudHMgYW55IHN1Y2gg
cHJvdmlkZXIgdG8gYmUgdXNlZC4KSSdtIG5vdCBhZ2FpbnN0IHRoaXMgc29sdXRpb24gYnV0IHRo
ZW4gc2hvdWxkIHdlIHVwZGF0ZSB0aGUgNiBvdGhlcgpwYWNrYWdlcyB0aGF0IGhhdmUgdGhlIHNh
bWUgQlIyX1BBQ0tBR0VfTElCT1BFTlNTTCBjb25kaXRpb24gOgpob3N0YXBkLCBsaWJwanNpcCwg
b3B0ZWUtdGVzdCwgcmVkaXMsIHVzYmd1YXJkIGFuZCB3cGFfc3VwcGxpY2FudD8KPgo+IFNvLCBJ
IHRoaW5rIHRoZSBiZXN0IHNvbHV0aW9uIGlzIHRvIGV4Y2x1ZGUgbGlicmVzc2wsIHJhdGhlciB0
aGFuIGxpbWl0Cj4gdG8gbGlib3BlbnNzbC4gSSd2ZSB0cmllZCB0byBjb21lIHVwIHdpdGggYSBz
aW1wbGUgY29uZGl0aW9uYWwgYmxvY2s6Cj4KPiAgICAgIyBBbiBvcGVuc3NsIHByb3ZpZGVyIGlz
IG5lZWRlZCwgYnV0IGxpYnJlc3NsIGlzIG5vIG1hdGNoLgo+ICAgICAjIEEgcHJvdmlkZXIgZnJv
bSBhIGJyMi1leHRlcm5hbCBpcyBzdXBwb3NlZCB0byBtYXRjaC4KPiAgICAgaWZlcSAoJChCUjJf
UEFDS0FHRV9PUEVOU1NMKSx5KQo+ICAgICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQlJFU1NMKSwp
Cj4gICAgIExJQktSQjVfU1NMID0geQo+ICAgICBlbmRpZgo+ICAgICBlbmRpZgo+ICAgICBpZmVx
ICgkKExJQktSQjVfU1NMKSx5KQo+ICAgICBMSUJLUkI1X0RFUEVOREVOQ0lFUyArPSBvcGVuc3Ns
Cj4gICAgIExJQktSQjVfQ09ORl9PUFRTICs9IFwKPiAgICAgICAgIC0tZW5hYmxlLXBraW5pdCBc
Cj4gICAgICAgICAuLi4KPiAgICAgZW5kaWYKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
Pgo+ID4gIExJQktSQjVfQ09ORl9PUFRTICs9IFwKPiA+ICAgICAgIC0tZW5hYmxlLXBraW5pdCBc
Cj4gPiAgICAgICAtLXdpdGgtY3J5cHRvLWltcGw9b3BlbnNzbCBcCj4gPiAtLQo+ID4gMi4zMC4y
Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+ID4g
aHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAt
LQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpCZXN0IFJlZ2FyZHMs
CgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
