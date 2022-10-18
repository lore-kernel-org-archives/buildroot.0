Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C3CC433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 21:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2DA141B7F;
	Tue, 18 Oct 2022 21:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2DA141B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_SqgeSQOcfT; Tue, 18 Oct 2022 21:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF9141B7C;
	Tue, 18 Oct 2022 21:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDF9141B7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF7F1BF44C
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 21:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04B7183F05
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 21:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B7183F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fS16_5UbcVE8 for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 21:38:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94FD83F03
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E94FD83F03
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 21:38:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j7so25981891wrr.3
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 14:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s4VQ8D87taXn2lnRwNtf7J9gPqB4dFR1Xw5FI8NOYpU=;
 b=IqtF8lpFUn4CtDh4SIZskP14rp63HUr4cy3q13Xw2EETSPcU7KyO0lpAMinEGVkloW
 EQlXdD+XHJcFNkQP5gHPDXAogUxijZkeElvkDQGcLnOhFd7SAiuSJBd0Ix1bfcfMgb0j
 q31plQXDwauDCfDG3W+LtbVcmXn7RLakO+aBkxoGeOpXfrMGZFxnv9YVbZaa+vyKGng+
 g4LvrHWUYYXqKqpRMnDHTfvprJx6+a1IwCeuDxIms7tEegofJJXKn9hd7Cg0FjFK6JfU
 koL9FCCngGfYeeOJBKLmvfaegmTiEtWzW+nY6Gc8EMJNQLpqYPgZbMgCXGS7J1huw4Bu
 lrDA==
X-Gm-Message-State: ACrzQf2mb3JJRuerzZojmeTSdunRIjDRXKvOzeCxyg1YmhyZxpT6MGd7
 Da1FUTpeNK5m1qyN1sEMudSfvb3MBwE=
X-Google-Smtp-Source: AMsMyM6dkbXfxxfv9tWYEFR+UYIGb40YJ9N2tB+k9mJpTMxBfWnvYnXf5S1Era8iyJttuqN6XLpT/A==
X-Received: by 2002:a5d:64c3:0:b0:22e:57e7:6230 with SMTP id
 f3-20020a5d64c3000000b0022e57e76230mr3108046wri.482.1666129082836; 
 Tue, 18 Oct 2022 14:38:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b00228fa832b7asm11907409wro.52.2022.10.18.14.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:38:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 23:37:56 +0200
Message-Id: <20221018213756.268341-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s4VQ8D87taXn2lnRwNtf7J9gPqB4dFR1Xw5FI8NOYpU=;
 b=PltqFdQojY770OZBj/DEA/+4yCnNTzIWJzJwSYQN35OEj4GR6scjcUmCMCEn6c2kgx
 zzOaABHbXmjUCyBoPivp2mffqjrfx83djWUDdosrIZr9IJ9iidlep2VTzaSeZ7/FeNcW
 WqV5Vx1q6ScOAM7wyMGfS0piaMKi4xmZSkZUVZbPNbZES4R1OB52v9fhSIJKMbXLyrcl
 olExEoyb2ZkyhZgJ9rq7/bLJ5T2+UbGm15Dt/qqDczITwhSonxfPosFG/vG61/VxGETk
 BtK02gBQhg4B9/OcVC2Kn5QfzvBUCJm5z2Iu6pfLzWfBFTvUb0KrzPIIBjYuNmn3BYAF
 OYoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PltqFdQo
Subject: [Buildroot] [PATCH 1/1] package/oracle-mysql: add CPE variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:oracle:mysql is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoracle%3Amysql

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oracle-mysql/oracle-mysql.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index f1f16abbb4..1086e4125f 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -13,6 +13,8 @@ ORACLE_MYSQL_DEPENDENCIES = ncurses
 ORACLE_MYSQL_AUTORECONF = YES
 ORACLE_MYSQL_LICENSE = GPL-2.0
 ORACLE_MYSQL_LICENSE_FILES = README COPYING
+ORACLE_MYSQL_CPE_ID_VENDOR = oracle
+ORACLE_MYSQL_CPE_ID_PRODUCT = mysql
 ORACLE_MYSQL_SELINUX_MODULES = mysql
 ORACLE_MYSQL_PROVIDES = mysql
 ORACLE_MYSQL_CONFIG_SCRIPTS = mysql_config
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
