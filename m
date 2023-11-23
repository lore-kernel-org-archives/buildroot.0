Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46EAC61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D64C81F9B;
	Thu, 23 Nov 2023 00:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D64C81F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVkFcC-eSBD6; Thu, 23 Nov 2023 00:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C57FC81F74;
	Thu, 23 Nov 2023 00:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C57FC81F74
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C53961BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BF5B415FB
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF5B415FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xoeArGeSWMH for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:36 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07F2C4168E
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F2C4168E
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6cb749044a2so382328b3a.0
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698115; x=1701302915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FC1aI5oikdphHe2aCAqC/EvW/IgixcfYZvO1we7Q98=;
 b=GAzQGXALanZzFCs60dhS8dm8hJenv+PBEQr1qO4x12daBC3xkN4ff7hHspL7MghJoD
 8c0X4nLPhBLRf23zoSY6HKpfBQU7MFqmR4y9VtWZ6rPZ2Ei8lWD/TykqEUhJeN47oSNM
 R7gLIxCDqO6bkn0Wbbhgz7gvYfv9/pszy0IIwnFvZHESOF51CXDGd8QAHgpkYk/XkL19
 PitFmFySINGiQMUOfTCtjG/rEVK2nZv84GvNxcEYp9FOAXne2/qYms0MRutAALz/MWT/
 3VeGA+I9uTFoMqFRqgHFMFDhNGq5+WRwiTcn2mhgKz+7CGfgtX2KOgXZ/cZ/PTJc740Z
 T08Q==
X-Gm-Message-State: AOJu0YxoQnT29Lw3Wklt6eJfXudF1oNUrJKj5K51UfV1qeK7wf3xf8EM
 Sdn87GmqnXl0U4MhpkJn0bWms3dm47V/zuIvLyI=
X-Google-Smtp-Source: AGHT+IGBYLDIBDdDV+L4o7Lj4MJfnl4GvgDABZAPljoCVUwQFzcJIwpx0Fsg8l+8Bh7T2rR2wyZ5pg==
X-Received: by 2002:a05:6a00:1f05:b0:6bd:7cbd:15ae with SMTP id
 be5-20020a056a001f0500b006bd7cbd15aemr4129809pfb.26.1700698114805; 
 Wed, 22 Nov 2023 16:08:34 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:34 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:13 -0700
Message-ID: <20231123000819.488595-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698115; x=1701302915;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FC1aI5oikdphHe2aCAqC/EvW/IgixcfYZvO1we7Q98=;
 b=PaXPyKtmzD6oenU8aYZH9JezmRcZAE1FuX6VtJj8N8DOzaWWenBEZD5LgwQ1I0J9EV
 Loki4IwvccdGLyf1qxseDsnn+3PbLhbLG4LqXUh94rEEmkbviR+q3W7pCgtysKzcR9xN
 POTxi/tsaNDcIwyIwSzZYE+q+C9SNE4iJWASc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PaXPyKtm
Subject: [Buildroot] [PATCH/next 07/13] package/ncurses: install foot
 terminfo if foot is selected
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbSBmb290L0lOU1RBTEwubWQ6CmBgYApBcyBvZiBuY3Vyc2VzIDIwMjEtMDctMzEsIG5jdXJz
ZXMgaW5jbHVkZXMgYSB2ZXJzaW9uIG9mIGZvb3TigJlzCnRlcm1pbmZvLiAqKlRoZSByZWNvbW1l
bmRhdGlvbiBpcyB0byB1c2UgdGhvc2UqKiwgYW5kIG9ubHkgaW5zdGFsbCB0aGUKdGVybWluZm8g
ZGVmaW5pdGlvbnMgZnJvbSB0aGlzIGdpdCByZXBvIGlmIHRoZSBzeXN0ZW3igJlzIG5jdXJzZXMK
cHJlZGF0ZXMgMjAyMS0wNy0zMS4KYGBgCgpTbyBpdCBpcyBiZXN0IHRvIGZvbGxvdyB0aGUgaW5z
dHJ1Y3Rpb25zIGFuZCBpbnN0YWxsIHRoZSBmb290IHRlcm1pbmZvCnByb3ZpZGVkIGJ5IG5jdXJz
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29s
dXRpb25zLmNvbT4KLS0tCiBwYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tayB8IDcgKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmN1
cnNlcy9uY3Vyc2VzLm1rIGIvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsKaW5kZXggM2I4MDVj
YjFmZC4uMDBlMWMwZDQyNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsK
KysrIGIvcGFja2FnZS9uY3Vyc2VzL25jdXJzZXMubWsKQEAgLTczLDYgKzczLDEzIEBAIE5DVVJT
RVNfVEVSTUlORk9fRklMRVMgPSBcCiAJeC94dGVybS14ZnJlZTg2IFwKIAkkKGNhbGwgcXN0cmlw
LCQoQlIyX1BBQ0tBR0VfTkNVUlNFU19BRERJVElPTkFMX1RFUk1JTkZPKSkKIAoraWZlcSAoJChC
UjJfUEFDS0FHRV9GT09UKSx5KQorTkNVUlNFU19URVJNSU5GT19GSUxFUyArPSBcCisJZi9mb290
IFwKKwlmL2Zvb3QrYmFzZSBcCisJZi9mb290LWRpcmVjdAorZW5kaWYKKwogaWZlcSAoJChCUjJf
UEFDS0FHRV9OQ1VSU0VTX1dDSEFSKSx5KQogTkNVUlNFU19DT05GX09QVFMgKz0gLS1lbmFibGUt
d2lkZWMKIE5DVVJTRVNfTElCX1NVRkZJWCA9IHcKLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
