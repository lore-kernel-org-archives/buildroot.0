Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E95C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 15:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0F5D81373;
	Mon, 12 Dec 2022 15:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F5D81373
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2JOu2yUcM29; Mon, 12 Dec 2022 15:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B2D080DF9;
	Mon, 12 Dec 2022 15:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B2D080DF9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C96261BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B01A84026F
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B01A84026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30Q9icClr3tz for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 15:45:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F0CA40256
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F0CA40256
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 15:45:52 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b192so96005iof.8
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9GinA7AiRKDlk9+PzKW4VyQpxrLnC6tx7mQlJH/ZJ24=;
 b=4oJYV3PINDQBbuMrU8b1SxJcJsNp4RNZL5kjnEnQm85Q8xLpaJPF2zP1zF9IG7PSh7
 M96wg4idRTlgT8Y1SZx05Fz1vaFDv7wCmLXfObcfou1jFaKcVG02U2FUNGF+urcLNaer
 l6avwFnqyc4ah/zbWKFNzoFzOan3u5apMtsTokczJN/4f0OFrGyr8Yfvfr/5jLJnJSIp
 0G7uWxiMkeHf/cihCbuO+g+vLA+MNoOHjnR9tD8gLzWa3qZR3/vNu1pAqHuhlAIi/7bb
 Kt3H/K5hMilDX99O3/JUq2NHqz2o65nHyFjJY+yk4xqwXF8JY21vmt/fTSIlib4zHEXI
 nuTQ==
X-Gm-Message-State: ANoB5plgecB8LDnRzsivWhX5Ck3UcROM+jcleJKW5YsR99X2WBu4p2V6
 5yUNc4Ap9RseJIeb34I5R5nvfbNEye2wbQ==
X-Google-Smtp-Source: AA0mqf4V9M/9DaQkEGTqSe/9AEpYISluv8+eGLvWiXu/O1PEQnGLUHg6z8fTa1Eh2GwFlcdEhvJhEw==
X-Received: by 2002:a05:6602:2349:b0:6e2:d5f1:98a7 with SMTP id
 r9-20020a056602234900b006e2d5f198a7mr9468238iot.9.1670859951183; 
 Mon, 12 Dec 2022 07:45:51 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g92-20020a028565000000b003781331d909sm42042jai.9.2022.12.12.07.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 07:45:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 08:41:11 -0700
Message-Id: <20221212154111.2865211-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9GinA7AiRKDlk9+PzKW4VyQpxrLnC6tx7mQlJH/ZJ24=;
 b=nwO0dC/GXfPkZD55Pzk1YMCmhF0ElK4yqS/VpW9fjO/4jaN0/1hMOYCWPERKpgnOKT
 TTohvGuwP919b2zUrMNKPEmhHG69SOLZ4sGwATK0EF6JC5eG5kH8f4QGk9hApEZiHnAF
 ynHM5rOSrRVnMmC8xvCab42/J5l3prfFFmMkTrkicex+2iGe3VTZltNm+UWV2tOMOUEg
 hXRx2Y3L0/cxNJqpsuVf6JE7xj+9iWfSNae+oflGDLaQBxTRx4tVrsP5e/n/V05VwRWZ
 knD9VQ3ypzR2uDZHamxDDqYb5bBVIBQ3NjGwWOdKimxGJd2I5YH0uD/j8qhlzpPypJ4X
 LCgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nwO0dC/G
