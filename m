Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D28C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:54:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46AD460E98
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46AD460E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 022D160783;
	Sat, 30 Oct 2021 21:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKyM71hAArKr; Sat, 30 Oct 2021 21:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6563260780;
	Sat, 30 Oct 2021 21:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4ED1BF23C
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EF3F401D8
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30U4bkyeRry6 for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 21:54:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F6A540197
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 21:54:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b12so17819129wrh.4
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8NYzL5UGfpRrhi+wBG5B53YSRDw6Q17o0nuxJ/Nl0w=;
 b=AuOcSz6lhkmXsmaAf3LKeCw/Gap5q3MOJEDuzZ0lndIQb8fm0lXB1E7AN/aO5Zczu0
 FiDQthLALZeOcPkCzebkS8IzEbmsMxH+WoDXHAzorW1haL7kjLSmdWzeRH3o4BnHFsN/
 06+V5SHVbgAtbuu4+qUaI3/WMX3sYTIBTBqdWj4faPisGPll/bmMX0U5Dr0pwi3uq1v+
 LJ1W9RYZ5L47M3I2e2c2NmiciDKBAyf/PrtPvXBdjw5pE4/GjVLmxyutwoAkR14/Rq6C
 CTGGouaUXWCKYfeGrI49Ti9IxaHyBn3CpzR325A1YlwFVeD8ORWEEuXFpRcKzzFTKutE
 cxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8NYzL5UGfpRrhi+wBG5B53YSRDw6Q17o0nuxJ/Nl0w=;
 b=6ysTaLgt4Td1NUC9JMCfX+iMkW53Yec54+wzXXttICGFOQ+O2MGkVV8iQ5FRNUqWn8
 TmN9IWrqY4tivsLlhPYqiv1qjNondNSMY+/od7bFslLhvblaQdzd6oN1WiiEQ9VdVIWd
 1JDURrlglETUeaJecPPRIPZY384HpbxCa6MZzKmynLluwVmcyHSMO0j5ZopU6J8qAwfB
 mxrCWvMO0mXUXc+jdaTbjWp6x+wRbiDXVgjLUnRcEDPoi+N9kHNrTT0YnvSUu7AJKe1h
 Y7BXtQBpcOpi0jHOyRkjj6yJC+0qDydcT/WGO6H0QfrCS462BL3zznpP7ryR1FAR3zlw
 GpOw==
X-Gm-Message-State: AOAM5334HeqENXA7JmDFN9gP+rZoZbViAP9DKxiG3sH1/MLLIwA76+mv
 iHLmjgETinGC+QSgTGst22yK8TuRFIA=
X-Google-Smtp-Source: ABdhPJzlNVjj875t0tvMZONlovlo+rr1J1d0jIeB9GsB8M6udK1JMPukke+0gCh+/e5M85aoc5KWVA==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr24299844wru.182.1635630887415; 
 Sat, 30 Oct 2021 14:54:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l7sm3686224wrf.31.2021.10.30.14.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 14:54:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 23:53:07 +0200
Message-Id: <20211030215307.2155221-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/collectd: add missing C++ comment
 for mysql
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add missing C++ comment for mysql and while at it drops depends on
MMU and threads which are always true

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index d44d4e4913..6873e6d5ab 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -377,13 +377,14 @@ config BR2_PACKAGE_COLLECTD_MODBUS
 config BR2_PACKAGE_COLLECTD_MYSQL
 	bool "mysql"
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
-	depends on BR2_USE_MMU # mysql
-	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MYSQL
 	help
 	  Connects to a MySQL database and issues a "show status"
 	  command.
 
+comment "mysql needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_COLLECTD_NETLINK
 	bool "netlink"
 	select BR2_PACKAGE_LIBMNL
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
