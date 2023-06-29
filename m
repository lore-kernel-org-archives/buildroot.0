Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60F8EB64DC
	for <buildroot@archiver.kernel.org>; Thu, 29 Jun 2023 13:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11AC9417A2;
	Thu, 29 Jun 2023 13:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AC9417A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJp4evtdkWnM; Thu, 29 Jun 2023 13:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 024D8416AC;
	Thu, 29 Jun 2023 13:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024D8416AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 572EC1BF3F3
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 13:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E16881865
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 13:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E16881865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5vXtDZSlK2t for <buildroot@lists.busybox.net>;
 Thu, 29 Jun 2023 13:49:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0C06813B2
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0C06813B2
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 13:49:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9920a6a6cb0so84598666b.3
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 06:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688046577; x=1690638577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3QdPG9IEJSDV3QLp9pIqa47belTzPSZRFjXzhrZfHFM=;
 b=CoBZqs0X0Q7IM12ZOHDivzP1EGXV45O5dyeXyHljoAztKxzidhJ/IQ9nvU/gI7SyqH
 O5ZPUs+mkfxiVzehwXg5OmTXMFkO4OxVnlX851ytb3iVJwray0oZlDGnKUPrUtMaiGL+
 46ln7HaNJjDV6UhxZ/0N25Moe0ObUIG4OB1Ehaj4vSqwcOQCl4XZIWW7djqc5d5MxRe3
 MSm8S3/K6WK+lreqRGkBQYihsyoVt3bchKOtEZ2VRcVapZ8k0zw227Gv8PEDyVeABmsU
 V3Tp3Sw9orinMNcwfGVkQ1mG5CL8oZ9/lg+KvUtZMQCF/vyjUArSOEqQR3P+59k+lhok
 td0A==
X-Gm-Message-State: AC+VfDzLVgryLloaf3fVWF8+k5F3A0V6wqs+52sAFgrYoPl/PjcbDa15
 EeU6ArHTdZasWBOOmy0f5y19Vyh8cEkoQA==
X-Google-Smtp-Source: ACHHUZ4LHzT2JwNwC72kYYp/pXZq8bY+3/S6sfFWbW7YM46ugp83ccruUadrB1sJuOng0q4cUJS8YA==
X-Received: by 2002:a17:907:7783:b0:992:7e1f:8419 with SMTP id
 ky3-20020a170907778300b009927e1f8419mr3849843ejc.2.1688046576448; 
 Thu, 29 Jun 2023 06:49:36 -0700 (PDT)
Received: from goliat.praguecc.cz (90-182-211-1.rcp.o2.cz. [90.182.211.1])
 by smtp.gmail.com with ESMTPSA id
 op16-20020a170906bcf000b0099251a40184sm2396926ejb.99.2023.06.29.06.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 06:49:35 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jun 2023 15:51:24 +0200
Message-Id: <20230629135124.63139-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688046577; x=1690638577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3QdPG9IEJSDV3QLp9pIqa47belTzPSZRFjXzhrZfHFM=;
 b=C0OS8yPNzs4xIRhlUXwULky56xpVuXfrZrXVXSbQ8XoX7Hgpq5TuUsi7hhnmYhUnvO
 nQGWwoJamQjPxqmn8gvZsaNA9u+RFHMCC7M/9PLpXo9yRL9J/9eXVEgLIF2OhKPDAS4Z
 OjcSch8OE73zZoQPsHexjNy3nV1l4hdn+u9ObDV4i+EbHtS3N/TOVKo+cusJ6kuMzXNN
 V9f3MZZIXN49QGlmZ2pj77zxGXRrVoXJlVouYBebFls3ZAqRw6aD61TdrbeCy7pgOYN7
 mrarX7vhzjr9Jw+hYq5anh19AsyKWNweDjE8W8UqoBA9GNEzT2ND66SLX2yc9gMy0kqk
 lbYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=C0OS8yPN
Subject: [Buildroot] [PATCH] package/libcamera-apps: bump to version 1.2.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera-apps/libcamera-apps.hash | 2 +-
 package/libcamera-apps/libcamera-apps.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 20a06aa8fe..97fcef7ddf 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a19f3960b97ec1c0d42df8af972868ff0d4c48be6096e7ac02dbaaa4c7c75636  libcamera-apps-1.1.2.tar.gz
+sha256  49ace5382a0a9f8b05d20077fc0900b801fff83dae6ca9e3caa94dae16dbef27  libcamera-apps-1.2.0.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 592773eec8..022e6055b5 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.1.2
+LIBCAMERA_APPS_VERSION = 1.2.0
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
