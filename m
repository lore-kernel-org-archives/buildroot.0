Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77477EC049D
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 10:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C168861387;
	Tue,  3 Mar 2026 10:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MLylF5B8XPx; Tue,  3 Mar 2026 10:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25F4A61374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772532781;
	bh=lYpurpxeM5lbr8g9Cdk/nu+hM3yYwnYsBXesXUh0YW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NKNM8wlotqwDi6LVrjptP2E6lZPZ5LqCVbeUn4Wi3JhnwGOHjwU9rUFv41qE0coww
	 zMBcW0+eNSMATXUAPqTYk0HdCfbeJ/FQfuMvJy3wM6yTbjK8ZnayZLTtib0XBGk7yN
	 fzQOy34RL0RIw+zuncxAuOgxXjoroyWDuut0oeR5mcHC6TJdyTiEzYM+BQd+F5Nptq
	 h8JMxawFA1qMJHIxXrfLozSfiU66PTciP3Sa3tROxwbSj7X1MkO74MPOBkUdwYOn4k
	 I+93HXW7oF9FMyqkuiCqrROmjeFBn6m4/7xemf1VH4j7uqICO065DtqqNuWCxdtuIk
	 S+Sfy1zx5GPcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25F4A61374;
	Tue,  3 Mar 2026 10:13:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A16231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B34D6137C
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Dax1VlK0XM7 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 10:12:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68178611D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68178611D9
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68178611D9
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:12:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso1710094f8f.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 02:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772532775; x=1773137575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5V2L6D1nkzjxpKATS8UDJkLpUZjHsvIplwr/N4mio1k=;
 b=Qj8OOGBUOFrsmRoa5v3JiusqtHM9mPF/c/6dOZCVAqQmTFvt24/Cv0wV9PV404wy1V
 5CtFOv/MuXJiTpELS9HeHjp+il9XmfTXYBBg9cERAl16Q78+sQbTdQ4s3dXJZTzHem5G
 uDjDY6Qqu50eNYpyzoW/50URzto6ZEH2ZoDK+IEOLD5chI3Ln5feivvIFbyQQolJHrLz
 du0xKlTJpX2l+/+Z1VGdR5FlelRC4+eQIiA6HeyX5n+d7++J8X+yKZhisXIXuDHCaTCp
 sobldAa68bu5p0ur7DH9e3VdKoFWPS8jtM9QPGV51PBFoAY4WMuyiPXRBvlBe9b227cX
 nQGA==
X-Gm-Message-State: AOJu0YwUnIPK3bfWA6UwdfYNB5ClUdcP7wbhTaxGoHnKaww6rt+2vjHs
 +FzPUoQK6WPX344gK0XMkRB3hZ6HC4QkcNzTmFZKsNqH852Kl9ejDd48lgTshtDvcwH2bGVCaFV
 Lqdzg
X-Gm-Gg: ATEYQzwjvOXU+3GOt6kZHxAByAno81fZxDL5ghkSLJUnvnpqWqLBBIN/+6O1mJiHbei
 /xbRiBQYkLZfBfqMfuAaJ/VFznSFFhBZZazuQFTT+0R4Y6WOCE3svSZelPC1yT4kPatpVTg4gkO
 Dt1oCA5O7FRtXbzINY5gl3J0zHQ4cAGxUEyT6uCagC3UoqERXEJ0xWy2XCqRagKXoPaKWo5iA1p
 SPbfEEIbxnxhHdkpQ/MbUuSWqPGHB7263fZRiujz2I4PTYM64/5W0LgLHCA/tiZPlAMOEOLrw5Q
 ZUSHbCSx4pvfi050DCD/tpsiyY3T9e6UQnOuE0kWTucM1ph5TNj2dxr/Ai1yu0VKHRsdMR78Vs6
 Cl8jAHx6c+gLUasu8+m2l5v2cWYOua222JSHazgubg4uDWaFTIzXc+LlOAn+cNQw6XgPWznE57S
 OZqjV2BD+G65MtgJs8ULc9tT4fjg==
X-Received: by 2002:a5d:4a92:0:b0:439:a9fa:93c1 with SMTP id
 ffacd0b85a97d-439a9fa99cfmr16354477f8f.14.1772532775148; 
 Tue, 03 Mar 2026 02:12:55 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm32917418f8f.31.2026.03.03.02.12.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 02:12:54 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 11:12:51 +0100
Message-ID: <20260303101254.192225-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772532775; x=1773137575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=5V2L6D1nkzjxpKATS8UDJkLpUZjHsvIplwr/N4mio1k=;
 b=Bb3d5Ld+tKufceWrHiIx800RUhjVYFY7mAS5jbd4qn4pu/qwxMOw9jQrX13kl2K+h+
 fiVq7InvcZ/6G1eCGj9wmrKBCLOLdymJAMLPv/eplbHnCCRr/8dt2kwtRzrKGvaMxLsY
 CQ88gRa00zSWMQe1+eAaVo5GpzyKo2Vn5hccb/tiCHeKXHJRr6v1FVhbvdqrG8L6QRAv
 HJWfcxq36sy0y6IIpFamW6pwH6YWmm4SAl/flI9W0nU1dQeEScn7/zefchlmPs+nM4MV
 tChx1P/k7fNWNYye0bKHganjvylSdCfxg+QHd0fIZBYzHHoL2wGRVsajkgmr022JHfoq
 PS1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Bb3d5Ld+
Subject: [Buildroot] [PATCH 1/4] package/freerdp: bump to v2.11.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information on the release, see:

- https://github.com/FreeRDP/FreeRDP/commit/9b678b6d5a40ce01607d8c3b1b1416437c8416c4
- https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8
- https://github.com/FreeRDP/FreeRDP/compare/2.11.7...2.11.8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.hash | 2 +-
 package/freerdp/freerdp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 83b83db121..5ae222e2ec 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7cc2bf43b9778e9079cd229ea8e37fc1843eb1c11a8e4e003034af71858ce6a  freerdp-2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0-git4.tar.gz
+sha256  8a7c953ece217aa4fa22c4a21ab2bc4c9093fc79aa67d3e1273c140d140203f7  freerdp-2.11.8-git4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index eb17c80e4f..6929c73683 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# Latest, and probably last, commit on the stable-2.0 branch
-FREERDP_VERSION = 2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0
+# Latest, and probably last, release on the stable-2.0 branch
+FREERDP_VERSION = 2.11.8
 FREERDP_SITE = https://github.com/FreeRDP/FreeRDP
 FREERDP_SITE_METHOD = git
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
