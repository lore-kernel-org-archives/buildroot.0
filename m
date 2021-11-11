Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7588FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 17:45:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05E461077
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 17:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D05E461077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9178240512;
	Thu, 11 Nov 2021 17:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MqRJ-mPmUIi; Thu, 11 Nov 2021 17:45:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08705404DA;
	Thu, 11 Nov 2021 17:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4451BF327
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 17:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF5A4404DA
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 17:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqxoAD9Y9b97 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 17:45:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10ACC404CA
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 17:45:00 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id k22so7841102iol.13
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 09:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xiPiCXaWPk/FJwN81HPD75E9YYa0lCoIduR7hyvTSh4=;
 b=aglQwPCLd0+i3gSJt6EciN1nLG/8ZWXazEcWLxdjTo8EvICaE/+eETMowbCPkbrjkQ
 bbcJReSC0GjkhoRIgg+NFVR4WxXTuq426TfZbonKV8dtsVb/GQ3tPXPjHZFXmaZF2jhF
 a9UGIZ2n0/n56BEteH+kTKbCfxwRC9KjVa/emHKDPVkRdwSubqur/21knhLEIun8oKbA
 GpDRpJoLg4WopYNJR24Z8ivvhcYQF+pHBF6A215oN7htZLSDbBMGDBjgyCgIOVQDL32S
 fnEXfewm0h5I2a+22lWBS9QlxJdpPl06pdV/9fZAJnbyzFzmmf9SDoHmpeBwiT9XHxG0
 8lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xiPiCXaWPk/FJwN81HPD75E9YYa0lCoIduR7hyvTSh4=;
 b=0w36r+v53EFynG5lpwnLS0ogoaxJL4GEY1bAKQJiLVSIyM5kmOq9PuBF9s/k149mNk
 JdWTAeHFE91n3LGALnYrZV1P9XsztGhtUWJA5QEPouerW04HnJLMMu1mVT9nbwNoVDN+
 NBMYT647tVy8mBki2oEU3Ur6XgNdioiAVGi5EsEl8AiikyLXUBMLoT6w2kRisy5jys4u
 bR5SVa4sX9NBYUPnaP8J3hEjQTp1/rjI7POSZDaL7mS6DNJgA1tHSPCxRTom+heSTtE7
 myPspKlxJ+Q3uvVSnLGfLt9JkLr7YP2uLB3WbORGOKzEPx0obx8Vq0wHzGI0qUdwENwS
 DWOw==
X-Gm-Message-State: AOAM533BfnGn43GLPiRmye1TF7wSlkHzJZbsL9R8bkNbFbuHTeRWRn3c
 xI8N+icoieEnbB5KiMDT+FFTfWH7rhw=
X-Google-Smtp-Source: ABdhPJwqeS/WGEvROqNYyiBPFeFStE3LGYsrFJ+S/Cr9MWNUOOodUrhrRo/gRyn3xJ96W682G0l3Vw==
X-Received: by 2002:a05:6602:2f01:: with SMTP id
 q1mr6012020iow.157.1636652699879; 
 Thu, 11 Nov 2021 09:44:59 -0800 (PST)
Received: from james-x399.localdomain (97-118-146-63.hlrn.qwest.net.
 [97.118.146.63])
 by smtp.gmail.com with ESMTPSA id g11sm2432588ile.30.2021.11.11.09.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 09:44:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 10:44:57 -0700
Message-Id: <20211111174457.4012093-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libv4l: bump to version 1.22.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libv4l/libv4l.hash | 4 ++--
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index e45dd576bd..d473c0eac0 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.22.1.tar.bz2.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256 956118713f7ccb405c55c7088a6a2490c32d54300dd9a30d8d5008c28d3726f7  v4l-utils-1.20.0.tar.bz2
+sha256  65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31  v4l-utils-1.22.1.tar.bz2
 
 # Locally calculated
 sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 7b61823cec..1863b8cb97 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.20.0
+LIBV4L_VERSION = 1.22.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
