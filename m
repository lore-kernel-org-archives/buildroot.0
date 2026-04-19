Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B86AEA718A
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 12:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3325A82392;
	Sun, 19 Apr 2026 12:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQWeoLGz5ReY; Sun, 19 Apr 2026 12:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5501A82393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776600530;
	bh=G0EaHOjrxTBOVir1t238p6aBrUmhKwLBc+Bm7NAgsvU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Pyju2LoCruyzIUs/CXPNs+ANshsjN0AOR7AwTDOO47LHe+cpc7+7dIMITQ/E2bSVs
	 Qqocdx48zrsFwSFLFzjt4KTO3drV8fO1ArUi9dd+HF442EKANbcopyQWNgAqV7uA2z
	 ypqfhy9o16M4tBL2gT8f6fV7j5tw5bedthMEL75J36cTK4l6YtJH4mMltvy/JpwxdE
	 xhot5y/Z0bxeTO81AFwCJ8uxdQSKw+WyGbQvW3MfkTIlD6ZFyc6UbpR2Cl2U3oDVNV
	 20wniYCosbhiw0rndHxY9apMs55DkjcUxxdpTxtYGz8bXAfm7LCdVHfQxh/WKVI8I8
	 tjJYdGh719YxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5501A82393;
	Sun, 19 Apr 2026 12:08:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B1B0259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 12:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CF95608A7
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 12:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Na1YXLpf6CsS for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 12:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A667605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A667605D0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A667605D0
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 12:08:47 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A4F2760137;
 Sun, 19 Apr 2026 14:08:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 19 Apr 2026 14:08:39 +0200
Message-ID: <20260419120839.543152-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776600524;
 bh=INwiWmIW3M2sQk109Ou0BDDhfKtUrJuCPLDshv6sceE=;
 h=From:To:Cc:Subject:Date:From;
 b=nLtnnvmsLj2LfuWPKAFFpfSzTINKPU/hvjz61oMCh68qDTfjUQpULjPtGmVFvyAH9
 pt1xDq4OPmEtHPJ/VprqD/BjkR/IB+SFmMsWi36MjCuQsD0xk6KRip675YJd/qTGCB
 4ORdfJwBEWUT0sBMrp0EUuLmm919Lxe7mkXnOOBcg2clli0qCR/+ScbCd1T2A7g5Dj
 TqtiGAn1XdCTcQzK6mGt0d3axENfU/ZvSiRnT/D6ZEpu/BnaOkGR+i2e56iWsjzLh5
 /kkoIl2dg2UZsGZlB6/1ZtcCFtQGVfxFM3iLo/lVduokh/WqOnNIlXNETDd1EZ+n4p
 57Bjx4wTyD6Aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nLtnnvms
Subject: [Buildroot] [PATCH 1/1] package/perftest: bump to version 26.01.5
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

For changelog since version 24.07.0-0.44, see:
https://github.com/linux-rdma/perftest/releases/tag/perftest-26.01.5

The tag name is now prefixed with "perftest-", so this commit
updates _SITE accordingly.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/13988057731
---
 package/perftest/perftest.hash | 2 +-
 package/perftest/perftest.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
index 496ced9a61..79a290f4a7 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e62774a4b098ad91aa13353333ad221cf541d280dc9ba94db50270d4bb5b84a  perftest-24.07.0-0.44.tar.gz
+sha256  662a426ac4aa8dddc8807a5010edc33e2168145598109c5eefc2acaa4d87df3f  perftest-26.01.5.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index 12d5c1fdba..d2c2466512 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 24.07.0-0.44
-PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
+PERFTEST_VERSION = 26.01.5
+PERFTEST_SITE = $(call github,linux-rdma,perftest,perftest-$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
 PERFTEST_DEPENDENCIES = pciutils rdma-core
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
