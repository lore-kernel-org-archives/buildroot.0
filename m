Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078B3CF45D2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 21:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C3E6110B;
	Mon, 12 Jan 2026 21:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LBVDATyDYmc; Mon, 12 Jan 2026 21:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E59A60BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768253881;
	bh=BSoSEKOpNVtlJMQ0M7K/Hq/Hccb4FEp10yLT7bs6g8I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YqYcjACfJzYwfj7+l12ljPMhqPTq6wpBbMJdIzihIIpIGLuoSS/iFYzvGL0TXursn
	 pRYdi3DwO4OqZGaGJKiSb+Bd8mdByCLW2xwxNBjNqarVIesmSjiS0YLVvn1swEQOti
	 KLFYSQ2KQepZVfYKp3g+uXpQEQf1UR0DIogeqefA3U8XoKU6EKqxqX8SYrW7OFX463
	 Zjd1DFWY1AsrBepP7Ud0nummNp78LxUxZrj78GFhdK4F9HkmJ7aDhnr1875+efIY02
	 ETCaJCiOryXrwX0jBsVrFUxHOU5QCS7/r2qaPm10b7eZ/svnmqaREvj9d6tv2iUwj9
	 OXPEuL51agJ/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E59A60BE5;
	Mon, 12 Jan 2026 21:38:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4FB11CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA38D8429A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98fJmlu3hENF for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 21:37:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B78D284211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B78D284211
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B78D284211
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:37:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4327555464cso4127005f8f.1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 13:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768253876; x=1768858676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fgeTmt3Uqs1bGLIhVJOGkFh2zTvJTNoDn2PNKAzKdTk=;
 b=rRnJAWQIEUg/fkM61stwiYecBiXMGph6f2xWR0/eD0m2u+xxJaWDp3BmmK5ZwEJW+d
 Bapu6UmD0LXN0NN37Mge9VsKCvP7E3dIAwiJZFhUDFywuHiUmHlQGlbD61pvwpFqO+EA
 yrnLo0iPKUmV7w9lW9+A+EQsONdcCiJtSZ82S962FTgplWTR2yiRhyNl74Y83oIRcTM0
 oOqS6cCOFEY6q2ldVKVaXyxQoN1Nr5BS/AzD1hDgizOXIklEBzTIzlZe1XUvBmgr7HFt
 vqO4vgI8zTkWwf8KU+h11ohUcjQX5EOYQotW+RPV36IxkjKjlC0YnRRL6dy1mDYi/9MO
 AHxA==
X-Gm-Message-State: AOJu0YwW4x+e1ywL7S3vAZzYhlsTbShnVvXoZWEYpb6KzhrUAuQPc+iC
 0QX76XKHr6v4XSKGD5JjgL2IbGp+vzRur9H8Qb9zaYOqkHKgAYr/i7c/TBMvvN/aJdst8fgc1Ef
 NO2fLu0Y0QuwxGQCBHjWCdBtg/tBX7c4=
X-Gm-Gg: AY/fxX4iPuqa9Sc94eC691UsnVW3VNK+BBo/W1sRRPB3DfcNPX1XGTLq7qcnn9i4FZY
 RXyninTFzZ9UJOBgpFIpIXZ/GWs72SCuFJMFnJMXQOPVz7b/SdYYhfkw2TCEPAfPYdSXpY1On8/
 KirLHV4vFSvZf1DQ+ePDfrX1pbyqEPajtVxCOctsQx/iL/iiGM4KUbuVukA6poBFP1HVzOsC5Wn
 bdOpDU/EDyIjpSBxkLGZ/AXQ1ckeYAZm7Ur21298Qfk+DvZcMAbQLwbE8aRjURl60PRsTkHoDrY
 JEKcbA==
X-Google-Smtp-Source: AGHT+IGDTXAa4PaxNCDmOxQwmxa/9BbmVZ0PY1MQGzJbXK+uNpWcX6RNJ5wciWUubA4HnJ+pxPxeaXwsdIfYvGlooRM=
X-Received: by 2002:a05:6000:24c6:b0:430:f742:fbb4 with SMTP id
 ffacd0b85a97d-432c37a4f66mr22287060f8f.43.1768253876299; Mon, 12 Jan 2026
 13:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20250805025930.315021-1-Mr.Bossman075@gmail.com>
 <20250805025930.315021-2-Mr.Bossman075@gmail.com>
 <20260106224115.4f44da16@windsurf>
