Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C365C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 07:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D0794070C;
	Sun, 24 Mar 2024 07:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0ZPLhum4kZG; Sun, 24 Mar 2024 07:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B9C740642
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B9C740642;
	Sun, 24 Mar 2024 07:36:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07F621BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 07:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E20A840496
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 07:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIUsSKjMMStg for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 07:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=tekieli.lukasz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0368400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0368400A4
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0368400A4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:35:56 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3668fd6952bso12944105ab.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 00:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711265755; x=1711870555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MkltD+IpANbRW83oeXuO6X2cluEZGMPm9j4nuOlIrxw=;
 b=E1AR4QLCDo3epJ4dGN6mYlShccJ54SjRcY8xISMQHJNl4u0lei7WgqCp0QDXi9SndI
 nLR2dytj4NRvzDjXny3NFbwQ73xRkdAeJDSo5FcTOxIdWtjQVq5GdBKY4XOOopXgki2G
 BVXNCADrW5VgPjgQl63mV2UY6Ac/+yho0NbYsj5QcG0CucBniulHVmeDaEFhpzSTQbzB
 qZv8L5ulaloTdlqP3xtzje3qjUNy0fMVodh9Z8SI5HD+wtBavGIIxMWu9deK/dNSoBAG
 ZvEsQl/xQxw76nLM3mC/FbJ3cYGgM3Z9QznJdPLENvuVpDfYlRaHH5fA2N+Hu2+vnjHG
 1koA==
X-Gm-Message-State: AOJu0YzASyDaPy9c/zfORp3EwsD9XKgayVkJ5e4IoEQg0FPkbybhpWP0
 G/a056yhydoQwoW7GYTQcbNoOZ2rSVCMO4holx0GaiKCTkkIvZ/7MWhkCU4F76Yzno17KwYep7x
 PWBcfLbx4xsNpM/Wvgq6WG8dl4ILhPp0Bg/U=
X-Google-Smtp-Source: AGHT+IHAxMEfySMOQmedMo26lsOCvuePOo5Q1Gi2AlTEU9jC1S7822uFll8hlXg1KAoEw5ZNHqO4xJ5URevYtEVh3c0=
X-Received: by 2002:a92:c643:0:b0:366:77fd:57e1 with SMTP id
 3-20020a92c643000000b0036677fd57e1mr4627471ill.24.1711265755509; Sun, 24 Mar
 2024 00:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
 <20240208211517.9234-3-tekieli.lukasz@gmail.com> <874jcwitlk.fsf@48ers.dk>
In-Reply-To: <874jcwitlk.fsf@48ers.dk>
From: =?UTF-8?Q?=C5=81ukasz_Tekieli?= <tekieli.lukasz@gmail.com>
Date: Sun, 24 Mar 2024 08:35:44 +0100
Message-ID: <CAFfxiozPcc5QisMEsKadCX2wb0F-oQ1GqQ2fXmJDK_+7xk=qXA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711265755; x=1711870555; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkltD+IpANbRW83oeXuO6X2cluEZGMPm9j4nuOlIrxw=;
 b=i1rLAT7nyFCx59I3KjglfpGHFQ0HTcaLfVcHNqdbph/uFRKFbxPuEgMUciWj60Et0w
 CYmVo4N6/W+uz4EWWUxEUkFS5b27CFjplYXj/Y0YAjomK8wMCyfgMV+BdMUXw4XwTzCD
 UOgnSCRbedXqEu3NdJat636ULrx2ziHWfyl5+/W3yTUwHHbxNQsxMF7vwM+1FW8OWnn3
 5oCkfdN+/RBkA6gJYWQjpDFeBFbCnJkJmoNNBLNzXmnbyR+vS/JVXcwPRgxA/LscRuEr
 50G50xklf/YIsfALGGckS/axxXLD7FkaK5frAniHWa9Wc5pMv6jxxUFjPJFIhCet8XoG
 Hy4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i1rLAT7n
