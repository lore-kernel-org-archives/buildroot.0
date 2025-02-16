Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C09CC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5117780EBB;
	Sun, 16 Feb 2025 21:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSsWeHYIBowI; Sun, 16 Feb 2025 21:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58DD980ECB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DD980ECB;
	Sun, 16 Feb 2025 21:37:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D3DBC8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C5A780C51
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 21:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y95-0Ansogp4 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 21:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 149ED80EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 149ED80EBB
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 149ED80EBB
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 21:37:34 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-abb892fe379so121489566b.0
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739741852; x=1740346652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVgduNFpQfo6wC1O1SpSI/TRCC6Su3xSRp4ijTJUAXI=;
 b=YopirkPOkUVbGiM5fqKosaw50TEk6RCgsQ7FwcMlQpbYe5N3LXLePzfZqiAcP8yiT8
 BSYA0smlnf5KS/qVTITpwNYf/Lh2NVUtRcDrGnfdDVyaLo5Obku8TqJUcuGfFSII96M3
 nU0ZDE2kVTS/yAnj8XKQP7dtO3fB6/2xjTB7GLHTt5Ip5iaq/fmKH7w0oblx6U0u40mk
 Z6Pyv/vskJ50O/nYl+gFYQe6d08PMqa/5o37kbEfDX4XWIn2ZpYip5uQmz/65li1EkZT
 VmNkH40dhKakGot/0SagqPOR9EY6G9GGgQ++Ry530DADIzsrWAZ8MFC8sRW4r4rmUy1K
 S+mg==
X-Gm-Message-State: AOJu0YzLz5P0byTo3zaBsSKjLwlJpy+FOAfHjhCvQ+bM7Mq9fRUeCUgV
 laS5oyfz4wxWaohL1yZFzLUXVT1Fm9IxMijLx6Cw0UwkJeOXwBrUQ/vm40dPyZA1vALiinA5QC9
 9IOjGoPE9jUjwx2p7ogefLsuiQmyOTJN6
X-Gm-Gg: ASbGncsA1/Uf9OcZdU5IF50ziADEW9fadDT5ac6TeMXGt/S7siKwQBTOKNeQFjjg/xc
 aTzOt2nkgYQCckEwgbrMoFhgi8J81SKkxx7vhwMEgJaCzVJ0c8G0+Uus4BW/piFPcCRK5VMcN1J
 8Xlg3xHDWg6nJZb3zGT4PFR6R4dqN5Hgs=
X-Google-Smtp-Source: AGHT+IEQ28kdvtF1uwmbfhnW869KqyACvVr0brv9z2lGMYTSPRcx+MZQfrXuyjMKMXKf3f1fcGH/q/3OgD+CGsu7duc=
X-Received: by 2002:a05:6402:4609:b0:5e0:2ea2:e583 with SMTP id
 4fb4d7f45d1cf-5e03605b96fmr19077886a12.14.1739741852009; Sun, 16 Feb 2025
 13:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20250216153853.2706304-1-gilles.talis@gmail.com>
 <127ace9e1e61db91550aae3a36283b59@free.fr>
In-Reply-To: <127ace9e1e61db91550aae3a36283b59@free.fr>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 16 Feb 2025 17:37:20 -0400
X-Gm-Features: AWEUYZnPL1viQwDDVmCRGJmwoWdWgJVjgLJSOyWsTETprxFTcXhb-r_Nlc7zwH4
Message-ID: <CAKcgs2xb=Q=RyEB6847hkvb8hL2p7z2RWe1ysn+JkNoW3AdC5g@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739741852; x=1740346652; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVgduNFpQfo6wC1O1SpSI/TRCC6Su3xSRp4ijTJUAXI=;
 b=HguQ1eW/qfHLQe5egE+E66N5qRSVk9MdGEb9yomlag2j4CIe2TMItNxcGQ8pCAbQRN
 IixwKUthPbKL+ztD+4cBfK3k9uUIXw1MJzM6OviWCo61bgC1WI2P/zxP3aNAM2Q7fC5B
 Q9WnMfAiHI/L35LTLa9yVlbKonQaIbEuuautZaczp5FvJVnqSHRljA8pT5s1gKHYZdE5
 0s88XFK66ICFUVWz1/3UqyhuBsaZQNXRAC4DnqbEC9nbNPgJUaIz+3Bri5BWAQfb+4bg
 G+jTqpgjxX5sDuJzuJCNow1GRIoyUP3QAkjr5rvzUstDFeQSE5BLUOkwueOm9d1UOL2R
 wTDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HguQ1eW/
Subject: Re: [Buildroot] [PATCH] configs/polyhex_debix_model_a_defconfig:
 new defconfig
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

