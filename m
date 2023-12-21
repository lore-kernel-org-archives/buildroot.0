Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A67AC35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4F84255B;
	Thu, 21 Dec 2023 15:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC4F84255B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BX0_utbSRbRM; Thu, 21 Dec 2023 15:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0190C426AA;
	Thu, 21 Dec 2023 15:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0190C426AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 813471BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 599B040A50
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 599B040A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7mKyxnBa4Vf for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:27 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8976D4031D
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8976D4031D
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d3aa0321b5so8032735ad.2
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172986; x=1703777786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2Q4I+inWbnUujB2ZhlulhWuYOJgqTHx+6irMoM3diQ=;
 b=beL/YdMwRjghlPe1dYd3H2l5rUSc6v/IZKbOCxh/LT5pH1KqUGgrRPvqzCUafkXmwu
 nIxb6X6MYEzLLG2GVj/XIpr0tmD6UyHffPRYhbFXm0+8nXz6h/Pli6f06FsNGcoOQG4a
 NK/oDqCBo8n9OpLwvf1hDWfNChuxof7m3PsfbqsOmH804+kPsQIn3mccMwcLxcvyu1lZ
 yHTndTgKumLpBIYAwkmb4rW0VzfD0YumvyKJvmmIv9rTwWR35ZcKKKLIaniGZzkPvjaq
 zHeqztYVpMbuvPhmjXvYiN6clQ1ScTWn9nk/p3NHLkwqg5KTCaBM63Yt2H/+8i+/JwYn
 uxig==
X-Gm-Message-State: AOJu0Yy9GX1GDrrmQMvstZkQ+rcwB6foA2suFzLEXy6tWOP0ztMGEHXh
 4NHfOW7SggcuPrvZil0+lE4P2cPeTM7IeBTohAs=
X-Google-Smtp-Source: AGHT+IEfPZiTBPUPxbYKoZkvMZXZLzjYokM6fFrAnI2MzWHY4EYELR/JH/ZUDYy9Iuili9E+/+YJbw==
X-Received: by 2002:a17:902:db10:b0:1d4:1044:87cc with SMTP id
 m16-20020a170902db1000b001d4104487ccmr624823plx.107.1703172986465; 
 Thu, 21 Dec 2023 07:36:26 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:26 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:13 -0700
Message-ID: <20231221153620.237439-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172986; x=1703777786;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2Q4I+inWbnUujB2ZhlulhWuYOJgqTHx+6irMoM3diQ=;
 b=ESPw24g/Fy0/HK60jAATpQnzTURaPM/DkKG345UqzEyMwNGZaOug3io5f1SirDW0D4
 68kw8oh446ohUrKMl4l8Y1r5T3G1hK4Rc/1GdueW6KD0bxb5uodrWYLQWTo62pEjHyRl
 j6HrU4aRvjkP3wV23QFDydjOkYSGm0WBbYwiE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ESPw24g/
Subject: [Buildroot] [PATCH v4 04/10] package/ncurses: install foot terminfo
 if foot is selected
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
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
d2lkZWMKIE5DVVJTRVNfTElCX1NVRkZJWCA9IHcKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
