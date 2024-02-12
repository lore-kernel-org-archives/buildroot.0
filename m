Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38FFC48297
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 09:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B5583D98;
	Mon, 12 Feb 2024 09:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hjTulTLqAha; Mon, 12 Feb 2024 09:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2791E83D8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2791E83D8C;
	Mon, 12 Feb 2024 09:00:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0472A1BF361
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 09:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E584F83D8C
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 09:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bqcd8LleRZEO for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 09:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E17083D79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E17083D79
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E17083D79
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 09:00:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5116ec49081so3123141e87.2
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 01:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707728433; x=1708333233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDIJhkWL4ND8EZXqVXTsSizaf+B4eGOEayfDGRG1OiI=;
 b=pil3ra2z4NzHOEWDwqdYpvvMToF6QC2ztH+MnwIc2yRK+zjcTEDUQl/CwcdXuGlYB4
 jRO1xjpVJEqqjViVD5z+ZHYfvqMzeH3O8HLLt+titji8MyovIylLRfcVVYmZkhmPSFc3
 zVruuA/Na7lFQkAr2BQYvTmYDdIz2irqg7qTxEIIXnq2G4NB6xLrNxyNiBhmo8biJWFv
 ZBv+eVgnO4IdiABxOZBGeDUWmBbK0c+xD1G5FjR6PuN8yxk8tqeCFMQnmTUm9Skod2s/
 WxelzSXYqnnFmRPzwVrihy9pfI4CUjGHjZnTBLQvCrMIgShXw8ZsCLg4oAR+GSxgl7dJ
 PNoQ==
X-Gm-Message-State: AOJu0YwQtPNsIIRKEtj/G1ZlAJXD/QA7dY05af1gfMY6kAsTQIdQNQbo
 8ufuShrXvT77W/ID9twaGCQP4rAI+OzFJw31dwaxBEdgJuMhaB0QZ/x/KYtwraSdlsUpm5x6MDK
 tW8bVTH/+cCf3YbkzKQPqS096mgtI0ARa
X-Google-Smtp-Source: AGHT+IFjbEXkd5W5KzprX6wnJnoCs10RGaExypgAa7TII0iJzXKlsJt0wu7scLiiCltJF/lBkE7NawWYGn/bvUy6CBI=
X-Received: by 2002:ac2:4288:0:b0:511:5087:36f3 with SMTP id
 m8-20020ac24288000000b00511508736f3mr4111193lfh.53.1707728432498; Mon, 12 Feb
 2024 01:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20240206132051.2838897-1-yegorslists@googlemail.com>
 <ZcI0bZt04f3jRhPk@landeda> <67502ba4-3f73-428e-802e-6ee9cbc1fe6a@mind.be>
In-Reply-To: <67502ba4-3f73-428e-802e-6ee9cbc1fe6a@mind.be>
Date: Mon, 12 Feb 2024 10:00:20 +0100
Message-ID: <CAGm1_kthjzi2yHBeo9uBd_ojW2FjY-i4USEgUV0QHL5G0=8Z5w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1707728433; x=1708333233; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDIJhkWL4ND8EZXqVXTsSizaf+B4eGOEayfDGRG1OiI=;
 b=JOAdszCcgmPcDummlx0u9dEbnohgcvBT2FuvUrxKJfNGslEB9STLVMQ6fvE615OsLG
 jTy6diJWKL0Yiw5pNERtLebfJVBReshh63C4d1MpZk+/zsk75Z0SuIJ9xC7TgAF95my1
 FoEM1ga7uGSlR+btNM4Om1ts0mbyVK0FHCl/Fq+keSN/kF3e2/F3BmTy/8XTjFpuU4Ml
 0ARHoxxt0gfPPrL8r3sB7092rxAxucw9xqPDleWEI+ASikXXrE0baHoDtRdtJvpMF7di
 V+Mvs/6xP51epGFuz1YkMm6IPdmp6fgBIg8ndlJ/JXfimbPVqchjpb1fiM3wROE+z5wY
 teyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JOAdszCc
