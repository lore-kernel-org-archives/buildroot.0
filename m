Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C201073C85
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 09:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3AF060EF1;
	Wed,  8 Apr 2026 09:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id porA16uhfaZK; Wed,  8 Apr 2026 09:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 266CF60B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775642227;
	bh=S7vAcyBY9yy6Epzol3jvRUNkoe3mtONyVdYe96/cJYU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CdJPerGRGeOodsTf6bl6esaB+O1H3hbduB7X/gp49wgc1uT+r+QrHxv9cXy4cbWv3
	 I4NcIEcyM7d7bLGrfYyKeSvgBTHbE5d0xDVVfLHuTDPwjQj1HpFn7eWBlZwT933ZIz
	 sEK196qNpFmBTR1MBPzYAbWMlNyDXyUUGrbrxQCib5snk3PGQRS5rfIFHxRe9PC6Vk
	 sVkXOYZEc7Mt50S484PiilxK4x6lyZtK1J/blbbHkFoge3IGAC4qsnsPLd2Zw/4RVA
	 cLdng4vENV/a7VkrryQlGkE1JK0hzHJTIb7XFeFUwU/HUB7wR8jNpFj3EEpBU1Aymq
	 NwC6oIxAqDVhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266CF60B71;
	Wed,  8 Apr 2026 09:57:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D052C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E783482309
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1jSIO4CXeod for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 09:57:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E873B82308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E873B82308
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E873B82308
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 09:57:01 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id APebw2GtG4bDkAPecwcSIL; Wed, 08 Apr 2026 11:56:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  8 Apr 2026 11:56:56 +0200
Message-ID: <20260408095657.2560313-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMitWLiwaD48cnmq/TXxoV6QcAEb23pWRS6N5HZdEE3KgRidA/9kYButGfUotLdpVmEcbhDpwNtrhcSc+TaXmhIGoigZcDe7RGhhltBCoP7jRVvBd3/c
 7xIVw/Ihf4lV+wV2UKdrQjaQSiQIggFl80TS2WXGDvhl0CEYhNBEj5VZxAxgWHTPGMcQ5Q+Hyih6dfu4lH/JuARXr33sirh0sYrsfUDhdMxUzKQ7qtckngXM
 mfWaGOAMXtdaAoom59H7GbmYN8jOL5FqMyjyxCipnWzfIGQXeQQ+k4InA+I/kQ7S3QIWrWaHlQvwnXa/J367GfmpcynVFfFV38284FPRKnCTr/+Q94jzhMwo
 rcCDJiCN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775642218; bh=/WZolFxwzUnJGHaLZBcY1IqwFBA5w2PZYL5jYKnh5io=;
 h=From:To:Subject:Date:MIME-Version;
 b=lAIARNYSaJIzOfeHMgXKW+wWz73AcmocT67x5o9qZLPetVDyOwdAKRQMgtzdnmBMb
 auVG6WBzjna2/5f4SOVSyDb0FjXgCW3mMAIcFTXemoZM5rONff9sFa+FvDPcl5rYb1
 FmOnPCn6VcddQFMWIqBCjeVcuzPcKeGjGAJrQDV4XL46l6iDlPdLKYV2K+aeiUOk7C
 Ya5nR0hfp9cbaUxfG1b3s/3IsQTWVHcTgRCYFyCXCiA5q7sR7fiGn9YczAkr1gntXi
 d4wHE1hmOczj1JIxtgJicIdNCiaSiZyjHqJWO2Fpg6mtQ+4uLBBq1pMR+mmbKzvJZH
 3CqhwfrKJxtng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lAIARNYS
Subject: [Buildroot] [PATCH 1/2] package/libnl: enable host package variant
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

host-libnl is needed for host-nfs-utils.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnl/libnl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index a0441b7835..28374320ba 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -13,6 +13,9 @@ LIBNL_CPE_ID_VALID = YES
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
 
+HOST_LIBNL_INSTALL_STAGING = YES
+HOST_LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
+
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
 else
@@ -27,3 +30,4 @@ LIBNL_CONF_OPTS += --disable-unit-tests
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
