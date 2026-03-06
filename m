Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2802F513E9
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 03:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF0B817AF;
	Fri,  6 Mar 2026 03:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elh3PGkX2JZX; Fri,  6 Mar 2026 03:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C55BD81865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772768714;
	bh=Yc/KPm/JcuOdD/PwvmOS23rP7SSRbxZmUHYz2eW2IjI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F3O3UCfRUX4UofAexY/w3fzadkQ4cSXMk7Ua8NxPCkVnHrmJs2YlxwKiuCDX7zZx2
	 +ojHiabUrA3dVc3BfEdJWGyTQ5twC2ZY48fZpD2VH6UsBSuCDfeOreDQL6wRwSm03f
	 e/aC27yJQp+IbE1ejiqgnfCHhtbXQhDPPWrBH1l5SNssfyggWTOQnDum/H22OODPtn
	 1Rt9dqftxjagSfm49y3j0sW1MdfOz+hRdbgt22GVrwEstuWIs5ctiIg036ngINdSUp
	 kQGgxf9BSNQ+gWEEPV/apo0ND1/ISO0ZgT/adIuCq+RDcj5BXGUIKYDAvmPXSYud1c
	 p1a4TslhFhnZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C55BD81865;
	Fri,  6 Mar 2026 03:45:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9EE39B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C9B84091D
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWAkAI_yrOoq for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 03:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.118;
 helo=out30-118.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B385408A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B385408A1
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B385408A1
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 03:45:06 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-M-cQe_1772768697 cluster:ay36) by smtp.aliyun-inc.com;
 Fri, 06 Mar 2026 11:44:57 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Fri,  6 Mar 2026 11:44:16 +0800
Message-ID: <20260306034417.613-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306034417.613-1-cp0613@linux.alibaba.com>
References: <20260306034417.613-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1772768700; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=l5lsTkuQkY6l4IuNLTjZmROZ0QuFo21KeauZLhCIru4=;
 b=OR96ASv5XREALiWk/9htvrpT1+klDI1bOhoxdH8tFo1hJsZim1+Q8XJarPeMbg/px4JDFNa7AWAD/uvMYxT0OXWJB7fAv24VJNaXSSYnoj8vAoLyXbLDuHLkTsJAOtBbLObRlnT6lVlXtKcKuXmP8RURAEHp1LVuf8l2H1+GF2g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=OR96ASv5
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: Add Chen Pei to ndctl
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

From: Chen Pei <cp0613@linux.alibaba.com>

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f347240ef2..39a756f85a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -604,6 +604,7 @@ F:	package/qoriq-cadence-dp-firmware/
 
 N:	Chen Pei <cp0613@linux.alibaba.com>
 F:	package/iniparser/
+F:	package/ndctl/
 
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
