Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5928C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F23560E9A;
	Sun, 24 Jul 2022 05:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F23560E9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lcs8Has7GXF; Sun, 24 Jul 2022 05:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54AFF60AD8;
	Sun, 24 Jul 2022 05:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54AFF60AD8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B3CF1BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52C6060AD8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52C6060AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0VPPvftK6nZH for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 861A360669
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 861A360669
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:22 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r13so9587251oie.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nRYz8ZqURI+5ddgmKJHONCXW5irEwS+9C7Ncs+PaZA0=;
 b=XIoOy8QjlMww6VKSp+W33o0QlLCIG1HEAFwQiPbD8+Oi/lFCPigk/uVij8vPkmVckT
 /OvqwL/85PxO9efP1Lac/WEwF9796ib3dcvS9tp2aKwqE+Vl5w9ztM35OjuAnmHaZ36M
 9TnBlPosRa3yC9aToZLPmYD0w2Np/N8oiPE6IDrIGUC5zYaBLJE5e/nKLdGKyT/WBeKs
 ZP3he36Ve9sNKhOeWT7s4jYBnayy5PuKyf2/kLdDcmRZefp2GVjyuiXNFuwgw2lrP/ow
 HWKeWjEJL86+tN9RoaN7HqeaZ/nhdHL31TkAaRn9UMQ0M8gUfs/HiLTD10vf33ligvoZ
 /AGA==
X-Gm-Message-State: AJIora8oLSYREVZUW2ZSyS6U936ZL6x1QzUhZgtwXcN4WUaxtTw0dID/
 r69hIOiiaewTTZn1NmkmoeVWnFNXjsY=
X-Google-Smtp-Source: AGRyM1vLWvGwmdiYW7YeaUCkFFd0lwYqyXNdBXQFIroVVkXq2/R06r+aUfaFd7d9hoPKNxFC/Xf2pw==
X-Received: by 2002:a05:6808:1a1e:b0:33a:add2:63f8 with SMTP id
 bk30-20020a0568081a1e00b0033aadd263f8mr6293955oib.268.1658641821566; 
 Sat, 23 Jul 2022 22:50:21 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:20 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:48:57 -0300
Message-Id: <20220724054912.2354219-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nRYz8ZqURI+5ddgmKJHONCXW5irEwS+9C7Ncs+PaZA0=;
 b=O4zWlJSsGhWQsTlpn1fMqkcIycl/prvk1bGZ7s8SA0wDX4YlkgdeyiHarWAGtpHMUQ
 V7ev6sasC7bItk3aDmD55W5wB+VJm0H2Op4QO3m4IpnNIAxZ2gak1p4xoHpLXFIaOJwu
 tctks7eEdEA3/KywwmemPY9zNOCg0QTouuHy6frk4GYHtICzJCsUI9L172xUE2zw1/6Q
 bvAmyHdjN7Gi1Cv1+4FxWXyrjJMIwclvRCUSvk+MWctGUiqd/eO/IIoyZ8icszLAjCXP
 6Q4XhBGoADUpusQ04PzmP2dXZUDiqKDhEyywelcmJSYFcrKvhEw+8s+YIuIZ9jwaI4O8
 bayw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O4zWlJSs
Subject: [Buildroot] [PATCH 01/16] DEVELOPERS: update entries for Ricardo
 Martincoski
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 DEVELOPERS | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ee836266be..00315ffe6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2466,21 +2466,16 @@ N:	Renaud Aubin <root@renaud.io>
 F:	package/libhttpparser/
 
 N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
+F:	.flake8
 F:	package/atop/
 F:	package/thermald/
-
-N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
 F:	support/testing/infra/
 F:	support/testing/run-tests
-F:	support/testing/tests/core/test_file_capabilities.py
-F:	support/testing/tests/download/
-F:	support/testing/tests/package/*_python*.py
 F:	support/testing/tests/package/test_atop.py
-F:	support/testing/tests/package/test_syslog_ng.py
-F:	support/testing/tests/package/test_tmux.py
 F:	support/testing/tests/utils/test_check_package.py
 F:	utils/check-package
 F:	utils/checkpackagelib/
+F:	utils/docker-run
 
 N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
