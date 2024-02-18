Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B98FC48BC4
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 23:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D845240901;
	Sun, 18 Feb 2024 23:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOWRr7j02NW9; Sun, 18 Feb 2024 23:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B88644062A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B88644062A;
	Sun, 18 Feb 2024 23:24:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 715981BF29A
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 23:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 639AC40702
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 23:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHFsKdWh4erP for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 23:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 587DD406FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 587DD406FA
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 587DD406FA
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 23:24:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512b36bb97eso251307e87.1
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 15:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708298641; x=1708903441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGeSQA9YKJ9xlkYMh9csqc+8ygoY1s7djKtwndhMWbE=;
 b=ejPc2Coxr9Sj0xmJjQW44o0wNnCaHUDjwkUd/jVPRB08s9sXuUmht5UQuLBk1FATzU
 JbKAE41XYHJcnEbU5USBVPwf5UnPdCoul23uZeidHyf4GvjzZp/adHyorhFvHOuGP4Yd
 BSH9NQYcECPx0yo8KCZeq7ig4GNz8GlRNI888TzlmmDi4CMuUQ8zP5sVn/hkxZ1rRfga
 OIODHSL9qcjMkcm1YD6BJp12mQRr/6O4JOBh/h0NyTUTO7j/0Ih8NBatS4znlPGqdItT
 tsZ+ToGL51hQuf8qLDblQM1bR9an07HUqulxKvwjHs5iRFXn3bR8zdPPqFlq+LsYzDvG
 IXdg==
X-Gm-Message-State: AOJu0YwAkyaY353YEX4R8sHKFCAeroQHDyhGBvBrSMjPR6FlZI2V/Qko
 CRDdffUkSAudAOINruLGzVMHNu0606zTuUCrr3FAWMHZoIhF6ueSQt+SC6NbJNk7pmjmFAzsljH
 u
X-Google-Smtp-Source: AGHT+IF4F0vAqRlgsOdpt22My/NBCs+mTXcr/6Pa9gjBbBbNsQ1PteCZv6PbcpoIfJ3Lx0sBXZzkow==
X-Received: by 2002:ac2:5b4b:0:b0:512:aad5:bd18 with SMTP id
 i11-20020ac25b4b000000b00512aad5bd18mr1820035lfp.17.1708298640947; 
 Sun, 18 Feb 2024 15:24:00 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 h5-20020a197005000000b005115b8700b7sm686691lfc.91.2024.02.18.15.23.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Feb 2024 15:24:00 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5120ecfd75cso5269604e87.0
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 15:23:59 -0800 (PST)
X-Received: by 2002:a05:6512:3698:b0:511:ab58:da2f with SMTP id
 d24-20020a056512369800b00511ab58da2fmr5974105lfs.30.1708298639540; Sun, 18
 Feb 2024 15:23:59 -0800 (PST)
MIME-Version: 1.0
References: <20240217172923.3629905-1-yann.morin.1998@free.fr>
In-Reply-To: <20240217172923.3629905-1-yann.morin.1998@free.fr>
Date: Sun, 18 Feb 2024 15:23:48 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rvgJT-pS_BwfCJgs2WR1c+x-TT+Oo1+E3hpCKZPbqj8w@mail.gmail.com>
Message-ID: <CA+h8R2rvgJT-pS_BwfCJgs2WR1c+x-TT+Oo1+E3hpCKZPbqj8w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1708298641; x=1708903441; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CGeSQA9YKJ9xlkYMh9csqc+8ygoY1s7djKtwndhMWbE=;
 b=nGWd6IrEtlGyGZW+3yLmUMDVqUQS6VUZG0k07+l4ogClALVsPfuCF2RVg4pygGDzxT
 CjEO1+LZiaTyWlzIy0T6EHNfN8ByXBYZFo4jlTNCspZ6+igpV1MMntTdomoh1rmhjt5G
 raOgPEwpT6gHlYSgwkdXDJB9m99rDoDIvJVbCJYO6C7NwkanDmkWjarh8Mo8+ufCJsn8
 NpHeOm8zf6vSIlHE1F/vjcBk1M2M5BcCSuNbB3bZAwiAseKf+h+WRBkPD7ckZQ7fQU0m
 0Vydk+J38TAv0KcQ+ne77uDglAk4hvCoBmQtVM84fag3nHYcujFFAKUXgo1TWrr/NAsg
 mgKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=nGWd6IrE
Subject: Re: [Buildroot] [PATCH] package/sudo: drop legacy, useless,
 and broken post-configure hook
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TEdUTQoKT24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgOToyOeKAr0FNIFlhbm4gRS4gTU9SSU4gPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBSZXBvcnRlZC1ieTogQ2hyaXN0aWFuIFN0
ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzogUGV0ZXIgS29yc2dhYXJkIDxwZXRl
ckBrb3JzZ2FhcmQuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3N1ZG8vc3Vkby5tayB8IDkgLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3Vkby9zdWRvLm1rIGIvcGFja2FnZS9zdWRvL3N1ZG8ubWsKPiBpbmRleCBhNGU4Mzhk
ZDk0Li43OTYxYTk5MDAyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3Vkby9zdWRvLm1rCj4gKysr
IGIvcGFja2FnZS9zdWRvL3N1ZG8ubWsKPiBAQCAtNTgsMTUgKzU4LDYgQEAgZWxzZQo+ICBTVURP
X0NPTkZfT1BUUyArPSAtLWRpc2FibGUtb3BlbnNzbAo+ICBlbmRpZgo+Cj4gLSMgbWtzaWduYW1l
L21rc2lnbGlzdCBuZWVkcyB0byBydW4gb24gYnVpbGQgaG9zdCB0byBnZW5lcmF0ZSBzb3VyY2Ug
ZmlsZXMKPiAtZGVmaW5lIFNVRE9fQlVJTERfTUtTSUdOQU1FX01LU0lHTElTVF9IT1NUCj4gLSAg
ICAgICAkKE1BS0UpICQoSE9TVF9DT05GSUdVUkVfT1BUUykgXAo+IC0gICAgICAgICAgICAgICBD
UFBGTEFHUz0iJChIT1NUX0NQUEZMQUdTKSAtSS4uLy4uL2luY2x1ZGUgLUkuLi8uLiIgXAo+IC0g
ICAgICAgICAgICAgICAtQyAkKEBEKS9saWIvdXRpbCBta3NpZ25hbWUgbWtzaWdsaXN0Cj4gLWVu
ZGVmCj4gLQo+IC1TVURPX1BPU1RfQ09ORklHVVJFX0hPT0tTICs9IFNVRE9fQlVJTERfTUtTSUdO
QU1FX01LU0lHTElTVF9IT1NUCj4gLQo+ICBkZWZpbmUgU1VET19QRVJNSVNTSU9OUwo+ICAgICAg
ICAgL3Vzci9iaW4vc3VkbyBmIDQ3NTUgMCAwIC0gLSAtIC0gLQo+ICBlbmRlZgo+IC0tCj4gMi40
My4wCj4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJl
LnVzPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
