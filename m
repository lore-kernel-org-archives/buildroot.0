Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D0C46CD2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 22:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF84540133;
	Mon, 22 Jan 2024 22:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF84540133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GcpDEaWIeS43; Mon, 22 Jan 2024 22:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8743E40328;
	Mon, 22 Jan 2024 22:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8743E40328
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB0031BF853
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8433660C15
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 22:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8433660C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6C1RFKxqJjrP for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 22:46:27 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88C9560BC6
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 22:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88C9560BC6
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a2dc7827a97so401937566b.2
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 14:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705963585; x=1706568385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sze+vEfLUpcIBAxI63HFjg7GCva5iO/W0NjVdHKHmSg=;
 b=AWveNN6rl3Tgy/kNhPafSKLjMfeFAD1dVgVyvt1qZADcwdLGDD3WeZX3sfCqIwRS9y
 x4KZTBlhktGxjh6xDunp+3oo5tkg7kiO3VvFOwZUC3O9mDIoGwJ+54o4AOjjG+4FMLgM
 Oej8piCCNkxnXRvTRWoGVVqZxbFrdpSeDZJVHE6M+E3rhcrcM4jSG7HWq8zaDe2nVNjn
 Pqa8MwHMKOKwg/rDKoVe5MOg+B4HOSjRImmfaVIwDfCNS3MJtitnj/sAyTvJ9blZgFp7
 0NjPg0tAmHsr0WD9WpaW5QdND6Kv3r2hQ1HNRSF7t07HdLgd5KPWmwzoArMvHImez1OU
 jTiw==
X-Gm-Message-State: AOJu0YxogSAVZPQ6+M13O+j9SVCQg7UbccQxTnHrY27ksLYPRaRff+6V
 uL9NaY5axKNQuvnIi7Dm6HPu5DtNRuyBtiZ/gLghUbvlFN4JUdFhNloyqFItMiwdpjnZyugtIje
 wnhaG5j0JYJPOhdtVxFgsULDsrwSH0GcHDmyuDA==
X-Google-Smtp-Source: AGHT+IGQIKHKapu4XYabEIka64TKAsuHprB9vUH7Ow7HShfezUViQT0Y1lwiPjPJHYe9hdt9n2BiWhCB4FLghGQdBD8=
X-Received: by 2002:a17:907:c20e:b0:a2f:b9c0:4c1a with SMTP id
 ti14-20020a170907c20e00b00a2fb9c04c1amr2862296ejc.146.1705963585264; Mon, 22
 Jan 2024 14:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20230921164809.102741-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230921164809.102741-1-fontaine.fabrice@gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 22 Jan 2024 15:46:14 -0700
