Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F06CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:32:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A09F615E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A09F615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6A0841B0;
	Thu, 30 Sep 2021 18:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVEmIsw1iysx; Thu, 30 Sep 2021 18:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB725841AC;
	Thu, 30 Sep 2021 18:32:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C88C11BF289
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B58EC6143C
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmE-DrsChNGT for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 18:31:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12B7E61439
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 18:31:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s21so11585693wra.7
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAG1//VMYMPBv+IFXUH8wp7fzoZo8lPLbUSkd/KIWr0=;
 b=JZ74ZFWIkoqAxBi5b/PrHBeIdO0pxm4zHJANuki1iR5M2+8YJk4FJaqv8ArZKRU33d
 ZqClHbDmGwMWodmIIt0xC9Nqa9ZT+ofb3ZXdyevxF/bCM9M9qT4eLgqvpJue0Yt5scLl
 dL62+UWbUXCTjLhJ6K1w0u93UuMTYtSH5sCtD7qG35CS/t5SWBQR2BzzICOs23zM2sam
 SjZCClXWlUqgzM+m9sO/z/ctePBFkhX4irU0yBUId9Zo8Lx+dKdrLu+qOTt0lZwt0WR3
 Qycyybr5Z2gZeefzlkbn3HyGZQacQExjLH1nZ+p6UsAd9mlBlVnODzP93GBZpPnEQDnz
 OLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAG1//VMYMPBv+IFXUH8wp7fzoZo8lPLbUSkd/KIWr0=;
 b=SB3uJrB72qqcZm1l25IBa5K4eVu7ChjpkkslXAAtFIOSJGhgqBMtT805fAPXtMPhah
 +7eb2+GBlJ+Ek60Geo31SnBtdtNI+ugShcS3LJAwIQwTxMd45dVLsnx5KhMbTSjzFkHO
 Y0Yt2QZ5InMq1n0ESFbz9qM74mUvKzwkPZdxIVSx7A881OBun6ikpRBva+yqt5N5aXeh
 Lf6113tZdiiQyz85ssVrt7I9+mTH0pFeqxQ8kMnUs1pndlBxGUEUWoCDjPa7XaJrsz6m
 9fWVB3MoItwA1uOqCcTHQ4aHBD72M9uXpSsID3YRoNU+FFffSW/yrpQazqYokGsaV9iB
 RUfA==
X-Gm-Message-State: AOAM531a5XQAEWZMUeZpz+K5Ce5Km9tfXcQR+dclEx4joskfpbEv5jd2
 KCJatNrA4ztdWSJEiBxM/XY=
X-Google-Smtp-Source: ABdhPJw7Kk06hM4RBBQtnG3r4NOjUdXWQHw90JTtNN0UXOHibqV/7js0+q4jj1FJw72OOsEvfohynA==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr8025956wru.110.1633026689162; 
 Thu, 30 Sep 2021 11:31:29 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id c9sm5767996wmb.41.2021.09.30.11.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:31:28 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 30 Sep 2021 20:30:58 +0200
Message-Id: <20210930183058.5240-4-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930183058.5240-1-petr.vorel@gmail.com>
References: <20210930183058.5240-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v2 3/3] lapi/if_addr.h: Define IFA_FLAGS
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

and use it in icmp_rate_limit01.c.

This fixes error on toolchains with very old kernel headers, e.g.
Buildroot sourcery-arm:

icmp_rate_limit01.c:82:3: error: 'IFA_F_NOPREFIXROUTE' undeclared (first use in this function)
   IFA_F_NOPREFIXROUTE);

Fixed because IFA_F_NOPREFIXROUTE was added in 3.14 and the oldest
system we still support is Cent0S 7 with 3.10 kernel.

NOTE: Cent0S 7 is obviously heavily patched thus it contains
IFA_F_NOPREFIXROUTE and therefore CI build didn't catch this error.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 include/lapi/if_addr.h            | 3 +++
 testcases/cve/icmp_rate_limit01.c | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
index 4e50a0a4e..0f7e44784 100644
--- a/include/lapi/if_addr.h
+++ b/include/lapi/if_addr.h
@@ -12,5 +12,8 @@
 # define IFA_FLAGS 8
 #endif
 
+#ifndef IFA_F_NOPREFIXROUTE
+# define IFA_F_NOPREFIXROUTE	0x200
+#endif
 
 #endif /* LAPI_IF_ADDR_H__ */
diff --git a/testcases/cve/icmp_rate_limit01.c b/testcases/cve/icmp_rate_limit01.c
index b3a237b30..3ada32675 100644
--- a/testcases/cve/icmp_rate_limit01.c
+++ b/testcases/cve/icmp_rate_limit01.c
@@ -27,11 +27,12 @@
 #include <sys/socket.h>
 #include <netinet/in.h>
 #include <arpa/inet.h>
-#include <linux/if_addr.h>
 #include <linux/errqueue.h>
 
 #include <sched.h>
 #include <limits.h>
+
+#include "lapi/if_addr.h"
 #include "tst_test.h"
 #include "tst_netdevice.h"
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
