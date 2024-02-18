Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463CAC48BC4
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 01:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6954A414C0;
	Sun, 18 Feb 2024 01:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3PFKMnDwL0W; Sun, 18 Feb 2024 01:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142F940855
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142F940855;
	Sun, 18 Feb 2024 01:17:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 151E51BF275
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 01:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F22D8608BD
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 01:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VEeMnGdmnHb for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 01:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE25560891
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE25560891
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE25560891
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 01:16:58 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5dca1efad59so2947989a12.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708219017; x=1708823817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2OJiiYGB77jbfvgy9HaGdxhiQSchQ0Hs1Vx4ryyuBwI=;
 b=JBEUyFpexnFo/jATyToL0sdvEgFGRhlWUjazXXI+qAcqFOjRrS6PGXQ7G+vjT8mfeF
 UaD2Q+GXNSR1Wz3EL3HBapZu+UtTMu/Z75Sl8Q1yagWXjhpqXbR7nW4Vewuk/N65xTGm
 ks+9U22xbqVraBgY5DstOqbYeC9j+p0xrlVoZqk04Av1CrdWQ8Jc/gLshZqA+4wtAkMU
 bnUmffdo0H/L83VQFjHUTywgE+qNY4BClTIV5/mc4nDw/hpEnbVGugSesgWSW/rHkfIy
 eBvP5xKPq9AtQhWYzqKxwTsI+d9r64d2Lutwxz6+vzd5xpFGIhqDdGZ81il2I/pkjyvY
 QHRw==
X-Gm-Message-State: AOJu0YyuxrvLBDzliDK9sYKv5FVXPlKV/co7eo1KhwcClsKPQwZVr4v0
 5faDsuSYy35AvU6NNPmC8ZTZ/+EBbPWRk/b1H6IKAphLS1mNXboZyLUNLIYjppE=
X-Google-Smtp-Source: AGHT+IH2ajuJork/7JqWeYp4YBbQ/POuwako7u5DhXoXi4Y6s7PhEMUXhdp8pdOnE94dGj/rOSOAtA==
X-Received: by 2002:a17:902:c1c1:b0:1db:b43b:eb with SMTP id
 c1-20020a170902c1c100b001dbb43b00ebmr3383387plc.42.1708219016758; 
 Sat, 17 Feb 2024 17:16:56 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 jx14-20020a170903138e00b001d936a7bd46sm1969307plb.271.2024.02.17.17.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 17:16:56 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:16:53 -0800
Message-Id: <20240218011653.790820-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708219017; x=1708823817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2OJiiYGB77jbfvgy9HaGdxhiQSchQ0Hs1Vx4ryyuBwI=;
 b=hxwRivVNg21SEHi4ByKK0n6WvdByZnDnSXcFPBaCEyzuOyvfplyPOTtZiBVxu1S1xz
 lQ7/oo8DxeYN+hzeCdc0/EcTd+JI9kFefTYreSdbyhsPZt6kloub2qstZJ+gNffSIz6B
 GYLYRvHiNqLoRJX93g1hrGDpP8E/bgySh6kIDjiu4Z8coAs/GPGpj2rPpdEB5HdKYruE
 wz8WPQo7BnygUHQDm3JFQRoO4SM4xC8rFoEi1xVKp3CX7PJIRQzcaAAu0A9VGGWDs3HX
 wH2+/3lqJkPKrsDgDU0mFKGi0ol9uaDqUOdaYX0PLnytU/yT7mfffOHxnoav8do2AcyS
 cVCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hxwRivVN
Subject: [Buildroot] [PATCH 1/1] package/google-breakpad: fix missing
 include error
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Pascal Huerst <pascal.huerst@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