Subject: [Buildroot] [PATCH v2 1/1] package/python-bunch: remove package
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdGhlIHB5dGhvbjMgYnVtcCB0byB2ZXJzaW9uIDMuMTEgaW4gY29tbWl0CjczODUwMGMy
OTZjOGIxMjA2ZjIwZTk0Y2EzZTdjNTkzMmE2YTA0ODYgcHl0aG9uLWJ1bmNoIGhhcyBmYWlsZWQK
dG8gYnVpbGQuCgpUaGlzIGlzIGR1ZSB0byBvcGVuKCkgd2hpY2ggbm8gbG9uZ2VyIGFjY2VwdHMg
J1UnICjigJx1bml2ZXJzYWwKbmV3bGluZeKAnSkgaW4gdGhlIGZpbGUgbW9kZS4KClJlbW92ZSB0
aGlzIHBhY2thZ2UgYXMgaXQgaGFzIG5vdCBoYWQgYSByZWxlYXNlIHNpbmNlIDIwMTEgYW5kCmlz
IHVubWFpbnRhaW5lZCB1cHN0cmVhbS4KCkRldGFpbHM6Cmh0dHBzOi8vZG9jcy5weXRob24ub3Jn
LzMuMTEvd2hhdHNuZXcvMy4xMS5odG1sI3BvcnRpbmctdG8tcHl0aG9uLTMtMTEKCkZpeGVzOgog
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yYmEvMmJhNzJmYzk4Mzc2
MDVhMzZlYTYzYmJkM2U2ZTE4MWE0MGNkZjM2MAoKU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYyOgogIC0g
YWRkIGNvbW1lbnQgYWJvdXQgcHl0aG9uLW11bmNoIHJlcGxhY2VtZW50Ci0tLQogQ29uZmlnLmlu
LmxlZ2FjeSAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCiBERVZFTE9QRVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgLQogcGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluICAg
ICAgICAgfCAgNiAtLS0tLS0KIHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNo
IHwgIDUgLS0tLS0KIHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5tayAgIHwgMTQg
LS0tLS0tLS0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyNyBkZWxl
dGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1idW5jaC9Db25maWcu
aW4KIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gu
aGFzaAogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5j
aC5tawoKZGlmZiAtLWdpdCBhL0NvbmZpZy5pbi5sZWdhY3kgYi9Db25maWcuaW4ubGVnYWN5Cmlu
ZGV4IDI4YzY4MjI2ODkuLjZjMjk2MWM0ZjkgMTAwNjQ0Ci0tLSBhL0NvbmZpZy5pbi5sZWdhY3kK
KysrIGIvQ29uZmlnLmluLmxlZ2FjeQpAQCAtMTQ2LDYgKzE0NiwxMyBAQCBlbmRpZgogCiBjb21t
ZW50ICJMZWdhY3kgb3B0aW9ucyByZW1vdmVkIGluIDIwMjMuMDIiCiAKK2NvbmZpZyBCUjJfUEFD
S0FHRV9QWVRIT05fQlVOQ0gKKwlib29sICJweXRob24tYnVuY2ggcmVtb3ZlZCIKKwlzZWxlY3Qg
QlIyX0xFR0FDWQorCWhlbHAKKwkgIFRoZSBweXRob24tYnVuY2ggcGFja2FnZSBpcyB1bm1haW50
YWluZWQgYW5kIGlzIHJlcGxhY2VkCisJICBieSB0aGUgcHl0aG9uLW11bmNoIHBhY2thZ2UuCisK
IGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fTTJSCiAJYm9vbCAicHl0aG9uLW0yciByZW1vdmVk
IgogCXNlbGVjdCBCUjJfTEVHQUNZCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVS
UwppbmRleCBmMGRjYzQyZGU3Li4wYzM3NzM2OTVhIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisr
KyBiL0RFVkVMT1BFUlMKQEAgLTIwMTcsNyArMjAxNyw2IEBAIEY6CXBhY2thZ2UvcG9saWN5Y29y
ZXV0aWxzLwogRjoJcGFja2FnZS9wcm9mdHBkLwogRjoJcGFja2FnZS9wcm90b2J1Zi1jLwogRjoJ
cGFja2FnZS9wcm90b2J1Zi8KLUY6CXBhY2thZ2UvcHl0aG9uLWJ1bmNoLwogRjoJcGFja2FnZS9w
eXRob24tY29sb3JhbWEvCiBGOglwYWNrYWdlL3B5dGhvbi1maWxlbG9jay8KIEY6CXBhY2thZ2Uv
cHl0aG9uLWZsYXNrLWNvcnMvCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2th
Z2UvQ29uZmlnLmluCmluZGV4IDkxNGMzNTg0ZTkuLjdmMGMzNDUxOWEgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC05NzksNyArOTc5LDYg
QEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCiAJc291cmNlICJwYWNrYWdlL3B5dGhv
bi1ib3R0bGUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tYnJvdGxpL0NvbmZp
Zy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWJzZGlmZjQvQ29uZmlnLmluIgotCXNvdXJj
ZSAicGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRo
b24tY2FjaGVkLXByb3BlcnR5L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNh
bi9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1jYW5vcGVuL0NvbmZpZy5pbiIK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0
aG9uLWJ1bmNoL0NvbmZpZy5pbgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggODllYWU3
NDJiOC4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9Db25maWcuaW4KKysr
IC9kZXYvbnVsbApAQCAtMSw2ICswLDAgQEAKLWNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fQlVO
Q0gKLQlib29sICJweXRob24tYnVuY2giCi0JaGVscAotCSAgQSBkb3QtYWNjZXNzaWJsZSBkaWN0
aW9uYXJ5IChhIGxhIEphdmFTY3JpcHQgb2JqZWN0cykuCi0KLQkgIGh0dHA6Ly9naXRodWIuY29t
L2RzYy9idW5jaApkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNo
Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFzaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggY2ZkZTJkYjYwMy4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFzaAorKysgL2Rldi9udWxsCkBAIC0xLDUgKzAs
MCBAQAotIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9idW5jaC9qc29u
Ci1tZDUgIDBhODI5ZDY0ZTk1ZWQ5NmRlZmJjYWUyYmY5MDYxYmIwICBidW5jaC0xLjAuMS50YXIu
Z3oKLXNoYTI1NiAgNTBjNzdhMGZjMGNiMzcyZGZlNDhiNWUxMTkzN2Q1ZjcwZTc0M2FkYmY0MjY4
M2YzYTZkMjg1NzY0NWE3NmFhYSAgYnVuY2gtMS4wLjEudGFyLmd6Ci0jIExvY2FsbHkgY29tcHV0
ZWQgc2hhMjU2IGNoZWNrc3Vtcwotc2hhMjU2ICA1N2NhOTVjOTIwNTljODM4MDYyNTE5MjQ2Mjk3
OWJkMzI5OTRhYWUzZmNkZjkwMmZmNmViMWU0NjdlZWIwNDY5ICBMSUNFTlNFLnR4dApkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rIGIvcGFja2FnZS9weXRo
b24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAx
OGZkYzIyM2JiLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1i
dW5jaC5taworKysgL2Rldi9udWxsCkBAIC0xLDE0ICswLDAgQEAKLSMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCi0jCi0jIHB5dGhvbi1idW5jaAotIwotIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKLQot
UFlUSE9OX0JVTkNIX1ZFUlNJT04gPSAxLjAuMQotUFlUSE9OX0JVTkNIX1NPVVJDRSA9IGJ1bmNo
LSQoUFlUSE9OX0JVTkNIX1ZFUlNJT04pLnRhci5negotUFlUSE9OX0JVTkNIX1NJVEUgPSBodHRw
czovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZWYvYmYvYTRjZjE3NzlhNGZmYjRm
NjEwOTAzZmEwOGUxNWQxZjRhOGEyZjRlMzM1M2EwMmFmYmUwOTdjNWJmNGE4Ci1QWVRIT05fQlVO
Q0hfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKLVBZVEhPTl9CVU5DSF9MSUNFTlNFID0gTUlUCi1Q
WVRIT05fQlVOQ0hfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Ci0KLSQoZXZhbCAkKHB5dGhv
bi1wYWNrYWdlKSkKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
