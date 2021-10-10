Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD909C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:51:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6190460EB2
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6190460EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F54403E0;
	Sun, 10 Oct 2021 19:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpbEEpmh_fmi; Sun, 10 Oct 2021 19:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 582A4403DD;
	Sun, 10 Oct 2021 19:51:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA4C01BF3BE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7B0A81D5A
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXqsPF0Qnpmw for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 19:50:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A42CA81D4F
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 19:50:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v17so48730941wrv.9
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 12:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wp+UY38RmXpM766f9CuH+TCjw5i0l+Rb3gkz+elDei4=;
 b=bicjBDsTQ8deFRhuRMUfgC6fHy/zPizEKKWOycPhup2sxzNqgmIeJN62joxUbWZUBI
 kHFPrj0B9MaZzIyn58ajzXCIB2fRTaQpMT1N3t0kOSuNwVkcTl/0/etmRqTUWZRVC7mP
 JKnoxedQVHw2HjjhZCTmTovJOK5o/pmHiGOsbpwGYPygQqkowbnVkOpbdcLPcRQ3CRmN
 oLRPqxjBH4vUrsG69S4Z+1DtBZo6JzG0qa0Hdubd+2dPyqqvytJyJ1qfK3MIZd32pGvk
 L3v6cXEZHQYNfLQOkjUzi94Zy7QWjZy+AKIwpZYPuGqojMZuvnylg2gdSgvvUMlUnIar
 t/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wp+UY38RmXpM766f9CuH+TCjw5i0l+Rb3gkz+elDei4=;
 b=l4Myn0eMCAkmoTAglM2nnTXaOXi8OH99EEweocQddhWgrhXENQidjKr7AZKLu2Yqop
 lirMWA7CVB5i4LeIv8RIdYVxqA9J3+KaP7ahEH3nQjRVVUwacAHl1vRKXimoVKP3lFOs
 sUD3yiq9hXQJrcb+e6DJpRRdKrzX2GdW0p7E4CfoOsv1YIpqlVdyBoxzDOWKJWPLRZG3
 E9A6uI2zcYYp72NILQgF2JKDULn9RDkLECSPkmSx33PYiVMP5e3j5yhtrMUpxSInz40M
 Cpn9z+7D2qPnXd55qU0D4vx5D19e3BaNUX4HUNli1l9GVlSOOvg58GjL+yJFSTJzkETJ
 E0rA==
X-Gm-Message-State: AOAM531cQr4fJrPcoab24JfWXFI946ifvbns7gaeOa+kzwXY+D7IoJb2
 DduSV7ZJ4T3+IPohL16YeH+Gv7MeT3g=
X-Google-Smtp-Source: ABdhPJzZDyoC7mGI0iDwjKufK31+dAxrMJUeWUOvdwNZWsdjZ24Tcx6ZtsPG7bpSuLHzW5es7ZaGLQ==
X-Received: by 2002:adf:fb89:: with SMTP id a9mr19159474wrr.164.1633895450502; 
 Sun, 10 Oct 2021 12:50:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l21sm5837284wmh.31.2021.10.10.12.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 12:50:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 21:49:37 +0200
Message-Id: <20211010194937.1419893-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010194937.1419893-1-fontaine.fabrice@gmail.com>
References: <20211010194937.1419893-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/knock: add knockd option
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
Cc: Michael Rommel <rommel@layer-7.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add knockd option to make libpcap and MMU optional and enable it by
default for backward compatibility

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/knock/Config.in | 14 ++++++++++++--
 package/knock/knock.mk  |  9 +++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/knock/Config.in b/package/knock/Config.in
index 0060ad07ce..5a4c00d9e8 100644
--- a/package/knock/Config.in
+++ b/package/knock/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_KNOCK
 	bool "knock"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBPCAP
 	help
 	  A port knocking implementation.
 	  Provides a daemon and a user application. Port knocking can be
@@ -11,3 +9,15 @@ config BR2_PACKAGE_KNOCK
 	  firewall.
 
 	  http://www.zeroflux.org/projects/knock
+
+if BR2_PACKAGE_KNOCK
+
+config BR2_PACKAGE_KNOCK_KNOCKD
+	bool "knockd"
+	default y
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Enable knockd
+
+endif
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 02811540bf..8a909b2dc3 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -8,10 +8,15 @@ KNOCK_VERSION = 0.8
 KNOCK_SITE = http://www.zeroflux.org/proj/knock/files
 KNOCK_LICENSE = GPL-2.0+
 KNOCK_LICENSE_FILES = COPYING
-KNOCK_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_PACKAGE_KNOCK_KNOCKD),y)
+KNOCK_DEPENDENCIES = libpcap
+KNOCK_CONF_OPTS += --enable-knockd
 ifeq ($(BR2_STATIC_LIBS),y)
-KNOCK_CONF_OPTS = LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+KNOCK_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+endif
+else
+KNOCK_CONF_OPTS += --disable-knockd
 endif
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
