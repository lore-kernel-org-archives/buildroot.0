Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15416C54E64
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 14:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C30641607;
	Thu, 28 Mar 2024 14:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LboQY7Odt2i9; Thu, 28 Mar 2024 14:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B51894160A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B51894160A;
	Thu, 28 Mar 2024 14:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 594C01BF3ED
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 14:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 520E541607
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 14:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8Wrad16sVdH for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 14:32:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA06C41604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA06C41604
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA06C41604
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 14:32:40 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d485886545so16084611fa.2
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 07:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711636358; x=1712241158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9sd9TAmf633dcJri8N3KrveYn99imOKsBi0jzfGanI=;
 b=pbq9/NJGm+YxFR5dalZS3mmSe6mBilwq0LUU2B3mSjyYPOtfgGJrfShLe//uPMX0YQ
 B8mZB4pLwNCrfKAd3GljBxN4iuMdEzkPMlO1Hp4B7cZxPISsIm9tBPfgfWwRvRaBuHL3
 LbDK78VcqBl2YcMytj5EkHKqtZYRMvbgjiA1rJ9TAodQOK1lYibr7KZbH7g0YOr27DLB
 MtBQkfMplJARjZDmNQDo5dWI2CCShvtlBkJx6aqQj+a6PwBy9uNMrrcJ/SVVVxCUnfTW
 biH+TZQD/zq2l3zlvGSfZyMchLLsej3bvmbq2VQfZyq7jrPf887lqPRWcfn8alu6uuob
 FeFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrqP1/ydWwc87UXSticK+7IgWspHNRya8rmP0QwpE2kWR9y++WeLSY1zZ0WBimmqKGWSp67iVbR/cX8i5cHL6IezTW6iLXbA==
X-Gm-Message-State: AOJu0Yy9bVU1InYnyrMtiBdoKUkDhe6lrLWAnGdE7PCsR/YV7EktT6tN
 JPi7sJDOGLCqhvZ87aUqskKwz2qHHcvnCaqKzZQCG5hQsyWo9Sjrv6Io4bPuIV8gdaXKe+bB8/B
 2wFSdTv87JCszMVy/HJtCkESjc4c=
X-Google-Smtp-Source: AGHT+IGRMpxuxEXhlPj+UNOYi5Y3fpGuZVkJqmvuCJk0ifu71MlMT4dmS/n386oaOZRs26XyF3DOm/xhQ5e0qBWml3g=
X-Received: by 2002:a2e:8e8d:0:b0:2d4:7455:89f6 with SMTP id
 z13-20020a2e8e8d000000b002d4745589f6mr2710942ljk.40.1711636358303; Thu, 28
 Mar 2024 07:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-23-dario.binacchi@amarulasolutions.com>
 <ec46a0be-e9cc-489a-95c2-fc2332d90fa6@smile.fr>
 <CABGWkvqk+HetGhA_FGL0Pw0a1Z2uyx7EH95wVKOd9KOtU6kC9A@mail.gmail.com>
 <c926513b-7d35-4d73-ba05-cd6d0bce5fc2@smile.fr>
In-Reply-To: <c926513b-7d35-4d73-ba05-cd6d0bce5fc2@smile.fr>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 28 Mar 2024 15:32:26 +0100
Message-ID: <CAEyMn7bwbkRBg8Z0C8sxdg-y6zHeKa7=hcMVabXzF2W6mXhyAw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711636358; x=1712241158; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9sd9TAmf633dcJri8N3KrveYn99imOKsBi0jzfGanI=;
 b=gPlzaoeKpZ0pfn12R4Ewk2MXgckLFEF2yaZKKRrWbENOxadyFzZ/4K5q7es+D5LWs4
 5f7cTDyImdWNQc3mrOm/lSMIW8g8Xcz+AA3qBlUakgTUAnyXk9HqEsV1YjpKHH9tZnTw
 KpvqI4adF7TpbKLOW/Y4bXgA9pAE/vn2B4ipyW4Evl6wmtv9jIpTu8lXVpNWGulhSc86
 ux0hXs/ZV3Yg+i0zAbwTZsIkUf2Hlx719Y41GkTfx+SE6+trGtidKZ5bv66lJff1/lRL
 AdKhbEODpQUMVYengpv2/4iwIegORxXv8qh7HsS9GVFuImgKSJO0ZJv1Y4h4hapNdect
 wYwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gPlzaoeK
