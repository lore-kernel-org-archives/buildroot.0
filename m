Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E062DCD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 22:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC293608FE;
	Wed, 13 May 2026 22:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v5s6FR8YsH1; Wed, 13 May 2026 22:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A330760901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778710191;
	bh=1vCwZRw6uEk7cAXQ7v1IYieJ4GWlprMQlhrtB2cpEJs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikOM7SK7IvJP6qcxQzhUx5m/BgwRyOZ6/JLp+bOFL6tSiGgNFqHjQJGg5UxNv6zv5
	 9yP+Qq7It7zZZxVapHZqF095dfKs6eTj8sDoio3YCIEvYWmz36C3eUiDnl8qFfkt4i
	 v7wwPE4dXoRjCR22pe8i/kKIl/vpU/rfId4v6xYop63PtUf2NoPNxO+cu+vEbvhtYS
	 sC/kVhE8eSaU7pDV0S6ewnOX+t/oiOgASHpTqgILvbLN2nB3/GQ99I4oS72DFYi26X
	 bwis68193R3ZcsQPSUDUvG90g6jg11NNbHL4xRaUqFYufoT+yabyOAEgqS48dOCRhV
	 8KVwgbe6DcTJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A330760901;
	Wed, 13 May 2026 22:09:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8CE9270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 22:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEC76608FE
 for <buildroot@buildroot.org>; Wed, 13 May 2026 22:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNvdLGTJopKl for <buildroot@buildroot.org>;
 Wed, 13 May 2026 22:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD50A608FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD50A608FD
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD50A608FD
 for <buildroot@buildroot.org>; Wed, 13 May 2026 22:09:49 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-439e724a62bso562837fac.1
 for <buildroot@buildroot.org>; Wed, 13 May 2026 15:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778710188; cv=none;
 d=google.com; s=arc-20240605;
 b=fMBKpm/7PghcW5XzFmCIN99E0XnDtllomXSI0TeLbws2fiJmJ3v+Z0AzNgf2TDHIEV
 93dt0AUGZb2+3TIGMe199+4J4svQipLKDWXZjGODkdKq+UjqqbwII4plFmg8Bmg+h5eW
 63fM4AdFVMqvSiIor5mAjnY3/Dj4Fnd4HunmhIob1iMvBZ3F7qvCwEDJHntZgV32kJyc
 MSz6JntHs6gYzNyP2Kxyxh/C2eXeYWpuUq5jjX+5vbn1gSJ6x3UFyUD33hMeeY18NFRf
 ABJ0utcvAOaYr+3t5yqa4AY+Z+SvPOKunjAsYCp1gDuQYE9AWAHjiYnhaXiX/dxYlfi5
 Djmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QTgb1Ny/dfyRewMxSHAdyu1GogSwVFBlxS1lpy6rLTo=;
 fh=vqI4HZAeDLA61/B+Lw/9MOP6+wMkwdbrtiLhDiBqY2w=;
 b=czQXFlPKapvtN+6Clj2WD1XervPHxQYCLt1bugxnkKmoZfJkz5hBqie5PnGysohANb
 UuxtPhgaYyf5a/9DPqSWoBLZB9ro8kNarH4Fr5Qq+yy1lYqxRhevxYCykkGt0a4hHrPv
 k35YwV1DQvxVq9etraGvmf2NUSkWXu2OoR7CdJyF/p6/MlUl+2UxE2dW1SRV+DbBKmLA
 93kVeBUJFhj/GkWz50quUKDokFNsUT41123KeFVuqcP85T6TVV8zZj884baoi4f82CoZ
 HX9QnrBkpCDJsEh6ErR7YlgJFDiJllvgSKhdeo4bKmYYbX3ljxnVJYekpm6+6IFhxywc
 jQFQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778710188; x=1779314988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QTgb1Ny/dfyRewMxSHAdyu1GogSwVFBlxS1lpy6rLTo=;
 b=ce+A8QV4Blc+nb5Rrh4ApeJr0TR5ZSSgfMiOuBRN0MOEXXqKzboYbZfRj8Ezw5VwSN
 k/As7/hpzO6Abcq1xpwpRlr7YwAEelusJH31MXTLn5JcyirL8WXE4Tm2SzvAPkYQjPgc
 SSp6kvcXYhAnmNagTBM5kKUMnEaYec6shlVXFaXXApZ7JKmR4fkaxwo1Kr03hfH4s9yo
 Y+G+tiovFZWBsLoqwQu0cZUflxagotS0iinTSt7lGt/1/fQuQF96SmvDXPQl5WS1syyJ
 ZH5uQ+z/9Jc2UDdpugfOCunh4v4+9qSUmPqNjhMg3Wp0g7bn9HmyH2/WEG43wbEgtfmd
 JxcA==
