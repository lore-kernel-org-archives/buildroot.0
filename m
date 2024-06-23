Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781EBC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 03:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3DE406CF;
	Sun, 23 Jun 2024 03:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKZ5-W50-65m; Sun, 23 Jun 2024 03:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A99414053A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A99414053A;
	Sun, 23 Jun 2024 03:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 415431BF573
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 03:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 399FC81E1B
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 03:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rskLZ7wHKUo9 for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 03:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47EF481E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47EF481E1A
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47EF481E1A
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 03:38:14 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-371c97913cdso14730165ab.3
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 20:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719113893; x=1719718693;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AC5lYnd5c1iVHAEkb06OZjrAVqBMWoYdf54a1CDZnf0=;
 b=TyVMqGOQnu4x4dBAwRuAGZtK5Os7YzZz246r/uHpvM2YOYfWpr4lxlGc2xRthZzBJe
 OVEJ93glwXXAmCPdscqzJd/v5xMm29ZxQHVmqAjlX4+aoKDG/TE98mrIqungsyZBUsws
 EzMARXFzBooANiqtX+89O00IlMBN9M3SmOn4+DU4jRi2xeZfH6CX2VloP9xLnWJlIrIO
 96NCE1/Z7LYXijqZB8meJlCzF4PAWaPclYa7GI/mexwZKa5qDzP4/50Bnn5sOT/NI2LX
 IzTJRNo9UuXgdPyo63G4yaOZ9jV4y0g3aFDsrfmYsWTjZWEvzXWTPo/rXNVCb/IjOV+i
 G7dQ==
X-Gm-Message-State: AOJu0Yynkfee4j6S4SbgaSa8QxpQwPUycuZhgulBBbiB00WI3tf+/hp4
 jcESWGruyUDfyEKk/AvDqIFDs0i2bqGZiM6F3UCf8aqbOod9bpqajX1myg==
X-Google-Smtp-Source: AGHT+IE5CdR0Qa5QxyMJ4aH8H60YO1WgGwcvMZHoFNCfX3aJnCMuxSCgdKVMgvEcpwqCV54sSx7UmQ==
X-Received: by 2002:a05:6e02:1e06:b0:375:a8a8:8e7 with SMTP id
 e9e14a558f8ab-3763b0bfcb0mr26595305ab.8.1719113892819; 
 Sat, 22 Jun 2024 20:38:12 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3762f3222casm11119215ab.46.2024.06.22.20.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 20:38:12 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 21:38:04 -0600
Message-Id: <20240623033804.105858-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719113893; x=1719718693; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AC5lYnd5c1iVHAEkb06OZjrAVqBMWoYdf54a1CDZnf0=;
 b=nWicNYePxgJS0Qyj9Tr6Y+cD/OCdcv6TyG7Y7LMYwQt4P1Cl/Zw0ksPtjyO3jcHvG6
 3vYwneAmn/BfWdORSidcbz5NJmdkWG4G9kNdrdTFuENWzjBBAdXhdjagJsWj2O6erOLe
 3kFGXVKeBjMnAFYB5BgLiJWTc7jQRW4Esw1grXG3tvInbRZSiLUqOr1x7ik9iiDvkZKd
 BIcRHQZMDjI4xZsslmZeQfjs+ZT7KR4WaxsNspDmFirZBqq/RS2yF/v2QSoMm9rAmEsJ
 qRFBiw8+tDCsgmrw++MvtRx9t1VDb0HNSI5dzGOsVxA1fBwmeT3GhxtbIs1PmFFwWIjn
 UhJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nWicNYeP
