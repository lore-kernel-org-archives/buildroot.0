Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70612C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 18:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20533607B8;
	Tue, 16 Jul 2024 18:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cl4m2TgCME3n; Tue, 16 Jul 2024 18:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 391F660AA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 391F660AA6;
	Tue, 16 Jul 2024 18:16:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3D21BF3CB
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25356607B8
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 18:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWpxvC-bDngB for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 18:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 261F960AA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 261F960AA6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 261F960AA6
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 18:16:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266edee10cso37655925e9.2
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 11:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721153793; x=1721758593;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZWbG3ql9J18P3gcR7dI3RL0lZZy8EOJ7DoYg4HwSx4Q=;
 b=BcgieDpcMCBWF3kRu+RZU1JSzNWi+Eho+PJ3QM1EI4y8ZEVux8xyT52JNT1sHmm7GQ
 NY49enNT4av2CRAWBKiMzoqYReTRV5HqX80oeCTnTcKJyzef5TvZq8dZn8trYsA8HZAe
 hf53uybKrNsEBDg1AYsGdh41D3EzS6cn9xtO6lQGAZ2dsPwAyKGBCDPhdr48GYmtWhI/
 tz8v/Rj5Z572uPlv/e545LlLmTm0DAz7XaI7J1JAbr3QqpkBPfE2SNEbL/90wziwH8sh
 zi2yXqx4dolFqyMNoPwWnj7e+Ju6x3f5bGaKLfLeUPNEl7NFQXxiOYv40q1Yk0z/JrQ9
 oV7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeHhiCqnl8+QO3R0PuGblY3hZslcf4GV4zZ92qyIYqbPZV3D5NFK4s5GiIf7ZLY7wyFeQ/48HSmK5xp+NSrIE0hbKl3Ka47Q==
X-Gm-Message-State: AOJu0YyIWaZYHEq5gIDTDe3owUF5x0vr6xtQGygmapekDqOyRHzex/9m
 BbtDDJwK6PyunVrQLutUBLcvSOdYkO2SBUG9ITxehJ/S6VNJ+EYz
X-Google-Smtp-Source: AGHT+IFJh4Kr0P1nZN0DiAY7cijaphVOqFaUoMioBa08J47Uu/WHmJ6BfB5Kye7xTrHMYkCnWOUIGA==
X-Received: by 2002:a05:600c:46c9:b0:426:6b47:290b with SMTP id
 5b1f17b1804b1-427ba6dc9a8mr22479815e9.28.1721153792899; 
 Tue, 16 Jul 2024 11:16:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27a265sm170653935e9.28.2024.07.16.11.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 11:16:32 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 16 Jul 2024 20:16:32 +0200
Message-Id: <D2R63KJLU3ZF.3CNKAW80ULZGX@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Athaariq Ardhiansyah" <foss@athaariq.my.id>, <buildroot@buildroot.org>
X-Mailer: aerc 0.18.0-0-g5f8620445ed9
References: <20240715160941.90353-1-foss@athaariq.my.id>
 <D2QRF2XRV54A.YI13SBIAUJMY@gmail.com>
 <8c2efc93-e2a8-402e-adf0-5679ef6c7cc8@athaariq.my.id>
In-Reply-To: <8c2efc93-e2a8-402e-adf0-5679ef6c7cc8@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721153793; x=1721758593; darn=buildroot.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWbG3ql9J18P3gcR7dI3RL0lZZy8EOJ7DoYg4HwSx4Q=;
 b=JG74eAh3kxCh/dPj1In6zGFL2RItUuYQ121MOwcAuFrcdawEqxhgEaClsD0k/ssnuK
 skAJVVQq+bu9aoHjZo4dWsn4hE1a39oz2qjziQh7RWcgQX4EgsvmyQqZBj99HQ2et4oN
 BhLeGEza6F+khFa5nn7M1EJdWs6Gt0YVTYeIlYQP79wQLTYOZSfjYSVqPie0twPyiEfE
 FtjNuJcCMoN57GNw3cDzaRKgrC6wLhOQaaxGI/cVGDr87tla1fshtPrEGNogl3TG4F35
 L8/soU0br33uiiRYNiz8HTaxcQa/iXEeQez1qifs01OsIzA3ZPV3euJeCSaiv54zAQ3Z
 7fKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JG74eAh3
