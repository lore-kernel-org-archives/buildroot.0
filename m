Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1882BC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:00:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7BA6610D0
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7BA6610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A07E40447;
	Sun,  1 Aug 2021 12:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLVOVhc76NQR; Sun,  1 Aug 2021 12:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB916404A3;
	Sun,  1 Aug 2021 12:00:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 758D81BF836
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6598940393
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDRIYzEE-8FX for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:00:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 737284038A
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:00:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id x17so2471753wmc.5
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 05:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wzpPndaVtX1d3K5s6JNC01FlHyJM8Ht2qhlCnPaxMo=;
 b=rbGtmTD6Z4MNJbCTIPObhvAHa+JbSLQuWiLHyU5XGVvFhx/p+fcwGbiOj39Jn+qcZt
 nk/sm2Eem/y7rmfur0nr6bFvuDwRw1phn5J7HTt5BkVGu7z/LDo+32LHI42nYMmzKzR9
 p1vrRqiWmXbq0mJnA8G8MktnzsrVSOWWBA4F/UfO7UvGIqxRMWQ31/YzpVRcI3qPDQc7
 BXuHmoI4ZFbJ1YQwFBRxpHx6FUv5GrCF1FCUkkMNwfsIXO9sA748Bxva/n0CHkZOz1Oy
 /L8CIQZzOW+hx24ItiywBXNA9XgbmNISSExBh7dQIVAoa78VioTLLfzTyHEs0Z8BDFrk
 xN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wzpPndaVtX1d3K5s6JNC01FlHyJM8Ht2qhlCnPaxMo=;
 b=m2wP2D3iaSyMDFhO+5UBmi3anBBdTW1Apzb7ZUbK8qeQ5xSNG+mW6NESCNKdAPfMSM
 /0A6nK7CQ3k4u6qnLGmAz8PH+0jOLbq3OLNiD2qK3NoXuuKWP/Gr8iJLlubs5KO/i6RT
 MBel5RULFlOurmpyAUNtS8Hi9JH0F0S3E/NeOPLJISUzNPzVpBsEJ0WnQBe4x6ZUvnKa
 iLqLByeSC7J0OnpQh2t/yASC0QfvBYFCzImD6JoFEMxm2By1g1/tFOJoTuwgNy0YVE/q
 wdQdoiftGF5IhnZb2mFou3GpYSpGzZucD+ZAXa4yN1np4yNFarPqF5Df5F6krhu7DUmi
 OoVA==
X-Gm-Message-State: AOAM532l6NBALmXvJKzpWo3Nq0ZHe1erd19xPRYg5wSbaTsNjOGVkrU4
 S+OCowQLYazQnOlOZ5PqyhtGAsSzq/V9sQ==
X-Google-Smtp-Source: ABdhPJyZ6XIXi296qCyBTHdbWvkYhYKMG1bYYZmXzOPe1Th7iWiCGkKwYdE+L8UqO97mXPD5dyh49Q==
X-Received: by 2002:a1c:2904:: with SMTP id p4mr11801945wmp.178.1627819244441; 
 Sun, 01 Aug 2021 05:00:44 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id f3sm7800519wro.30.2021.08.01.05.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 05:00:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 14:00:36 +0200
Message-Id: <20210801120036.2911538-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libfreeimage: add CPE variables
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
Cc: =?UTF-8?q?R=C3=A9mi=20R=C3=A9rolle?= <remi.rerolle@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

cpe:2.3:a:freeimage_project:freeimage is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreeimage_project%3Afreeimage

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfreeimage/libfreeimage.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index b254fa8846..91299084a1 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -9,6 +9,8 @@ LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
 LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
 LIBFREEIMAGE_LICENSE = GPL-2.0 or GPL-3.0 or FreeImage Public License
 LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
+LIBFREEIMAGE_CPE_ID_VENDOR = freeimage_project
+LIBFREEIMAGE_CPE_ID_PRODUCT = freeimage
 LIBFREEIMAGE_INSTALL_STAGING = YES
 
 define LIBFREEIMAGE_EXTRACT_CMDS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
