Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC56C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1631080C09;
	Tue, 25 Aug 2026 21:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EduErj0C56HE; Tue, 25 Aug 2026 21:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787694149;
	bh=NzHDgiJKEaNIyp1QBhr2Dhb+zH2VbDLjZX24a1paOyY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fa+1/GooOmrMUprHYUPdKjfGXYxLaDbUhmYOOa2fKEW+c/KEgpuWPXA6HgdkOeiWO
	 DdSz7IOGSFbtoOb24gKoUlqzO9cYXyL3krhpCCbrqAHFkfGx4JujR6FpXZuVkqFti5
	 vsUnUkD+g9ToI4ShnM4JDCDDyP9ykvSVtlwr/RD0aN6sM7KH3wIBFmxG2O/WZaBOWv
	 Rw7hzJT+QisAevfaaVY+mk1OdvssnDYMk6RUC227Mo/D0s45f7y+fltoguYb+MKUcv
	 5D3UyH8meq2cKSgouwyDUHW5YiXoCJbUzPg0F/Mmb2tdbJgVZvSJpUJLFkxhkCciRn
	 WkqnOFqt3hr6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC2980D32;
	Tue, 25 Aug 2026 21:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 734CE105
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5957980D32
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_7LNCklHUkS for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 471B880D45
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:42:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 18E524E413B2;
 Tue, 25 Aug 2026 21:42:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3B7F604C4;
 Tue, 25 Aug 2026 21:42:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A8F511C7A935; 
 Tue, 25 Aug 2026 23:42:19 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2026 23:42:00 +0200
Message-ID: <20260825214203.3708181-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
References: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v3 2/3] support/scripts/check-host-rpath: rename
 to check-host-bins
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we are about to extend check-host-rpaths to check more than the
RPATH of host binaries, let's rename it check-host-bins to indicate
that it runs various checks on binaries installed by host packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v2:
- New in v3
---
 package/pkg-generic.mk                                | 10 +++++-----
 support/scripts/{check-host-rpath => check-host-bins} |  0
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename support/scripts/{check-host-rpath => check-host-bins} (100%)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 09d6e5b20b..34e24f5aa9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -55,13 +55,13 @@ define step_time
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
-# This hook checks that host packages that need libraries that we build
-# have a proper DT_RPATH or DT_RUNPATH tag
-define check_host_rpath
+# This hook runs various checks on the binaries installed by host
+# packages.
+define check_host_bins
 	$(if $(filter install-host,$(2)),\
-		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR) $(PER_PACKAGE_DIR)))
+		$(if $(filter end,$(1)),support/scripts/check-host-bins $(3) $(HOST_DIR) $(PER_PACKAGE_DIR)))
 endef
-GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath
+GLOBAL_INSTRUMENTATION_HOOKS += check_host_bins
 
 define step_check_build_dir_one
 	if [ -d $(2) ]; then \
diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-bins
similarity index 100%
rename from support/scripts/check-host-rpath
rename to support/scripts/check-host-bins
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