Subject: Re: [Buildroot] [PATCH v5 1/3] package/rpi-firmware: bump version
 to 1.20240529
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXRoYWFyaXEsCgpPbiBUdWUgSnVsIDE2LCAyMDI0IGF0IDE6NDUgUE0gQ0VTVCwgQXRo
YWFyaXEgQXJkaGlhbnN5YWggd3JvdGU6Cj4gWWVhaCBJIGFncmVlLiBJIHRoaW5rIHRoaXMgcGF0
Y2ggc2VyaWVzIGlzIG5vIGxvbmdlciByZWxldmFudCBmb3Igbm93Lgo+IFRoZSBXaS1GaSBicmVh
a2FnZSBmaXggb25seSBleGlzdCBvbiBsaW51eCB2Ni42LjM5LCBub3QgdjYuNi4zMSB3aGljaCBp
cwo+IGN1cnJlbnRseSBsYXRlc3Qgc3RhYmxlIG5vdy4gVGhlcmVmb3JlLCB0aGUgYnVtcCB3b24n
dCBkbyBhbnl0aW5nIHVzZWZ1bAo+IHVudGlsIHRoZSBuZXdlciBzdGFibGUgdGFnLgo+CgpXZWxs
IG5vLCBpdCBkb2VzIG1ha2Ugc2Vuc2UgdG8gYnVtcCBib3RoIHJwaS1maXJtd2FyZSBhbmQgbGlu
dXghCgpFc3BlY2lhbGx5LCBpdCBpcyB2ZXJ5IG5pY2UgdG8gYnVtcCB0byBhIHRhZ2dlZCBjb21t
aXQsIEkgZ3Vlc3MsIGl0IGhhcwpuZXZlciBiZWVuIGJlZm9yZSA6KQoKPiAgPiBBcyByZXF1ZXN0
ZWQgYnkgVGhvbWFzLCB5b3UgY2FuIGFkZCB0aGUgZm9sbG93aW5nIGNvbW1lbnQ6Cj4gID4JIyBQ
bGVhc2Uga2VlcCBpbiBzeW5jIHdpdGggY29uZmlncy9yYXNwYmVycnlwaSpfZGVjb25maWcKPgo+
IFRoaXMgZ29pbmcgdG8gYmUgc3VibWl0dGVkIG9uIHRoZSBuZXh0IHJhc3BiZXJyeSdzIGxpbnV4
IGtlcm5lbCBzdGFibGUKPiB0YWcsIGFzIEkgd2FudCB0byBleHBlcmltZW50IHRvIG1ha2UgdGhl
IHZlcnNpb24gdGFnIHN5bmNocm9uaXplZCBvbgo+IGJvdGgga2VybmVsIGFuZCBycGktZmlybXdh
cmUgdmVyc2lvbi4gSWYgaXQgaW1wb3NzaWJsZSwgdGhlbiBUaG9tYXMnCj4gc3VnZ2VzdGlvbiB3
b3VsZCBiZSB0aGUgYmVzdCBvcHRpb24uIEknbSBnb2luZyB0byBidW1wIGFsbCBvZgo+IHJhc3Bi
ZXJyeSBwaSBib2FyZHMgYXQgb25jZSBvbiB0aGF0IHBhdGNoIHN1Ym1pc3Npb24uCj4KCkl0IGlz
IHBvc3NpYmxlLCBpdCBpcyB3aGF0IGl0IGlzIGRvbmUgdXAgdG8gbm93IChhdCB0aGUgZXhjZXB0
aW9uIG9mCmJ1bXBpbmcgdG8gYSB0YWdnZWQgY29tbWl0KS4KCkFuZCwgZG8gbm90IGZvcmdldCB0
byBjb21tZW50IGJlbG93IGFzIHdlbGwgaW4gdGhlIGRlZmNvbmZpZyBmaWxlcyA7KQoKCSMgUGxl
YXNlIGtlZXAgaW4gc3luYyB3aXRoIHBhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5t
awoKPiBSZWdhcmRzLAo+IEF0aGFhcmlxIEFyZGhpYW5zeWFoCgpLaW5kIFJlZ2FyZHMsCkdhw6ts
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
