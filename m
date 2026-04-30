Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECB2CD13DA
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 19:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9732B84FCD;
	Thu, 30 Apr 2026 19:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqaV8QarixsQ; Thu, 30 Apr 2026 19:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138C284FB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777576100;
	bh=EMWV8C2wSx3aKxgnHA40FrmAJB2MH/p4hJCOrkPF2rU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mLpRrVAZLmzUDEytLySRbqkDq5bsuPZmNq9iJ47bUUUANmElpL84E935TmdHDyzU0
	 CfiQvn2hzBLXFHCopCzVLrSalbDHl5gxml9ln48TRrw6TrkkcS9F3DZrwwk78zFJ/X
	 23Ftwx/sZ/iJcZEB8IdyjSTMmq/DysHodZwssO3ivSZ7ZjReZ2SWbIH9hMync5sQff
	 g9RNi1nSU9XFj9PzuFysf2Ufx/LcBYYnJMQw+7jArw6B9Wip+2SyxliQMWOPZibGPE
	 kfzmNSqnwmS6yhAif/rxpScefSLkdmYOnHxR/B+cmQpIcBdVNBkv/11n4S2oR8YFPW
	 UkXggdUGcHoRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 138C284FB3;
	Thu, 30 Apr 2026 19:08:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28A3018E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 264AC40289
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLN92UzkAVGG for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 19:08:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B83D40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B83D40024
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B83D40024
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CF101A4C2D5C;
 Thu, 30 Apr 2026 21:07:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWim-000000000Pg-1Mgz;
 Thu, 30 Apr 2026 19:06:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 21:06:42 +0200
Message-ID: <20260430190647.3212159-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430190647.3212159-1-bernd@kuhls.net>
References: <20260430190647.3212159-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777576020;
 bh=YInEGN7jDme+QbAv8Gp+YGScu3e4B0elA6ZvIbYSQLI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YW+Bl01qw1uNw6TONA8I93pzAktPJ3rv7vZk8W6q607u+7rkRZXXGSOHD9iL9DwFC
 xnTk0bZLw+Xu+Oq2P0d+jjV3wKkB0HxYRgtVBJZYgEdIcGG6UyKH6BoqkJXZmaQ9or
 zTL9EDCdyrUk0+l6zXQJk1/hyFm0rc2RydDmvqISIFN2wIOXezLOOsim7PBXOJRlyb
 8HcGycZhPEhl2daP+XPr0C1vunPLCBiqwYfo+FmuDwEiZI7ariUOK3oNSXI2l3bZSk
 tNw1yGg9OLbU6YNtQ46e7tW7rThNSYgUVyK97iAiu+E7yu5mvTtUXgwe6cpxRtDCsd
 OSW8Vm0YYmbvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YW+Bl01q
Subject: [Buildroot] [PATCH v2 09/14] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_17
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 624b5e9d21..863a1eed34 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -344,6 +344,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
