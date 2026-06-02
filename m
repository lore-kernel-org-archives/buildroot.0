Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943F7CD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 05:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB4B60B0D;
	Tue,  2 Jun 2026 05:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-zPYhKiMX-h; Tue,  2 Jun 2026 05:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9062860B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780378287;
	bh=Kr1I/BWVifrHm78XG0ZKRAA0ZjdmaRv0UkOsDtXuGYU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NRxfyA20147PnNX69y1fhTYOkzziDstSDXibS93HQMlG+B+EkD506qkitmHno6E52
	 Vue8q3hjB2ZZuJAUy/NulPxhsMm4oA6f415PoOv27nGuW4GTxogHkHX50kpFzFYMaR
	 IZbl3a5HsLoRlbUP+7/2UMOn35kk6+xcwMeo8yRqV3qtZ2HFr2wlqfr1zSkPuaKZyV
	 oIeTywBAPWS4LwFNJs79Zcaw+wQ+dqXg43cSiJe2zShikwL4jrJknO9EXHA9R4fDzG
	 9lFTs4/Od4gYCDQPa5e+OcLiEWdKqjnwTtVsziCj0qz8QSnW6vq8HG1h1Y6eE0URUj
	 KinZUUrGIV+oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9062860B02;
	Tue,  2 Jun 2026 05:31:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D10BF4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8341160B02
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVjmmfzpze3f for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 05:31:26 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1229; helo=mail-dl1-x1229.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BAAE960AFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAAE960AFF
Received: from mail-dl1-x1229.google.com (mail-dl1-x1229.google.com
 [IPv6:2607:f8b0:4864:20::1229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAAE960AFF
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:31:24 +0000 (UTC)
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-132d1b2519eso16396160c88.0
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 22:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780378284; cv=none;
 d=google.com; s=arc-20240605;
 b=TDjESDcupp3gCBp1OPTkRAo/UQ4WM1zMWa3/WbPBLtJROH+80A+7AGW80wM7wDjNWb
 H1RxiQIRzeofh1jvYowYkyuGriZgeRIvsk7ersApf4G873NBsoHrzhiTQcPOb3J/41Mr
 4UoiaUeypwJrAdmSPJeo7wmjmwFl4B+G+iaOQO7vdKucTgW9xBxkEucuz6HDg9U2NxAI
 HEeLYyb1ygNoc0CQ0Tv+MLyeDeDIfX10F23GcLVzgIVEyTEZHqm6WD0Y5opscAedUeYH
 5hkTaYt9V7JRQWrEp+K0vpmfDUNvc/SPj0dG5eoNYnGeDkDoIuK7nA7RyfKsROZrvTd5
 7+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JRVlkCUbLu0dXAP6UnQ+DLGW3ma4LgKnXmOssWBSNLI=;
 fh=G+BApR6a1k4WQ8lAI0seMFlwgW+/m75xF12lAHKyhYI=;
 b=kxeCu16p7KuffgqpNM28Zdy2diiR8lEAZhW3ciBpc70lksSUTc5CZKuH6NzlTXu5OL
 76xVjI8Ew5tuX5zwJvqdAUKmtJGbPvlKA7A1FFKENJeel4aFmMDuel1jReVTlehH3JYk
 P6UlmJ7txf36ZSjcI+0LGMkxafPclMRPjJZf2B/O6qeb+0VWObUS5rTNQHTeHHuFjpxS
 DVympp6n1DDOV4g+euMwEXydhit6Ik+3UDk0v8PcIS9DvZJaCoDsC0naVDq0tUGLz4wO
 BMiiWFqSsll8VbMgU+VNCm8BXfTT9e8tpd+THJfv+JgtOElimvOeNMBpKGfMkUfh+prs
 Xtaw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780378284; x=1780983084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JRVlkCUbLu0dXAP6UnQ+DLGW3ma4LgKnXmOssWBSNLI=;
 b=SccCqfhYbwvbHppr8go1WahUfcSuPwuIza7KFAIeXdV1AxxFyMZ1i99CDw/D/F6ZrO
 hqDfHJH6uXbitzwjB/JGkof+tp8eePg96jvRXbaU3lklYtslFwXUjEVVikWOjdojtA9e
 L8fLjkRd9SLGEQYT6zXqFrCeif3Lp17hCph2U0mBj4wThaeiP7mEmOUApxTfkzPggTVL
 h87C6sGlTWWhugRrGiWxwGQifCBmN1hHIVwevyp/Gik8lLmCMwcjuJTmOAf7VNSEjpxz
 pADvgSSislLXscYWNj/FzICltMolTaKf5L7tQtWB8FOBOQpnKNJIrsHA053WXU2Q+yvh
 HuuQ==
X-Gm-Message-State: AOJu0YwNgXLX1yntUPP7rUl47jAqXBrXlBISg2NGIy5MVm9qUiVtwsHM
 BOzaXl5oPEwQqaH4JkDaiGQeuFpJIDysNy3LVwIL4hMCmnMNLYJ7rU8FpwsPxl+OoxuVqL0HFCE
 KZ2+L0ODLATiTjEo07ilLTu4eF37/82dwbd6lD5oQ0w==
X-Gm-Gg: Acq92OHsvwQ2OTNQKELCe/3B2S40DjoxaJI8QT0UHtvwmE5U3UzTf5/3e0ZPwjPcAy0
 WsGXDs/cWZ/ZLogB1Z5ctTq0RNQYyjcDRBjsST5SjrbqfFFeMBmdm+3rRftdfqLrp67B6WF2H0V
 pUMi1lLY/EDkw03daU/aaI1hFIFjL59qZPY6esj9EWbH1SWG17oDT+Nn0MW6MEaoXUOrDhi1PSy
 U2NQI1BP41qjkYiFrZx0WhnNkK4ElGFMp4EBnxkf3ua3jcxt/fbAPcNxny/76knKhI56DEzsi4k
 ubE2kB1Qz3USvCBeQQ==
X-Received: by 2002:a05:7022:238c:b0:12b:ebb9:1c18 with SMTP id
 a92af1059eb24-137d4243a4cmr6466681c88.31.1780378283747; Mon, 01 Jun 2026
 22:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-4-j@j-ernberg.se>
 <7085d622-123f-4a91-b473-51d1755a5b4f@rnout.be>
In-Reply-To: <7085d622-123f-4a91-b473-51d1755a5b4f@rnout.be>
From: John Ernberg <j@j-ernberg.se>
Date: Tue, 2 Jun 2026 07:31:12 +0200
X-Gm-Features: AVHnY4KpjFH7vxgdGhZu6FL9C0HJ8dgZ6XFl-U9_oG4pZCk3W3e-Iksr1D5Gc5E
Message-ID: <CAAHg4ZhGY_hSgDxswcRN40X5ExBdBoCcFfY1Vsh=PDFvX6Hu_w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780378284; x=1780983084;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRVlkCUbLu0dXAP6UnQ+DLGW3ma4LgKnXmOssWBSNLI=;
 b=k8xxGilHXfRsYB6ANCj1pkBCeK2I7cYRn+GNOh5n1zKsK4fMoyEI3WasT1gKGRv1Ff
 NqQ0qqN0O/4SNkEuGwWMeDp8ha7IexoYlxvOo9+ecUAatnpxsPhxIbk1LsiB+LNQkMs9
 LD3AoQdKSfSpMZSCRjhqbMv6fT/i2MoxRATXGPwADSIvegUgRHBepyITizr7Y6uylsjV
 eATSh6p0Qk/Cv2cZ46RVPF12IwX0H4+f5J4qOcNYGmyPGem+n1PoiavfPyBJQKn+aX76
 u3TJA7RjBwiADaYFSnaDgnwkWXNRpaRb+Xf19AF3z0b7npr1MxFvWxLtG56PsSj7DtRO
 lusA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=k8xxGilH
Subject: Re: [Buildroot] [RFC PATCH 3/9] package/rtl8188eu: Select
 linux-firmware for the firmware
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

SGkgQXJub3V0LAoKT24gTW9uLCBKdW4gMSwgMjAyNiBhdCAxMToxNeKAr1BNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+IHdyb3RlOgo+Cj4KPgo+IE9uIDAxLzA2LzIwMjYg
MjI6NDcsIEpvaG4gRXJuYmVyZyB3cm90ZToKPiA+IER1ZSB0byBwYXJ0aWFsIHJ0bDgxODhldSBz
dXBwb3J0IGluIHRoZSB1cHN0cmVhbSBMaW51eCBrZXJuZWwKPiA+IGxpbnV4LWZpcm13YXJlIHBh
Y2thZ2VzIHRoZSBmaXJtd2FyZSBmb3IgdGhpcyBjaGlwIG5vdy4KPiA+Cj4gPiBJdCdzIHBhY2th
Z2VkIHVuZGVyIHRoZSBzYW1lIGZpbGVuYW1lLCBidXQgaXMgYSBsYXRlciB2ZXJzaW9uICh2Mjgp
IGZyb20KPiA+IDIwMTcgWzFdIHdoaWxlIHRoZSBmaXJtd2FyZSBibG9iIGJ1bmRsZWQgaW4gdGhl
IHJlcG9zaXRvcnkgaXMgZnJvbSBvdmVyIDEzCj4gPiB5ZWFycyBhZ28gWzJdLgo+Cj4gICBJdCdz
IHZlcnkgbGlrZWx5IHRoYXQgdGhlIGRyaXZlciBkb2Vzbid0IHdvcmsgd2l0aCB0aGUgbmV3IGZp
cm13YXJlIGJsb2IuCgpJJ20gaG9waW5nIHNvbWVvbmUgbGlrZSBHaXVsaW8gb3IgTHVjYSBtYXli
ZSBoYXMgYSBib2FyZCB3aXRoIHRoaXMgY2hpcCBvbgphbmQgdXNlIHRoaXMgZHJpdmVyLCBhbmQg
Y2FuIHRlc3QgdGhpcyBwYXRjaC4gQmVjYXVzZSB0aGUgdXBzdHJlYW0gZHJpdmVyIGFuZAp0aGlz
IG9uZSBjYW4gY28tZXhpdCBmaWxlbmFtZSB3aXNlLgo+Cj4gICBJIHRoaW5rIHRoZSBwcm9wZXIg
c29sdXRpb24gaXMgdG8gZm9yY2UtZGlzYWJsZSB0aGUgdXBzdHJlYW0gdmVyc2lvbiB3aXRoIGEK
PiBLQ09ORklHX0RJU0FCTEVfT1BULgoKVGhhdCBpcyB0aGUgb3RoZXIgb3B0aW9uLCBhbmQgYWxz
byBhZGQgYSBLY29uZmlnLWNoZWNrZWQgY29uZmxpY3QgYmV0d2VlbgpsaW51eC1maXJtd2FyZSdz
IHJlYWx0ZWsgZmlybXdhcmVzIGFuZCB0aGlzIHBhY2thZ2UsIGFzIHRoZXkgYXJlIGluc3RhbGxp
bmcgdGhlCnNhbWUgZmlsZW5hbWUgYnV0IGluY29tcGF0aWJsZSBmaWxlcy4KCkxldCdzIGdpdmUg
aXQgdGhlIHdlZWsgYW5kIHNlZSBpZiBhbnkgdGVzdCByZXN1bHRzIGNvbWUgaW4sIG90aGVyd2lz
ZSBJIHdpbGwgZ28KdGhpcyByb3V0ZSBpbnN0ZWFkLgoKVGhhbmtzISAvLyBKb2huIEVybmJlcmcK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
