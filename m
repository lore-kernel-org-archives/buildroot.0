Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1009CC25B79
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 08:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C782E402D7;
	Tue, 28 May 2024 08:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ow4N7GMPxR1K; Tue, 28 May 2024 08:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661DC404DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661DC404DC;
	Tue, 28 May 2024 08:24:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB3C1D2575
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 08:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67CB8404DC
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 08:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7nhIp4RvnTF for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 08:24:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFDAE402D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFDAE402D7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFDAE402D7
 for <buildroot@buildroot.org>; Tue, 28 May 2024 08:24:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4202ca70287so2522755e9.3
 for <buildroot@buildroot.org>; Tue, 28 May 2024 01:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716884648; x=1717489448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2pJaaeaQSjQumneje4I6urs8vVQmgwGk7bCyYtEN+U=;
 b=YP6o3K/3LBJZkpk2H8EZMDzLv/FmcV2bsSGDGFeJi7Ua1C3Qv24rVRLpODHY8sosvC
 ZhivkOB8jOy+FETuPEW5se09j8/d7paWRhlhqQooRSjqTGo3jtoipGrtmxRpbMBKYbQH
 ZzJreBOEGL7zUuPzIsQfAI4V/P4ov3Dlvw17r6fz/n0J8u56Nzvvu94daweKnGZ6FCFv
 aJtUNJKJR4ByGwhWDYVfZhCsNx+S+pv99ox5kYSx8xyN4ecTYZIl9DRtU5YTy/6z0pYn
 TdjjiD5Q+J/SbiMLLNB/860W2HLaPNjvDKP2HKvO9hOl8r544ab3Fd+I6Jy3dkKmoImg
 YcEg==
X-Gm-Message-State: AOJu0Yz6SPMEUF/UwuUMA8Hw3AX4jnuDuxbOVK1IBATPwC8f5Ox784eJ
 wGIVXRn0m6KH4hjxGqAwf1gbTH3wJQiVxIwgkINt1Q1rfcOPSHCpY/y8qyMPcU0AoP0W1kAAAXJ
 Qu+U=
X-Google-Smtp-Source: AGHT+IEE/zu/VA/+2DY6gBd8azN0LgImZK77bPdZguw1papYQeHGa7pqhTr1NmHd4bLpDzB+tpVtoQ==
X-Received: by 2002:a05:600c:1c03:b0:421:182d:9232 with SMTP id
 5b1f17b1804b1-421182d9352mr37579065e9.18.1716884648028; 
 Tue, 28 May 2024 01:24:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.226])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100f1399asm166374815e9.11.2024.05.28.01.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 01:24:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 10:23:56 +0200
Message-ID: <20240528082356.215363-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716884648; x=1717489448;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r2pJaaeaQSjQumneje4I6urs8vVQmgwGk7bCyYtEN+U=;
 b=keUzO06ZcxvcF4Jbp0t+xfDiNH0ZS80vngaus5izLUQ2dzF4QkFoaa5JFYxQHynxWk
 qw4bZcRSdZUPkkxjv/E6hpsGoGjR9bcOkzwEJyQHmKyw0s8QxgOcSQGfGnKJ/zknGt0r
 2UVuxn+N2xTaR5RM4R/F73CREmZ7z3FIdJr3Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=keUzO06Z
