Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8CBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 20:09:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73D4B60FC2
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 20:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73D4B60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1835B400DA;
	Sun, 19 Sep 2021 20:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkIYdj5oeKqQ; Sun, 19 Sep 2021 20:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 336AF4028A;
	Sun, 19 Sep 2021 20:09:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDFD61BF4D5
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 20:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B541A6064C
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 20:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNBUESrQjVCY for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 20:09:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8BD160615
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 20:09:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 140so11530181wma.0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B78Bqljf4ogtWH/8OMPqOCcma/fhxWYAKkAwSLuIg+Q=;
 b=Y3bmBS36wBAI81xOoiUZ9q6rV3UPdHD5DUScBAH4LAv2/1PKauo3c8kNhVD3z4MKg4
 PVRIDuVl/EO1REVVE6XrGv60USgxmzv69CCvDWhCwPFj5gE/ehKBpYKXKHYQyI6hi4Or
 WgYrmxMTthLf0Hcq0zcDgpmqwKW6UZ0Eq2qmzh7S8F09J6nit29kImIwN2tlGbcciGli
 gJ64Mg7ccalLMCGmUDFvygtmCM4o1P0V6ZljDg8PqzUwhF2ajBqA5wp3zfl23IuGkjkq
 ibGB6X2aKxAG86oAeWP0gLG0fqneCGnlHf14oUiniZ36veIVypRP9udOSHjwXOVWn72a
 ULTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B78Bqljf4ogtWH/8OMPqOCcma/fhxWYAKkAwSLuIg+Q=;
 b=t0GFOGLU8FGKfiEA/vR1gPb0HtxXBVinoBf+otxokmebm4UDJvG+d1zDWrEte5tpy9
 GJakNS7siIhlKZwNGlIwhxY+6jfqL/fDDfCkNEdewdUKMfRTbp2Vt/QQ/eIchQrf1DTg
 05M/bAF9Phulu+k1GaZjAqs1GKW4eNnp7J+zpp9qHyWC5TXjegta3tpGBy+I7s3Cr8E5
 Re7o5Pjj4FN7fwxM4frPSIofWTxkKslTlf3WeCYXJPl2J2ugJj7RfRCxfvDS4QmJAEGg
 ZiB/mVILzRfDjc65s/ZvZ3ViIu+Y2GgUu2osVCKploYD7dTbgB5Xd7fbqFdiWpWOfidY
 tZ/A==
X-Gm-Message-State: AOAM530amTw/LbN75uhPI7muUSau7WToyVBOtiYG/3XLTAmzda3UvF3S
 JngammCdZPxS6LD/HDqe+UodSIgkU5I=
X-Google-Smtp-Source: ABdhPJzC+JB74ec2gDg3VLvmEfFOzyiadHplKPjc14k3khEYwr3f4OM07rnDJ4/OinEblUr7aumuDg==
X-Received: by 2002:a1c:a912:: with SMTP id s18mr3867709wme.48.1632082180643; 
 Sun, 19 Sep 2021 13:09:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id c7sm13196918wmq.13.2021.09.19.13.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 13:09:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 22:09:26 +0200
Message-Id: <20210919200926.51954-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sigrok-cli: bump to version 0.7.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://sigrok.org/gitweb/?p=sigrok-cli.git;a=blob;f=NEWS;h=e80dad6392501dd16e4fdc87836d443474e2eed9;hb=b584f959edb788f1731d5a304badf241ac21bf65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sigrok-cli/sigrok-cli.hash | 2 +-
 package/sigrok-cli/sigrok-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sigrok-cli/sigrok-cli.hash b/package/sigrok-cli/sigrok-cli.hash
index 3231bf82cf..cdf004fa09 100644
--- a/package/sigrok-cli/sigrok-cli.hash
+++ b/package/sigrok-cli/sigrok-cli.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f52413429f47d457c333db0fd068416ab7a3f9e35ca76de8624dc5ac6fb07797  sigrok-cli-0.7.1.tar.gz
+sha256  71d0443f36897bf565732dec206830dbea0f2789b6601cf10536b286d1140ab8  sigrok-cli-0.7.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 2c960fdf4f..af3c0a032b 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGROK_CLI_VERSION = 0.7.1
+SIGROK_CLI_VERSION = 0.7.2
 SIGROK_CLI_SITE = http://sigrok.org/download/source/sigrok-cli
 SIGROK_CLI_LICENSE = GPL-3.0+
 SIGROK_CLI_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
