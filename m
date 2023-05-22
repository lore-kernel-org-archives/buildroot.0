Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E7DC7EE29
	for <buildroot@archiver.kernel.org>; Mon, 22 May 2023 20:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F31640164;
	Mon, 22 May 2023 20:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F31640164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOQQhxjM8rWS; Mon, 22 May 2023 20:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 098E141E4B;
	Mon, 22 May 2023 20:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 098E141E4B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C75BD1BF38D
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 20:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EFD541E4B
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 20:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EFD541E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzPRjPYdgBKr for <buildroot@lists.busybox.net>;
 Mon, 22 May 2023 20:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16A8D41E62
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16A8D41E62
 for <buildroot@buildroot.org>; Mon, 22 May 2023 20:18:05 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-96f5d651170so820178566b.1
 for <buildroot@buildroot.org>; Mon, 22 May 2023 13:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684786684; x=1687378684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+m20tspjOKxToCeiUbWjg2TKhJBaALo5cQV00qd0lY=;
 b=lwvMRUbYEbosKnPvGhnHVPvyKZ13M4xw0RjPpe5LyF4nK0a1hqCsDvEIdW20fK4g+a
 paXcf6lU5R5Ca2VSkzl88mYvJIIJ58GrDaAEpASCO/eQYrNI0MU9jT6kAtj94hJmC1D0
 TrmAuNNnFhbsayjNoEcgFUFq/4X3ebPxtFfntC4qhn7Be2y+XPp9hrv8Tv1x1KgXxmvi
 hFzz3InvLEtCnF+V5+fhUYQK2tg+SUxEyGeUHMHKApue5JwlVAYPCdP6rObzfPEL62XI
 H1RSj0/tO562tZT2c3UwaFEwhvnwLwpkc4MX3XQsTIG/Dnl2HGgH7E2lPDN2QzgDXYgD
 jIFw==
X-Gm-Message-State: AC+VfDxhWWegxBF3BIhps5FL3cFZBOrZGREns8uTDYO97bbTf031FuNv
 hmeykvW+1qLoBSxM00gb/Y4q1Xa/aXKEv5XsTdCd5w==
X-Google-Smtp-Source: ACHHUZ6SKBsNo3jJSiGe+/jZYg8BXTZrG44tbJAzRMO5S5PhCZ6qTSvQRB6nvZJaDaENQ22jxSVLgQ==
X-Received: by 2002:a17:907:d27:b0:94e:4285:390c with SMTP id
 gn39-20020a1709070d2700b0094e4285390cmr12438482ejc.10.1684786683890; 
 Mon, 22 May 2023 13:18:03 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 qu7-20020a170907110700b0096a5d341b50sm3478614ejb.111.2023.05.22.13.18.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 13:18:03 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-513fd8ad61dso56230a12.0
 for <buildroot@buildroot.org>; Mon, 22 May 2023 13:18:02 -0700 (PDT)
X-Received: by 2002:a05:6402:3c4:b0:50d:9058:733 with SMTP id
 t4-20020a05640203c400b0050d90580733mr11692986edw.18.1684786682175; Mon, 22
 May 2023 13:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230512002511.1356447-1-christian@aperture.us>
 <20230512002511.1356447-2-christian@aperture.us> <86h6sbtu2c.fsf@gmail.com>
