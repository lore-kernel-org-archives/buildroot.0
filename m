Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8B1C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 06:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E087882640;
	Sat, 25 May 2024 06:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A276jyi0jJbI; Sat, 25 May 2024 06:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B3F82660
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B3F82660;
	Sat, 25 May 2024 06:12:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7F41CFAD6
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76B5082660
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8prn75CLID3 for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 06:12:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2244C82640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2244C82640
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2244C82640
 for <buildroot@buildroot.org>; Sat, 25 May 2024 06:12:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so9754115e9.1
 for <buildroot@buildroot.org>; Fri, 24 May 2024 23:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716617569; x=1717222369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TPGCvQ/dvrus17iBIJgTTt0xV+jWCEnZ7YA1Q2oEwVY=;
 b=TXfPdaJiRCL8w7ONRTRvHS42t8PAdbGa8ukhzlbkxZCCJJ/8bT7JdmNe7dKT2Y24Vd
 51szbbpO240ESuaeAdufZpXzIyN1NvyU20UxFlt+pFf4rmZOJ6iYnP/DD+oq8A2qYPII
 qDU1ceIrAkbSbM2Qiv2j8hFW3YHcMMHV1QMytibvjXTG8iwZ3Lu45bcCPC8udMYKJ8Ap
 RUEG+Mmt13QzejqIAMHhQqFZcQGvgfzcRzvXmd3gSD+YMsEafiZxB1TYsWR552Cr8MPb
 F0q5GG6JlzKt3bRswztBLkYseRWNnQEWrTqUBKxRldts783f3uzgIyYUE7Vr/fyh8Sch
 m4Jg==
X-Gm-Message-State: AOJu0YxD0n5hiUalgSqsll27ksqAZrxDwpYZXlTmDgHi1IW2MhpiYgvB
 /dAAEV6SVmiVTNvELRPBItcbGY2qK6fQ6396r9YcR4l+Cpx1wqv5q1KWoA==
X-Google-Smtp-Source: AGHT+IGggzAfmzTQ7F649dVuhCh45MLGX5i7KEnewRDeKLrr6ssLcNFd2BhhfOmBY+aVqsYF3ZNDxw==
X-Received: by 2002:a05:600c:1c83:b0:421:925:6655 with SMTP id
 5b1f17b1804b1-421092566c8mr34980985e9.1.1716617568355; 
 Fri, 24 May 2024 23:12:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42108966682sm38950225e9.2.2024.05.24.23.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 23:12:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 08:12:44 +0200
Message-ID: <20240525061244.8014-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716617569; x=1717222369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TPGCvQ/dvrus17iBIJgTTt0xV+jWCEnZ7YA1Q2oEwVY=;
 b=m8HY5DEsW4dQScu7kupwFgoQApUosJcnoMouln0rFtM+QslXi3JJMmDhkmUhJolrO8
 i9b4yljBEyK1R9LGndAurLBcBeHbJSLrB3kiqgzhseh63x2ksESVBbHUe6cyEKVvBfYz
 bwVXNCeF+5aPtTFYBFnM7DAJvaFvEmj2rxFVszT0bIMt9qy8PsrH1m+c1hlL7r5OxIWI
 ZmykdSXFg4zrZOoYkixByQ+YRwf37mOMDhFHuNN2647VUvqOPsTcsxJ8O7JySxZzGf6W
 PxRe7PI3we+TJGHAvq/tm5pctWoEwKedzU8UL6NDacffeYuuINbJ5V89ew5CdjLLCcca
 Zthg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m8HY5DEs
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: fix build with
 kernel >= 6.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGtlcm5lbCA+PSA2Ljc6CgovaG9t
ZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTAvb3V0cHV0LTEvYnVpbGQvY3J5cHRvZGV2
LWxpbnV4LTEuMTMvLi9jcnlwdGxpYi5jOiBJbiBmdW5jdGlvbiDigJhjcnlwdG9kZXZfaGFzaF9p
bml04oCZOgovaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTAvb3V0cHV0LTEvYnVp
bGQvY3J5cHRvZGV2LWxpbnV4LTEuMTMvLi9jcnlwdGxpYi5jOjM4NDoyODogZXJyb3I6IGltcGxp
Y2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGNyeXB0b19haGFzaF9hbGlnbm1hc2vigJk7
IGRpZCB5b3UgbWVhbiDigJhjcnlwdG9fYWVhZF9hbGlnbm1hc2vigJk/IFstV2Vycm9yPWltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDM4NCB8ICAgICAgICAgaGRhdGEtPmFsaWdubWFz
ayA9IGNyeXB0b19haGFzaF9hbGlnbm1hc2soaGRhdGEtPmFzeW5jLnMpOwogICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjcnlwdG9fYWVhZF9hbGlnbm1hc2sKCkZpeGVzOgogLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy80NjYzNjBjN2JhZWMyZWRmNDJk
YzZmMGFkOWE4ZDc1N2RkNDcxYzg4CgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAuLi4vMDAwMy1GaXgtYnVpbGQtZm9yLUxp
bnV4LTYtNy1yYzEucGF0Y2ggICAgfCAzOCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvY3J5cHRv
ZGV2LWxpbnV4LzAwMDMtRml4LWJ1aWxkLWZvci1MaW51eC02LTctcmMxLnBhdGNoCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9jcnlwdG9kZXYtbGludXgvMDAwMy1GaXgtYnVpbGQtZm9yLUxpbnV4LTYt
Ny1yYzEucGF0Y2ggYi9wYWNrYWdlL2NyeXB0b2Rldi1saW51eC8wMDAzLUZpeC1idWlsZC1mb3It
TGludXgtNi03LXJjMS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li40ZmRjY2FmNmUwCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9jcnlwdG9kZXYtbGludXgv
MDAwMy1GaXgtYnVpbGQtZm9yLUxpbnV4LTYtNy1yYzEucGF0Y2gKQEAgLTAsMCArMSwzOCBAQAor
RnJvbSA1ZTcxMjFlNDVmZjI4M2QzMDA5N2RhMzgxZmQ3ZTk3YzRiYjYxMzY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP0pvYW49MjBCcnVndWVyYT0yME1pYz1DMz1C
Mz89IDxqb2FuYnJ1Z3VlcmFtQGdtYWlsLmNvbT4KK0RhdGU6IFN1biwgMTAgRGVjIDIwMjMgMTM6
NTc6NTUgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGJ1aWxkIGZvciBMaW51eCA2LjctcmMx
CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1NpbmNlIExpbnV4IDYuNy1y
YzEsIG5vIGFoYXNoIGFsZ29yaXRobXMgc2V0IGEgbm9uemVybyBhbGlnbm1hc2ssCithbmQgdGhl
cmVmb3JlIGBjcnlwdG9fYWhhc2hfYWxpZ25tYXNrYCBoYXMgYmVlbiByZW1vdmVkLgorCitTZWUg
YWxzbzogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9MGY4NjYwYzgyYjc5YWY1OTViMDU2ZjZiOWY0ZjIy
N2VkZWI4ODU3NAorICAgICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWM2MjY5MTBmM2YxYmJj
ZTZhZDE4YmM2MTNkODk1ZDJhMDg5ZWQ5NWUKKworU2lnbmVkLW9mZi1ieTogSm9hbiBCcnVndWVy
YSBNaWPDsyA8am9hbmJydWd1ZXJhbUBnbWFpbC5jb20+CisKK1Vwc3RyZWFtOiBodHRwczovL2dp
dGh1Yi5jb20vY3J5cHRvZGV2LWxpbnV4L2NyeXB0b2Rldi1saW51eC9jb21taXQvNWU3MTIxZTQ1
ZmYyODNkMzAwOTdkYTM4MWZkN2U5N2M0YmI2MTM2NAorU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CistLS0KKyBjcnlwdGxpYi5jIHwg
NCArKysrCisgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEv
Y3J5cHRsaWIuYyBiL2NyeXB0bGliLmMKK2luZGV4IDRkNzM5ZTUuLjBlNTlkNGMgMTAwNjQ0Cist
LS0gYS9jcnlwdGxpYi5jCisrKysgYi9jcnlwdGxpYi5jCitAQCAtMzgxLDcgKzM4MSwxMSBAQCBp
bnQgY3J5cHRvZGV2X2hhc2hfaW5pdChzdHJ1Y3QgaGFzaF9kYXRhICpoZGF0YSwgY29uc3QgY2hh
ciAqYWxnX25hbWUsCisgCX0KKyAKKyAJaGRhdGEtPmRpZ2VzdHNpemUgPSBjcnlwdG9fYWhhc2hf
ZGlnZXN0c2l6ZShoZGF0YS0+YXN5bmMucyk7CisrI2lmIChMSU5VWF9WRVJTSU9OX0NPREUgPCBL
RVJORUxfVkVSU0lPTig2LCA3LCAwKSkKKyAJaGRhdGEtPmFsaWdubWFzayA9IGNyeXB0b19haGFz
aF9hbGlnbm1hc2soaGRhdGEtPmFzeW5jLnMpOworKyNlbHNlCisrCWhkYXRhLT5hbGlnbm1hc2sg
PSAwOworKyNlbmRpZgorIAorIAlpbml0X2NvbXBsZXRpb24oJmhkYXRhLT5hc3luYy5yZXN1bHQu
Y29tcGxldGlvbik7CisgCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
