Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD2ACD11BF
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 09:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 692A7400C4;
	Sun, 24 Mar 2024 09:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIYLStistMpp; Sun, 24 Mar 2024 09:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 675DA400E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 675DA400E5;
	Sun, 24 Mar 2024 09:49:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F40AC1BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 09:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E045D400E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 09:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HO43RkWKFmcC for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 09:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF8BC400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF8BC400C4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF8BC400C4
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:49:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34100f4f9a2so1895801f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 02:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711273777; x=1711878577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xkRZi1dIA1rWrH+AoBCsQd32J93n6HRhkVMH2+2MKxw=;
 b=nDeQ9tgefve9x8Do6hc4b3Atc6FQKHVV8GTT9bReWUtr5QjQYocLd7tWalpjCf+6r2
 rPdjX835ZqJPGJI75iBKisxBMnAjWtE5gcnXi4Sx5I4e22i/Qj3wQ05vb2J9ONzPrbAq
 47/f+BLUpA6fW50/YqqlK3iUmHkaYV0CNkin6OySIaqxWk5SdESeV8/Z6LPm202O+dBI
 oELhd5Zdt+3ndYq61B8SalYptsDC4Gc1v+PEn86d8aHpJhxnZ+TAyrVjghgtWtONN32D
 a3ZK3NAm0t54oBmo7GvdZDWfwweV1vENxjIFwK68f3ThuIvutb6I1/wmIYvXt7M30WGa
 Sdqg==
X-Gm-Message-State: AOJu0YxH9DVv1vj9uNw/5pi/csFhzoGBuumfYZlbM1GcfTC+Z+PsL24/
 nV+mTGk8vNMe9mgwUPLJwrWqm9G2+oo6sMo3ugDjsZeelgwg8WYiZLEmTbEa
X-Google-Smtp-Source: AGHT+IEJ1nDRAhcnvGD1x6mpcaXB7MdEl1obx2nTqGQ1p6wWifqNL8Pg014fgHm3KcdIAw9//PmA0Q==
X-Received: by 2002:a05:6000:4cf:b0:341:984d:e389 with SMTP id
 h15-20020a05600004cf00b00341984de389mr2358475wri.21.1711273777195; 
 Sun, 24 Mar 2024 02:49:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u7-20020a056000038700b00341b8edbe8csm5532533wrf.87.2024.03.24.02.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 02:49:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 10:49:34 +0100
Message-ID: <20240324094934.414459-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711273777; x=1711878577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xkRZi1dIA1rWrH+AoBCsQd32J93n6HRhkVMH2+2MKxw=;
 b=i8kwIJgnPD012lBeZi5PRy1BDmDs3g6p4LCWGsL3QtMy1p9rPwJ1onoswPHDewdy4P
 sdQ+SuLNtiiI+gdZ1KjXPTGIckzhW72AWrPU8dvon4DxbufhA6Sy89nPD5GHaE+0Jekj
 Z/4nq11BcYcbP70TY7BNFftDp0NdOvkFYPjPmmih0wFXp3y1alZ5Bkha1JRMUkb4xzs3
 ujNzTjdmKJfWX/wwndU6bLBCzax7bpEiPlFp5cXjbaL/Wpyic22X1D5uxyU5nzDpT/Sl
 wgnFyOMCfmbXeFOYHhPj2HeMM5Q0WWlGQzrFozMDhEWNiixn2mB+3kQJ56+EHxnYythw
 nOoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i8kwIJgn
Subject: [Buildroot] [PATCH 1/1] package/vdr: bump to version 2.6.5
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

https://github.com/vdr-projects/vdr/blob/2.6.5/HISTORY

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vdr/vdr.hash | 2 +-
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index 1b7ced0b77..47179a9907 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  70352c7558d627202c02e80d88c83d25d9df4c5e49a010f7d1d9ae631bd54ad0  vdr-2.6.3.tar.gz
+sha256  293e355b2cc22e6152dae9c315d5b8903f3e647a2e60b6217d306ff4bceb83e1  vdr-2.6.5.tar.gz
 sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index a44e1ff512..c717d40e02 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.6.3
+VDR_VERSION = 2.6.5
 VDR_SITE = $(call github,vdr-projects,vdr,$(VDR_VERSION))
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
