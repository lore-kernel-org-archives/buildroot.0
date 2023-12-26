Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAC5C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 22:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8A3740A14;
	Tue, 26 Dec 2023 22:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8A3740A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FBYzKdsRP_W; Tue, 26 Dec 2023 22:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D544240A07;
	Tue, 26 Dec 2023 22:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D544240A07
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3D61BF34D
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5477E40A07
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5477E40A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwtdqGsYAZcr for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 22:28:47 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E105040114
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 22:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E105040114
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so1387345f8f.1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 14:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703629724; x=1704234524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jD153sVRn/fl+b3McNM9+kUeDxjnnV9xa9Yp+JDacBw=;
 b=Y0zLjqmTq8/hBoCeFENN9LMki3yHy3yjbTeUgyQmfVSJVjN398e0YqRn9rO3KBjID6
 zNPViNWeQr3VbDMi1DFv3UXhWIR0g4SPO/tKtec3p49FSYJS0ISp5mdy1YetMKgYlMYg
 1XgYFVQGIs102cbAJ/j+/nvNxlJsh5OYT7pHXiUfVW/AEt8WDpkcE6KtQsOdsN8rCeYY
 J4+OFImsKc0NkBsqh6X6MnNQS9sx3MmJ6okVnYujCiSCFL7Jax8UDBPexm9MaPilZjbr
 yTvV0FAv56rjOs171M1uorZnoPstdK0qm1hDbWVPwYDQuRb9wVOks2OnbHISO1blGMNr
 rGaA==
X-Gm-Message-State: AOJu0YxZLp5Rf3tJdi/+qEnxaI+44GxCAOrAHdr0gGrZTwMkUXcYIAsg
 0xbNourX7KIHP4ucpzcLfr5yEaGBt50=
X-Google-Smtp-Source: AGHT+IEiDcJV3xNbLsOQkcZVnZzpTE733mfx0c/0j9096pgRW+0uijQZvfo22WJ42+rXj8vSC1jIPg==
X-Received: by 2002:adf:edc3:0:b0:333:2fd2:5d1f with SMTP id
 v3-20020adfedc3000000b003332fd25d1fmr4306484wro.81.1703629723833; 
 Tue, 26 Dec 2023 14:28:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o4-20020a5d4744000000b003365e685102sm13413026wrs.29.2023.12.26.14.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 14:28:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 23:28:27 +0100
Message-ID: <20231226222827.2013990-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703629724; x=1704234524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jD153sVRn/fl+b3McNM9+kUeDxjnnV9xa9Yp+JDacBw=;
 b=kD/wfflLjMZ6IvfhwfKE1eDn0OvC0XYHz9nSkTRdOTLeo62yI1ukPP2WL+gZszDPum
 LJEpFx49NK/t649Sn6f+fLdvIKwjFeZc0+UpFlcR4klhikV0YVR/cNYceAspNFQk9S4O
 p0/wRyVdwjTOpDEV8Jl3EWKvLrprknpnNooh+qVaiqeDksU2YItkulfDM4SEsg0VhKYu
 BxNUZXZh6SVPCIU+/EbKFy0AO91CkLPmEo3/E0jrIi6kU2CyzH0bAPVx02bXyPhB6STU
 zDjnki5OaLX1VntSTpKY3+rWdka1bHACDHQdfXbJ2ONaJpP5Z34KHvbUPLDVUS0lGrZP
 MvDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kD/wfflL
Subject: [Buildroot] [PATCH 1/1] package/empty: bump to version 0.6.23c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of COPYRIGHT (update in year with
https://sourceforge.net/p/empty/code/ci/203ac90eaf90c01bc210697b8dcef7836d27b802/)

https://sourceforge.net/p/empty/code/ci/master/tree/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/empty/empty.hash | 4 ++--
 package/empty/empty.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index cc74254a7a..5c7daa0052 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f581d560e1fa857f5304586e3c2107b5838bcf11dedcccec4a7191fa9e261b69  empty-0.6.22b.tgz
-sha256  db6b65f5eaf782a92715887ac107f3477d64016301a66194a92312b13ff89be1  COPYRIGHT
+sha256  8a7ca8c7099dc6d6743ac7eafc0be3b1f8991d2c8f20cf66ce900c7f08e010bd  empty-0.6.23c.tgz
+sha256  6433f4490a82b80ddac37f24cebfe8f3cd7de5686ebb9737281d47997a9941d6  COPYRIGHT
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 91d9476445..24135b2f8d 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.22b
+EMPTY_VERSION = 0.6.23c
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