SGVsbG8gSnVsaWVuLCBhbGwKCkxlIGRpbS4gMTYgZsOpdnIuIDIwMjUgw6AgMTQ6MTQsIEp1bGll
biBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEhpIEdpbGxlcywKPgo+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoIQo+Cj4gT24gMTYvMDIvMjAyNSAxNjozOCwgR2lsbGVzIFRhbGlz
IHdyb3RlOgo+ID4gVGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFBv
bHloZXggRGViaXggTW9kZWwgQSBTQkMKPiA+Cj4gPiBERUJJWCBNb2RlbCBBIGlzIGFuIGluZHVz
dHJpYWwgZ3JhZGUgc2luZ2xlIGJvYXJkIGNvbXB1dGVyCj4gPiBwb3dlcmVkIGJ5IE5YUCBpLk1Y
IDhNIFBsdXMgYXBwbGljYXRpb25zIHByb2Nlc3Nvcgo+ID4KPiA+IGh0dHBzOi8vd3d3LmRlYml4
LmlvL2hhcmR3YXJlL21vZGVsLWEuaHRtbAo+ID4KPiA+IC0gTGludXggS2VybmVsOiBVcHN0cmVh
bSB2ZXJzaW9uIDYuMTIuMTMKPiA+IC0gVS1ib290OiBVcHN0cmVhbSB2ZXJzaW9uIDIwMjQuMTAK
PiA+IC0gQVRGOiBVcHN0cmVhbSB2ZXJzaW9uIDIuMTIKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBH
aWxsZXMgVGFsaXMgPGdpbGxlcy50YWxpc0BnbWFpbC5jb20+Cj4KPiBJdCBnZW5lcmF0ZXMgZmV3
IGVycm9ycyB3aGVuIHJ1bm5pbmcgdGhlIGNvbW1hbmQ6Cj4gInV0aWxzL2RvY2tlci1ydW4gbWFr
ZSBjaGVjay1wYWNrYWdlIjoKPgo+ICAgICAgYm9hcmQvcG9seWhleC9kZWJpeC1tb2RlbC1hL3Bv
c3QtYnVpbGQuc2g6MDogcnVuICdzaGVsbGNoZWNrJyBhbmQKPiBmaXggdGhlIHdhcm5pbmdzCj4g
ICAgICBjb25maWdzL3BvbHloZXhfZGViaXhfbW9kZWxfYV9kZWZjb25maWc6MDogbWlzc2luZwo+
IEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVMKPgo+IENvdWxkIHlvdSBmaXggcG9zdC1i
dWlsZC5zaCBzaGVsbGNoZWNrIHdhcm5pbmdzIHBsZWFzZT8KPgo+IEFsc28sIGluIEJ1aWxkcm9v
dCwgd2UgYXJlIG5vdyBpbnRyb2R1Y2luZyBuZXcgZGVmY29uZmlncyB3aXRoCj4gQlIyX0RPV05M
T0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15IHRvIGNoZWNrIGFsbCBoYXNoZXMuCj4KPiBTZWU6Cj4g
aHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjX2FkZGlu
Z19wcm9qZWN0X3NwZWNpZmljX3BhdGNoZXNfYW5kX2hhc2hlcwo+Cj4gU2VlIGFsc28gYW4gZXhh
bXBsZSBjb21taXQganVzdCBlbmFibGluZyBoYXNoZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzRjYThmMGVhNzYyMDYxYWQwNDAxNmQwNjVm
MzdlMGMzNTFkNTc4ZjEKPgo+IENvdWxkIHlvdSBhZGQgdGhvc2UgY3VzdG9tIGhhc2hlcyBwbGVh
c2U/Cj4KPiBbLi4uXQo+Cj4gPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcG9seWhleC9kZWJpeC1tb2Rl
bC1hL2V4dGxpbnV4LmNvbmYKPiA+IGIvYm9hcmQvcG9seWhleC9kZWJpeC1tb2RlbC1hL2V4dGxp
bnV4LmNvbmYKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5l
ZDZiODgxNzcyCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9ib2FyZC9wb2x5aGV4L2RlYml4
LW1vZGVsLWEvZXh0bGludXguY29uZgo+ID4gQEAgLTAsMCArMSw0IEBACj4gPiArbGFiZWwgYnVp
bGRyb290Cj4gPiArICBrZXJuZWwgL2Jvb3QvSW1hZ2UKPiA+ICsgIGRldmljZXRyZWUgL2Jvb3Qv
ZnJlZXNjYWxlL2lteDhtcC1kZWJpeC1tb2RlbC1hLmR0Ygo+ID4gKyAgYXBwZW5kIHJvb3Q9UEFS
VFVVSUQ9JVBBUlRVVUlEJSByb290d2FpdCBydwo+Cj4gU2luY2UgdGhlIGZpbGVzCj4gYm9hcmQv
cG9seWhleC9kZWJpeC1tb2RlbC1hL2dlbmltYWdlLmNmZwo+IGFuZAo+IGJvYXJkL3BvbHloZXgv
ZGViaXgtbW9kZWwtYS9leHRsaW51eC5jb25mCj4gYXJlIGluIGZhY3QgdGVtcGxhdGVzIHRoYXQg
eW91IG1vZGlmeSB3aXRoIHNlZCBpbgo+IGJvYXJkL3BvbHloZXgvZGViaXgtbW9kZWwtYS9wb3N0
LWJ1aWxkLnNoLCBjb3VsZCByZW5hbWUgdGhvc2UgdG8KPiBib2FyZC9wb2x5aGV4L2RlYml4LW1v
ZGVsLWEvZ2VuaW1hZ2UuY2ZnLmluCj4gYW5kCj4gYm9hcmQvcG9seWhleC9kZWJpeC1tb2RlbC1h
L2V4dGxpbnV4LmNvbmYuaW4KPiBwbGVhc2U/Cj4gVGhpcyB3aWxsIHJlZHVjZSBjaGFuY2VzIG9m
IG1pc3Rha2VzIChlLmcuIHVzaW5nIHRoZSBmaWxlcwo+IHdpdGhvdXQgcHJvY2Vzc2luZyB0aGVt
KS4KPgo+IEJlc3QgcmVnYXJkcywKPgo+IEp1bGllbi4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEK
SSBoYXZlIGFkZHJlc3NlZCBhbGwgeW91ciBjb21tZW50cyBhbmQgd2lsbCBzZW5kIGEgdjIgc2hv
cnRseS4KVGhhbmsgeW91IQpyZWdhcmRzCkdpbGxlcy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
