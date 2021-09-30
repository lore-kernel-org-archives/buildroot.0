Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F64C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6989F61381
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6989F61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06C39407C8;
	Thu, 30 Sep 2021 18:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jev79qKR73tK; Thu, 30 Sep 2021 18:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33BA3407C6;
	Thu, 30 Sep 2021 18:31:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 388381BF289
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35DC661439
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HtNEqaowyUVM for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 18:31:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E33B61438
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 18:31:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id o19so5420095wms.1
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dgiYGSNl2iWaVmC3tBDo1KFcVjMOXrUxq8fvu05yRhI=;
 b=FDkuHrsosuFib8Ol5SHr1teureV2c8+bRaVKJjHOXM9SRO85Mv8YE0nCOM81URh45v
 mXo9/kq1q1degbk7WKRjLpREXWbnGIMQ2/ekhR5vpWAotDgV/6ow32xzuKeYKwxUoCKt
 jaHz9pV1or9TyRk86QKKgkunNoWczws9twtSwnDpCxJyHGsPMpIw76C+d7Kqn7Qb0K1O
 eZ4NQWZtsHEodqBZN70VDoNojioJ6JbsVSsDdTibBfe0mydM2UL8NUqhdnHmwwwtrJ+U
 +3+mlhtFMjUvxYYR8WdVoj4JBy4ewSFHJjOf8AI6oFOgEE9ezrU+oh0UY8Gt9iBKJ2D9
 pgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dgiYGSNl2iWaVmC3tBDo1KFcVjMOXrUxq8fvu05yRhI=;
 b=4J/fSfElgsROD2ZhQlFKvRC6YPBLJhwZ4n5exH/C37btphzrlE38raaa/qGQZtIJsV
 woMu8JoR0V0s+H6kJyWZmapZGIEIwA4ZE5dLpn7f2cQNMat+kYO34bXc9AeMAbELN4k3
 6Yh+07/aJR6vd4DvB0z7YabaJ77tSwxDtWYDJBDu4NyX7rNeyW83v78SDSuJMz+xlGnj
 QSwxbsKWCQNnq1RRBBWzOancqu15DFp4V3E3H7OLAvri+wd8BxWD3r5VgyXg+uYoCAOd
 ott462Wzb4s1x5gW+vZ6zR7tdITps20CYeaQFgHc5Xwhe0dGdMPko4tMUqYJACFbx2Rc
 Ozlg==
X-Gm-Message-State: AOAM531QcvKeiQAeli5GB5uWOeGFqzfY+/b82sGNmiyrzAiNDw2l5Dy1
 Xzggrg2dFZ2ZG7V2z/Gkt4c=
X-Google-Smtp-Source: ABdhPJwHwyOoS9QGu8XUMNrpJ8y5w+N6P4UoIgOa2cBaf1ixHuWmRLPGDsj5Hag8F1MEzsePQawrzw==
X-Received: by 2002:a05:600c:247:: with SMTP id 7mr662708wmj.4.1633026686700; 
 Thu, 30 Sep 2021 11:31:26 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id c9sm5767996wmb.41.2021.09.30.11.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:31:26 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 30 Sep 2021 20:30:56 +0200
Message-Id: <20210930183058.5240-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930183058.5240-1-petr.vorel@gmail.com>
References: <20210930183058.5240-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v2 1/3] tst_netdevice.c: Drop redundant
 include
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

<linux/rtnetlink.h> is already included in lapi/rtnetlink.h.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 lib/tst_netdevice.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
index ba9a55b70..4a0442932 100644
--- a/lib/tst_netdevice.c
+++ b/lib/tst_netdevice.c
@@ -4,7 +4,6 @@
  */
 
 #include <asm/types.h>
-#include <linux/netlink.h>
 #include <linux/veth.h>
 #include <sys/socket.h>
 #include <net/if.h>
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
