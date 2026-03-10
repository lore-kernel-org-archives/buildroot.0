Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E1EFCC9D6
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 08:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866424209C;
	Tue, 10 Mar 2026 08:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64W7zemtsUZc; Tue, 10 Mar 2026 08:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C43A41AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773130762;
	bh=aNrgGwHJMTQcu8R6gBfgr7LQAGbo/ASMaaA19ErSWlU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDAWdAMAdwsOD2Ek6mSjPvMEvUuoBHXLxbed/uXzPgAO1Rqm+Unbl2lIPxfxJphGi
	 PzqSE3QfZaB7mywfTaLxZfh8Yd/Ot+rOmJ1TwAnLKoNyrlPZXM5ZXeEATJg6J9w4Ne
	 7t1W/z+f0l3GRKOI7HWaK1LyNUupSVuoVh7MZCDC2EFKf1/uiwfSpuy533Mk3X7m1F
	 CHg2Nl0dyEt/2+rA6m9kT7qvXefCShUAhkfHVZoxVgWf0ftIn98POPwP2LhtEhGKK3
	 JA2g6TuZnon+rucXr8D7X8oNJc71+NSKDfm1gJdsn++1n7CXmuYx+7Vz2/1iswL/9z
	 n1laMx5uWYnDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C43A41AFD;
	Tue, 10 Mar 2026 08:19:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AC8C35C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C1E841C50
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_QSKtFSOls0 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 08:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.99;
 helo=out30-99.freemail.mail.aliyun.com; envelope-from=cp0613@linux.alibaba.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 687EF40D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 687EF40D03
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 687EF40D03
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 08:19:12 +0000 (UTC)
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0X-fQmPf_1773130748 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 10 Mar 2026 16:19:08 +0800
From: cp0613@linux.alibaba.com
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Chen Pei <cp0613@linux.alibaba.com>
Date: Tue, 10 Mar 2026 16:18:50 +0800
Message-ID: <20260310081850.33001-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310081850.33001-1-cp0613@linux.alibaba.com>
References: <20260310081850.33001-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1773130749; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=WRujn67ZccQ6Kjhs8XCrGOmEhuWFIsP2p6qXCEOMWjI=;
 b=aqGBhg6EtHLwrSvYXDzqbkYe1YqQf9oPzpEQqOYiuE4A+eTUjmDo6G3gnM2EnRCvbQa24I8JJnzmOKOiEmXGxqOmmAITcLLKwT0CkpoWpRnuy40z/MuhP4rgp1ty6GBPX4tG6mrbrqu3CbtGvbqBfDCu88ZGfZGwGYvkvbbOwTA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=aqGBhg6E
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: Add Chen Pei to ndctl
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
index 106510ea84..0513a50531 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -612,6 +612,7 @@ F:	package/qoriq-cadence-dp-firmware/
 
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
