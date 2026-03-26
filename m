Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE05F10AB829
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E7D80C1E;
	Thu, 26 Mar 2026 21:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dm0HoVT5qosC; Thu, 26 Mar 2026 21:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2634680B37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559755;
	bh=0B9cSMoUzn09mERATivnM1woXx7a6O7oQD5qpK1oKzA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSvqqcaOwzo3JKzhykXitdwf0F/x8AuqevxayHa0UU/jwVRgYUsYLU9MSjJU4KGIH
	 6qflNjj3bsg27QgQMWQUSvMB59Sn5IUE7Brrzr6+Jlm1Kth98Wj531y/MMCECgED+Y
	 SEr61Sg+8TkLk0juYN7XdUmHHg2ZTcXAjf9lqLnF9CxCxEz/rioB3fCSqhzUgSjsit
	 7YTrw5MAkQtldemsowdAJtbvUcu60UykukzSttE6tHxW+ecnO8X0q1U+ZreLWFh09v
	 aglRY8PmDlFXWh2lhHR5G0cTReIsr8hSOt6mVUNEan+YdhjHrrff8OCgwsAbM2pGJH
	 wG6uKdt9vZIQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2634680B37;
	Thu, 26 Mar 2026 21:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE08E2D5
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFFE380B37
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfaSQpccj6f2 for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B04B180B2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B04B180B2C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B04B180B2C
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 56999A4C2C73
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 22:15:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49662)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s32-0000000070b-49zQ
 for buildroot@buildroot.org; Thu, 26 Mar 2026 21:15:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 22:15:24 +0100
Message-ID: <20260326211524.3598703-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326211524.3598703-1-bernd@kuhls.net>
References: <20260326211524.3598703-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559725;
 bh=H4fpMJn8aOvCvwYYtOxY8gH6Z3yETov3eJ3y96PeDE0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dILJRpN6p8sOdeXcldBmi8Fi/zLZHdGFxNy9EsOcR7ge+5DNxNUCoTZQhm2fHv5bf
 elDhdvtsIw3dimMsqIPU2jF11Udyc3T/9N/NdcTMAqb8XWcNepoux18DHIPNKwuabg
 1TvcP44zBEXBiegSLw/iZt7D5VH1bSBs+bjZiAHuV23mJgHpL5ncGrU0zA0VNSBDrv
 5mW+kIpvaUbfKjKxGi3mtl5dodjXPxiq8OweODE6Z1toE66ir5inVQDcvPcmhh0npc
 hHjHe4JDKUznVTzmcHx8mgDPw3KcozL8gzCwEOgldA6lOL36T71DVEytom8gy9gRqV
 L/ZaLkFk7TZJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dILJRpN6
Subject: [Buildroot] [PATCH 3/3] package/intel-gmmlib: bump version to
 22.10.0
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

https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.10.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 76263f950f..1b7c7a2c84 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ae262b95540681ad5478c63affb880135f772c95410b092009a6f7dfc04a5ba  intel-gmmlib-22.9.0.tar.gz
+sha256  893e3c5a24b408ac312a0318b70f38f427f297646e323f31e79d3a06a92c1543  intel-gmmlib-22.10.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 1e263c3add..7cb784f361 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.9.0
+INTEL_GMMLIB_VERSION = 22.10.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
