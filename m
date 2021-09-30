Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05348C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:31:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9898961381
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9898961381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AF8E407CC;
	Thu, 30 Sep 2021 18:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOFaFEtS4SCp; Thu, 30 Sep 2021 18:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FF8640259;
	Thu, 30 Sep 2021 18:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B918B1BF289
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A947461438
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7-oqfXfjP2N for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 18:31:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE19A61439
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 18:31:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id b192so5402841wmb.2
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LxT1wJPlx8epPQ96gI9CFqtHDY9ypMS44oyi3q70HIM=;
 b=CKy24y7Ob0Tg5Hepj/VEjR980fK15llL5ULmjUCX044NArlpJeWdh+ygog9tau8z+5
 i/rACg/LOG1tLZbMZKvoJwopLm7af/T/zDOShXkcnmCfZxdkyj4XSJpwuop3wHaKXOMP
 useTZO0xc4WMyTUliOw61+EOx0Lze1JnfqRmVwypulyTbxNad64VLzpp9NJc5+dMQ7no
 tmfFGLvwJqIbXrZvQ62Wdk/o0dZG1bu3nre2gU99YllgwmmgmX/sqHmEwQSBdtJLdVjJ
 uM8XzAJGfK1mNKGqKfzvgZDb+O5XJC6YPSDNY9fOphFCwS/i1DczZjStvXY0NUsq06f2
 GSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LxT1wJPlx8epPQ96gI9CFqtHDY9ypMS44oyi3q70HIM=;
 b=3bRq/l9AxilUradWgehXLifwFzBTgBHN/FLPboFXpqukqgx+X61OZKYjAmvIG3ABHN
 EUn7K423YbRUrLtUP9CfjbeTVg0cFIzYN1gg4ttPmzHPcEgLWETv9G/6+jTMf1ZKTcC8
 ZUs6+BJyBLmXz7deDEtRz7hVou5mkn/BQT+u2EoyYfrB4dtwjAAErlc9zYY0n4YZth/E
 /ZXHJtWBwjgfB6eHpV9byITLcv/oBTBS3SX7eDkrL/nmEj+eS7w11qdqvMouh16PQ0Zk
 xNw81Cqf5koim5VUJI8V/1XmTfOPX520BF2r2pmcrHGUCjiXaFcUCaUnajrIPRJSb2f2
 TUyg==
X-Gm-Message-State: AOAM530cI6SWKJwly3KNxg4z0bCyI1ckqBijmY3yuwoUpRsByoMoxC40
 XCb4R1kTyYL3m3MJrJDL4zk=
X-Google-Smtp-Source: ABdhPJxIwNmEdLd4AjjCjtQJ3U0GLdS0YdGqvCoVyGbr4pthNAS2O9HfxSFfq7qVj4a3i03+bcD0Kg==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr739854wmq.134.1633026687871; 
 Thu, 30 Sep 2021 11:31:27 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id c9sm5767996wmb.41.2021.09.30.11.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:31:27 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 30 Sep 2021 20:30:57 +0200
Message-Id: <20210930183058.5240-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930183058.5240-1-petr.vorel@gmail.com>
References: <20210930183058.5240-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v2 2/3] lapi: Create if_addr.h and reuse it
 in rtnetlink.h
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
Cc: Li Wang <liwang@redhat.com>, Martin Doucha <mdoucha@suse.cz>,
 Cyril Hrubis <chrubis@suse.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There will be fix in next commit for missing IFA_F_NOPREFIXROUTE which
requires creating lapi/if_addr.h. Thus move IFA_FLAGS to lapi/if_addr.h,
as it belongs there and reuse lapi/if_addr.h in lapi/rtnetlink.h just
like <linux/rtnetlink.h> includes <linux/if_addr.h>.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 include/lapi/if_addr.h   | 16 ++++++++++++++++
 include/lapi/rtnetlink.h |  5 +----
 2 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 include/lapi/if_addr.h

diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
new file mode 100644
index 000000000..4e50a0a4e
--- /dev/null
+++ b/include/lapi/if_addr.h
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
+ */
+
+#ifndef LAPI_IF_ADDR_H__
+#define LAPI_IF_ADDR_H__
+
+#include <linux/if_addr.h>
+
+#ifndef IFA_FLAGS
+# define IFA_FLAGS 8
+#endif
+
+
+#endif /* LAPI_IF_ADDR_H__ */
diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
index 04e9ad51a..089bf1a0d 100644
--- a/include/lapi/rtnetlink.h
+++ b/include/lapi/rtnetlink.h
@@ -5,9 +5,6 @@
 # define LAPI_RTNETLINK_H__
 
 #include <linux/rtnetlink.h>
-
-#ifndef IFA_FLAGS
-# define IFA_FLAGS 8
-#endif
+#include "lapi/if_addr.h"
 
 #endif	/* LAPI_RTNETLINK_H__ */
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
