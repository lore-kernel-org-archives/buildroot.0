Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614BACD68E5
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 09:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0870E40A15;
	Tue, 10 Oct 2023 09:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0870E40A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmDt2x7ChEWJ; Tue, 10 Oct 2023 09:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69251408BC;
	Tue, 10 Oct 2023 09:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69251408BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9236F1BF2FB
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 09:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74941415CE
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 09:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74941415CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBZWJVV3Slfs for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 09:15:27 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DA5D415A4
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 09:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA5D415A4
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so985373966b.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 02:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696929325; x=1697534125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44GNR7KT8q8pTzyBsxs6BRNlx4IJ6uPt2iZyHZ6foVA=;
 b=ab02Sy+7ju8stK2Leu23nJDdbg9U/pdPHp3G729L4FijM++7zE7zzqUhqx7QZfOQ5c
 iwWTcpnD3Je9pcwxD/AmgctigTg43hSks9eQg8jH8InaX0mEnfyJ+cLbMcx03+GNq2kk
 41YbckL37HILmibLbU4bZ6VDhInhqDGZRHmJMDtolrnmdvJy3LqnjdOBAtn5qASsr/H6
 +93H3+dNnFUEeINv2V1p9WTZOExmx1DddFbaj9UfvERvmt+XsJBrMJa/ajkVeujavanB
 wIKouf8WyKB7Y4/zd1gKzsqTsPtnfuZdkJdwE/RIG3u2MrUCdt+T66Y3mDiE05BN7R3/
 HEJg==
X-Gm-Message-State: AOJu0Yxxe+IzMpMBbP4tqLu0LlBF24YIu3BB1uEvcGvlisBFZV77JQpr
 ntzGAtEGQgam3wBLSfurWhr4oTwqDBWB0z36ycNMjv+9m7sn8ae0
X-Google-Smtp-Source: AGHT+IEKBCRPrXqFv57xXer2ms5mx/7Ba11gcMEePDR5Hco6eq0wJ9P3xnfXW8Y/6f+0liPcGRTqYLnSnOUgISq3klY=
X-Received: by 2002:a17:906:74c8:b0:9ba:2a6:956d with SMTP id
 z8-20020a17090674c800b009ba02a6956dmr9357637ejl.44.1696929325222; Tue, 10 Oct
 2023 02:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231010070558.9791-1-ramirez.clement3@gmail.com>
 <874jiydiiq.fsf@tarshish>
 <CADRKr2ov7vayiQPreXt1Z5mhy848UJxztJ+seMmGk1t36ikRiw@mail.gmail.com>
 <87v8bec0pm.fsf@tarshish>
In-Reply-To: <87v8bec0pm.fsf@tarshish>
From: =?UTF-8?Q?Cl=C3=A9ment_Ramirez?= <ramirez.clement3@gmail.com>
Date: Tue, 10 Oct 2023 11:15:13 +0200
Message-ID: <CADRKr2oNM2btAby66VOSNCs2bJkheButc7R+5N7kB-Kc7YuWtg@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696929325; x=1697534125; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44GNR7KT8q8pTzyBsxs6BRNlx4IJ6uPt2iZyHZ6foVA=;
 b=ggCKDBogOmJen8x5hdkVlWarPrrK8JefbTGrnTfUXALtm0dVpX4Tr0BpTNZNWducOM
 BGUajB2AwMIJXHe/NlMiRDhj/DbpXLlZINJRUih7vwcTrJ7DajmmDvNMP9jzS/hJLAKi
 e5pNwOVCCpiggWLZTTkZEFHdKz/gI9rFtDuZduGWIRclL8PhC8VsLyBbI2mwkDP/yBaL
 2AY6TmVG/Ng5fnINty0aXZ0L+hHHtCsn9ZvRP0X5qYHb0gRZ+pnQBJ2HD7GtEikqXgaK
 sQfLFNHzOoF3uiux2U+nnPkQuCYYgRt9I/7ZIzvrL58uStMNv/LNkrjlJixUQu856Y9S
 z6NQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ggCKDBog
Subject: Re: [Buildroot] [PATCH] package/qemu: security bump version to 8.1.1
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

SGkgQmFydWNoLAoKPiBUaGlzIGlzIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBmaXhlZCBpbiB0
aGUgQ1BFIGRhdGFiYXNlLgo+Cj4gSW4gdGhlIG1lYW4gdGltZSB0aGVyZSBzaG91bGQgYmUgYSBj
b21tZW50IHRoYXQgZXhwbGFpbnMgd2h5IHdlIGlnbm9yZQo+IHRoZXNlIENWRXMgZXZlbiB0aG91
Z2ggdGhleSBkbyBub3QgYWN0dWFsbHkgYWZmZWN0IHRoZSBjdXJyZW50IHBhY2thZ2UKPiB2ZXJz
aW9uLgoKSSB3aWxsIHRyeSB0byBmaW5kIGEgd2F5IHRvIGFkZCBhbiBlbnRyeSBpbiB0aGUgQ1BF
IGRhdGFiYXNlLCBhbmQgYWRkIGEKY29tbWVudCB0byBleHBsYWluIHdoeSB3ZSBhcmUgaWdub3Jp
bmcgdGhlc2UgQ1ZFcy4KClRoYW5rcyBmb3IgeW91ciBmZWVkYmFja3MsCkNsw6ltZW50Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