Subject: [Buildroot] [PATCH 1/1] package/openssh: fix build failure with gcc
 11.x
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhdGNoIGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmU6CgpvdXRwdXQvaG9zdC9i
aW4vYXJtLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpaGYtZ2NjIC1EX0xBUkdFRklMRV9T
T1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFCi1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgIC1PcyAt
ZzAgIC1waXBlIC1Xbm8tZXJyb3I9Zm9ybWF0LXRydW5jYXRpb24gLVdhbGwgLVdleHRyYSAtV3Bv
aW50ZXItYXJpdGgKLVd1bmluaXRpYWxpemVkIC1Xc2lnbi1jb21wYXJlIC1XZm9ybWF0LXNlY3Vy
aXR5IC1Xc2l6ZW9mLXBvaW50ZXItbWVtYWNjZXNzIC1Xbm8tcG9pbnRlci1zaWduCi1Xbm8tdW51
c2VkLXBhcmFtZXRlciAtV25vLXVudXNlZC1yZXN1bHQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCAt
V21pc2xlYWRpbmctaW5kZW50YXRpb24KLWZuby1zdHJpY3QtYWxpYXNpbmcgLURfRk9SVElGWV9T
T1VSQ0U9MiAtZnRyYXB2IC1memVyby1jYWxsLXVzZWQtcmVncz11c2VkIC1mbm8tYnVpbHRpbi1t
ZW1zZXQKLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAgLWZQSUMgLUkuIC1JLi4gLUkuIC1JLi8u
LiAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRQotRF9GSUxFX09GRlNF
VF9CSVRTPTY0IC1EX1hPUEVOX1NPVVJDRT02MDAgLURfQlNEX1NPVVJDRSAtRF9ERUZBVUxUX1NP
VVJDRSAtRF9HTlVfU09VUkNFCi1ESEFWRV9DT05GSUdfSCAtYyBwb3J0LWFpeC5jCnNoYTIuYzog
SW4gZnVuY3Rpb24g4oCYU0hBMjU2SW5pdOKAmToKc2hhMi5jOjM2MDoxOiBzb3JyeSwgdW5pbXBs
ZW1lbnRlZDog4oCYLWZ6ZXJvLWNhbGwtdXNlZC1yZWdz4oCZIG5vdCBzdXBwb3J0ZWQgb24gdGhp
cyB0YXJnZXQKICAzNjAgfCB9CiAgICAgIHwgXgptYWtlWzNdOiAqKiogW01ha2VmaWxlOjEwNjog
c2hhMi5vXSBFcnJvciAxCm1ha2VbM106ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMu
Li4uCm1ha2VbMl06ICoqKiBbTWFrZWZpbGU6MTk5OiBvcGVuYnNkLWNvbXBhdC9saWJvcGVuYnNk
LWNvbXBhdC5hXSBFcnJvciAyCgpUaGlzIGNvbW1pdCBhcHBsaWVzIGFuIHVwc3RyZWFtIHBhdGNo
IHRoYXQgaW1wcm92ZXMgdGhlIGRldGVjdGlvbiBvZgotZnplcm8tY2FsbC11c2VkLXJlZ3M9dXNl
ZC4KClNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KLS0tCiAuLi50ZWN0aW9uLW9mLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzLXVz
ZWQucGF0Y2ggfCAzMiArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL29wZW5zc2gvb3BlbnNz
aC5tayAgICAgICAgICAgICAgICAgICAgfCAgMyArKwogMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuc3NoLzAwMDEtSW1wcm92
ZS1kZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2VkLXJlZ3MtdXNlZC5wYXRjaAoKZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvb3BlbnNzaC8wMDAxLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6ZXJvLWNhbGwt
dXNlZC1yZWdzLXVzZWQucGF0Y2ggYi9wYWNrYWdlL29wZW5zc2gvMDAwMS1JbXByb3ZlLWRldGVj
dGlvbi1vZi1memVyby1jYWxsLXVzZWQtcmVncy11c2VkLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMWI5MWIxNWE3OTgzCi0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9vcGVuc3NoLzAwMDEtSW1wcm92ZS1kZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2Vk
LXJlZ3MtdXNlZC5wYXRjaApAQCAtMCwwICsxLDMyIEBACitGcm9tIGY5MTkzZjAzZGIwMDI5ZmM5
YzMxZmJkYjVjNjZhMjczNzQ0NmJkOGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBE
YXJyZW4gVHVja2VyIDxkdHVja2VyQGR0dWNrZXIubmV0PgorRGF0ZTogTW9uLCAyNSBNYXIgMjAy
NCAwOToyODowMiArMTEwMAorU3ViamVjdDogW1BBVENIXSBJbXByb3ZlIGRldGVjdGlvbiBvZiAt
Znplcm8tY2FsbC11c2VkLXJlZ3M9dXNlZC4KKworU2hvdWxkIGJldHRlciBkZXRlY3QgcHJvYmxl
bXMgd2l0aCBnY2MgMTMgb24gbTY4ay4gIGJ6IzM2NzMgZnJvbSBDb2xpbgorV2F0c29uIHZpYSBi
eiMzNjczIGFuZCBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0x
MTA5MzQKKworU2lnbmVkLW9mZi1ieTogRGFycmVuIFR1Y2tlciA8ZHR1Y2tlckBkdHVja2VyLm5l
dD4KK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzaC9vcGVuc3NoLXBvcnRhYmxl
L2NvbW1pdC9mOTE5M2YwM2RiMDAyOWZjOWMzMWZiZGI1YzY2YTI3Mzc0NDZiZDhmCistLS0KKyBt
NC9vcGVuc3NoLm00IHwgMyArKysKKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCisK
K2RpZmYgLS1naXQgYS9tNC9vcGVuc3NoLm00IGIvbTQvb3BlbnNzaC5tNAoraW5kZXggMDMzZGY1
MDFjM2Q4Li4xNzZhOGQxYzkyODIgMTAwNjQ0CistLS0gYS9tNC9vcGVuc3NoLm00CisrKysgYi9t
NC9vcGVuc3NoLm00CitAQCAtMjAsNyArMjAsMTAgQEAgY2hhciAqZjIoY2hhciAqcywgLi4uKSB7
CisgCXZhX2VuZChhcmdzKTsKKyAJcmV0dXJuIHN0cmR1cChyZXQpOworIH0KKytpbnQgaTsKKytk
b3VibGUgZDsKKyBjb25zdCBjaGFyICpmMyhpbnQgcykgeworKwlpID0gKGludClkOworIAlyZXR1
cm4gcyA/ICJnb29kIiA6ICJnb29kZXIiOworIH0KKyBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
KmFyZ3YpIHsKKy0tIAorMi40My4wCisKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNzaC9vcGVu
c3NoLm1rIGIvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsKaW5kZXggZDdmNGRiNTljYTNkLi41
YTU2OGQ1ZmQxNzQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCisrKyBi
L3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCkBAIC0xMyw2ICsxMyw5IEBAIE9QRU5TU0hfU0lU
RSA9IGh0dHA6Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0QvT3BlblNTSC9wb3J0YWJsZQog
T1BFTlNTSF9MSUNFTlNFID0gQlNELTMtQ2xhdXNlLCBCU0QtMi1DbGF1c2UsIFB1YmxpYyBEb21h
aW4KIE9QRU5TU0hfTElDRU5TRV9GSUxFUyA9IExJQ0VOQ0UKIAorIyAwMDAxLUltcHJvdmUtZGV0
ZWN0aW9uLW9mLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzLXVzZWQucGF0Y2gKK09QRU5TU0hfQVVUT1JF
Q09ORiA9IFlFUworCiBPUEVOU1NIX0NPTkZfRU5WID0gXAogCUxEPSIkKFRBUkdFVF9DQykiIFwK
IAlMREZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIiBcCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
