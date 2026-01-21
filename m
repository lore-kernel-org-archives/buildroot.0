Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35531C44508
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E829385419;
	Wed, 21 Jan 2026 18:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCraBUjZE-Wo; Wed, 21 Jan 2026 18:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DBEE85418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769018873;
	bh=lqM1LCn314WJYDzPJJ9aLrYgfuv4UADrsPE/QyVRMkM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i9oqSRYA0EFj2tGXZfB/mT7bNbKxq6rgvOAx7vUtUSH6qbPovRBo29WANHdSM0X0d
	 s+fhx8hLeIMki7DMZbROBVe+5OBjJHVN1/EuPJyQJlUY68C8IfAnGcp7FQZtqlSfpO
	 IHI9OBiKP+W3NNMnxQjp6frPyy1epCws31siWyPVimxE3Gpmh3REtIQGkO3aqvUGcy
	 OlyEng/t8QbsqIUejEPWq+1Njxrj2ocM5HCb5jsnnEN3MOP0XwxI1xQwNDzMXYr5HC
	 5uduDEJYWQOWXfWm98jw2v/4C6fBstMoL+7secM5IWEh5n3JBdOD1GEVo0fTt1Ah0Z
	 kORSMRTKt789w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBEE85418;
	Wed, 21 Jan 2026 18:07:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68A2D160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 560B785419
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6XkupJHGlyJ for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:07:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AD3385418
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AD3385418
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AD3385418
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E37EA4C4668
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 19:07:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49408)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1viccN-000000006dh-2C2h
 for buildroot@buildroot.org; Wed, 21 Jan 2026 18:07:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 19:07:47 +0100
Message-ID: <20260121180747.48074-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769018868;
 bh=W9umYO8zbwlhDrynSwg28Vq58chHHW6iuKkR314IMVk=;
 h=From:To:Subject:Date:From;
 b=t3Tvq5dN1T4AzrUY+Pb3id4G3+ElxL92SIfpRvaX+Xqi/E1K64+ykalSej7vfCCxZ
 v/g9wBqxdISSpXv0rIDoL45FpvswuCi1ENRtTdewtse/4VH50toH8hhWu39eZhyWIF
 R2UB9r4f4KjoQP5yV1r8cMgBQpTsPrjHu3DklL+dQlU2/ltmzbByMP/VerhNJ3Oj+D
 t6sHHPV9ADk9CdJJgJFFgmPedj8TP1AGzNIfrphFTcJO9agEJB3JBYgONHgS+xBDr+
 FcYLN7LrwNSfaU+jiLI5nE6Cmd5DXTmPqwcArVhjc0r7VftTlN/FGjctHV0uU8cDN4
 clX0NRG5odnig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=t3Tvq5dN
Subject: [Buildroot] [PATCH] package/pure-ftpd: bump version to 1.0.53
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

https://github.com/jedisct1/pure-ftpd/blob/1.0.53/ChangeLog

Updated license hash due to copyright year bump:
https://github.com/jedisct1/pure-ftpd/commit/bb162a22de772a810f802da61c7b103ae701c28a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pure-ftpd/pure-ftpd.hash | 4 ++--
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index 2c7a1849ff..b31afb2956 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  b3b879468275e0344555458c8e62465dcf525205ecf9ad78c3f208557d0c1947  pure-ftpd-1.0.52.tar.bz2
-sha256  1ec531b1bc4035019545d6a83e260a5a56d3a6bec52895393e9f25965e608e85  COPYING
+sha256  329a1d524476d7a137dcf65af04ec79ddf1c225e2c4ac4a2e884663ef4897fa1  pure-ftpd-1.0.53.tar.bz2
+sha256  b0bc52c61f9265bc00c509bd40dab60950371166b59416a1484bf226f480796e  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index fb247f51ca..bf2599ecaf 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.52
+PURE_FTPD_VERSION = 1.0.53
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
