Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6B9C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6076421C3;
	Thu, 21 Dec 2023 00:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6076421C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAmp1XJ910Sx; Thu, 21 Dec 2023 00:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7784211B;
	Thu, 21 Dec 2023 00:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D7784211B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01FC21BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD6F140BEC
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD6F140BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoRKOhGar5yy for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:33 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7124440323
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7124440323
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d96d71654dso208944b3a.0
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117972; x=1703722772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2Q4I+inWbnUujB2ZhlulhWuYOJgqTHx+6irMoM3diQ=;
 b=r9x3ozy9Zo744NKRchsST/k8bSMWfMNClUVs6Wj+zKq0J8pqEidLkrV0oj5FlQI1n6
 e933jdUj2l/KupRCII6/a5NED4ZHB85L0rpxGjMuqmTRzIdrLlWMEvlgQ0VZZmitm708
 z7V/NlVUSsC8PN+JY01lT0bsahn60VXzEXhJw5bToqv60V7+5N3BGmWjymTDZVGcYBoA
 e2SNU55AnToQR5wrZboUd0UPFI1LpKHKDWF7Y2GdKAI5M++0ZxqrcQT+cm4DazzKVcvh
 1eVPSG766yaqwgpMtop9G3H8dVe4dXqCWwG7n1JpA1K+4/LcaJ6U4kINkjIJq9V9hSbs
 TOQQ==
X-Gm-Message-State: AOJu0YzE+GUVR7ObzLLY2yEUtsRIhV/qGobmNANFMBYjpGsfTd3yLCGJ
 /oF/rIOXEuQIwddtwEndLeQh+L3zzBAV5ChUwaE=
X-Google-Smtp-Source: AGHT+IFZtHSwsmneaMLP+OV2vBv6wmKDsW5VaEr3SPAOJ/Esbvz56RjSjUefjbri00nI/M7Ao0JRyA==
X-Received: by 2002:a05:6a20:8e20:b0:194:401c:24b3 with SMTP id
 y32-20020a056a208e2000b00194401c24b3mr522892pzj.40.1703117972087; 
 Wed, 20 Dec 2023 16:19:32 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:18 -0700
Message-ID: <20231221001924.1356215-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117972; x=1703722772;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2Q4I+inWbnUujB2ZhlulhWuYOJgqTHx+6irMoM3diQ=;
 b=O3RowEcB5Bf950YYGc7ayuX+GALAj9qPSJS9C4h1r91mkGGHpbn3fWluDV79PqFDc+
 lkBH3xFL9izojSHBY7Chv70gwAK0EACOoIFPA1aTvJQ95IbOpQ1QYzudRlyRZ7/PhSxf
 EuXsZoW85LM4KgGbk/Bq3xOyy5q3la+CJSuwE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O3RowEcB
Subject: [Buildroot] [PATCH v3 04/10] package/ncurses: install foot terminfo
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