Message-ID: <CAHDQB6P+xwH8_Fhi5EFinnuh2bGn7vR0paiAa8-0zFW+XXQ2-g@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705963585; x=1706568385;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sze+vEfLUpcIBAxI63HFjg7GCva5iO/W0NjVdHKHmSg=;
 b=k/gLCUjOjeSlixxm9i/MBXG76BsBgNZk/cri/xSf07pEj8qvyd35JqJgOer5OTNDXB
 GX9RVUudwtvCvFeRDHI0yEWeAr7qLUvPd+JNLrSlvVWujgjvByMaX15e+jyIbSj/lOOL
 IUiDdG4FxArkQgXZsozeYPuCLDmMTaNNts22g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=k/gLCUjO
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/vulkan-loader: fix x11 handling
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
Cc: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsOwoKUmV2aWV3ZWQtYnk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgpUZXN0ZWQtYnk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgoKCk9uIFRodSwgU2VwIDIxLCAyMDIzIGF0IDEwOjQ44oCvQU0gRmFicmlj
ZSBGb250YWluZQo8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRml4IHRo
ZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSByYWlzZWQgc2luY2UgdGhlIGFkZGl0aW9uIG9mIHRo
ZSBwYWNrYWdlCj4gaW4gY29tbWl0IDZhYTFiYzMxNjc4ZmY5ZjgwMTMwODRmZGEzNGI5Zjk0MWNj
NjNmYzM6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hvbWUvYnVpbGRyb290L2F1dG9idWls
ZC9ydW4vaW5zdGFuY2UtMy9vdXRwdXQtMS9idWlsZC92dWxrYW4tbG9hZGVyLTEuMy4yNjIvbG9h
ZGVyL2V4dGVuc2lvbl9tYW51YWwuaDoyNCwKPiAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUv
YnVpbGRyb290L2F1dG9idWlsZC9ydW4vaW5zdGFuY2UtMy9vdXRwdXQtMS9idWlsZC92dWxrYW4t
bG9hZGVyLTEuMy4yNjIvbG9hZGVyL2V4dGVuc2lvbl9tYW51YWwuYzoyMzoKPiAvaG9tZS9idWls
ZHJvb3QvYXV0b2J1aWxkL3J1bi9pbnN0YW5jZS0zL291dHB1dC0xL2hvc3QvYWFyY2g2NC1idWls
ZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvdnVsa2FuL3Z1bGthbi5oOjcxOjEw
OiBmYXRhbCBlcnJvcjogWDExL2V4dGVuc2lvbnMvWHJhbmRyLmg6IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKPiAgICA3MSB8ICNpbmNsdWRlIDxYMTEvZXh0ZW5zaW9ucy9YcmFuZHIuaD4KPiAg
ICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPgo+IEZpeGVzOgo+ICAt
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzU1ZGRmZDQ0MzkzZTNiY2My
ZjI1YmFkMmY5ZWNiN2UxYjE0MmE5ODUKPgo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFp
bmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjIg
KGFmdGVyIHJldmlldyBvZiBUaG9tYXMgUGV0YXp6b25pKToKPiAgLSBEcm9wIHNlbGVjdAo+Cj4g
IHBhY2thZ2UvdnVsa2FuLWxvYWRlci92dWxrYW4tbG9hZGVyLm1rIHwgMTUgKysrKysrKysrLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1sb2FkZXIubWsgYi9w
YWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5tawo+IGluZGV4IGY2ZGQ5ZDBhYzMu
LmIxNTQ1YTQ5NzIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS92dWxrYW4tbG9hZGVyL3Z1bGthbi1s
b2FkZXIubWsKPiArKysgYi9wYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5tawo+
IEBAIC0yNiwxMyArMjYsMTYgQEAgZW5kaWYKPgo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQlhD
QikseSkKPiAgVlVMS0FOX0xPQURFUl9ERVBFTkRFTkNJRVMgKz0gbGlieGNiCj4gLVZVTEtBTl9M
T0FERVJfQ09ORl9PUFRTICs9IFwKPiAtICAgICAgIC1EQlVJTERfV1NJX1hDQl9TVVBQT1JUPU9O
IFwKPiAtICAgICAgIC1EQlVJTERfV1NJX1hMSUJfU1VQUE9SVD1PTgo+ICtWVUxLQU5fTE9BREVS
X0NPTkZfT1BUUyArPSAtREJVSUxEX1dTSV9YQ0JfU1VQUE9SVD1PTgo+ICBlbHNlCj4gLVZVTEtB
Tl9MT0FERVJfQ09ORl9PUFRTICs9IFwKPiAtICAgICAgIC1EQlVJTERfV1NJX1hDQl9TVVBQT1JU
PU9GRiBcCj4gLSAgICAgICAtREJVSUxEX1dTSV9YTElCX1NVUFBPUlQ9T0ZGCj4gK1ZVTEtBTl9M
T0FERVJfQ09ORl9PUFRTICs9IC1EQlVJTERfV1NJX1hDQl9TVVBQT1JUPU9GRgo+ICtlbmRpZgo+
ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9YTElCX0xJQlgxMSkkKEJSMl9QQUNLQUdFX1hMSUJf
TElCWFJBTkRSKSx5eSkKPiArVlVMS0FOX0xPQURFUl9ERVBFTkRFTkNJRVMgKz0geGxpYl9saWJY
MTEgeGxpYl9saWJYcmFuZHIKPiArVlVMS0FOX0xPQURFUl9DT05GX09QVFMgKz0gLURCVUlMRF9X
U0lfWExJQl9TVVBQT1JUPU9OCj4gK2Vsc2UKPiArVlVMS0FOX0xPQURFUl9DT05GX09QVFMgKz0g
LURCVUlMRF9XU0lfWExJQl9TVVBQT1JUPU9GRgo+ICBlbmRpZgo+Cj4gIGlmZXEgKCQoQlIyX1BB
Q0tBR0VfV0FZTEFORCkseSkKPiAtLQo+IDIuNDAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