Subject: Re: [Buildroot] [PATCH] Create a .gitignore file in the CANONICAL_O
 directory
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFR1ZSwgRmViIDYsIDIwMjQgYXQgMjozN+KAr1BNIEFybm91dCBWYW5kZWNh
cHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+Cj4gT24gMDYvMDIvMjAyNCAxNDoz
MCwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiA+IFllZ29yLCBBbGwsCj4gPgo+ID4gT24gMjAyNC0w
Mi0wNiAxNDoyMCArMDEwMCwgeWVnb3JzbGlzdHMtLS0gdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVz
bHk6Cj4gPj4gRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29t
Pgo+ID4+Cj4gPj4gVGhpcyAuZ2l0aWdub3JlIGZpbGUgaWdub3JlcyBhbGwgZmlsZXMgaW4gYW4g
b3V0cHV0IGRpcmVjdG9yeSBhbmQKPiA+PiBoZW5jZSBkb2Vzbid0IGNoYW5nZSB0aGUgZ2l0IHN0
YXR1cy4KPiA+Pgo+ID4+IFJlbW92ZSAiL291dHB1dCIgZW50cnkgZnJvbSB0aGUgbWFpbiAuZ2l0
aWdub3JlIGZpbGUgYXMgaXQgaXMgYWxyZWFkeQo+ID4+IGhhbmRsZWQgYnkgdGhpcyBnZW5lcmFs
IGFwcHJvYWNoLgo+ID4KPiA+IFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gYWNoaWV2ZSB3aXRoIHRo
aXMgdGhhdCBkb2VzIG5vdCB3b3JrIGN1cnJlbnRseT8KPgo+ICAgSSB5b3UgZG8gYG1ha2UgTz1v
dXRwdXQtdGVzdC1teXBrZ2AgKHdoaWNoIEkgZG8gcXVpdGUgYSBsb3QpLCB0aGF0IG91dHB1dAo+
IGRpcmVjdG9yeSBkb2Vzbid0IGdldCBpZ25vcmVkIGJ5IGdpdC4gV2UgY291bGQgaWdub3JlIG91
dHB1dCogYnV0IG1heWJlIHlvdSBuYW1lCj4gdGhlIG91dHB1dCBkaXJlY3Rvcnkgby1mb28gb3Ig
c29tZXRoaW5nLgo+Cj4gICBQdXR0aW5nIGEgLmdpdGlnbm9yZSBpbiBhIGdlbmVyYXRlZCBkaXJl
Y3RvcnkgaXMgYSB2ZXJ5IGVsZWdhbnQgc29sdXRpb24gZm9yCj4gdGhhdC4gSXQgaXMgdXNlZCBi
eSBlLmcuIHZpcnR1YWxlbnYsIHB5dGVzdCwgYW5kIGEgbG9hZCBvZiBvdGhlciBhcHBsaWNhdGlv
bnMKPiB0aGF0IGdlbmVyYXRlIG91dHB1dCBpbiBhIGRpcmVjdG9yeS4KPgo+ICAgU2luY2UgdGhl
IC5naXRpZ25vcmUgaXMgY3JlYXRlZCBpbiB0aGUgb3V0cHV0IGRpcmVjdG9yeSwgaXQgaXMgbm8g
bG9uZ2VyCj4gbmVjZXNzYXJ5IHRvIHB1dCBvdXRwdXQvIGluIHRoZSAuZ2l0aWdub3JlIGZpbGUu
Cj4KPgo+ICAgQWxsIG9mIHRoZSBhYm92ZSBjb3VsZCBiZSBwdXQgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLCBvZiBjb3Vyc2UsIGJ1dCBmb3IgbWUKPiBZZWdvcidzIGNvbW1pdCBtZXNzYWdlIHdhcyBz
dWZmaWNpZW50bHkgY2xlYXIgOi0pCgpXZXJlIHdlIGFibGUgdG8gY29udmluY2UgeW91PwoKUmVn
YXJkcywKWWVnb3IKCj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPgo+ID4KPiA+IFJlZ2FyZHMs
Cj4gPiBZYW5uIEUuIE1PUklOLgo+ID4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1v
diA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPj4gLS0tCj4gPj4gICAuZ2l0aWdub3Jl
IHwgMSAtCj4gPj4gICBNYWtlZmlsZSAgIHwgMyArKysKPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvLmdp
dGlnbm9yZSBiLy5naXRpZ25vcmUKPiA+PiBpbmRleCBiYjAyZDlmNTcyLi4xNGI3Y2E1MDQwIDEw
MDY0NAo+ID4+IC0tLSBhLy5naXRpZ25vcmUKPiA+PiArKysgYi8uZ2l0aWdub3JlCj4gPj4gQEAg
LTEsNCArMSwzIEBACj4gPj4gLS9vdXRwdXQKPiA+PiAgIC9kbAo+ID4+ICAgLy5hdXRvLmRlcHMK
PiA+PiAgIC8uY29uZmlnLmNtZAo+ID4+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxl
Cj4gPj4gaW5kZXggYWM2MjUxNTJjNi4uODZkNDQ0NDc0NSAxMDA2NDQKPiA+PiAtLS0gYS9NYWtl
ZmlsZQo+ID4+ICsrKyBiL01ha2VmaWxlCj4gPj4gQEAgLTYzLDYgKzYzLDkgQEAgaWZuZXEgKCQo
ZmluZHN0cmluZyBALCQoQ0FOT05JQ0FMX08pKSwpCj4gPj4gICAkKGVycm9yIFRoZSBidWlsZCBk
aXJlY3RvcnkgY2FuIG5vdCBjb250YWluIGEgJ0AnKQo+ID4+ICAgZW5kaWYKPiA+Pgo+ID4+ICsj
IENyZWF0ZSBhIGRlZmF1bHQgLmdpdGlnbm9yZSBmaWxlIHRoYXQgaWdub3JlcyBldmVyeXRoaW5n
Cj4gPj4gKyQoc2hlbGwgZWNobyAiKiIgPiAiJChDQU5PTklDQUxfTykvLmdpdGlnbm9yZSIpCj4g
Pj4gKwo+ID4+ICAgQ0FOT05JQ0FMX0NVUkRJUiA9ICQocmVhbHBhdGggJChDVVJESVIpKQo+ID4+
Cj4gPj4gICBSRVFfVU1BU0sgPSAwMDIyCj4gPj4gLS0KPiA+PiAyLjM0LjEKPiA+Pgo+ID4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+ID4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