In-Reply-To: <86h6sbtu2c.fsf@gmail.com>
Date: Mon, 22 May 2023 13:17:50 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pZ3zDt4cD4HWD9Jg-pUNUQzr+3O1YqfOWsWxez+JjxZA@mail.gmail.com>
Message-ID: <CA+h8R2pZ3zDt4cD4HWD9Jg-pUNUQzr+3O1YqfOWsWxez+JjxZA@mail.gmail.com>
To: Joachim Wiberg <troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684786684; x=1687378684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+m20tspjOKxToCeiUbWjg2TKhJBaALo5cQV00qd0lY=;
 b=ieau6dyKhHBt4ds4KFsY9/Y53Q9RG0pYha+GpwJcu47zYB1TjwC+hMzeXkkKIlT0wa
 a1F0RWn5o2Dp9WcnvyHkGHtS5tiHNEb5AECVIk+pKkQiTk1kjoI72H404APsyFGH+2tp
 mxJr26i3O5++VEu83/sexr0GWKTfhFX2Fj9xquYpARzvzDtNlCWkQWOFrAgLw7erhYSX
 BTPEyw9LX6wki+ySqXPrzE6QG9BrTggY9kvI4aa/svXy/Jw8CUdoo2kLSqez1xdDB/S5
 Fo7wYrNYvv1AJAXe1Ske4+zgO19SA9ZhM57TNE8roXBHUZfWr7oMqi5wMqpToqhTckM2
 4njQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=ieau6dyK