In-Reply-To: <20260106224115.4f44da16@windsurf>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 12 Jan 2026 16:37:20 -0500
X-Gm-Features: AZwV_Qj98hA6E8HHGj-BiBdMfxduxbSBj7ZTyXx3GzASRJHwB0E0iC26S_gW6Zo
Message-ID: <CAJFTR8R0yevWtPUX7qk=us6cnpHdZodnWs_hGc804c=B3ThAqQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768253876; x=1768858676; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgeTmt3Uqs1bGLIhVJOGkFh2zTvJTNoDn2PNKAzKdTk=;
 b=cCDKolaaAhoT4sv0QyA9BmsSsDcqNjk9g9YKHZQKNN22Whv0R67opZKH2GX2rMb288
 qtbYOG+uTGmhBv+CbyaiLuVQk6s+m1pY59QbKMs7ME2FbzsG/Ih7dSFD4y9d7H7243aS
 GZPRdK0rz69J4tsdGDx9s7tjnG3TlVfj9E/LZz6erwewGK4GnNt6tKcMNscCQcV/O1W0
 IbQrglro95RYvvLyxNe5Bub1Pa6Bc9lajqpZSFqCri3R6LIYH1RvVHo/vSVdS0EM7KXK
 1l1mcouWu+5RZ9y1kQ84M7NwslaKE5aiwH9uPmh31tvGa+CBz2rJBwN4kL0wd9+i/Qx5
 QcMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cCDKolaa