Subject: Re: [Buildroot] [PATCH v2 2/2] board/visionfive2: enable u-boot
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTYXQsIE1hciAyMywgMjAyNCBhdCA5OjI14oCvUE0gUGV0ZXIgS29yc2dhYXJk
IDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+IEhtbSwgc28gdG8gdXNlIHRoYXQgd2Ug
bmVlZCB0byBjaGFuZ2UgdGhlIGJvb3QgbW9kZSB0byBTRCwgb3RoZXJ3aXNlIHRoZQo+IFNCSS9V
LUJvb3QgaW4gdGhlIFNQSSBmbGFzaCB3aWxsIHN0aWxsIGJlIHVzZWQgLSBTbyB3ZSBzaG91bGQg
YWRkIGEgbm90ZQo+IGFib3V0IHRoYXQuCgpZZXMsIFNEIG1vZGUgaXMgcmVxdWlyZWQgdG8gdXNl
IHRoaXMuIEkgaGF2ZSBhIHBhdGNoIHRoYXQgYnVpbGRzIGFsc28KdGhlIFNQSSBmbGFzaCBpbWFn
ZSwgYnV0IGRpZG4ndCBzdWJtaXQgeWV0LgpJJ2xsIGFkZCBhIG5vdGUgaW4gdGhlIGJvYXJkIHJl
YWRtZS4KCj4gSSBnYXZlIGl0IGEgcXVpY2sgdHJ5IGhlcmUgYW5kIGl0IGRvZXMgYm9vdCwgYnV0
IFVTQiBpcyBicm9rZW4gaW4gVS1Cb290Cj4gYW5kIExpbnV4LCBpcyB0aGF0IGEga25vd24gaXNz
dWU/Cj4KPiBbICAgIDguNzI4NTkyXSB4aGNpX2hjZCAwMDAwOjAxOjAwLjA6IEVycm9yIHdoaWxl
IGFzc2lnbmluZyBkZXZpY2Ugc2xvdCBJRAo+IFsgICAgOC43MzUzMDFdIHhoY2lfaGNkIDAwMDA6
MDE6MDAuMDogTWF4IG51bWJlciBvZiBkZXZpY2VzIHRoaXMgeEhDSSBob3N0IHN1cHBvcnRzIGlz
IDMyLgo+IFsgICAgOC43NDM0OTVdIHVzYiB1c2IyLXBvcnQyOiBjb3VsZG4ndCBhbGxvY2F0ZSB1
c2JfZGV2aWNlCj4gWyAgICA4Ljc0ODk4NF0geGhjaV9oY2QgMDAwMDowMTowMC4wOiBFcnJvciB3
aGlsZSBhc3NpZ25pbmcgZGV2aWNlIHNsb3QgSUQKPiBbICAgIDguNzU1NjYwXSB4aGNpX2hjZCAw
MDAwOjAxOjAwLjA6IE1heCBudW1iZXIgb2YgZGV2aWNlcyB0aGlzIHhIQ0kgaG9zdCBzdXBwb3J0
cyBpcyAzMi4KPiBbICAgIDguNzYzNjg2XSB1c2IgdXNiMS1wb3J0MTogY291bGRuJ3QgYWxsb2Nh
dGUgdXNiX2RldmljZQoKSSd2ZSBhbHJlYWR5IGZpeGVkIGVtYWMwIHByb2JsZW1zIGluIHVwc3Ry
ZWFtIHUtYm9vdC4gSSBub3RpY2VkIHRoYXQKdGhlIGNoYW5nZXMgYmV0d2VlbiBTdGFyRml2ZSBm
b3JrcyBhbmQgdXBzdHJlYW0gYXJlIHF1aXRlIGV4dGVuc2l2ZQphbmQgdGhleSBkZWZpbmF0ZWx5
IG1pc3NlZCBzb21lIHBhcnRzLgpJJ2xsIHRha2UgYSBsb29rIGF0IHRoaXMuCgo+ICA+IFUtQm9v
dCBjb25maWcgdXNlcyBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRSB3aXRoIHZh
bHVlCj4gID4gInUtYm9vdC5pdGIiLiBVc2luZyBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JVEIg
ZmFpbHMsIGJlY2F1c2UgdGhlCj4gID4gYnVpbGQgZG9lcyBub3Qgc3VwcG9ydCB1LWJvb3QuaXRi
IG1ha2UgdGFyZ2V0Lgo+Cj4gSG1tLCBvZGQuCgpZZXMsIHRoZXJlIGFyZSBvdGhlciBib2FyZHMg
dGhhdCB1c2UgdGhpcyBhcHByb2FjaCBhcyB3ZWxsOgoKcm9jazY0X2RlZmNvbmZpZzpCUjJfVEFS
R0VUX1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRT0idS1ib290Lml0YiIKYW5kZXNfYWUzNTBfNDVf
ZGVmY29uZmlnOkJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NVU1RPTV9OQU1FPSJ1LWJvb3QuaXRi
Igpyb2NrcHJvNjRfZGVmY29uZmlnOkJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NVU1RPTV9OQU1F
PSJ1LWJvb3QuaXRiIgpwaW5lNjRfZGVmY29uZmlnOkJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NV
U1RPTV9OQU1FPSJ1LWJvb3QuaXRiIgpyb2NfcGNfcmszMzk5X2RlZmNvbmZpZzpCUjJfVEFSR0VU
X1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRT0idS1ib290Lml0YiIKZnJpZW5kbHlhcm1fbmFub3Bp
X3Iyc19kZWZjb25maWc6QlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9NX05BTUU9InUtYm9v
dC5pdGIiCnBpbmU2NF9zb3BpbmVfZGVmY29uZmlnOkJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NV
U1RPTV9OQU1FPSJ1LWJvb3QuaXRiIgpoaWZpdmVfdW5sZWFzaGVkX2RlZmNvbmZpZzpCUjJfVEFS
R0VUX1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRT0idS1ib290Lml0YiIKCk1pZ2h0IGJlIGFsc28g
d29ydGggZml4aW5nIHRoaXMgaW4gdS1ib290LgoKVGhhbmtzIQoKCi0tIArFgXVrYXN6IFRla2ll
bGkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
