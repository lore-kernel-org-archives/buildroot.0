Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E89CF58C6
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 18:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1135283E2C;
	Wed, 19 Nov 2025 18:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXy6B1BuDDOg; Wed, 19 Nov 2025 18:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16ACE83E08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16ACE83E08;
	Wed, 19 Nov 2025 18:27:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E0EE2A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 18:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A941610FF
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 18:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWRAVdtV_nbG for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 18:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BC5861115
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BC5861115
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BC5861115
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 18:27:25 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-5de0c1fa660so28555137.1
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 10:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763576844; x=1764181644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ov326AnMbk5dWeNC4KvJPEYlhjCSfVI30SdpF5KK7R0=;
 b=awWb+ligJcAzpczlvLnimfVP3ts+3fZbYJFFHgUBYbwDKUzjkv3jFb9rCJ9+bE7xGv
 SmyJejeLvBmkzJLECIUzPGyuyV4spOOoNPQzMF91hASMf8e8v2IxaPD9tL+qh0nuGUbQ
 gdDiRGDtn4xoVEIe0GPR+pV9JQTjLLE3wVqulfCBxJ3r6t/CzP1k605XNZ1s64P7/7/g
 pOmPnn1i+jH04Tj2EN9XWuQ48O/fXX98IJbRflZrwIW6gvWvXCPo+kO22rHUSDlH8igj
 1CZp3fUe/x9ej76YPo76CWsXxdMh4G04O3/CSa/UMTVl8sX7Fis7qz/f3ogfg0oxrrLT
 IdRg==
X-Gm-Message-State: AOJu0YyKdWHa/tbGv84Ttn/VXJmptBWZLDtY6iKaOIiNBUW+Uyr7p1Bz
 rXBTg6MwnNQ5yY/NdF0KtV/pY0f0CZ2YZz5KNuZo8YghyqeJaRtlC0G+tqez1DHf0UgePGwN2ri
 3ilwOgezK43lTTEMEajg04juyjFE+SzrG55PACo4=
X-Gm-Gg: ASbGncsPqdf+X3fteVt1cUTztA5MNWavyeUdMruUBrG5WMluT5X5Q9C9uclpWpAg8Df
 IcHKUsFgyA4KLB+rgtCeHkQJJzx2sEkXFIIWMXFbXuMS0h/cv2vagw3XU/5hOeZlGA/rKxkAcql
 Gh6dJXKM9fbJrlaDDWlJ0uZwbQ2PxQcv1+a2e6NJg5PjRqELdcjxEQGFBuYjvaSZ4Iq+NMXBFv/
 QR60tfUwQmny2kGIaIvdruMtfHWoClzAKNeIV8x4KybClqA6VB3Pf6Zig6QQXrP5NzudJX7BjOH
 2sKKZg==
X-Google-Smtp-Source: AGHT+IF+XBFPW2rmp28aKjbCKdp6DYy0T16FGZNZo23jjgwYq4C2/qmk2q1amZZcabr3dtAC3mX1N2JcJu8Gi+tHVF0=
X-Received: by 2002:a05:6102:e0b:b0:5d7:bd67:eaf with SMTP id
 ada2fe7eead31-5e1bbc95756mr236709137.18.1763576844029; Wed, 19 Nov 2025
 10:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <CADvTj4qKBNEobk78FM1Zxj8n1irVV+LaApwWR=rDcbwf8+2mmg@mail.gmail.com>
 <CADYdroNVCmUqTZB6cZ6r3=pnvARiGrnd6V+FeY3cO4tLFFUCEQ@mail.gmail.com>
 <CADvTj4oCZzy=O+j5Y_xOeQAXUcNe9EzZ96oHG-MQwEuZavXLmw@mail.gmail.com>
 <CADYdroOdjA_Qr87SyZExhpM1WqT4O-ff0MdNvNZfsttxmvNwVg@mail.gmail.com>
 <CADYdroNV1m5yjDbyPqvU6hZAOSSoXgRK9tFZk0ovFwWokOt4fw@mail.gmail.com>
