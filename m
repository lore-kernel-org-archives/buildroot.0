Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09559C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:49:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A28A36105A
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A28A36105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43E91401DF;
	Wed, 15 Sep 2021 19:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwKCPizil97H; Wed, 15 Sep 2021 19:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87F28401BF;
	Wed, 15 Sep 2021 19:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EBEA1BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BB9160790
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QqwPPGhsheKv for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:48:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E03F605D2
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:48:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b6so5634343wrh.10
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+EiRcfWU/zttKAYQKW9/IW64+NmbZhRkJ2/zwtFP+Iw=;
 b=OaEfXGyzBocRiwOHj7nT3DXEL5aETmJawM9uPMDkGIzeRLI9f4u45Wbmx30QtBCUKi
 F4ZOjHvh4c/a8RScu4EDVc47ZFFaB3/FOsh345y4d1Z6cmPaCARtxABJ3FIF2BQqddq6
 pf7W9REXxADuNfK6uRdzUmDSsmiXV8NcD4uA5wMi3Z5z2fB18eLk5hHNesvP8f9eh6Wj
 2rdNoIFSS95GbtF72pQ91XDO6Cinzu80oYlqRJmSrnhGXa2pf6QtKh3yjOpqyKBOus2k
 uKjBXxSreMs/rFECRDxlfPrqW0XiBNTDygyPUtrQ7o14zk37CoRbVw1u1jaGsorkJSPS
 YT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+EiRcfWU/zttKAYQKW9/IW64+NmbZhRkJ2/zwtFP+Iw=;
 b=xqD8RN2JieCjqqMaXyy9re477J0XlzvwMieynh1UdlzTcwErfIlVXOsS5JiWTucPnw
 qH9V3hONS3IT39U/FuNBCadzEQXERa496qYSsuNo6LkdtxN29983IGUJertI4P7e+G35
 FM75s2CsYRJFO/YDF352ZFBd5B4EkvNtXYl9cSGwc4CfDYFD7kAmAl6YP3SwKZlotB/G
 BXY1to56mOWqcIToCaVTKw+oK0LyAAgk8Hg6lkpwOOVhl18BsyuPgOO23aquFNNaQSi/
 h2dnXQl+hcm73bdne9MNcn+3RRIWiSx4XIsMCQ5BbZIY4setCCJ5yMObnAsayIpJEEYI
 FhrQ==
X-Gm-Message-State: AOAM533aiCC8e+YxUEjTxYlU3Kx4NpR0i9cnjNsLoFbKWV+dnI+w0pnW
 7UlJgrnOhWoi0Qw8xcfdiIxkmvcsTIE=
X-Google-Smtp-Source: ABdhPJybrgTTLuSkAdg8PEN626CUjxedqQ1+Y0xAsdI3PZZDHVyu+fwh0yPcW8H5zBnocm+zxf7jfw==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr1905534wrq.3.1631735328675;
 Wed, 15 Sep 2021 12:48:48 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id l26sm5099699wmi.25.2021.09.15.12.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:48:48 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 21:48:38 +0200
Message-Id: <20210915194839.22122-4-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915194839.22122-1-petr.vorel@gmail.com>
References: <20210915194839.22122-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] utils/getdeveloperlib.py: use python3
 explicitly
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

+ remove python2 compatibility imports

library is used by support/scripts/pkg-stats and utils/get-developers
which both use python3. Although library does not require shebang,
it's better to state python3 use.

Tested with python3 -m py_compile.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
New in v2

 utils/getdeveloperlib.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index ce822320f8..74a3a420ee 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -1,4 +1,5 @@
-from __future__ import print_function
+#!/usr/bin/env python3
+
 from io import open
 import os
 import re
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
