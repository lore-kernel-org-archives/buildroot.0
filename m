Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18B9ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 23:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B67F813D5;
	Mon, 31 Oct 2022 23:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B67F813D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ASnmN9cpf-o; Mon, 31 Oct 2022 23:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E6D0813CD;
	Mon, 31 Oct 2022 23:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E6D0813CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2925D1BF297
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D79640157
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D79640157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diDbtFl_IMaP for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 23:28:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0306C400CC
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0306C400CC
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 23:28:03 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g62so11992398pfb.10
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 16:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LNx1Xw3q7wUW3/n44Iz32XJtM4WCkkCo59QqZm2F3Y=;
 b=s8L84+RobQlLLxJvdCppJMwv5kZBoFwFxQE7qPaQ0OVE0+08NG7Pi8/8Q4HdsKZcfy
 VHRpUAwxHEqvdc1UpZ0Svho27One0VIXQKZK9/51R+8DMtzD1OwWNkrlJbTnsyZWzZtu
 yqR1+n7WhtAinii2qeWhvHYAlJtqY0ze5NAErqrUzpY/G38xqAElrvkd9L3pvXlcZrfr
 4YK5wz95/hDy0y0Vv3OqlO0cNwwRz936Hiy7gI5VEb2s5Ev74sfBqrpM4Ddxi174qGwM
 wpaw1s9elIoZJ2tX3Pk6y/jAsB1uK95t7+yWMF8ypK6b/EawkuKMieMQrTPDIimROXiK
 zNQA==
X-Gm-Message-State: ACrzQf17thrrbjwPYLuqlZGloW+RdKwMduispf3jy2yL+WzOaXbiu+v4
 YZcbZmENhbXIK4KjxDGNC3TivrdK7UcR8g==
X-Google-Smtp-Source: AMsMyM6DBMbIAXoPUJRgr6l2vCE81V5ImduXTrLvlZFEJ0zSL8MINviFW/OGVgDYxTI/edpe1PX0Kg==
X-Received: by 2002:aa7:8293:0:b0:563:5852:e750 with SMTP id
 s19-20020aa78293000000b005635852e750mr16936811pfm.11.1667258882886; 
 Mon, 31 Oct 2022 16:28:02 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n8-20020a170902d2c800b00186a1b243basm4932590plc.226.2022.10.31.16.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 16:28:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 16:27:49 -0700
Message-Id: <20221031232752.626154-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4]
 support/testing/tests/package/test_docker-compose: fix docker compose
 binary name
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Docker compose is now invoked as "docker compose" not "docker-compose."

Signed-off-by: Christian Stewart <christian@paral.in>
---
 support/testing/tests/package/test_docker_compose.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 1ce132c242..10ceee3167 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -40,7 +40,7 @@ class TestDockerCompose(infra.basetest.BRTest):
 
     def docker_compose_test(self):
         # will download container if not available, which may take some time
-        self.assertRunOk('docker-compose up -d', 120)
+        self.assertRunOk('docker compose up -d', 120)
         # container may take some time to start
         self.assertRunOk('while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done', 120)
         self.assertRunOk('wget -O /tmp/busybox http://127.0.0.1/busybox', 120)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
