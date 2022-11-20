Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA15CC433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 18:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84ED260BF3;
	Sun, 20 Nov 2022 18:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84ED260BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xN2DH_Xa5Hwu; Sun, 20 Nov 2022 18:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B90B860BF2;
	Sun, 20 Nov 2022 18:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B90B860BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6D51BF38A
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 18:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 344524088C
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 18:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344524088C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d86MOJqmPbuo for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 18:40:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B0340243
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9B0340243
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 18:40:08 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 y14-20020a17090a2b4e00b002189a1b84d4so2992083pjc.2
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 10:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BF89kXPPwhEKlGLosQay1eE9TMY4W2THExJOULUK5Y=;
 b=2UC/Q1ne+ancF34PvORI8aKG77StM/Jm9xKhpLAfZ4vN/JNaiC7EgiDNaEf0N5wGYL
 euXYShzW8ltYeUIcPIZii00UcjQuke1U9iscppfASrCD3KcB+TkwXTMknNob+MApa97k
 tSCAvS74b7kbQwcVnxOsZL9zuklCV9dvSe/LJOXyRBLKAJe8Gpv9AZWHURy0BzspJSV2
 1O3GH86ipNc3BfesMQDZ957FZDVS7hGtkYOqjiOZljvXdQK41g9eYTmUxGIOuy74AWg3
 dg7U2JnTE6QeIlz4XXMRe3MTVWwnbot9i2tg8b2zPngTI/paBcdfdYTGEs0LG5x4DKXS
 Htjg==
X-Gm-Message-State: ANoB5pmx/xKOzqkOFjlH2NTBX+4iLzm6a7SG3rsCIW/afkp37GfaX3u8
 YcDmKXtbkazrm5SCGzBtSJd4xHi0bdtsF8eXfV4=
X-Google-Smtp-Source: AA0mqf5ckqTiwKpli+xg65YB+FZbpS86zBDsxxAE7kUCuMrgHb9jxDB0KMKyFcUVXNOYmIgiWv04GivSrhoKhrY/8NI=
X-Received: by 2002:a17:90a:6343:b0:213:b853:5e45 with SMTP id
 v3-20020a17090a634300b00213b8535e45mr23156532pjs.97.1668969608146; Sun, 20
 Nov 2022 10:40:08 -0800 (PST)
MIME-Version: 1.0
References: <CADvTj4qYnqsAjQMZQHBTdpxgiZ2VoLtewn9uWa1QzPjriT_VZg@mail.gmail.com>
 <A7C2FFDF-A321-49E6-A82C-3DA7C936C65E@benettiengineering.com>
 <CADvTj4rMLacz40pDcGWWE9MrBx-X6yYvrreST83Exa2yRAM_8w@mail.gmail.com>
 <b954a6db-f94c-96d4-524e-be7fbed67765@benettiengineering.com>
In-Reply-To: <b954a6db-f94c-96d4-524e-be7fbed67765@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Nov 2022 14:39:56 -0400
Message-ID: <CADvTj4pVzogcB1FaYa-WRZ_og=W1c7S7icXxFFmqSB6kwhC4Lw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BF89kXPPwhEKlGLosQay1eE9TMY4W2THExJOULUK5Y=;
 b=ahpJ4Rh4stoqQN2Qd5x+WE1/F9f3HWqH9spUKdyERcFqM4g42BjS9hx0JsZCw9u5V9
 46Mzd5OMqJdcjI2I06zW3AWB1vtZN0xiXvz+CuUD5LxC9BBnpzNC6OMclC42hteAk+7Z
 PNWZCcB0Awv5o7LEkeGjDwRBz4xg4Yl2zh7O7tu0/JagSp+FtDBLNqhRTVjinG5w1YHs
 H0R0pqGxlxsqneIGqwGepmiG3XzM3B42ckASydDWDdVnUYTswHUimc04quGsZ2fmGplX
 0z4A5zh89UZNlw39+P7xpeG3AFO7AUaJ8pi94yedXkGAHZv4hzIaS/1sDkz97mKm7AmM
 ETVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ahpJ4Rh4
Subject: Re: [Buildroot] [PATCH] package/libnss: disable parallel build with
 Make 4.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBOb3YgMTcsIDIwMjIgYXQgMzo0OCBQTSBHaXVsaW8gQmVuZXR0aQo8Z2l1bGlvLmJl
bmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9u
IDIwLzEwLzIyIDE1OjI5LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDIw
LCAyMDIyIGF0IDI6NTMgQU0gR2l1bGlvIEJlbmV0dGkKPiA+IDxnaXVsaW8uYmVuZXR0aUBiZW5l
dHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhpIEphbWVzLAo+ID4+Cj4gPj4+
IElsIGdpb3JubyAyMCBvdHQgMjAyMiwgYWxsZSBvcmUgMDI6MjMsIEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+ID4+Pgo+ID4+PiDvu79PbiBX
ZWQsIE9jdCAxOSwgMjAyMiBhdCA3OjM2IFBNIEphbWVzIEhpbGxpYXJkCj4gPj4+IDxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiA+Pj4+Cj4gPj4+Pj4gT24gV2VkLCBPY3QgMTks
IDIwMjIgYXQgMzo1NSBQTSBHaXVsaW8gQmVuZXR0aQo+ID4+Pj4+IDxnaXVsaW8uYmVuZXR0aUBi
ZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiA+Pj4+Pgo+ID4+Pj4+IEZpeGVzOgo+ID4+
Pj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzQzMy80MzM1ZDBkODQ1
NDAzNWE4Zjc0NjQ1YmE4ZDZjMjMyOWFiMmU1NDgwLwo+ID4+Pj4KPiA+Pj4+IEhtbSwgdGhpcyBs
b29rcyBsaWtlIGEgYnVnIGluIHRoZSBsaWJuc3MgbWFrZWZpbGUsIHdoYXQgd2FzIHRoZSBmYWls
dXJlCj4gPj4+PiBzZWVuIHdpdGggbWFrZSA0LjMgaGVyZToKPiA+Pj4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIyMDEwMTIxMDk1Mi4yMTQ4MjU2LTEtZ2l1bGlvLmJlbmV0
dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KPiA+Pj4KPiA+Pj4gVGhpcyBwYXRjaCBhbHNvIGRv
ZXMgbm90IGZpeCB0aGUgYnVpbGQgd2l0aCBtYWtlIDQuNChtYWtlIGZyb20gbWFzdGVyIGJyYW5j
aCkKPiA+Pj4gZnJvbSBteSB0ZXN0aW5nLgo+ID4+Pgo+ID4+PiBFdmVuIHdpdGhvdXQgc2h1ZmZs
ZSBtb2RlIGVuYWJsZWQgdGhlIGJ1aWxkIGFwcGVhcnMgdG8gYWx3YXlzIGZhaWwuCj4gPj4KPiA+
PiBUaGFuayB5b3UgZm9yIHRlc3RpbmcsIEkgaGF2ZSBmb3Jnb3R0ZW4gZXhhY3RseSB0byBhc2sg
eW91IHRvIGRvIGl0IDotKSBzaW5jZSBhbG1vc3QgYWxsIHRoZSBmYWlsdXJlcyBjb21lcyBmcm9t
IHlvdXIgYXNhaGktbWluaSB0aGF0IEkgcmVtZW1iZXIgdG8gaGF2ZSBNYWtlIDQuNC4KPiA+Cj4g
PiBJJ20gcnVubmluZyBtYWtlIG1hc3RlciBicmFuY2ggb24gYWxsIG15IGF1dG9idWlsZGVycyBh
dCB0aGUgbW9tZW50LAo+ID4gdGhlIGZhaWx1cmVzIGFyZW4ndCBsaW1pdGVkIHRvIGFzYWhpLW1p
bmk6Cj4gPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvP3JlYXNvbj1saWJuc3MtMy44
NAo+ID4KPiA+Pgo+ID4+IFNvIEkgdHJ5IHRvIHJlcHJvZHVjZSB0aGUgYnVnIGhlcmUgYXQgbWUg
YW5kIGZpbmQgb3V0IGEgZml4Lgo+ID4KPiA+IFVzZSBtYWtlIG1hc3RlciBicmFuY2ggZnJvbSBo
ZXJlIGZvciB0ZXN0aW5nOgo+ID4gZ2l0IGNsb25lIGh0dHBzOi8vZ2l0LnNhdmFubmFoLmdudS5v
cmcvZ2l0L21ha2UuZ2l0Cj4gPgo+Cj4gQWZ0ZXIgbG90IG9mIHRpbWUgSSd2ZSBmb3VuZCBhIHdh
eSB0byBmaXggdGhpcyBidWcgd2l0aCB0aGlzIHBhdGNoOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjExMTcxOTQ1MDUuOTQ5ODQ2LTEt
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KPgo+IENhbiB5b3UgcGxlYXNl
IGdpdmUgYSB0cnkgYXQgeW91IHRvbyBhbmQgZ2l2ZSBhIFRlc3RlZC1ieSB0YWc/CgpZZWFoLCBJ
IHZlcmlmaWVkIGl0IHdvcmtzIG9uIHRoZSByZWNlbnRseSByZWxlYXNlZCBtYWtlIDQuNCBmaW5h
bC4KCj4KPiBUaGFuayB5b3UKPiBCZXN0IHJlZ2FyZHMKPiAtLQo+IEdpdWxpbyBCZW5ldHRpCj4g
Q0VPL0NUT0BCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
