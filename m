Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53AEC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:44:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78AF061179
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 16:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78AF061179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309D86058B;
	Sun, 15 Aug 2021 16:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIuWzrXT3hSv; Sun, 15 Aug 2021 16:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D856059E;
	Sun, 15 Aug 2021 16:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFDB1BF3CA
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7633A4035B
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 16:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja0V4kCmksQt for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 16:44:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF9574028F
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 16:44:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f5so20273693wrm.13
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oPL1xelOlB3sIChGm3JnJ9ge4IvyRyLf7Bvu6M9x7qk=;
 b=aieMAlzvhG4q4xrTpdkq/ekfItSG7gorUeCuzTPtQ1sf+QDWyMn2T2DcR9T66g4yy7
 Kb/fdO0sR3tCN6jOhkZ+FOGiQOJKatxxs5PahQ0Ke5SeHa7XShteGFUsWeTycrEEnAVm
 RbgMmDXX0VTfhL1mXaVKbe4Yzz6ZskdLnJDhOXw3GWtOwQEB1ws4X2AqaavJ2qsLchK6
 sDGjfjfd+8knnO87NOr8NVw5gM/gz0LWho7Q9irBCeDubUh7kCZjn+XphumUGOVUC5dv
 KSCh0odlHSk7/E0YaXsH65r7CYBSLT6aM/nyBwh2l1hIeNct+wpWZhkrOcBWWtqQqj1h
 wmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oPL1xelOlB3sIChGm3JnJ9ge4IvyRyLf7Bvu6M9x7qk=;
 b=Sl3Ox13zBYHNwB0TuzbURwSmfjZz8NMhJp98mz7RNnflUJQDMT6O4j9m8V40CBrFiu
 U/ws4aM6r/f1276T4HTShazBpOVmQclhmWQMG6nCFJjp9Nz8piwCHVjLvoPvYQdanuQ7
 FXM8RPyU1ueuYOdKmv2k05UE8JDC7l2Q74A+l0e659UXfxg7Cv4FO37Odmai4TweFLo8
 2h+2XaFUoBKNvcXikpV9L8sZajw00j3jSdQWm7mptd0WFH+xIcLZ9xQrVyMvKvzHNVvb
 dlyQbfUlAU3Aon1RTYpe7gpfD5mleozlx5NHD/RjhCkfK2GPB6LQEaQ3GVj9epewcOkD
 NKZg==
X-Gm-Message-State: AOAM532XVQQWd6hieUGGIc7eslBpUVwBwsyRD5MAqsy+tdNlmoZZEiLP
 CeGg2mlLtCY2lSwXXALIWf3vGUslxd4Heg==
X-Google-Smtp-Source: ABdhPJw8pF9nky+w+LBlKcGYBEhzUcclhTXr6XA9sUz6aT369fnTb+Sl5xCAjTIB2IDqDZ3imyCKXQ==
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr8989369wrs.161.1629045857847; 
 Sun, 15 Aug 2021 09:44:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id b13sm8662426wrf.86.2021.08.15.09.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 09:44:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 18:44:05 +0200
Message-Id: <20210815164405.1494069-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sqlite: add SQLITE_TAR_VERSION
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

3.35.0 is the version used by https://release-monitoring.org as well as
NVD NIST database so add SQLITE_TAR_VERSION and drop
SQLITE_CPE_ID_VERSION

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlite/sqlite.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8e864ba2e5..0c2f27f127 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3350500
-SQLITE_CPE_ID_VERSION = 3.35.5
-SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
+SQLITE_VERSION = 3.35.5
+SQLITE_TAR_VERSION = 3350500
+SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
