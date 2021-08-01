Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAF1C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:47:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D528161057
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D528161057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA6A6070B;
	Sun,  1 Aug 2021 20:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSomEaREPUnm; Sun,  1 Aug 2021 20:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE9D1606A9;
	Sun,  1 Aug 2021 20:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ECC51BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C1D4836AE
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZ0p47KJYlxS for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:47:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A8EA836EA
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:47:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m12so14196456wru.12
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2K8JZivYzLKZxm6wVWSz+aGQCUbiH7MS12IxywksmeI=;
 b=OmrI9uz8QckeH8eKkqskPJWML4WIowCg0Sc2QtVK7xMDcZvqAJn0pscg2CSJGien9l
 LQ/gchjxcQtGTnih/2d87EV865u5rrgCBIAutxFEk0pG/qr5NsaNh/jBDa66W3F4B1VV
 MhpuuTxynx374FB7+WeiJylgazBFXbq2PPkKB1KuC2SpcoaV5eEY7a8wiZPoqd8oRmuV
 9wACh7JFUmf2HDSrOi/83QGyUJ2jv7vl8UaSb9QW3WlNUOVtrzXhX8S8YDStswXUcysv
 6O4qD7EuonZZEy2n96lNpQV+KPtHa4tiBAaJ2D2DwFS6Z95UiKf65/xh3GlAB4MV8tlS
 yqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2K8JZivYzLKZxm6wVWSz+aGQCUbiH7MS12IxywksmeI=;
 b=kiKmzQJsHcZQDLty+LM/DvgcjYrhOg0W0adCOKEizWwXM1TKeU7vax7KzFM7D+J7AZ
 4Yu9ilmm7aKUqJtYJ5cTWRL9fJqSgDqg4Own/3AqKxb2U3/tGBOr43JmuFRlTlpo/fn+
 juIveW/DMDMJ+IWQYwwq0o9ok9SFIw07NpY+vrVZnm4Fq6qMDebzgcFBDItBQJoNi12W
 fmcJrKRnLR3RZ+3K9dkSbXFdk7+Q7EiQtUttGalAoh8YKAUI5dTE6Aj/pAwMGBvHbe3R
 4DqGU18jotulq8wCaDsPn7D8qWdC9UdEqMRtMVaga0bRERSwGQgo9UWlal0fg+PCFDwX
 mwfQ==
X-Gm-Message-State: AOAM533YW0Dc+Ycft3dqJOLSsDg+RFBebtX1ZzMTrbui0VWii3I1519s
 TL9v8gLQEuIEciORvp/HVZ7yiqORerrQjA==
X-Google-Smtp-Source: ABdhPJw9d9P7F0xFiyIFxFdHNH9f8EwuyMIPpe6qDVjJlFSWv47iv87g47HzX/TdyWFeCNtfHnrcxA==
X-Received: by 2002:a5d:45c1:: with SMTP id b1mr13909822wrs.264.1627850822468; 
 Sun, 01 Aug 2021 13:47:02 -0700 (PDT)
Received: from kali.home (pop.92-184-106-106.mobile.abo.orange.fr.
 [92.184.106.106])
 by smtp.gmail.com with ESMTPSA id d67sm9798310wmd.9.2021.08.01.13.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:47:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:46:50 +0200
Message-Id: <20210801204650.75712-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210801204650.75712-1-fontaine.fabrice@gmail.com>
References: <20210801204650.75712-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/2] package/s390-tools: add libxml2 optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

libxml2 is an optional dependency which is enabled by default since
version 2.17.0 and
https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/s390-tools/s390-tools.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index b5843fe0d6..7f7df0542e 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -56,6 +56,15 @@ else
 S390_TOOLS_MAKE_OPTS += HAVE_GLIB2=0
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+S390_TOOLS_DEPENDENCIES += libxml2
+S390_TOOLS_MAKE_OPTS += \
+	HAVE_LIBXML2=1 \
+	XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
+else
+S390_TOOLS_MAKE_OPTS += HAVE_LIBXML2=0
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 S390_TOOLS_DEPENDENCIES += ncurses
 S390_TOOLS_MAKE_OPTS += HAVE_NCURSES=1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