X-Gm-Message-State: AOJu0Yy5qFJEROmYAk2jMKKTj5mDFQyHbtGrMMZuXkr8HI743CUPuHYg
 MAfrKmC0vjoZ7PDHvS+wCpJB2YAAa17YM1NmBp6XWGM7kT+NbAVSdzjzJD736B3SGhPcQ9VR23w
 N1O+pAGhc5HVfOPcmXK0wVPqipscmsAc=
X-Gm-Gg: Acq92OH+22ok71vYji1ynXsjztabalcgChDnys8i5chjofu4SCM8kUqx5eR4BsMwp+D
 Xzdv4iNS6/2qED1pZkx+m095udL/x9vUXGEuoXYRvWR49t3f8MWdKz0u1aCjOIj3BI/M7jVOnVu
 Hq6QVySWMpD72IPUa0Qmb7JAHZUxbumKIzmwOUl2RMXAYlLEw6XO0r+Tgww7E6M4sG0eTyzzYus
 GMBqzgZVgluleV4J/71wL20Gq0kTNruQ7w14hENu2+jayY41Y1TENt0Q9qpniD58mKKB/uVRvhh
 eBCidKFudlM6OMw=
X-Received: by 2002:a05:6820:4b18:b0:696:23f5:7702 with SMTP id
 006d021491bc7-69b78e539a3mr2958017eaf.60.1778710188528; Wed, 13 May 2026
 15:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-5-1806e588eb59@gmail.com>
 <5bd5971c-17c5-4ebb-85d3-3944efb39a7c@smile.fr>
 <CAMWSM7gneUcaExHXk5=O0TwwUUXGpX=c_jdFNB_=TNS5UMJU+g@mail.gmail.com>
 <8635728b-ccae-4c74-ac6c-eda4f18ff78a@smile.fr>
In-Reply-To: <8635728b-ccae-4c74-ac6c-eda4f18ff78a@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 13 May 2026 15:09:11 -0700
X-Gm-Features: AVHnY4IBGg24hzM415fQRIixpjHsH9Q02uM0z-HDQ8glZzdXJiYhvg9Q3IeZUIw
Message-ID: <CAMWSM7ihij6ZsYNv9j9tUyyfGS__MgdASGezGV+PPk==XxvTbQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778710188; x=1779314988; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTgb1Ny/dfyRewMxSHAdyu1GogSwVFBlxS1lpy6rLTo=;
 b=qYxgQ/WwtKNdZmd6lvq8pgw5CNv7yXBi3MDttOyVlADy/5PjTW/V9DcMZh31er9wiS
 ujn/FTTnSBZZN8oXSA9d6jWJa71xPtqNV6wwUj8GlhhJmB6Lr6N+Af23uMAiqadAc0/q
 PSjWt+Q63uXB+WDlFm6hI1Jhi9aYeCaisRx/JLAxyBguE7k53kIGsBOM5wi4M/8DMamz
 HS9ba/4ma4v3nzDRSz/Cd5Zu6OPam2pZWQ1VNob+etV/H7mkjb/OUhy5Bj+kV3MzNyAT
 yFNan3fQWPUD/PK3xNRJI4zD/AnZFlQcovrueBwj+jH89wH5ox5wAnst+wHSlRr7JLQk
 KqhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qYxgQ/Ww
