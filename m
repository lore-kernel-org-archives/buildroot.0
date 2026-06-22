Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB82CDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 09:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE4578601C;
	Mon, 22 Jun 2026 09:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVP-PA-y_To2; Mon, 22 Jun 2026 09:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B394085FE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782121544;
	bh=7sVxyx3BkJ1yKQPE8+XF16qLcSTV7onsCaO5F04FEXE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Sef4wcUj7NFeZEVyPSUHFkBPUAY8wyzhFk3cYjZkXa+Q9VjzC4v/a9gdCHr2lq5Wt
	 9L2LTb9ap4XZm7J80DF5gg4j29dNCP1gl3BPzjobTW7NyR79wMFnkOEk8Ire8ta5V1
	 OaUw6EaI9vu8DnE31TYJkLpaJh712K+PmfVopFMIEOnNj+1K0J+k5zTRTmJHYls7QB
	 mwwUF63C7nntuMM3xu+pph7zTFrw+gOs/9XeKIDP7ku2Q4VaqzmmvPsFLFnaLHowA6
	 W95PhJiBQYnLwE4PQWn1USC9gVkSwiLNeo7ngi7uu75sjjK5a73Z8g17NXHaEwdRWS
	 +lKxtlQegM6+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B394085FE6;
	Mon, 22 Jun 2026 09:45:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75C8E24D
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 09:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6795340262
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 09:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-V2DtPqjRly for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 09:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.50;
 helo=mout-b-105.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC6FE4006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC6FE4006B
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC6FE4006B
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 09:45:40 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4gkNbz0t6Lz9xyR;
 Mon, 22 Jun 2026 11:45:35 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 11:45:16 +0200
Message-ID: <20260622094517.1342785-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4gkNbz0t6Lz9xyR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1782121535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WJO2B2IrVoT7t2AfBBbYR8mWmLuzdpiHX0AO9JWCVuY=;
 b=iatTldXmFg5hqrR870AQ03ZBFFgRPbXmRab7un69kzeQ60NTRZ90EKqUkGKm1j4kYgStuI
 SuG/nUeSDDvkzmgqmb8M1NVqVcLwNlJ1rV2M6P6i64lKt1DK6HgiRBVuCZi4p8rpdcsmrl
 DjiiIO/v7tgpzQ/9Pha2iLdRAQzaQ2KUMPpSuoCdGzonexxjkQhnR/nlkdL9TsQPaTuGn2
 9nrwOrBcDmX4T9KKg3p72GB2YaPZYyMM8tg29xnUqF+jNgI8CWqzm67bbF5ipDX3bDXCx5
 IxfRXCYg56Mad1PE8FEwnEQf7TvMX6jU4+LAvVH8S9ZnwvDiIp+1QWD6FUCvhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=iatTldXm
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH] package/python-jc: bump to version 1.25.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here: https://github.com/kellyjonbrazil/jc/blob/master/CHANGELOG

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index d2eb47d41c..49372996e8 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  f3fbc012843d192e446462e45ab2ebe1  jc-1.25.6.tar.gz
-sha256  27f58befc7ae0a4c63322926c5f1ec892e3eac4a065eff3b07cfe420a6924a07  jc-1.25.6.tar.gz
+md5  9cf85817e3a9553b19d413f9d1ce3687  jc-1.25.7.tar.gz
+sha256  63481e34d92715781e1b094eca7d76d122a14489463d45b7f3e8180f44ea3a10  jc-1.25.7.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 0404275277..e07fe671a2 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.6
+PYTHON_JC_VERSION = 1.25.7
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/7c/fa/f174bfb1ecfd3bdc6259b2de32052f09cccba11c9a1b733aedf618fadd05
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/a9/da/7827d3389d87fa645556d595a2a437576de83f7a7d4a5fceda9c32208c0b
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
