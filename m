Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C9EC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 10:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBB1401D8;
	Tue,  2 Jan 2024 10:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BBB1401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V92eUEKGIgc8; Tue,  2 Jan 2024 10:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA83A401DF;
	Tue,  2 Jan 2024 10:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA83A401DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 064101BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 10:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3A4760BCE
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 10:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A4760BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3E6xyMaw1KAg for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 10:43:11 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 181E8605A4
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 10:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 181E8605A4
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55569b59f81so4938783a12.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 02:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704192189; x=1704796989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GWRxQoBwPg9P042wu8UyWwCQx2bAmlpmDfp9doEllIM=;
 b=sqyuKdSKjdzi1TvzaBMG2OkkQ4vZqH4GoUHVQan5x2x5BC3veVSNOj/mgtBb8uvkP2
 7Q4sQdrHbZQ9xogU/3eDcwAm45amK+3fWsOGXajrqJdPApj/oAG4NHjRjWQXMSSB8X2G
 JgeW/lzG2mayXecxk1kPZiODqBNUq3i4njv1OZYq23baS/Tpy42ge2jMRSG9vlXnem7w
 3ru+hEVX+4ShJb1zLO5/kOXHTqzcLtYgGV/0KN/DRt6uzAQtJFTnMhUNXQy3c3S8xci6
 jmnWH47v3E6fNgbSSFVl9ryMkrhGtZwFXm+f4jz2o9dBjaKiPQBjoc9JsJzTsHbisFbH
 ANNA==
X-Gm-Message-State: AOJu0YxzUGH3pIJ1BpdKUUJciZ+wK7OFF8bnTgV0ndEL0duUrD86RJ93
 YMY9BLfUpWEpcMVlGMnJTGPa8O8Tolg=
X-Google-Smtp-Source: AGHT+IHlUOFKrGY/pE/jt7bZB6uK8SmJdEQB9nkPKvjnVD/K6nVK6DiCDo5N44kSRserSmpu9LKZsQ==
X-Received: by 2002:a50:d74e:0:b0:554:877e:b7f with SMTP id
 i14-20020a50d74e000000b00554877e0b7fmr10864968edj.39.1704192188718; 
 Tue, 02 Jan 2024 02:43:08 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl.
 [31.11.218.106]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056402320600b0055410f0d709sm15625602eda.19.2024.01.02.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 02:43:08 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 11:42:58 +0100
Message-Id: <20240102104258.1375-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704192189; x=1704796989; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GWRxQoBwPg9P042wu8UyWwCQx2bAmlpmDfp9doEllIM=;
 b=J2dVnz4SPNP5UhoulTMHqBb5XqnhezW6fR09RCN1ih60VJBTA+Q3v0n7B+piXUcqD5
 X58luWLNUH3TxLfNPYP/fVbbO5AbArQJp8IQR5fAg2IqDNOdwhwx9MwTsbfg5F6vowpd
 YCNlRQxzj0+Q5UkSMJc9lEL1rB7CZeRPKdjjg+io2xuHmB4zyxWt+7psHkaXDUhB3RJd
 qNV/R6Sc4IRGouhePBRmT7YHpt9R3PKFGjKmkbXEOgvdtkG2YBuL+EWppUXA7luYpJbF
 T7G8Hh74T2bk/Y/Qv6IVE2Ee+jL2ywjfOA2QW9TpJbA/QuynU2nNp9ENKGtpa0vuM+T7
 XNuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J2dVnz4S
Subject: [Buildroot] [PATCH] configs/broadcom_northstar_defconfig: adjust
 DTS paths
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU3RhcnRpbmcgd2l0aCBr
ZXJuZWwgcmVsZWFzZSB2Ni41IEFSTSBEVFMgZmlsZXMgYXJlIHBsYWNlZCBpbiB2ZW5kb3IKc3Vi
ZGlyZWN0b3JpZXMgKExpbnV4IGNvbW1pdCA3MjRiYTY3NTE1MzIgKCJBUk06IGR0czogTW92ZSAu
ZHRzIGZpbGVzIHRvCnZlbmRvciBzdWItZGlyZWN0b3JpZXMiKSkuCgpUaGlzIGZpeGVzOgptYWtl
WzNdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcw
OC1zbWFydHJnLXNyNDAwYWMuZHRiJy4gIFN0b3AuCm1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTM4
NDogYmNtNDcwOC1zbWFydHJnLXNyNDAwYWMuZHRiXSBFcnJvciAyCm1ha2VbM106ICoqKiBObyBy
dWxlIHRvIG1ha2UgdGFyZ2V0ICdhcmNoL2FybS9ib290L2R0cy9iY200NzA5NC1sdXh1bC14d3It
MzE1MC12MS5kdGInLiAgU3RvcC4KbWFrZVsyXTogKioqIFtNYWtlZmlsZToxMzg0OiBiY200NzA5
NC1sdXh1bC14d3ItMzE1MC12MS5kdGJdIEVycm9yIDIKClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBjb25maWdzL2Jyb2FkY29tX25vcnRoc3Rh
cl9kZWZjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jb25maWdzL2Jyb2FkY29tX25vcnRoc3Rhcl9kZWZjb25m
aWcgYi9jb25maWdzL2Jyb2FkY29tX25vcnRoc3Rhcl9kZWZjb25maWcKaW5kZXggMTAwOGRlMTY4
Zi4uOWFlNzE2NzI2ZCAxMDA2NDQKLS0tIGEvY29uZmlncy9icm9hZGNvbV9ub3J0aHN0YXJfZGVm
Y29uZmlnCisrKyBiL2NvbmZpZ3MvYnJvYWRjb21fbm9ydGhzdGFyX2RlZmNvbmZpZwpAQCAtNSw3
ICs1LDcgQEAgQlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01f
Q09ORklHPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9icm9h
ZGNvbS9ub3J0aHN0YXIvbGludXguY29uZmlnIgogQlIyX0xJTlVYX0tFUk5FTF9BUFBFTkRFRF9a
SU1BR0U9eQotQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImJjbTQ3MDgtc21hcnRy
Zy1zcjQwMGFjIGJjbTQ3MDk0LWx1eHVsLXh3ci0zMTUwLXYxIgorQlIyX0xJTlVYX0tFUk5FTF9J
TlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTQ3MDgtc21hcnRyZy1zcjQwMGFjIGJyb2FkY29t
L2JjbTQ3MDk0LWx1eHVsLXh3ci0zMTUwLXYxIgogIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMg
bm90IHNldAogQlIyX1RBUkdFVF9ST09URlNfVUJJPXkKIEJSMl9UQVJHRVRfUk9PVEZTX1VCSV9T
VUJTSVpFPTIwNDgKLS0gCjIuMzUuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
