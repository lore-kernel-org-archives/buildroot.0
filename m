Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7558ED149E7
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06E46402DB;
	Fri, 25 Oct 2024 19:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFIMVDmBQSvK; Fri, 25 Oct 2024 19:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F69402ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F69402ED;
	Fri, 25 Oct 2024 19:51:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 071615C1E
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC69780F6E
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rT_FW7ThzAQ for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 19:51:30 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 040F080F65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 040F080F65
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 040F080F65
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 19:51:28 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2e56df894d4so1838428a91.3
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 12:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729885887; x=1730490687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+MlnD6ALknFLFkKxyWqD6mFdC4541uWvvIeEnK1k+fo=;
 b=mCz0z++1PsRPCvEWoy2/doONqU0AWnBt/qpwPR7LYpqOOFsBw05ORkG9qOkmCgycko
 Zz9VAoDw7DVmwIOQTec0zR6zscipGDfKgEQtFJ+T/98skomnzFzp7DItn9axgK6+9ZTY
 BgqD1kRWPPUGdrbrelBRwj+y6C3bfqMyhkOeloeIchEyjxZ0E2XbmqjDU1efA5w24Rlw
 nB41a5xtMGd1rmX2SRjKF0yuaKF4dwkCFyqKncV/jRiDcfcl1dt8wBXxT0NRS/AimpnU
 73FM2KZ/hIuqirHfWzkVp3slHDtkZucIGUl8Pxuz3zZtP0KUXIAML7/BA8G0yOZi6y0d
 JhPA==
X-Gm-Message-State: AOJu0YwoSey8HgZNJj4K3HbYJr4GVKucRvVYjNnHAdml6uFCSWcxxomc
 g9YUj9SN2XmQPs5mqMfjzOgx5nxtCgOd9q+3D9MgLONUeM2U9V/lABzt8/MLD6NRxMpM72WN8Aa
 2TN8=
X-Google-Smtp-Source: AGHT+IHO63r4XSrSmdEg20n25nZ77lOdA8ku1pZGtokR1bcAqihDoGB15hsIG8DPlDhIMW6gVTmd6Q==
X-Received: by 2002:a17:90b:1041:b0:2e2:cf6d:33fd with SMTP id
 98e67ed59e1d1-2e8f11a9721mr606935a91.31.1729885887369; 
 Fri, 25 Oct 2024 12:51:27 -0700 (PDT)
Received: from niltesque.1.1.1.1 (200-144-63-234.vpn.internuvem.usp.br.
 [200.144.63.234]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e36a323fsm1913684a91.30.2024.10.25.12.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 12:51:26 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Fri, 25 Oct 2024 16:51:22 -0300
Message-ID: <20241025195122.2156220-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1729885887; x=1730490687;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+MlnD6ALknFLFkKxyWqD6mFdC4541uWvvIeEnK1k+fo=;
 b=ovi6TtNG+3Tr36qlxa2N1d9+H8y7dOhzho/mv309BdOz3n7tDTVtzm7Oh6vMtMfuyv
 9+cwQ2CyqGVhg1zrFzr604E/6iwyXLWVoE6s+OdqZ5vEv2rYiisHzPW03KhETCnvlURF
 h0uKvB24BcCd17lfSU5DB3k9OrSL4EWJB6zqBecx/9uZxGdwmr06J3uxKterVKSVMPKl
 I6Z77sIRcNI0aQYlYbY3Bmgz1lmjt4dgroDXLSLI321aRiMTlEIg2zP911cmJzHxcYtS
 nM6O9TCUoZ9lS0rjpKzvGIsphs1grBgasPPakn0xJAP0XSkLW52Q7SJ4fEoHeEVrMYKo
 Zagg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ovi6TtNG
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2410.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 24748eab19..9c523c5881 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256  8bb2f15f9bf9bb7e635182e3d3e370bfc39d08bf35a367dce9714e186f787206  rsyslog-8.2408.0.tar.gz
+sha256  b6be03c766df4cde314972c1c01cb74f3eacf8aec57066c0c12be0e079726eba  rsyslog-8.2410.0.tar.gz
 
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 86d87a5d93..69b32076f8 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.2408.0
+RSYSLOG_VERSION = 8.2410.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
