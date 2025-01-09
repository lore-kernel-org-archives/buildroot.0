Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DDCE77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67F1560AE8;
	Thu,  9 Jan 2025 21:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENdn4cHtpZ3E; Thu,  9 Jan 2025 21:34:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6981360F3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6981360F3B;
	Thu,  9 Jan 2025 21:34:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AF84940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2929C60F3B
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmBP5KAC2Fyp for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B16860AE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B16860AE8
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B16860AE8
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:34:42 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3ce46520a29so7383735ab.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736458481; x=1737063281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sW6ybsEwsefvnzC6PdHSKt73KLPp3tYwNHX9ZtONNCw=;
 b=at8O83VdqO95baGZOCX67tnldMQGkm/hqwSr1dotBtgXeWh3sTHsWdifeEBlzbA0lA
 WYHO0DoOnUeqOxIF+rXOANqJAf3fp0OyhPVAwPjcUi4FH89h7DBeo1cezzU3um59Kx3H
 MjZLV0CjkFgMX6Ghyy84HwX7giDDe9OdKv5RqHTHtp9EVM3YBdNtZjjz6BLpF8vtSlux
 IoHX/qtyppl720dVVl5ORkl3sdLe5O1+FlXwAdv+oy5yjMh5DRw6OAV6P+u/YzEu1/lM
 pjZ7CsHHr3ku3GH4BfRGIFabuCGpuChvYhyD8EOvCiheYxMSy6dWAnLh4Hf2I2dLCICE
 W91A==
X-Gm-Message-State: AOJu0Yzz7/Amp820S3vmvMDcfBOz2U5ugT6OBaO8JhbLHOrpvRk9nkpd
 gVcinAn1Xyb9iaHI8ORTCimyG0KN2+V8KgrbYO27GM1RKanZiqN525AP7B98vDM=
X-Gm-Gg: ASbGncssSUxw1oAi71I3smkrJHrPoXkqou53Qs5lg6jmMFv7+oZKQSrzJZDzn/HIqog
 lM8TRcMunAo2rc5oHXgmTeXUZw8de2J7hd1ddkzJJPftE94xlaJQE1nEXL9Ay9BxyIBiz9r8xRk
 shrWiuFR4+X8MMG0itY3XJyo2HowiXX/O5DhLaqxpF6pj0PYGI5sHd58IjMCkLoNBhZ++qIqzge
 I3W0Xtexv2l7kd+RwUbA+hUDELy/kNIDYVylzjoPdRYTIczhrIwVaRsYvGfiDfA0NdT0+zq04Ib
 xE9zepz4tcL+jL/jRhqQ6eZzXr01agw=
X-Google-Smtp-Source: AGHT+IEUgAMJbrg6vMbkvGFTIJj7ruivXUBBILPBLjXBradEeKdmyx4VxjKgUDblwj+A2DRUO9iCAA==
X-Received: by 2002:a05:6e02:1f8a:b0:3cb:f2e6:5590 with SMTP id
 e9e14a558f8ab-3ce3a7abde0mr74660505ab.0.1736458480973; 
 Thu, 09 Jan 2025 13:34:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b62c333sm519011173.71.2025.01.09.13.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:34:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:34:39 -0700
Message-Id: <20250109213439.2410122-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736458481; x=1737063281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sW6ybsEwsefvnzC6PdHSKt73KLPp3tYwNHX9ZtONNCw=;
 b=IWvo8sKRFNdSa00Vywv7mHAjBaEfCcx2cXJyp3uiCR++RcvA9ts20mMC8WfZJYo0Bv
 6XoJY8luCcSSp9qUIgOsxJUPB3ryINCLvHWb/6QLiC5n1oXZnc1YAQsbToNM5hHqIOpz
 lyaG1Y1tZkdzgiqYEzm/HTpxR5zElU4o/13lCUNwJaJluMXgiAdZW0F/MwG1aZ1Tj5IT
 zWQv4Y1G1m2S9BILylCbkLQyyD3oWQE7fZ0+nHb1NIPbPCxtWH5nvd9dt2UKuTGzmaPU
 QLSmmo2KmgPDOlPsR9+OIkwvNYBwoER7caWVJ26XBhiYMK/WX/EwQs2wrW+fP1vE71uK
 OXoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IWvo8sKR
Subject: [Buildroot] [PATCH 1/1] package/python-janus: bump to version 2.0.0
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
 package/python-janus/python-janus.hash | 4 ++--
 package/python-janus/python-janus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-janus/python-janus.hash b/package/python-janus/python-janus.hash
index 9cdf8fdde7..d7d0ce401b 100644
--- a/package/python-janus/python-janus.hash
+++ b/package/python-janus/python-janus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/janus/json
-md5  0e3053f8b41e447e3cabed4075ac9116  janus-1.1.0.tar.gz
-sha256  0634df8b2b31f8afda4311abcf7fea912686fef717d13769eeaa01ae08d2b84c  janus-1.1.0.tar.gz
+md5  7c8ec257be4e90abc47a7df47df88436  janus-2.0.0.tar.gz
+sha256  0970f38e0e725400496c834a368a67ee551dc3b5ad0a257e132f5b46f2e77770  janus-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8b177cccb6ddec12a9fc97bd49e7e2bbcd92464625624bd8bdbfad799ae606e9  LICENSE
diff --git a/package/python-janus/python-janus.mk b/package/python-janus/python-janus.mk
index a6cbfc86db..12ec7d6c48 100644
--- a/package/python-janus/python-janus.mk
+++ b/package/python-janus/python-janus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JANUS_VERSION = 1.1.0
+PYTHON_JANUS_VERSION = 2.0.0
 PYTHON_JANUS_SOURCE = janus-$(PYTHON_JANUS_VERSION).tar.gz
-PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/45/50/112a19f28a11b545c4c95de29c50a06fa9381a2432eaabbf9316bbd4e046
+PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/d8/7f/69884b6618be4baf6ebcacc716ee8680a842428a19f403db6d1c0bb990aa
 PYTHON_JANUS_SETUP_TYPE = setuptools
 PYTHON_JANUS_LICENSE = Apache-2.0
 PYTHON_JANUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