Subject: Re: [Buildroot] [PATCH v9 22/22] boot/ti-k3-image-gen: remove
 package
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
Cc: michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLCBIaSBEYXJpbywgQWxsLAoKQW0gTWkuLCAyNy4gTcOkcnogMjAyNCB1bSAxNTo1
NSBVaHIgc2NocmllYiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj46Cj4KPiBI
ZWxsbyBEYXJpbywgQWxsLAo+Cj4gTGUgMjQvMDMvMjAyNCDDoCAxODoyMCwgRGFyaW8gQmluYWNj
aGkgYSDDqWNyaXQgOgo+ID4gSGkgUm9tYWluLAo+ID4KPiA+IE9uIFdlZCwgTWFyIDEzLCAyMDI0
IGF0IDEyOjAw4oCvUE0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3Rl
Ogo+ID4+Cj4gPj4gSGVsbG8gRGFyaW8sCj4gPj4KPiA+PiBMZSAwNC8wMy8yMDI0IMOgIDE2OjMy
LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdCA6Cj4gPj4+IEZyb206IFJvbWFpbiBOYW91ciA8cm9t
YWluLm5hb3VyQHNtaWxlLmZyPgo+ID4+Pgo+ID4+PiB0aS1rMy1pbWFnZS1nZW4gdG9vbCBpcyBk
ZXByZWNhdGVkIGFuIHJlcGxhY2VkIGJ5IGJpbm1hbiBbMV0uCj4gPj4+Cj4gPj4+IEFsbCBkZWZj
b25maWcgdGhhdCB3YXMgdXNpbmcgaXQgaGF2ZSBiZWVuIHVwZGF0ZWQgdG8gdXNlIFUtYm9vdAo+
ID4+PiBiaW5tYW4gdG9vbCBpbnN0ZWFkLgo+ID4+Pgo+ID4+PiBTbywgd2UgY2FuIHNhZmVseSBy
ZW1vdmUgdGktazMtaW1hZ2UtZ2VuIHBhY2thZ2UuCj4gPj4KPiA+PiBUaGUgQU02NSBzdXBwb3J0
IGlzIHN0aWxsIGJyb2tlbiBzaW5jZSB3ZSBuZWVkIHRvIGNvcHkgc3lzZncqLml0YiBiaW5hcnkg
dGhhdAo+ID4+IHdhcyBwcm92aWRlZCBieSB0aS1rMy1pbWFnZS1nZW4uCj4gPgo+ID4gQ291bGQg
eW91IGtpbmRseSBpbmRpY2F0ZSB0aGUgQnVpbGRyb290IGNvbmZpZ3VyYXRpb24gZm9yIGFtNjUg
dGhhdAo+ID4geW91IGFyZSByZWZlcnJpbmcgdG8gcmVnYXJkaW5nIHRoZSBpc3N1ZSB5b3UgYXJl
IGluZGljYXRpbmc/Cj4gPiBJdCBzZWVtcyB0byBtZSB0aGF0IHRoZSBjb25maWd1cmF0aW9ucyBv
ZiBpbnRlcmVzdCwgYW5kIHRoZXJlZm9yZQo+ID4gdGhvc2UgdGhhdCBoYXZlIGJlZW4gdGVzdGVk
LCBhcmUgdGlfYW02Mnhfc2tfZGVmY29uZmlnIGFuZAo+ID4gdGlfYW02NHhfc2tfZGVmY29uZmln
Lgo+Cj4gVGhlIEFNNjUgc3VwcG9ydCBpcyBjdXJyZW50bHkgcHJvdmlkZWQgYnkgdGktazMtaW1h
Z2UtZ2VuIG9wdGlvbgo+IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTY1WCBhbmQg
d2Ugc2hvdWxkIHRyeSB0byBub3QgYnJlYWsgaXQuCj4KPiB0aS1rMy1pbWFnZS1nZW4gaXMgbWVh
bnQgdG8gYmUgdXNlZCBieSBhbGwgVEkncyBLMyBmYW1pbHkgbm90IG9ubHkgQU02Mi9BTTY0Lgo+
Cj4gU2VlIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjQt
TWFyY2gvNjg3ODE3Lmh0bWwKPgo+IE5vdGU6IEkgY2FuIGhlbHAgdGVzdGluZyB0aGUgQU02NSBj
YXNlIHVzaW5nIHRoZSBKNzIxZSBTb0Mgc3VwcG9ydCBvbiB0b3Agb2YKPiB0aGlzIHNlcmllcy4K
Pgo+ID4KPiA+IEhlcmUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzk2YTcxNzA1LWRjZWIt
NDQxNy05ZWRkLTFmOTYyZWRkNjZmNEBzbWlsZS5mci8sCj4gPiB5b3UgYWxzbyBtZW50aW9uIEJl
YWdsZVBsYXkuCj4gPiBJcyB0aGVyZSBhIEJlYWdsZVBsYXkgY29uZmlndXJhdGlvbiBpbiBCdWls
ZHJvb3Q/Cj4KPiBJJ20gbm90IHN1cmUgYWJvdXQgdGhpcyBuZXcgc2NyaXB0IGJvYXJkL3RpL2Nv
bW1vbi9hbTZ4eC9wb3N0LWltYWdlLnNoLCB0aGUKPiBib2FyZF9kaXIoKSBmdW5jdGlvbiBsb29r
cyBxdWVzdGlvbmFibGUuIEkgd291bGQgbGlrZSBhIHNlY29uZCBvcGluaW9uLgoKSSBqdXN0IHBy
ZXBhcmVkIGEgcGF0Y2ggWzFdIHRoYXQgaW50cm9kdWNlcyB0aGUgY2FwYWJpbGl0eSB0byBhZGQK
c3BlY2lmaWMgYXJndW1lbnRzIHRvIFBPU1RfQlVJTEQgYW5kIFBPU1RfSU1BR0Ugc2NyaXB0cy4K
CldpdGggdGhpcyB5b3UgY2FuIGNvbXBsZXRlbHkgZGlzcGVuc2Ugd2l0aCB0aGlzIHBvc3QtYnVp
bGQgc2NyaXB0IGFuZAp1c2UgdGhlIHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCBkaXJlY3Rs
eS4KCkJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3RpL2NvbW1vbi9hbTZ4eC9w
b3N0LWJ1aWxkLnNoIgpCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUX0FSR1M9Ii1jIHR0eVMy
LDExNTIwMG44IC1kCmszLWFtNjQyLXNrLmR0YiAtbCBhbTY0eC1zay1idWlsZHJvb3QgLXIgL2Rl
di9tbWNibGsxcDIgLXgKZWFybHljb249bnMxNjU1MGEsbW1pbzMyLDB4MDI4MDAwMDAiCkJSMl9S
T09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKQlIy
X1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVF9BUkdTPSItYyBib2FyZC90aS9hbTY0eC1zay9nZW5p
bWFnZS5jZmciCgotLS0tIHNuaXAgODwgLS0tCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDMyODE0MDkxOS4xNTc2NjQtMS1oZWlr
by50aGllcnlAZ21haWwuY29tLwotLSAKSGVpa28KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
