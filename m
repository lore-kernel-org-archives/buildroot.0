Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEACC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 00:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4199382C75;
	Sun,  2 Oct 2022 00:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4199382C75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWVr7JJNC-n5; Sun,  2 Oct 2022 00:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76F8A82C3E;
	Sun,  2 Oct 2022 00:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76F8A82C3E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 654191BF977
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 00:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 409254013C
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 00:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 409254013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1aeSuo8Gr2F for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 00:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08A8F40139
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08A8F40139
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 00:49:45 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 2so1479569pgl.7
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 17:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rGcPrJ81Yr5zz+XfR3cKTtEvbXf4sOX/g6g+zWKECdM=;
 b=Yuo9b+DDtCNs1+Vq9dor0BmPMUjmc0s/kwcMzVKHWiV41IR+XinEiCJiD60tMRdKJh
 FWFfkzrrSY8tHdwdVWbKDipu//lg3GZbKtHbwejvAYuUPSpbKbSuXIdcyWDpYwfwMi9g
 wXkIE1/JvXr/uKR7z3c7qZDUCn1YMidy3snXT17sPAH1NpfwGcjAdXeqJYek2mh4eJ2l
 X2zJAWz2oyPDxOmC3Ja/0qPurBrcWLh49ydosQOli3omX6BfsG+/ZJc/siy99YI52Cwl
 fpv72o7ueGeUMah4T58LMz4VOafA/c4sBtfo3nbE34FlrFhprZNmpfES5+M1j8LG1/ak
 Z36Q==
X-Gm-Message-State: ACrzQf18DwiLdAd/UdM77jyidU/nlMkL6r/tpTK7k2sSHvX6LaQDJyjL
 R/ZGcREuBf6ZyXXkL9oVhT1+8t5zpZfStQ==
X-Google-Smtp-Source: AMsMyM4QTPMCHBjaJ5bVzTisKWiNUnxEh3RCmJCt9obq7L2nxlRG3x4ds//YIe+LiyQ7vxB3P0A86A==
X-Received: by 2002:a63:c112:0:b0:443:94a1:f09 with SMTP id
 w18-20020a63c112000000b0044394a10f09mr5894297pgf.396.1664671784848; 
 Sat, 01 Oct 2022 17:49:44 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:f3f6:75b8:5739:f03d])
 by smtp.gmail.com with ESMTPSA id
 x2-20020aa79562000000b0053dec787698sm1031611pfq.175.2022.10.01.17.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 17:49:43 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Oct 2022 13:49:30 +1300
Message-Id: <20221002004931.1805825-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=rGcPrJ81Yr5zz+XfR3cKTtEvbXf4sOX/g6g+zWKECdM=;
 b=ICRl5cm8eShAhzOkDRZGpUxgt1Xt/1tF98oO/snga79DNPNfaLB0DgbN1yq0qPjcmt
 9mt6C/BvQMseY9nsxAFZE2VTKjQlXLNJwxG3Rx6QYKnE8cAVck0uDAhv6qKUZXBQLRhe
 5uI5ADhZf8eVMmciaWrOy+JbwWGAZgzHPgcEU1CP6iAqM4m2fO0PmNZTPVd7pLvZnLPc
 OOuMkTFFiTE0UpJBH4gD4grJlWW5/gDvLUFT5QH/4IgVeLTSgtJ2nNrLIAG5yvVuf67w
 982sERYjsLhQaD9eo6TyaL9iW8C+ddLUP5c37i2pvwCL/IDL9GieDpFcKmJ8ABKKOXyy
 fY1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ICRl5cm8
Subject: [Buildroot] [PATCH 1/2] package/micropython: Bug fix release 1.19.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bug fix release.  The changes are:

- extmod/machine_i2c: only use WRITE1 option if transfer supports it

  This fixes the machine.SoftI2C.readfrom_mem() method on esp32, so it
  writes the address to read from.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.hash | 2 +-
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 09bc574ebc..7bff7de4e2 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  128b6fb13b518b4d3e75b4f0c04f175dc336c762d8c6360f647e91dc4d25e5d0  micropython-1.19.tar.gz
+sha256  c980ad7e742491df0dc10db2958137dbbf9aa7a8009e102fc75f4c0cac2d6b5e  micropython-1.19.1.tar.gz
 sha256  0f678c2abd7fe2cfca36693630506bbcbdfc219bd04bf4a02fe3b094ae4c666f  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index f7af9bfc32..51b45e5e99 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.19
+MICROPYTHON_VERSION = 1.19.1
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 # Micropython has a lot of code copied from other projects, and also a number
 # of submodules for various libs. However, we don't even clone the submodules,
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
