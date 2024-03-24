Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BEAC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB71405C3;
	Sun, 24 Mar 2024 17:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoDyLnYmsaEk; Sun, 24 Mar 2024 17:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85631405C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85631405C1;
	Sun, 24 Mar 2024 17:45:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE801BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D40F81604
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_69z8dNagl1 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28B658146E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28B658146E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28B658146E
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:45:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf0b.dip0.t-ipconnect.de [84.161.191.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4B36A4C31F0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 18:45:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41002)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roRuN-000000003SW-1ofy
 for buildroot@buildroot.org; Sun, 24 Mar 2024 17:45:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 18:45:23 +0100
Message-Id: <20240324174523.1770994-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711302323;
 bh=sidjLj8TB8WD32qCccg3NVLN86LJ1YU0xTSyploBooU=;
 h=From:To:Subject:Date:From;
 b=i0HMD9DBPvWPHC2q3MvvbAtuv4CCfj0rZ5h9HqiXoKAYB1jz+qJQswcoqHRiLpEYp
 y0XnqCr5zcgO7vni3msCGZEcX6AaPxiVjCGUxwSs7ovcZimhNV9HidYpS/lQeFTdgc
 XYQYDw70GhMu5izIeu8TnArNFtudzkxl2xwxadgrkecJ6RPAnRi9p9U/7tXLZ6D/sH
 wGxfB8wuKWB06lT/VAbU9Fmjif5LKX/I4S60Jox5caI+E34HM01c1xTBic8MZjQsAH
 NcFxRaIkROcBwWrLU8jKBLvzBqTqIe1yeR3j5IrOzmKB0A5izghRu9Pw+JRjFGXodw
 IU1D9JwUQIYzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=i0HMD9DB
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix install of test programs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit f95069814bd68cfc10ccf2dbc41efa6f1e127495 disabled the
build of test programs unconditionally without considering the option
BR2_PACKAGE_LIBDRM_INSTALL_TESTS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index a04331c2da..e0c1217b38 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,8 +17,7 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
-	-Dman-pages=disabled \
-	-Dtests=false
+	-Dman-pages=disabled
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
@@ -109,10 +108,12 @@ LIBDRM_CONF_OPTS += -Dvalgrind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
-LIBDRM_CONF_OPTS += -Dinstall-test-programs=true
+LIBDRM_CONF_OPTS += -Dtests=true -Dinstall-test-programs=true
 ifeq ($(BR2_PACKAGE_CUNIT),y)
 LIBDRM_DEPENDENCIES += cunit
 endif
+else
+LIBDRM_CONF_OPTS += -Dtests=false
 endif
 
 $(eval $(meson-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