Subject: Re: [Buildroot] [PATCH RESEND v5 5/5] package/qemu: add
 virglrenderer support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjowNOKAr1BNIFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IFRoYW5rcyBmb3IgdGhlIGV4
cGxhbmF0aW9uIQo+Cj4gU29ycnkgSSdtIG5vdCBmYW1pbGlhciB3aXRoIHZpcnRpby1ncHUgLyB2
aXJnbCBzdGFjayAoYXQgbGFzdCBJIGhhdmUgYSBiZXR0ZXIKPiB1bmRlcnN0YW5kaW5nIHRoYW5r
cyB0byB5b3VyIHBhdGNoIHNlcmllcykKCk5vIHByb2JsZW0sIHRoaXMgaXMgYSBmYXN0LWV2b2x2
aW5nIGFuZCBmYXNjaW5hdGluZyBmYWNldCBvZiBhbgphbHJlYWR5IGNvbXBsZXggbmljaGUuIEl0
J3MgdGFrZW4gbWUgc29tZSB0aW1lIHRvIHdyYXAgbXkgb3duIGJyYWluCmFyb3VuZCBpdC4KCj4g
Pgo+ID4gWW91IGZvbGxvd2VkIHVwIHdoaWxlIEkgd2FzIGRyYWZ0aW5nIG15IG93biByZXBseS4g
OikKPiA+Cj4gPiBPbiBXZWQsIE1heSAxMywgMjAyNiBhdCAxMTowNuKAr0FNIFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPiA+Pgo+ID4+IE9rIEkgZ2V0IGl0LCBi
dWlsZGluZyBsaWJlcG94eSB3aXRob3V0IGVnbCBvciBnbCBkZXBlbmRlbmN5IG1ha2VzIHNlbnMg
d2hpbGUKPiA+PiBidWlsZGluZyB3aXRoIG9ubHkgdmVudXMgKHZ1bGthbikuIGxpYmVwb3h5IGlz
IGEgbWFuZGF0b3J5IGRlcGVuZGVuY3kgb2YKPiA+PiB2aXJnbHJlbmRlcmVyIGV2ZW4gaWYgb25s
eSB2ZW51cyAodnVsa2FuKSBpcyBlbmFibGVkIGluIHRoZSBkZWZjb25maWcuCj4gPj4KPiA+PiBU
aGUgQlIyX1BBQ0tBR0VfVklSR0xSRU5ERVJFUl9WRU5VUyBvcHRpb24gaXMgbm90IHVzZWQgYnkg
UWVtdSBidXQgY291bGQgYmUgdXNlZAo+ID4+IGluIGJ5IGFub3RoZXIgcGFja2FnZSBvciBkZWZj
b25maWcuCj4gPgo+ID4gRXhhY3RseSwgdmlyZ2xyZW5kZXJlciBhbHdheXMgZGVwZW5kcyBvbiBs
aWJlcG94eSwgd2hpY2ggY2FuIGJlIGJ1aWx0Cj4gPiB3aXRob3V0IEdML0VHTC4gV2UgbWF5IHdh
bnQgdG8gYnVpbGQgdmlyZ2xyZW5kZXJlciB3aXRoIFZlbnVzIGFuZC9vcgo+ID4gRFJNIHN1cHBv
cnQsIHdoaWNoIHdvdWxkIGVuYWJsZSBndWVzdHMgdG8gZG8gY29tcHV0ZS9yZW5kZXJpbmcgZWl0
aGVyCj4gPiBoZWFkbGVzcywgb3IgZm9yIGRpc3BsYXkgb24gdGhlIGhvc3QgdGhyb3VnaCBWdWxr
YW4uCj4gPgo+ID4gVGhlIHZpcmdscmVuZGVyZXIgcGFja2FnZSBkZWZhdWx0cyBWaXJHTCBzdXBw
b3J0IHRvIHkgd2hlbiBsaWJHTCBpcwo+ID4gcHJlc2VudC4gVGhpcyBpcyB0aGUgY2FzZSB3aGVu
IHdlIHNlbGVjdCB2aXJnbHJlbmRlcmVyIHN1cHBvcnQgaW4KPiA+IHFlbXUsIGFzIGV4cGxhaW5l
ZCBhYm92ZS4KPgo+IFllcyBidXQgZXZlbiBpZiBpdCdzIHRoZSBkZWZhdWx0LCBCUjJfUEFDS0FH
RV9RRU1VX1ZJUkdMUkVOREVSRVIgb3B0aW9uIHNob3VsZAo+IHNlbGVjdCBCUjJfUEFDS0FHRV9W
SVJHTFJFTkRFUkVSX1ZJUkdMLiBCUjJfUEFDS0FHRV9WSVJHTFJFTkRFUkVSX1ZJUkdMIGNhbgo+
IHN0aWxsIGJlIGRpc2FibGVkIGZyb20gbWVudWNvbmZpZy4KPgo+IFdoYXQgaGFwcGVuIGlmIEJS
Ml9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUiBpcyBzZWxlY3RlZCBhbmQKPiBCUjJfUEFDS0FH
RV9WSVJHTFJFTkRFUkVSX1ZJUkdMIGRpc2FibGVkPwo+CgpWaXJHTCAtPiBHcmFwaGljcyBBUEkt
bGV2ZWwgbWVkaWF0ZWQgT3BlbkdMClZlbnVzIC0+IEdyYXBoaWNzIEFQSS1sZXZlbCBtZWRpYXRl
ZCBWdWxrYW4KSG9zdCBuYXRpdmUgY29udGV4dCAtPiBtZWRpYXRlZCBrZXJuZWwgRFJNIHVBUEkK
CldoZW4gVmlyR0wgaXMgZW5hYmxlZCBpbiB2aXJnbHJlbmRlcmVyLCBNZXNhIGluIHRoZSBndWVz
dCB1c2VzIGEgdmlyZ2wKVU1EIHRvIGV4cG9zZSBhbiBPcGVuR0wgQVBJIHRvIGd1ZXN0IGFwcGxp
Y2F0aW9ucywgYW5kIG9uIHRoZSBiYWNrZW5kCmNvbnZlcnRzIHRob3NlIEFQSSBjYWxscyB0byBh
IGdhbGxpdW0tbGlrZSBjb21tYW5kIHN0cmVhbSB0aGF0J3MKZm9yd2FyZGVkIG92ZXIgdmlydGlv
LWdwdSB0byB0aGUgaG9zdCBmb3IgZXhlY3V0aW9uIHVzaW5nIHRoZSBuYXRpdmUKVU1ELiBWZW51
cyBpcyBzaW1pbGFyLCBidXQgZm9yIFZ1bGthbi4gQm90aCBvZiB0aGVzZSBhcmUgdmVyeQpwb3J0
YWJsZSwgYXMgdGhleSBvbmx5IHJlcXVpcmUgdGhlIGhvc3QgdG8gaGF2ZSBhIGdyYXBoaWNzIHN0
YWNrIHRoYXQKc3VwcG9ydHMgdGhlc2UgQVBJcy4gVXNlcnMgY291bGQgYWxzbyBlbmFibGUgb25s
eSBWZW51cyBhbmQgc3RpbGwgaGF2ZQpHTCBzdXBwb3J0IGluIHRoZSBndWVzdCwgZS5nLiB1c2lu
ZyBaaW5rIFswXSwgd2hpY2ggaW1wbGVtZW50cyBHTCBvbgp0b3Agb2YgVnVsa2FuLgoKVGhlIGhv
c3QgbmF0aXZlIGNvbnRleHQgYmFja2VuZCBwcm92aWRlcyBtZWRpYXRlZCBhY2Nlc3MgdG8gdGhl
IGhvc3QKa2VybmVsJ3MgRFJNIHVBUEkuIFdoZW4gZW5hYmxlZCBmb3Igc3VwcG9ydGVkIGhhcmR3
YXJlLCB0aGUgbmF0aXZlIFVNRApydW5zIGluIHRoZSBndWVzdCwgYW5kIHRoZSBEUk0gY29tbWFu
ZHMgYXJlIGZvcndhcmRlZCB0byB0aGUgaG9zdAprZXJuZWwuIFRoaXMgYWxsb3dzLCBlLmcuLCBy
dW5uaW5nIHJhZGVvbnNpIGFuZCByYWR2IGRyaXZlcnMgZm9yIEdMCmFuZCBWdWxrYW4gcmVzcGVj
dGl2ZWx5IG9uIEFNRCBoYXJkd2FyZSBpbnNpZGUgYSB2aXJ0dWFsIG1hY2hpbmUsIG9uCnRvcCBv
ZiBlbmFibGluZyBmZWF0dXJlcyBsaWtlIGhhcmR3YXJlLWFjY2VsZXJhdGVkIHZpZGVvIGRlY29k
ZSBpbgpndWVzdHMuIEhvc3QgbmF0aXZlIGNvbnRleHQgaGFzIHRoZSBsb3dlc3Qgb3ZlcmhlYWQs
IGJlY2F1c2UgcmF0aGVyCnRoYW4gZW11bGF0aW5nIGEgR1BVLCB0aGUgZ3Vlc3QganVzdCB1c2Vz
IHRoZSBEUk0gdUFQSSBwcm94aWVkIG92ZXIKdmlydGlvLWdwdS4gSG93ZXZlciwgaXQgcmVxdWly
ZXMgc21hbGwgbW9kaWZpY2F0aW9ucyB0byB0aGUgTWVzYSBVTUQKYW5kIHZpcmdscmVuZGVyZXIg
Zm9yIGVhY2ggZHJpdmVyLCBzbyBpdCdzIG5vdCBhcyB3aWRlbHkgc3VwcG9ydGVkLgoKVG8gYW5z
d2VyIHlvdXIgcXVlc3Rpb24gc3VjY2luY3RseSwgc2VsZWN0aW5nIHZpcmdscmVuZGVyZXIgd2l0
aG91dAp2aXJnbCBzdGlsbCBsZWF2ZXMgVmVudXMgYW5kIERSTSBkcml2ZXJzLCBhbmQgYW55IGNv
bWJpbmF0aW9uIG9mIHRoZXNlCmNhbiBwcm92aWRlIHRoZSBndWVzdCB3aXRoIGdyYXBoaWNzIGFu
ZCBjb21wdXRlIGNhcGFiaWxpdGllcy4gQnVpbGRpbmcKdmlyZ2xyZW5kZXJlciB3aXRob3V0IHZp
cmdsLCB2ZW51cywgb3IgRFJNIHByb2JhYmx5ICg/KSByZXN1bHRzIGluIGEKcWVtdSBidWlsZCB0
aGF0IHdvcmtzIGFzIGV4cGVjdGVkLCBidXQgbGFja3MgZ3JhcGhpY3MvY29tcHV0ZSBmb3IKZ3Vl
c3RzLgoKV2UgdHVybiBvbiBWaXJHTCBieSBkZWZhdWx0IHdoZW4gdGhlIGhvc3QgaGFzIGxpYkdM
LCBhbmQgbGlrZXdpc2UgdHVybgpvbiBWZW51cyBieSBkZWZhdWx0IHdoZW4gYSBtZXNhIFZ1bGth
biBkcml2ZXIgaXMgZW5hYmxlZC4gV2UgYWxzbyB0dXJuCm9uIERSTSBiYWNrZW5kcyBieSBkZWZh
dWx0IHdoZW4gdGhlaXIgY29ycmVzcG9uZGluZyBVTURzIGFyZSBzZWxlY3RlZCwKbW9yZSBvbiB0
aGF0IGJlbG93LgoKPiA+Cj4gPiBQZXJoYXBzIHdlIGNvdWxkIGNsYXJpZnkgdGhpcyBieSBleHBh
bmRpbmcgdGhlIGhlbHAgbWVzc2FnZSB1bmRlcgo+ID4gcWVtdSdzIHZpcmdscmVuZGVyZXIgY29u
ZmlnIHRvIGV4cGxhaW4gdGhhdCB2aXJnbHJlbmRlcmVyIGl0c2VsZiBoYXMKPiA+IGFkZGl0aW9u
YWwgb3B0aW9ucy4KPgo+IEZpcnN0LCB3ZSBzaG91bGQgaW1wcm92ZSB0aGUgbGliZXBveHkgaGVs
cCB0ZXh0IHRvIGV4cGxhaW4gd2h5IGl0J3MgZmluZSB0byB1c2UKPiBsaWJlcG94eSB3aXRob3V0
IEVHTCBhbmQgR0wuCgpUaGF0J3MgYSByZWFzb25hYmxlIG5leHQgc3RlcC4KCj4gVGhlbiwgQlIy
X1BBQ0tBR0VfUUVNVV9WSVJHTFJFTkRFUkVSIHNob3VsZCBub3Qgb25seSBzZWxlY3QKPiBCUjJf
UEFDS0FHRV9WSVJHTFJFTkRFUkVSIHdpdGhvdXQgZW5hYmxpbmcgYW55IHN1Ym9wdGlvbi4KPgoK
VGhpcyBpcyBhIGJpdCB0cmlja3kuIEVhcmxpZXIgdmVyc2lvbnMgaW4gdGhpcyBzZXJpZXMgYXR0
ZW1wdGVkIHRvCmltcGxpY2l0bHkgZW5hYmxlIHZpcmdscmVuZGVyZXIgRFJNIGJhY2tlbmRzIGJh
c2VkIG9uIHRoZSBwcmVzZW5jZSBvZgphIE1lc2EgVU1ELCB0aGUgY29uc3VtZXIgb2YgdGhlIERS
TSBBUEkuIFNvIGlmIHdlIGhhZApCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfUkFE
RU9OU0kgb3IKQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfQU1ELCB3ZSB3b3VsZCBl
bmFibGUgdGhlIGFtZGdwdSBEUk0KYmFja2VuZCBpbiB2aXJnbHJlbmRlcmVyLgoKVGhlIGluaXRp
YWwgYXNzdW1wdGlvbiB3YXMgdGhhdCBoYXZpbmcgdGhlc2UgVU1EcyBlbmFibGVkIGltcGxpZXMg
d2UKYWxzbyBoYXZlIHRoZSBjb3JyZXNwb25kaW5nIEtNRC4gSG93ZXZlciwgSSByZWFsaXplZCB0
aGF0IGFub3RoZXIgdmVyeQp2YWxpZCBjb25maWcgaXMgdG8gaGF2ZSBubyBVTUQgZW5hYmxlZCBv
biB0aGUgaG9zdCwgaW4gd2hpY2ggY2FzZSB3ZQpuZWVkIGFuIGV4cGxpY2l0IGNvbmZpZyB0byBl
bmFibGUgdGhlIERSTSBiYWNrZW5kIGZvciB2aXJnbHJlbmRlcmVyLgpUaGlzIHdvcmtzIGluIGNv
b3JkaW5hdGlvbiB3aXRoIGEgbWVzYSBjb25maWcgdG8gZW5hYmxlIHZpcnRpbyBhcyBhCmJhY2tl
bmQgZm9yIHZhcmlvdXMgVU1Ecywgd2hpY2ggaXMgcGFydCBvZiBhIHNlcGFyYXRlIHNlcmllcyBb
MV0gKFRoaXMKbWVzYSBidWlsZCBpcyBpbnRlbmRlZCB0byBydW4gaW4gYSBndWVzdCBlbnZpcm9u
bWVudCkuCgpJJ20gb3BlbiB0byB0aG91Z2h0cyBhbmQgaWRlYXMgb24gdGhlIGJlc3Qgd2F5IHRv
IGhhbmRsZSB0aGlzLgoKQmVzdCwKSm9zZXBoCgpbMF0gaHR0cHM6Ly9kb2NzLm1lc2EzZC5vcmcv
ZHJpdmVycy96aW5rLmh0bWwKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8y
MDI2MDUxMi1tZXNhM2QtYW1kZ3B1LXZpcnRpby12Mi0wLTMwNjc4Yjc5N2RmOUBhbm9kaXplLmNv
bS9ULyN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
