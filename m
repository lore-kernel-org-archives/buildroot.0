Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2935CC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E236660783;
	Fri, 24 Jan 2025 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUby8g08psdr; Fri, 24 Jan 2025 19:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 010EC608C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010EC608C7;
	Fri, 24 Jan 2025 19:36:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F81944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E720E6089A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIp3sRA9Cz_b for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0FF360783
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0FF360783
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0FF360783
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:36:19 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3cfb0ed6ef8so10260895ab.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737747378; x=1738352178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rTnsD8yFIF/L+vi+Ly27bVyL/VxHrsIxniO5e7VFDaM=;
 b=RFg842EQqe7XAA3tQrUir1xY1piXlwa7FKSZJs3C4n+Q+lxpdHKMenUH73Sy8PnOjz
 lBnVVhoLSDna4b2WUrLxggPrKw4EToSdQKq+Ur3iINbS9w+FV+5gZPc3IPdhWYbozPsG
 PrtWVXE5gvw8TGYMKBGDodcrB4A2v8G2Q1plSuawcXc46/G5DznnM7GfITfMyvS2j7Pa
 k7L1iuLOXuOT/mFMPhBK8QxtfoUNa64JqCYxMLH/9zWJg7Z8yD0dxy0FuCgvkX7Ijt13
 2P7QzPdzfEEpsRNzStHOpG1aTGk7imO1ZqGuXxgppw+990veVUvJHBSqv5ijnge/IBZe
 Vd3A==
X-Gm-Message-State: AOJu0YymSRBNsp16uo8x/qXwJhpH4E/geLm5Ws4hSu5X+pE1lGcPU9rw
 cc+Yz686USG5k1AHppaVumwwXdDFdbCv9ulCxS0bgdRwBS02GGZtIK4MGRNu
X-Gm-Gg: ASbGnctU/TKYTaNAErwyKkDMRoIfSpqeLu8Am4XVnR1iOT4RNrHaMVFFxMzqlDdNQPO
 pdBTRwLodjtEPl2g0HD1JxbDdUz8POMJNt68fy3K2cXszpwac+XEQOY0310TaebYBL+de6U58qy
 doCnDxRj6m7xBB27RrWUdr3wrqVlL8/YF511tWqCrBEj3vkQPEA2LljWDxN5Q2s8y3w8/Z+sdTk
 B1aim1OOAs/5N/Wiut6UheeH8ZlXAHdKzTlNPaAt7Tu4J2GZcIhD0fbylO8x3rOjkTN4DG27AtE
 H6Dl269cXE6JPkv7UAcPlcRC0m10fg988RTyexz5uVgGCcx7DV4y+Yg=
X-Google-Smtp-Source: AGHT+IF7OqKfeUcBFWb+3ArNtTQdBD3QQfI7d79syUZ+4COIymRQ6DMIKUuOz+cXo24YjZZGHvhWIg==
X-Received: by 2002:a05:6e02:3984:b0:3cf:baa1:44cc with SMTP id
 e9e14a558f8ab-3cfc7a6f208mr37777485ab.11.1737747378508; 
 Fri, 24 Jan 2025 11:36:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da2db1asm800348173.44.2025.01.24.11.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:36:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:36:14 -0700
Message-Id: <20250124193614.3816599-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737747378; x=1738352178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rTnsD8yFIF/L+vi+Ly27bVyL/VxHrsIxniO5e7VFDaM=;
 b=B6yEjgkbOMsrUFZtb4Mb6TB4U3X2C78WPWrFsRD5nWVipK6WdeHgujjvv1qAj0tshg
 nApjAGYP5bOKHyEQTKTJtVs/Sbx4zN+XpQcha9mVsHNMD9zO4Pg//lQ4TJLkekF3d8WG
 ZxZd+dxF4+WD/mQao1qrbbXGCJ6mbZaJs+Y99/26bnlFCJTRj8fl75Yx8wTVBDGcbxCP
 ByAq4FxL6VdKbpa4uHDy7lLk8n6XRVwEVATYNtvi/MOvGbq/B6qtzvE9UpD7jMS/41aM
 NH/LCfyHJSy7NSwlAR7hl6VZuEh8BV+6T8/i53LtacagxlVN2zbVUUL1+DuJmrCOmOtX
 bAoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B6yEjgkb
Subject: [Buildroot] [PATCH 1/1] package/python-hyperframe: bump to version
 6.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hyperframe/python-hyperframe.hash | 4 ++--
 package/python-hyperframe/python-hyperframe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hyperframe/python-hyperframe.hash b/package/python-hyperframe/python-hyperframe.hash
index b39ab51a72..a3abf27b15 100644
--- a/package/python-hyperframe/python-hyperframe.hash
+++ b/package/python-hyperframe/python-hyperframe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hyperframe/json
-md5  153c064e8ac654aaf136b3388c36de48  hyperframe-6.0.1.tar.gz
-sha256  ae510046231dc8e9ecb1a6586f63d2347bf4c8905914aa84ba585ae85f28a914  hyperframe-6.0.1.tar.gz
+md5  fda90f638a3db3e8f1837c2e0ade8f08  hyperframe-6.1.0.tar.gz
+sha256  f630908a00854a7adeabd6382b43923a4c4cd4b821fcb527e6ab9e15382a3b08  hyperframe-6.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hyperframe/python-hyperframe.mk b/package/python-hyperframe/python-hyperframe.mk
index 4b13ca51a3..3ebbf4cee5 100644
--- a/package/python-hyperframe/python-hyperframe.mk
+++ b/package/python-hyperframe/python-hyperframe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HYPERFRAME_VERSION = 6.0.1
+PYTHON_HYPERFRAME_VERSION = 6.1.0
 PYTHON_HYPERFRAME_SOURCE = hyperframe-$(PYTHON_HYPERFRAME_VERSION).tar.gz
-PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/5a/2a/4747bff0a17f7281abe73e955d60d80aae537a5d203f417fa1c2e7578ebb
+PYTHON_HYPERFRAME_SITE = https://files.pythonhosted.org/packages/02/e7/94f8232d4a74cc99514c13a9f995811485a6903d48e5d952771ef6322e30
 PYTHON_HYPERFRAME_SETUP_TYPE = setuptools
 PYTHON_HYPERFRAME_LICENSE = MIT
 PYTHON_HYPERFRAME_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