Subject: Re: [Buildroot] [PATCH 2/2] package/picotool: Add host-picotool
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA0OjQx4oCvUE0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBKZXNzZSwKPgo+IE9uIE1v
biwgIDQgQXVnIDIwMjUgMjI6NTk6MzAgLTA0MDAKPiBKZXNzZSBUYXViZSA8bXIuYm9zc21hbjA3
NUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBBZGQgYSBob3N0LXBpY290b29sIHBhY2thZ2UgdG8g
cGljb3Rvb2wuCj4gPiBUaGlzIHdpbGwgYWxsb3cgdXNlcnMgdG8gYnVpbGQgcnBpIHBpY28gYXBw
bGljYXRpb25zIG9uIHRoZSBob3N0IHN5c3RlbS4KPgo+IEJ1dCB3aGF0IGlzIHRoZSB1c2UtY2Fz
ZSBmb3IgdGhhdD8KCklmIGEgYm9hcmQgY29tZXMgd2l0aCBhIHJwMjA0MCBvciBycDIzNTAgYW5k
IHlvdSB3YW50IHRvIGJ1aWxkIHRoZQpmaXJtd2FyZSBmb3IgaXQgaW5zaWRlIG9mIGJ1aWxkcm9v
dCB5b3UgbmVlZCBwaWNvdG9vbCBvbiB0aGUgaG9zdApzeXN0ZW0uIFRoZSB0YXJnZXQgY2FuIHRo
ZW4gdXNlIGl0cyBwaWNvdG9vbCB0byBmbGFzaCB0aGUgZmlybXdhcmUgaW4KdGhlIHJvb3RmcyB0
byB0aGUgcGljby4KWW91IGNhbiBhbHNvIHVzZSB0aGUgaG9zdCBwaWNvdG9vbCBkaXJlY3RseSB0
byBmbGFzaCBmaXJtd2FyZSB0byBhIHBpY28uCgpNb3N0IG9mIHRoZSByZWFzb24gd2h5IEkgdGhp
bmsgdGhpcyBpcyBhIGdvb2QgYWRkaXRpb24gaXMgYmVjYXVzZQpwaWNvdG9vbCBhbmQgdGhlIHBp
Y28tc2RrIGFyZSBhbHJlYWR5IGluIGJ1aWxkcm9vdCBhbmQgaGF2aW5nIGEgc2Vjb25kCnZlcnNp
b24gaW4gQlIyX0VYVEVSTkFMIGlzbid0IGEgZ3JlYXQgc29sdXRpb24uCgo+ID4gQWxzbyBhZGQg
Y21ha2UgYXMgYSBkZXBlbmRlbmN5IHRvIHRhcmdldCBwaWNvdG9vbC4KPgo+IE5vcGUgdGhpcyBj
aGFuZ2UgaXMgbm90IGNvcnJlY3QsIHRoZSBob3N0LWNtYWtlIGRlcGVuZGVuY3kgaXMgYWxyZWFk
eQo+IGhhbmRsZWQgYnkgY21ha2UtcGFja2FnZSwgaWYgbmVlZGVkLgo+Cj4gPiAgUElDT1RPT0xf
VkVSU0lPTiA9IDIuMS4xCj4gPiAgUElDT1RPT0xfU0lURSA9ICQoY2FsbCBnaXRodWIscmFzcGJl
cnJ5cGkscGljb3Rvb2wsJChQSUNPVE9PTF9WRVJTSU9OKSkKPiA+ICtIT1NUX1BJQ09UT09MX0NP
TkZfT1BUUyA9IC1EUElDT19TREtfUEFUSD0kKEhPU1RfRElSKS91c3Ivc2hhcmUvcGljby1zZGsK
PiA+ICtIT1NUX1BJQ09UT09MX0RFUEVOREVOQ0lFUyA9IGhvc3QtbGlidXNiIGhvc3QtcGljby1z
ZGsyIGhvc3QtY21ha2UKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5eIHNkazIgPwo+Cj4gQWxzbywgZHJvcCBob3N0LWNtYWtlLgo+
Cj4gPiAgUElDT1RPT0xfQ09ORl9PUFRTID0gLURQSUNPX1NES19QQVRIPSQoU1RBR0lOR19ESVIp
L3Vzci9zaGFyZS9waWNvLXNkawo+ID4gLVBJQ09UT09MX0RFUEVOREVOQ0lFUyA9IGxpYnVzYiBw
aWNvLXNkawo+ID4gK1BJQ09UT09MX0RFUEVOREVOQ0lFUyA9IGxpYnVzYiBwaWNvLXNkazIgaG9z
dC1jbWFrZQo+Cj4gc2RrMiA/CgpJJ20gaG9uZXN0bHkgbm90IHN1cmUgaG93IEkgbWlzc2VkIHRo
YXQuIEl0IGlzIHRoZXJlIGJlY2F1c2UgSSB3YXMKb3JpZ2luYWxseSB1c2luZyBCUjJfRVhURVJO
QUwgYW5kIG5lZWRlZCBhIGRpZmZlcmVudCBuYW1lLgoKVGhhbmtzLApKZXNzZSBUYXViZQoKPgo+
IEFsc28sIGRyb3AgaG9zdC1jbWFrZS4KPgo+ID4gIFBJQ09UT09MX0xJQ0VOU0UgPSBCU0QtMy1D
bGF1c2UKPiA+ICBQSUNPVE9PTF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5UWFQKPgo+IFNvbWUg
cmVvcmRlcmluZyB3b3VsZCBtYWtlIHNlbnNlIGhlcmU6Cj4KPiBQSUNPVE9PTF9WRVJTSU9OID0g
Mi4xLjEKPiBQSUNPVE9PTF9TSVRFID0gJChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSxwaWNvdG9v
bCwkKFBJQ09UT09MX1ZFUlNJT04pKQo+IFBJQ09UT09MX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UK
PiBQSUNPVE9PTF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5UWFQKPgo+IFBJQ09UT09MX0NPTkZf
T1BUUyA9IC1EUElDT19TREtfUEFUSD0kKFNUQUdJTkdfRElSKS91c3Ivc2hhcmUvcGljby1zZGsK
PiBQSUNPVE9PTF9ERVBFTkRFTkNJRVMgPSBsaWJ1c2IgcGljby1zZGsKPgo+IEhPU1RfUElDT1RP
T0xfQ09ORl9PUFRTID0gLURQSUNPX1NES19QQVRIPSQoSE9TVF9ESVIpL3Vzci9zaGFyZS9waWNv
LXNkawo+IEhPU1RfUElDT1RPT0xfREVQRU5ERU5DSUVTID0gaG9zdC1saWJ1c2IgaG9zdC1waWNv
LXNkawo+Cj4gU28gdGhhdCB3ZSBoYXZlOgo+Cj4gMS4gR2VuZXJpYyB2YXJpYWJsZXMgKGluZGVw
ZW5kZW50IGZyb20gaG9zdC90YXJnZXQpCj4KPiAyLiBUYXJnZXQgdmFyaWFibGVzCj4KPiAzLiBI
b3N0IHZhcmlhYmxlcwo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6
b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
