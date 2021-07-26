Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361EAC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:21:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFB2560243
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFB2560243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9DCF401E1;
	Mon, 26 Jul 2021 09:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QV97FTUxvm8H; Mon, 26 Jul 2021 09:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00FD140171;
	Mon, 26 Jul 2021 09:21:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 953741BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84E7F402A0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6D-QJRMjv2Ow for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:21:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCD5B400D7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:21:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l4so10216148wrs.4
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3xA3ZpLkuxbbG+HkAGsEPKaVm8vdNV8l2MiYvZtG0y0=;
 b=SwY0EtIG3vQomidyX9P10MZYjjgfh9oTdpL/+NzjQm6Fem0GSrrAEbyvVXkOMhyO08
 +TSxEqUM/5T9oy37VXxIIdAKLOLi4oyxRnuvDX5ftSbRfR0C9uGzteZF3fJBZQ4ehGNa
 oTj2tfngPh6FgTC9HaP4bZUYuISi5QjAkfnh1QjYkRMKgaY4djQnE0zeSanHGqY8ZKV6
 DWfQmTNbcDNO6Y64sPyHNg2PTcTZv40gtxdXadp+jvcjBDrHeySOErSPEZJ8wlW0XzEZ
 0An6BoCWDlz0qH5RwSVpmHdowum3Rzm4pihPhE4wztOGCsVOZBOy/JTdHI8qxK13EcRH
 3ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3xA3ZpLkuxbbG+HkAGsEPKaVm8vdNV8l2MiYvZtG0y0=;
 b=PipVLNPOutGTtQ/Kp9ukpTu6N36SpysMEjSnxNsH2NWxgHqJc0dWpP26uHUFbBzyf7
 +Sxw4I0T4RlWvsWTJg0Cvv1j+wmvDBf00/Ms/JlDg3pBOjmeNvRXOyQ8zatsls8o9C+c
 OKvDNKhvBs6Z3bnUjyk+DaeTAPmoTVLUDkwgy/7+iL7oh06YFtA+6QI4AUuXIU/XGjsP
 4EAlqrzzCcN0uw++wvXUE1ttH0FM3MeRRrN6j8PxLYkJoa6EeGmhaNn5cF9WaW2N+SSL
 V+7UJ4UBPkvcmML2noY2c85Ahop4NuWsnUwEPo7nHomvRlY1nmeqT/9UfEABQlyStY+x
 2uzA==
X-Gm-Message-State: AOAM531KEXLeR/KmiSatdtofKuhnAbIvR3UiwpaynL4zqADiGgEXU3x8
 Aqz/gp7leKOk/Z0F9Q2piaTu0/JPwgt/1g==
X-Google-Smtp-Source: ABdhPJzlA/XF5i3546iGsCIF5EWj9W9z+O3SzGBYyTbMYm+pB9ov587bbi/l3AIfdwldPvgn6kdoRw==
X-Received: by 2002:a5d:5305:: with SMTP id e5mr5482367wrv.243.1627291258740; 
 Mon, 26 Jul 2021 02:20:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l3sm11502625wmq.2.2021.07.26.02.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:20:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:20:52 +0200
Message-Id: <20210726092052.1713322-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/oracle-mysql: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for oracle-mysql is added by the services/mysql module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oracle-mysql/oracle-mysql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index e7d6354ed8..6607486d4d 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -13,6 +13,7 @@ ORACLE_MYSQL_DEPENDENCIES = ncurses
 ORACLE_MYSQL_AUTORECONF = YES
 ORACLE_MYSQL_LICENSE = GPL-2.0
 ORACLE_MYSQL_LICENSE_FILES = README COPYING
+ORACLE_MYSQL_SELINUX_MODULES = mysql
 ORACLE_MYSQL_PROVIDES = mysql
 
 # Unix socket. This variable can also be consulted by other buildroot packages
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
