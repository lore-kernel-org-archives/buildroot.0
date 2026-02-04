Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DF1EA7940
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F41D812B8;
	Wed,  4 Feb 2026 19:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD0lO_a1GxzR; Wed,  4 Feb 2026 19:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF0C8129B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770233457;
	bh=dgR/EXDezz1JVVffZ129+Ama5UUFluK12qGzefgtjuM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=r388nnh+ieVI9Ck4za39sKRppSfGyOLFdnEl/ZWnRjh8MlZoDW6YQTeyMsytjqAFE
	 7oPJO4jwMr1HmRKA/veb4Rk4eh3Kx4DgTPk8thliCeSTKolf3ShtufObVvgqqk/Lgc
	 8rvX2Vzp0rhXO4LRwQujq+7MSGclXFiphdxWTpGHawErjdm1pqim4py6dMRa7EVHBm
	 FbMa+ge97U5WgXs7hu2rIa+0m1Rh91Qcr4wNoPObbKtIvNcYpVh9qMsIihCDQQvT+4
	 Mf92XD+Al4VvHmtOMb1qZy4iqdsvB9tNDQ5hUYbsbXclcfKZbUau8dW8ZlaLqAS9J7
	 c1lr1Stjrx3aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF0C8129B;
	Wed,  4 Feb 2026 19:30:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B722F173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2D638129B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDs05leZPA1T for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:30:54 +0000 (UTC)
X-Greylist: delayed 1588 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Feb 2026 19:30:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE42A81281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE42A81281
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.10;
 helo=smtpfb2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE42A81281
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:30:51 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id B2E11428C44
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:42:27 +0100 (CET)
Received: from home.juju.sh (unknown [77.109.103.251])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 49A405FFBA;
 Wed,  4 Feb 2026 19:35:29 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed,  4 Feb 2026 19:35:24 +0100
Message-ID: <20260204183524.36078-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770230130;
 bh=o60021MJJeeVV8OI1AUp4G/mPbXt9He/8o7//EGInG0=;
 h=From:To:Cc:Subject:Date:From;
 b=hJ5Jo+ZLrXD4j5nBr0d24gthKhqQ3Qwe5T1QC8JoYxr5E8NWmc4632MoFRjkbYN0f
 CRObI2UnH7/nzOjtlCOUZmspdeSAtZwicZJIQrnIQzb+4Nwwt0UWIu3AbsNuJA/h17
 48xCAdMgNSrawv6M1qqQ5ha5/OqQl3Mp5i31l6D2dS3ljKPqg8p4hxq84QpG3livzY
 eiCiTrKx4Roipu9kI5bPx4N34ViIWZsWuNV4HvwuD6JEtC3Y/LFQll62KPGYgyzu0Y
 J6cc/7mPwAw8SKHiYMqf5zNBH6f7+BNT5M/GqjXANgWghxlaLJTZPS717O/Crdxb8Y
 PL1AryvVBYR9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hJ5Jo+ZL
Subject: [Buildroot] [PATCH 1/1] support/misc/Buildroot-Initialize.cmake:
 make include optional
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] introduced a new Buildroot-Initialize.cmake file,
to mimic the upstream Linux-Initialize.cmake.

However, this upstream file was introduced in commit [2], which was
introduced in CMake 3.27.

When compiling a cmake package on a host with a cmake older than
version 3.27 (for example, the Buildroot Docker reference image has
cmake 3.25), the configuration fails with the error:

    CMake Error at /buildroot/output/host/share/buildroot/Platform/Buildroot-Initialize.cmake:1 (include):
      include could not find requested file:

        Platform/Linux-Initialize
    Call Stack (most recent call first):
      /usr/share/cmake-3.25/Modules/CMakeSystemSpecificInitialize.cmake:21 (include)
      CMakeLists.txt:20 (project)

CMake version < 3.27 is setting its LINUX predefine elsewhere (see
commit log of [1]), so this commit fixes the issue by simply making
the include optional. This will guarante the cmake predefines will
be present in all the cases.

Fixes:
[1]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ef9f0a07ed40970a7de4c608a5708ef6ceb75131
[2] https://gitlab.kitware.com/cmake/cmake/-/commit/cc737ae8295156812e697a9d2f3f7b79bf7b72c8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/misc/Buildroot-Initialize.cmake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/Buildroot-Initialize.cmake b/support/misc/Buildroot-Initialize.cmake
index 3451562f08..3ee54f349b 100644
--- a/support/misc/Buildroot-Initialize.cmake
+++ b/support/misc/Buildroot-Initialize.cmake
@@ -1 +1 @@
-include(Platform/Linux-Initialize)
+include(Platform/Linux-Initialize OPTIONAL)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