c3JjL2NvbW1vbi9tb2R1bGUuY2M6IEluIG1lbWJlciBmdW5jdGlvbiDigJhib29sIGdvb2dsZV9i
cmVha3BhZDo6TW9kdWxlOjpBZGRGdW5jdGlvbihGdW5jdGlvbiop4oCZOgpzcmMvY29tbW9uL21v
ZHVsZS5jYzoxOTQ6NTI6IGVycm9yOiDigJhmaW5kX2lm4oCZIGlzIG5vdCBhIG1lbWJlciBvZiDi
gJhzdGTigJk7IGRpZCB5b3UgbWVhbiDigJhmaW5k4oCZPwogIDE5NCB8ICAgICBGdW5jdGlvblNl
dDo6aXRlcmF0b3IgZXhpc3RpbmdfZnVuY3Rpb24gPSBzdGQ6OmZpbmRfaWYoCiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fgog
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZpbmQKTWFrZWZpbGU6ODMwOTogcmVjaXBlIGZvciB0YXJnZXQgJ3NyYy9jb21tb24vdG9vbHNf
bWFjX2R1bXBfc3ltc19kdW1wX3N5bXNfbWFjLW1vZHVsZS5vJyBmYWlsZWQKClRoaXMgZXJyb3Ig
aXMgc2VlbiBvbiBnY2MtMTQuCgpyZWxhdGVkIGxpbmtzOgpodHRwczovL2Nocm9taXVtLXJldmll
dy5nb29nbGVzb3VyY2UuY29tL2MvYnJlYWtwYWQvYnJlYWtwYWQvKy81MTM3NjU4Cmh0dHBzOi8v
Z2l0Lm9wZW5lbWJlZGRlZC5vcmcvbWV0YS1vcGVuZW1iZWRkZWQvdHJlZS9tZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvYnJlYWtwYWQvYnJlYWtwYWQvMDAwMS1GaXhlZC1taXNzaW5nLWluY2x1ZGUt
Zm9yLXN0ZC1maW5kX2lmLnBhdGNoCgpTaWduZWQtb2ZmLWJ5OiBLYWRhbWJpbmkgTmVtYSA8a2Fk
YW1iaW5pLm5lbWFAZ21haWwuY29tPgotLS0KIC4uLml4ZWQtbWlzc2luZy1pbmNsdWRlLWZvci1z
dGQtZmluZF9pZi5wYXRjaCB8IDI0ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nb29nbGUtYnJl
YWtwYWQvMDAwMS1GaXhlZC1taXNzaW5nLWluY2x1ZGUtZm9yLXN0ZC1maW5kX2lmLnBhdGNoCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1GaXhlZC1taXNzaW5nLWlu
Y2x1ZGUtZm9yLXN0ZC1maW5kX2lmLnBhdGNoIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAw
MS1GaXhlZC1taXNzaW5nLWluY2x1ZGUtZm9yLXN0ZC1maW5kX2lmLnBhdGNoCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjgwZWFiNzIzYjMKLS0tIC9kZXYvbnVsbAorKysg
Yi9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC8wMDAxLUZpeGVkLW1pc3NpbmctaW5jbHVkZS1mb3It
c3RkLWZpbmRfaWYucGF0Y2gKQEAgLTAsMCArMSwyNCBAQAorRnJvbSA4OThhOTk3ODU1MTY4YzBl
NmE2ODkwNzJmZWZiYTg5MjQ2MjcxYTVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTog
TmF0aGFuIE1vaW52YXppcmkgPG5hdGhhbkBuYXRoYW5tLmNvbT4KK0RhdGU6IFR1ZSwgMTkgRGVj
IDIwMjMgMTQ6MzU6MDUgLTA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4ZWQgbWlzc2luZyBpbmNs
dWRlIGZvciBzdGQ6OmZpbmRfaWYuCisKK1Rocm93cyBhbiBlcnJvciB3aGVuIGNvbXBpbGluZyBv
biBXaW5kb3dzLgorCitDaGFuZ2UtSWQ6IEllYjM0YzAwY2YxOTlhYWExYjQ1YTQ0MDA4NmM0OGI4
ZWQzNjNiM2M3CitSZXZpZXdlZC1vbjogaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291
cmNlLmNvbS9jL2JyZWFrcGFkL2JyZWFrcGFkLysvNTEzNzY1OAorUmV2aWV3ZWQtYnk6IEl2YW4g
UGVua292IDxpdmFucGVAY2hyb21pdW0ub3JnPgorLS0tCisKK2RpZmYgLS1naXQgYS9zcmMvY29t
bW9uL21vZHVsZS5jYyBiL3NyYy9jb21tb24vbW9kdWxlLmNjCitpbmRleCAwZWI1YWFkLi5iNmY1
ZGE3IDEwMDY0NAorLS0tIGEvc3JjL2NvbW1vbi9tb2R1bGUuY2MKKysrKyBiL3NyYy9jb21tb24v
bW9kdWxlLmNjCitAQCAtNDIsNiArNDIsNyBAQAorICNpbmNsdWRlIDxzdGRpby5oPgorICNpbmNs
dWRlIDxzdHJpbmcuaD4KKyAKKysjaW5jbHVkZSA8YWxnb3JpdGhtPgorICNpbmNsdWRlIDxmdW5j
dGlvbmFsPgorICNpbmNsdWRlIDxpb3N0cmVhbT4KKyAjaW5jbHVkZSA8bWVtb3J5PgotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