Subject: Re: [Buildroot] [PATCH v2 2/2] package/podman: new package
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9hY2hpbSwKCk9uIFR1ZSwgTWF5IDE2LCAyMDIzIGF0IDEwOjE44oCvUE0gSm9hY2hpbSBX
aWJlcmcgPHRyb2dsb2JpdEBnbWFpbC5jb20+IHdyb3RlOgo+IFlvdSBmb3Jnb3QgdG8gdXBkYXRl
IHRoZSBERVZFTE9QRVJTIGZpbGUgd2l0aCB5b3VyIG5ldyBwYWNrYWdlLgoKV2lsbCBmaXggZm9y
IG5leHQgcmV2aXNpb24sIHRoYW5rcy4KCgo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0NB
VEFUT05JVAo+Cj4gTm9vYiBxdWVzdGlvbiwgaXMgQ0FUQVRPTklUIHJlYWxseSBhIGRlcGVuZGVu
Y3k/ICBJIHRob3VnaHQgaXQgd2FzIG9ubHkKPiBuZWVkZWQvcmVjb21tZW5kZWQgd2hlbiBjb21w
b3NpbmcgYSBuZXcgY29udGFpbmVyLgoKV2hlbiBzdGFydGluZyBhIGNvbnRhaW5lciB3aXRoIHRo
ZSAtLWluaXQgZmxhZywgYm90aCBEb2NrZXIgYW5kIFBvZG1hbgp3aWxsIHVzZSBhbiBpbml0IGJp
bmFyeSBhcyB0aGUgUElEIDEgd2l0aGluIHRoZSBjb250YWluZXIuIFRoZSBpbml0CmJpbmFyeSBj
b21lcyBmcm9tIHRoZSBob3N0IHN5c3RlbS4gV2l0aCBEb2NrZXIgYW5kIENvbnRhaW5lcmQgd2Ug
dXNlCi91c3IvYmluL3Rpbmkgc3ltbGluayB0byAvdXNyL2Jpbi90aW5pLgoKVGhlIGRlZmF1bHQg
aW4gcG9kbWFuIGlzIHRvIHVzZSBjYXRhdG9uaXQgYXQgL3Vzci9iaW4vY2F0YXRvbml0IGZvcgot
LWluaXQsIHNvIEkgaGFkIGluY2x1ZGVkIGl0IGFzIGEgZGVwZW5kZW5jeSBoZXJlLgoKQW4gYWx0
ZXJuYXRpdmUgY291bGQgYmUgdG8gYWRkIGEgZGVwZW5kZW5jeSBvbiBUaW5pIGFuZCBhZGRpbmcK
YGluaXRfcGF0aCA9ICIvdXNyL2Jpbi90aW5pImAgdG8gYC91c3Ivc2hhcmUvY29udGFpbmVycy9s
aWJwb2QuY29uZmAuCgpIb3dldmVyOiBjdXJyZW50bHkgaW4gRG9ja2VyIGFuZCBDb250YWluZXJk
IHdlIGRvIG5vdCBhY3R1YWxseSAic2VsZWN0ClRJTkkiLiBEb2NrZXIgd2lsbCB1c2UgaXQgaWYg
aXQncyBwcmVzZW50LCBidXQgd2UgZG9uJ3QgZGVwZW5kIG9uIGl0CmRpcmVjdGx5LiBTbyBJIGhh
dmUgZHJvcHBlZCB0aGUgInNlbGVjdCBDQVRBVE9OSVQiIGZvciB0aGUgbmV4dApwYWNrYWdlIHJl
dmlzaW9uLgoKPgo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0NOSV9QTFVHSU5TCj4gPiAr
ICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfQ09OTU9OCj4gPiArICAgICBzZWxlY3QgQlIyX1BBQ0tB
R0VfQ05JX1BMVUdJTlMKPgo+IER1cGxpY2F0ZQoKRml4ZWQsIHRoYW5rcy4KCj4gTm90IHN1cmUs
IGJ1dCBmb3IgY29udGFpbmVyIG5ldHdvcmtpbmcgd2UgYWxzbyBuZWVkIEJSSURHRV9VVElMUywg
cmlnaHQ/CgpOb3QgZnJvbSB3aGF0IEkndmUgcmVhZCwgcGx1cyBJJ3ZlIGJlZW4gdGVzdGluZyB3
aXRob3V0IGl0ICYgaXQgd29ya3MgZmluZS4KCkl0J3Mgbm90IGluIHRoZSBsaXN0IG9mIGRlcGVu
ZGVuY2llcyBvbiB0aGUgYXJjaCBwYWNrYWdlIGVpdGhlci4KCj4gPiArICAgICBzZWxlY3QgQlIy
X1BBQ0tBR0VfTElCR1BHTUUKPgo+IEZvciByb290bGVzcyBzdXBwb3J0LCBpc24ndCBTSEFET1cg
KyBTSEFET1dfU1VCT1JESU5BVEVfSURTIGFuZAo+IFNMSVJQNE5FVE5TIHJlcXVpcmVkPwoKUG9z
c2libHksIGJ1dCBnaXZlbiB0aGF0IG91ciBkZWZhdWx0IG1vZGUgaGVyZSBpcyB0byBydW4gcG9k
bWFuIGFzIGEKc3lzdGVtIGRhZW1vbiwgSSBkb24ndCBrbm93IGlmIGVuZm9yY2luZyB0aGVzZSBy
ZXF1aXJlbWVudHMgaXMKc3RyaWN0bHkgbmVjZXNzYXJ5LiBJZiBhIHVzZXIgd2FudHMgdG8gdXNl
IHBvZG1hbiBpbiByb290bGVzcyBtb2RlCnRoZXkgY2FuIGVuYWJsZSB0aGVzZSB0aGluZ3MuCgo+
IENHUk9VUEZTX01PVU5UIGlzIHByb2JhYmx5IG5lZWRlZCBmb3Igbm9uLXN5c3RlbWQgYnVpbGRz
LgoKR29vZCBjYXRjaCwgYWRkZWQgJiBmaXhlZCwgdGhhbmtzLgoKPiBDQV9DRVJUSUZJQ0FURVMg
aXMgbmVlZGVkIGZvciBodHRwcyBwdWxsLgoKVGhhdCdzIGFsc28gdHJ1ZSBmb3IgZG9ja2VyIGFu
ZCBiYWxlbmEtZW5naW5lIGFuZCBjb250YWluZXJkLCBidXQgd2UKZG9uJ3Qgc2VsZWN0IENBX0NF
UlRJRklDQVRFUyB0aGVyZS4KClBvZG1hbiB3aWxsIHdvcmsgZmluZSB3aXRob3V0IGl0LCBhc3N1
bWluZyB5b3UganVzdCBsb2FkIGNvbnRhaW5lcgppbWFnZXMgbG9jYWxseSB3L28gaHR0cHMgcHVs
bC4KClNlbnQgYW5vdGhlciByZXZpc2lvbiBhcyB2MywgdGhhbmtzIQoKQmVzdCByZWdhcmRzLApD
aHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
