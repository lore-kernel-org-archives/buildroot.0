Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000AFC04AA5
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 20:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F0CD82D2F;
	Wed, 24 Aug 2022 20:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F0CD82D2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuft5avL0zU5; Wed, 24 Aug 2022 20:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD1AB82C3B;
	Wed, 24 Aug 2022 20:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD1AB82C3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2681BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58A0A404C2
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58A0A404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfBpyFltOjFp for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 20:26:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAF62401C2
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAF62401C2
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 20:26:24 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id m15so10169498pjj.3
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 13:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OAhiqyLq950nJ3iKKEpVK35yM9e3grnBsLiZsThZB2A=;
 b=00guuB/2pXIb539D8CoMB3oKzzrEPndZ8TIjS/yHSEZm/BIzEBfNhTkSpKnWjsK/aj
 Rq6PrViheZuYrS/B9/oyjcWvJ1q/3QTGwJISRXHLjOrP5l8mNWwPPhQzLYkzfz7gMqlb
 M3a0T4eFFU4BZsmTT1GQzl8CXGPfcMZtWDTllx2z7+3Vtm7+zhbYJXJGFgGVuNNRMcSj
 pFxUGIPUDVHF+1BuLjiJwin3pnhpPeQmPO12cjnHuacXvGANo2yz31yPjq6xqPQXzodq
 pVsNXNfSUStstEg2mwTtQDifuU2pXxP7NwYRW8LBkBRELrndWZ3SZorUkwUR6ViaWYmq
 BSRQ==
X-Gm-Message-State: ACgBeo1Fq5NQjE7sstHHqgXtJRukfFLsrZWehk46/VKvKSFVa7xd5JF4
 DF/8+pKgm97d90h+p3ATbLMnQhDcwc8C7A==
X-Google-Smtp-Source: AA6agR6WddICdS5andI4AOOSRtjmAZ1AEjCTmlGPmze6Cvymt7ecwV7dXOyKIMLLNX6M8G2rM39icA==
X-Received: by 2002:a17:90b:4b86:b0:1f7:6fbf:116 with SMTP id
 lr6-20020a17090b4b8600b001f76fbf0116mr837270pjb.56.1661372783653; 
 Wed, 24 Aug 2022 13:26:23 -0700 (PDT)
Received: from localhost.localdomain
 (96-82-249-149-static.hfc.comcastbusiness.net. [96.82.249.149])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a656817000000b0041cd5ddde6fsm86147pgt.76.2022.08.24.13.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 13:26:23 -0700 (PDT)
From: lancethepants <lancethepants@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 14:26:17 -0600
Message-Id: <20220824202617.21650-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=OAhiqyLq950nJ3iKKEpVK35yM9e3grnBsLiZsThZB2A=;
 b=HyetPNDIkxto/LAkhK/4iR4ki/xTF/xH/kFRspndaCstbFdogLGIDl1hwE12hRARd/
 jeQjk+HDF0ky3bYBKYTgUET+2Pa20kqiWrwDvd1Qp73Tpa82LaIJANL3duhC/c8lvHw/
 RakfCfLBFWXPGjczag3eB+XmsSI+NkVG/PynlkSi5YHN3jBoNMu2w0Nen4cCANm5asqm
 BnwukfrTBjgYGiXhdWEQndr2TfKIz7zzkb6L6pYIu/dTdnnLQHia2KixwDaWkV0MyI+R
 WZ5VmfHl7yHhPOarafA1zu/fmgY32E6PO9bL+ioylXzwtbaKPsHN7HIgKHwmx2N29nY6
 J4oQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HyetPNDI
Subject: [Buildroot] [PATCH 1/1] package/musl-fts: always build static
 library
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
Cc: lancethepants <lancethepants@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

musl-fts provides features left out of musl that are included in other libc's.

This patch always enables building the static library so
that it is always present with musl's libc.a when enabled.

For those that are using buildroot for toolchain creation
and want to static link, then libfts.a is available.

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: lancethepants <lancethepants@gmail.com>
---
 package/musl-fts/musl-fts.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl-fts/musl-fts.mk b/package/musl-fts/musl-fts.mk
index dd7f1f9ea0..fcad9c3d75 100644
--- a/package/musl-fts/musl-fts.mk
+++ b/package/musl-fts/musl-fts.mk
@@ -12,5 +12,6 @@ MUSL_FTS_LICENSE_FILES = COPYING
 # pkg-config needed for autoreconf
 MUSL_FTS_DEPENDENCIES = host-pkgconf
 MUSL_FTS_INSTALL_STAGING = YES
+MUSL_FTS_CONF_OPTS += --enable-static
 
 $(eval $(autotools-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
