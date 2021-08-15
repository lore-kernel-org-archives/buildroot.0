Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F52C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:21:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB1060E52
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FB1060E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E1524029E;
	Sun, 15 Aug 2021 16:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ok-LICKOhyOn; Sun, 15 Aug 2021 16:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79734031B;
	Sun, 15 Aug 2021 16:21:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 373091BF3CA
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2471B401F5
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOE906yG8hJD for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 16:21:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E7CD401F3
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 16:21:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v4so13143870wro.12
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=myISPzgjJ/2OsAzZaea6aeFQpVsIb10s9Ly5HQyvJEc=;
 b=EfUeW7Ak9I6QxJZc8658ybg6x/t490a5oQgFPc+ZUGc+SZ4uEBGXr1LQz++zaPzxja
 1Q+zo84rUwCEtZwyWvP4EradOZei2b8CptRlYozJSo6FE78+CTrQyJ1+ki1SShACIZAQ
 2aFAiKv9hrT2DuqnvTStBEaEnIINYr9BIx6lKigGkSTJbmIxpobaSHnT6d9CPVQ1eiTZ
 RwNPwsLxP9OyYuFPgBAsZjedIx/elT+TFzdHMQsDcQreNNhZxk5Q/YCkj1nssyyPWggu
 SeJ+wFGYkqSb6gk0Z63lFuid9DD3mIRYaQ5Eua9G0FmjY+42aZbrOHLVETcf3COBZWzf
 vN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=myISPzgjJ/2OsAzZaea6aeFQpVsIb10s9Ly5HQyvJEc=;
 b=KZlMGW/87V8FJtp39koOLevx0AJTrogMQ/QJ33vmo2Jte+0M9ikyoVKcV4m7w9av8i
 3UFwywS76cQKYZOIvBhzcM8YHF9BKueSVIIcNdRDAV4Gc09mMvdQuXjW2fPUjvrzuiMa
 eFqjZWOzltRWrL1SxUF6aaem+RdIWZIyyo9NAA3Vlwit89ojbfttrw2u1+hhW0hlGcGJ
 agsTfmLv2Q/lJuLd7K7sZjsPo9WNXF1S7qZs36VB060VX7ORvnGRe0hRsnHIZivP5i3c
 LyL/GUfWCfgurjb8i6vxvHs0MPKFH/GEDwhc5o+RVj7pPKs4pMx9aiBSLCEIxtVkhsCx
 72CQ==
X-Gm-Message-State: AOAM533EfGMCY6mpb46zjZlrADPlm2y2Ywt8DSwjZ1e7UbwzCYWVe0zr
 HwyRC+6P95iCLeY8uAdFcqRst5MgFNnSIw==
X-Google-Smtp-Source: ABdhPJwubJqKc4UpeTgSh9bWHpHghITwoXD9yoe8xGmK9pGoR05u1AmagtH3Q6miOUHK9MntqfSTtw==
X-Received: by 2002:adf:e702:: with SMTP id c2mr13833825wrm.397.1629044478845; 
 Sun, 15 Aug 2021 09:21:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id n10sm7493990wmq.3.2021.08.15.09.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 09:21:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 18:21:06 +0200
Message-Id: <20210815162106.1492967-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/gdb: fix build of gdb on riscv
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build of gdb on riscv without host-gdb is broken since commit
4ecd247ead22a6cfb87a4ffafc4be05201328aef because BR2_GDB_VERSION_10 is
never defined if BR2_PACKAGE_HOST_GDB is not selected resulting in the
following build failure:

/bin/bash: line 0: cd: /tmp/instance-0/output-1/build/gdb-10.1/gdb/gdbserver: No such file or directory

So add a BR2_PACKAGE_GDB_TOPLEVEL hidden option as suggested by Thomas
Petazzoni.

Fixes:
 - http://autobuild.buildroot.org/results/ce47d616ee79d5f735779570ebc3b4a9c0f64c6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add BR2_PACKAGE_GDB_TOPLEVEL

 package/gdb/Config.in.host |  9 +++++++++
 package/gdb/gdb.mk         | 11 +----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9814f3a79b..0661f50233 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -93,3 +93,12 @@ config BR2_GDB_VERSION
 	default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB && !BR2_riscv)
 	default "10.1"	   if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
+
+# recent gdb versions (>= 10) have gdbserver moved at the top-level,
+# which requires a different build logic.
+config BR2_PACKAGE_GDB_TOPLEVEL
+	bool
+	default y if BR2_arc
+	default y if BR2_GDB_VERSION_10
+	default y if !BR2_PACKAGE_HOST_GDB && BR2_riscv
+	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 17e10e8b16..f9010019f5 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -8,19 +8,10 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 
-# recent gdb versions (>= 10) have gdbserver moved at the top-level,
-# which requires a different build logic.
-ifeq ($(BR2_GDB_VERSION_10),y)
-GDB_GDBSERVER_TOPLEVEL = y
-endif
-
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
-# recent gdb versions (>= 10) have gdbserver moved at the top-level,
-# which requires a different build logic.
-GDB_GDBSERVER_TOPLEVEL = y
 endif
 
 ifeq ($(BR2_csky),y)
@@ -35,7 +26,7 @@ GDB_CPE_ID_VENDOR = gnu
 
 # On gdb < 10, if you want to build only gdbserver, you need to
 # configure only gdb/gdbserver.
-ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(GDB_GDBSERVER_TOPLEVEL),)
+ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(BR2_PACKAGE_GDB_TOPLEVEL),)
 GDB_SUBDIR = gdb/gdbserver
 
 # When we want to build the full gdb, or for very recent versions of
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