Subject: [Buildroot] [PATCH 1/1] boot/syslinux: Fix building syslinux with
 GCC 14.x
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
Cc: Lance Fredrickson <lancethepants@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTGFuY2UgRnJlZHJpY2tzb24gPGxhbmNldGhlcGFudHNAZ21haWwuY29tPgoKQWRkIG1p
c3Npbmcgc3RkaW8uaCBpbmNsdWRlLiBXaXRob3V0IGl0IHJlc3VsdHMgaW4gdGhlIGZvbGxvd2lu
ZyBlcnJvciB1bmRlciBHQ0MgMTQueAoKLi4vLi4vLi4vY29tMzIvbGliL3N5c2xpbnV4L2RlYnVn
LmM6IEluIGZ1bmN0aW9uIOKAmHN5c2xpbnV4X2RlYnVn4oCZOgouLi8uLi8uLi9jb20zMi9saWIv
c3lzbGludXgvZGVidWcuYzo5MTo1OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24g4oCYcHJpbnRm4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogICA5
MSB8ICAgICBwcmludGYoIkR5bmFtaWMgZGVidWcgdW5hdmFpbGFibGVcbiIpOwoKVXBzdHJlYW06
IGRlYWQgKGxhc3QgcmVsZWFzZSBpbiAyMDE0KQpTaWduZWQtb2ZmLWJ5OiBMYW5jZSBGcmVkcmlj
a3NvbiA8bGFuY2V0aGVwYW50c0BnbWFpbC5jb20+Ci0tLQogLi4uLzAwMjAtcHVsbC1pbi1zdGRp
by1oLWZvci1nY2MxNC5wYXRjaCAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3N5c2xp
bnV4LzAwMjAtcHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRjaAoKZGlmZiAtLWdpdCBhL2Jv
b3Qvc3lzbGludXgvMDAyMC1wdWxsLWluLXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNoIGIvYm9vdC9z
eXNsaW51eC8wMDIwLXB1bGwtaW4tc3RkaW8taC1mb3ItZ2NjMTQucGF0Y2gKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMDlhMDA3NGIzMQotLS0gL2Rldi9udWxsCisrKyBi
L2Jvb3Qvc3lzbGludXgvMDAyMC1wdWxsLWluLXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNoCkBAIC0w
LDAgKzEsMzQgQEAKK0Zyb20gZGZhMjcwNTEwMGE4OTNiYzAxN2QyMzQwNmRhYTlhMzgzZmJjM2M5
NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IExhbmNlIEZyZWRyaWNrc29uIDxsYW5j
ZXRoZXBhbnRzQGdtYWlsLmNvbT4KK0RhdGU6IFdlZCwgNSBKdW4gMjAyNCAxNDozMTozOCAtMDYw
MAorU3ViamVjdDogW1BBVENIXSBjb20zMi9saWIvc3lzbGludXgvZGVidWcuYzogYWRkIG1pc3Np
bmcgc3RkaW8uaCBpbmNsdWRlLgorCitGaXggYnVpbGRpbmcgc3lzbGludXggd2l0aCBHQ0MgMTQu
eAorCitBZGQgbWlzc2luZyBzdGRpby5oIGluY2x1ZGUuIFdpdGhvdXQgaXQgcmVzdWx0cyBpbiB0
aGUgZm9sbG93aW5nIGVycm9yIHVuZGVyIEdDQyAxNC54CisKKy4uLy4uLy4uL2NvbTMyL2xpYi9z
eXNsaW51eC9kZWJ1Zy5jOiBJbiBmdW5jdGlvbiDigJhzeXNsaW51eF9kZWJ1Z+KAmToKKy4uLy4u
Ly4uL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jOjkxOjU6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiDigJhwcmludGbigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb25dCisgICA5MSB8ICAgICBwcmludGYoIkR5bmFtaWMgZGVidWcgdW5hdmFpbGFibGVc
biIpOworCitVcHN0cmVhbTogZGVhZCAobGFzdCByZWxlYXNlIGluIDIwMTQpCitTaWduZWQtb2Zm
LWJ5OiBMYW5jZSBGcmVkcmlja3NvbiA8bGFuY2V0aGVwYW50c0BnbWFpbC5jb20+CistLS0KKyBj
b20zMi9saWIvc3lzbGludXgvZGVidWcuYyB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQorCitkaWZmIC0tZ2l0IGEvY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmMgYi9jb20z
Mi9saWIvc3lzbGludXgvZGVidWcuYworaW5kZXggZDlhYjg2M2YuLmU4ZjUzZDU3IDEwMDY0NAor
LS0tIGEvY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmMKKysrKyBiL2NvbTMyL2xpYi9zeXNsaW51
eC9kZWJ1Zy5jCitAQCAtMSw2ICsxLDcgQEAKKyAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgorICNp
bmNsdWRlIDxzdHJpbmcuaD4KKyAjaW5jbHVkZSA8c3RkYm9vbC5oPgorKyNpbmNsdWRlIDxzdGRp
by5oPgorIAorICNpZmRlZiBEWU5BTUlDX0RFQlVHCisgCistLSAKKzIuMzkuMgorCi0tIAoyLjM5
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
