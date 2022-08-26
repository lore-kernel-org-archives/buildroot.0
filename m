Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796D6ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 21:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17DD882733;
	Fri, 26 Aug 2022 21:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17DD882733
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yQdb-KgQ11Nl; Fri, 26 Aug 2022 21:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47667826DF;
	Fri, 26 Aug 2022 21:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47667826DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 915CA1BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC5E41675
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 21:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC5E41675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3tHqLhd0Wxf for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 21:34:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2503341620
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2503341620
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 21:34:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so5035865wme.1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 14:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ciuS1TAi6DAFFnKtGgc+Fvb5N377cquLA70IeVwSn/U=;
 b=c9pIgDTbV37v/XlqQ4b2mtqKDVEjdvC1h6qs4EFhqi51tm1E/iyEudLx2ck51Mk/oG
 a17dxwpd9MFn2pKRgHwStOLcgcWSFyQL7E8LPm/xXfcMzKsaZVYpNa/yOL1PMinAHEZm
 jMX6iWlHITxuju4gkocaOw/MaZxp75B4vc7ELDrjZMmtIiJzHwbjRkm+Ecal6oxC9zXC
 gwTCqm6d7wdZaBq5L1I+PXoPeWOlXRJj7vUWRyB197i9Y91toqXBDLm722BRgUHySvmq
 RB8bW19pFpnXzmyj9D2UoZ9IWkgEOfwkUp9pRzKRSnVc1UpA5Qi73N71JKnalXgEZZM6
 JZDw==
X-Gm-Message-State: ACgBeo05KvQHYAOuRabkasYmnjAt4/J4EKrvS/8LVzBdWWS7MErvO0si
 lmw6i4EBc8KuW97T2lpBBsWGgWNvMSM=
X-Google-Smtp-Source: AA6agR5GcYHa9rSDx/v9ptqdUVbr7lIU6gumvFjMAMVk+0WueAcqj96yyo3uZogqof45OATF1ZmCHg==
X-Received: by 2002:a05:600c:35cc:b0:3a6:1785:ca4 with SMTP id
 r12-20020a05600c35cc00b003a617850ca4mr774486wmq.192.1661549693092; 
 Fri, 26 Aug 2022 14:34:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o26-20020a05600c511a00b003a5de95b105sm813986wms.41.2022.08.26.14.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 14:34:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 23:34:46 +0200
Message-Id: <20220826213447.47029-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ciuS1TAi6DAFFnKtGgc+Fvb5N377cquLA70IeVwSn/U=;
 b=nvqEupFbvDqcA0VdxI0e0zWKNvHlgdBQhek3HQD7P9lexJU+0IBmOz0spuJVaGQ12D
 3S6wjUpa1KdpSRZY/XJpL2SPPzdlj+0CLAaO3i5jG5OYw+tc9w53WwFv+NibkCHGoD/N
 9LZQkIW8ga9dKKIyUvR5y6wHcygKTN+JZOS9RkJGUgdhpX/0PNrRpWr8leO+nu8E4PQM
 mB17SwTXc8YJmFLIMeJyARZf7dJZ0AFdh6suxXyi29wX75/0foi7v5RLnomyQlzjRTSN
 TFmc/6aqiDjz6LywAe+73Tmilk+0lXTsTc8cMwKwwA5tXjvchzrUpWtJD5JrYTv7gIHm
 RkTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nvqEupFb
Subject: [Buildroot] [PATCH 1/2] package/v4l2loopback: add
 V4L2LOOPBACK_CPE_ID_VENDOR
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:o:v4l2loopback_project:v4l2loopback is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Ao%3Av4l2loopback_project%3Av4l2loopback

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/v4l2loopback/v4l2loopback.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index d9f065a49d..6ee4b69ef9 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -8,6 +8,8 @@ V4L2LOOPBACK_VERSION = 0.12.5
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
+V4L2LOOPBACK_CPE_ID_VENDOR = v4l2loopback_project
+V4L2LOOPBACK_CPE_ID_PREFIX = cpe:2.3:o
 
 ifeq ($(BR2_PACKAGE_V4L2LOOPBACK_UTILS),y)
 define V4L2LOOPBACK_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
