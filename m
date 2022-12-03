Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E65C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 18:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C367681826;
	Sat,  3 Dec 2022 18:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C367681826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7jDdaKp51pPT; Sat,  3 Dec 2022 18:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FDCD817EB;
	Sat,  3 Dec 2022 18:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FDCD817EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A46B21BF232
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 18:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ACA041526
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 18:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ACA041526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spsORys0APgn for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 18:37:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4926410D1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4926410D1
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 18:37:08 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so8846063wma.1
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 10:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=grUOff4uiaW3E3SfDi2X2ZpEifCrtbUFVzooxzOvdMc=;
 b=msABPQ4d4oAuxYL/szEIGNSRDpOvB4p2pmK9VuKd/3uSrKPaAv55yPFp89lI0bZOUF
 jil1zKRf63oSIOnohiDlS70SUJ+hSPx2xTJXJdPzATfArRvlUMCofk6dtAakQ4pU/puw
 pefX99yJAAMUmgwTm9yCuUkOGTeSMh3BZxr8Dhd06pP3+Mj+PWQsHxsMEevMIU4RWKlS
 jc8gKkFUGvgiaH1gz2cSgTbtBPcBdwrS7U6E03dr/iP50vSm5d2cbNfDMLAS1MaR7Du5
 SXqKOnp4acUB2v3VsWY8LfLAnWCMQ9zeHcb1LK03iYZVXsqK6tjlp2VMqPbm//Rnx67O
 Tkxw==
X-Gm-Message-State: ANoB5plSgZEr1aWMSQjf0m7+5i+AIU5DEQPnPWZcmBYZxO2HbHIoijxW
 cIG4xbpVkKlzAk/A7NmAoee/wEDRXwM=
X-Google-Smtp-Source: AA0mqf42nURDRpJRsS/3/qLDCmfbc3g9q8qdYJKWhyPqGfot6jq44kSz5k8J2p8UN2XcTj2+6a6UAQ==
X-Received: by 2002:a05:600c:1d81:b0:3cf:6ab3:4a60 with SMTP id
 p1-20020a05600c1d8100b003cf6ab34a60mr44201549wms.32.1670092627008; 
 Sat, 03 Dec 2022 10:37:07 -0800 (PST)
Received: from localhost ([207.188.147.136]) by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003cf6c2f9513sm12600109wmr.2.2022.12.03.10.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Dec 2022 10:37:06 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Dec 2022 19:36:38 +0100
Message-Id: <20221203183638.1293234-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=grUOff4uiaW3E3SfDi2X2ZpEifCrtbUFVzooxzOvdMc=;
 b=dVuARGix93fQ9KXefnjcCGjEbEH+hT2x6o56PJga6wLBI+RLkdOXTIIP+i5gjsb++Q
 32esPhj/dFHMlj02/UO6vE/zgXS2B8M7aO0WDPAaYX6+YHDDvHLuSCZK+wlLGU6cjtfO
 neTDeqQfLKmP3qrgQJ6YIf37Ln+HFA/1PAKMoCOWOwb1apKnT2hO2AGebBsN1H3cxc41
 L0tTaTCplcp5SUS1tmFcrqGITu6xSHLXi9vgrgOFN6vwV9bVPeO08K9beMmQJtBO4RbT
 iH/jqmPe21foTH9ueQDX0o9VE4Ls3QIwQnhMGHET13rowx3X+oU3GLAMIFRRh6LU5fkk
 qTeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dVuARGix
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.1.7
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2Uv
emZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLmhhc2ggYi9wYWNrYWdl
L3pmcy96ZnMuaGFzaAppbmRleCBiNzNmYzNiNzAzLi4wYmNlMzgxN2ZlIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pmcy96ZnMuaGFzaApAQCAtMSw1ICsx
LDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93
bmxvYWQvemZzLTIuMS42L3pmcy0yLjEuNi5zaGEyNTYuYXNjCi1zaGEyNTYgIDE1MzM5MDE0Zjhk
MjEzMTM0OGViOTM3YmY4ODkzODQ5ODA2YjZkMjY0NWVhNjA3YTE4YzdmMTE3NzQ5ZGJkN2EgIHpm
cy0yLjEuNi50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvZG93bmxvYWQvemZzLTIuMS43L3pmcy0yLjEuNy5zaGEyNTYuYXNjCitzaGEyNTYgIDY0
NjJlNjNlMTg1ZGU2ZmYxMGM2NGZmYTZlZDc3MzIwMWEwODJmOWRkMTNlNjAzZDdlODEzNmZjYjRh
Y2E3MWIgIHpmcy0yLjEuNy50YXIuZ3oKIHNoYTI1NiAgOTZhMjczNTNmZTcxN2ZmMmM4Yjk1ZGVi
OGIwMDljNGViNzUwMzAzYzY0MDBlMmQ4YTI1ODJhYjFlYzEyYjI1YSAgYmMzZjEyYmZhYzE1MmEw
YzI4OTUxY2VjOTIzNDBiYTE0ZjljY2VlOS5wYXRjaAogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmls
ZXM6CmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsK
aW5kZXggZjdlNjczYzIzZi4uODRlOTA5OWJhOSAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZz
Lm1rCisrKyBiL3BhY2thZ2UvemZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKLVpGU19WRVJTSU9OID0gMi4xLjYKK1pGU19WRVJTSU9OID0gMi4x
LjcKIFpGU19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rv
d25sb2FkL3pmcy0kKFpGU19WRVJTSU9OKQogWkZTX1BBVENIID0gaHR0cHM6Ly9naXRodWIuY29t
L29wZW56ZnMvemZzL2NvbW1pdC9iYzNmMTJiZmFjMTUyYTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNj
ZWU5LnBhdGNoCiBaRlNfTElDRU5TRSA9IENEREwKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