In-Reply-To: <CADYdroNV1m5yjDbyPqvU6hZAOSSoXgRK9tFZk0ovFwWokOt4fw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Nov 2025 11:27:13 -0700
X-Gm-Features: AWmQ_bnRapzzEFsUEq3H-2nWyMoucWqLMLgHnezzFstZYtp0vmqrjY3BOf5qs7s
Message-ID: <CADvTj4raPttoFi1nfz1MdHWdurkRCtjpvOq1To9Q2rdkL4fOCg@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763576844; x=1764181644; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ov326AnMbk5dWeNC4KvJPEYlhjCSfVI30SdpF5KK7R0=;
 b=DAf7R/jpHqYmRkrpW2LKhqtFKLl14GOooTJ7ZTsuHfOT6arKXS4ZbWQyTkWUdK9uwB
 k/RHtwwGudp4hzZ9UcPiztQcSUHdOZ1KFmdRnWRuLx//GxYQ6aCFj0vi0WLY52qQ1qBb
 Afic2qws2eVnD8F7zZ/TfVtvJKZgrss7/MNL5iUlj5O3FK2pPuNLgiVFQCHGtDMA5oa7
 tObv/GRC2CkrpjkOKdTcidBQJWg/TGsHk6jmLWDAHfwWyfLMF758+xmZyg+Ercj08NEG
 LofDh4i2oDp06hfO3EJecgSmIjdUze6C+RRCKd+QglttfVde6zSyxZ9kYo+UeivnlEE5
 EX9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DAf7R/jp
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgMTA6NDTigK9BTSBOb3JiZXJ0IExhbmdlIDxub2xhbmdl
NzlAZ21haWwuY29tPiB3cm90ZToKPgo+IFBTLiBjb3VsZCBLQ09ORklHX0VOQUJMRV9PUFQgZG8g
bm90aGluZyBpZiBpdCBmaW5kcyAiIyBDT05GSUdfJChPUFQpCj4gaXMgbm90IHNldCI/CgpJJ20g
Z3Vlc3NpbmcgdGhpcyBtaWdodCBiZSBhIGJpdCB0cmlja3ksIGVzcGVjaWFsbHkgc2luY2Uga2Nv
bmZpZ3MKY2FuIGJlIHNvbWV3aGF0IGxheWVyZWQsIGZvciBleGFtcGxlIEkgdXNlIGFuIGluIGtl
cm5lbCBkZWZhdWx0Cmtjb25maWcgdGhlbiB1c2UgYSBsaW51eC1leHRyYXMuY29uZmlnIHRvIGFk
ZCBhIGZldyBtb3JlIG9wdGlvbnMsCkkgdGhpbmsgS0NPTkZJR19FTkFCTEVfT1BUIGZ1bmN0aW9u
cyBzaW1pbGFyIHRvIGtjb25maWcgZXh0cmFzLgoKSSB0aGluayBLQ09ORklHX0VOQUJMRV9PUFQg
b3BlcmF0ZXMgdHlwaWNhbGx5IG9uIHRoZSBrZXJuZWwKY29uZmlnIGFmdGVyIGV4dHJhcyBhcmUg
YXBwbGllZCBhbmQgYWxsIHRoZSBkZWZhdWx0cyBhcmUgZ2VuZXJhdGVkCnNvIGdhdGluZyBLQ09O
RklHX0VOQUJMRV9PUFQgdG8gZG8gbm90aGluZyBsaWtlIHlvdSBzdWdnZXN0CndvdWxkIGxpa2Vs
eSByZXN1bHQgaW4gaXQganVzdCBuZXZlciBkb2luZyBhbnl0aGluZyBhdCBhbGwuCgo+Cj4gVGhl
IGJpZ2dlc3QgaXNzdWUgaXMgdGhhdCB5b3UgY2FudCBvcHQtb3V0IG9mIHRoZSBhdXRvbWF0aWMg
b3B0LWluLgo+Cj4gTm9yYmVydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
