Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4CFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D2F610CE
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 21:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67D2F610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A8680EC5;
	Mon, 13 Sep 2021 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWXTCT21mPsg; Mon, 13 Sep 2021 21:10:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B1D80CCC;
	Mon, 13 Sep 2021 21:10:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0557B1BF318
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E911380CCC
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_WIFnwrl78a for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 21:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1292A80CC0
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 21:10:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q11so16706463wrr.9
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 14:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OlOf/DweyEehtIa9OdC4f43MdnR15UDCy5uA74Em9sA=;
 b=U069+Hn35UxCdtl3zZ69vTApxDdpM1K7pfPvPI6wvElO0fPuPAVTbTfF4UuumTHEuT
 UO9GaAQwG1WixxuiW0dXqSkrU2eZuA86CxhWGkm4kXfQrCrgfPPqHe3xrhgEyXUVN5NG
 uHW3Cxqr3gBobOQYM7T/lWuH8G9unGxsWtBcvtfwrJu8fC8j/3rlgA6GN6iFPTUtZLLZ
 bqT9JSnzoOL4G80oheRwn4L4XRb0TxLY0MIZxYnRm5bqqGYuv20XF0d/5tLDonxbS2Rv
 YuApQWyYyAIpeL14tAglYihQcYGhhht7vlYLEFbj6liR73jluYdAO9ypKhyfuHzhauVq
 NP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OlOf/DweyEehtIa9OdC4f43MdnR15UDCy5uA74Em9sA=;
 b=oub3Z6SIYyhO19ZXyBVFVkkDEzuxtXio1TueO4F199Zd21uGZsYUikFUFKcKafQRDV
 5AdUbE7N1qpCKctJZ6Ge/ljJ5u0pgBQdcln9DfrHLHTrVZ3ttxwUtzt5NIsUe1S19vlj
 MTvqyKxmXsI4QODfnGmY6wJQGUnzfGKJSFbvya/A5u9tLg+AoBWxB78w9YiPAyB07CqY
 +4RNw+Ug5rwoas9OJWlMhSHtvJ2P19CkR02P+nuqR11OMao5SQETSS09mgdiP1gSqKrO
 l8tJkXEGziDOvTP2ZK6pJF6za4qxZNdV/F6+aJ+cjoUfIz1ECOBLIBq5qHHbIjhZg+Bn
 Vo8A==
X-Gm-Message-State: AOAM530RwW1JUJbmNVcyUBoxZ/8NC5KJBH0as1BLJTZhPAA4N+u99tnl
 CQVHC68jTtPyBqRPNqsMmCieb95kwow=
X-Google-Smtp-Source: ABdhPJwbLeBkuVebwy71xG/FNB63gtp01BZ1IS4aZPc+iE1xyRs9XYxQja6431khtUl944D6/jcxLg==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr14512532wre.387.1631567432914; 
 Mon, 13 Sep 2021 14:10:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id k1sm8385598wrz.61.2021.09.13.14.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 14:10:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 23:09:28 +0200
Message-Id: <20210913210928.3938740-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmaxminddb: bump to version 1.6.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://github.com/maxmind/libmaxminddb/releases/tag/1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 4bdc05f34e..cfe838f7e5 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5237076d250a5f7c297e331c35a433eeaaf0dc205e070e4db353c9ba10f340a2  libmaxminddb-1.5.2.tar.gz
+sha256  7620ac187c591ce21bcd7bf352376a3c56a933e684558a1f6bef4bd4f3f98267  libmaxminddb-1.6.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index c022acf797..4037f89a15 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.5.2
+LIBMAXMINDDB_VERSION = 1.6.0
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
