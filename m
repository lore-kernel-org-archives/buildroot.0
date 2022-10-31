Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABF8ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 22:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8330060BE9;
	Mon, 31 Oct 2022 22:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8330060BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtABAkntN8V5; Mon, 31 Oct 2022 22:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B590460BCC;
	Mon, 31 Oct 2022 22:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B590460BCC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 139861BF2B6
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFDED40157
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFDED40157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YhOb0O42VYAK for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 22:31:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 291A7400CC
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 291A7400CC
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 22:31:39 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id q1so11870144pgl.11
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 15:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LNx1Xw3q7wUW3/n44Iz32XJtM4WCkkCo59QqZm2F3Y=;
 b=nnNBFvjnc/2AV2Mtc7lYoc4ASoeneTEdeMZvA8KHLX/RkKVKIbh6C0BrIWP/8PTjv3
 zlkxCrxOK1HZ+3wgeD0uBjaAAc6WOQ2JpWcv8Bt2u6iFkLD5rsIhRHwWKbt+QaIT1oz8
 uT2Hgba9jLK3HdMr4uEew1QgIidaZjh6Ngyaj8gw3jSl7mggUnO46AZw9x0RSmCsG6Io
 JelTV8qt7rHLrxjeOb5CXeKgnJ8DPNLg4xqfBvxs5+2DTRKC91AsR+odYKF3f9zeBXY7
 6EdezleXaq2s5/h6MM7mGlH1hsD4RIBu9C6AlhX+C46j5ofdIMeETRwaXVhR5MQPqZ+N
 GChw==
X-Gm-Message-State: ACrzQf0SexOjwINQnUsudBX0I+b0wwo1p19/AbspWjDn6+9gz26tsKLM
 mn/Tvp2m72/FFdUB+vbzxbO2MGz5u2vkNA==
X-Google-Smtp-Source: AMsMyM6tctkiaCmNh2MBgI+y5Q43/nT4jwhZHHS+rYDpRf6Jfd9n6SAiDmEiQKViqrK8BGI78Ccq5w==
X-Received: by 2002:a63:4f09:0:b0:440:4706:2299 with SMTP id
 d9-20020a634f09000000b0044047062299mr14881150pgb.115.1667255497996; 
 Mon, 31 Oct 2022 15:31:37 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y4-20020aa79e04000000b0056c0d129edfsm5064041pfq.121.2022.10.31.15.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:31:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:31:33 -0700
Message-Id: <20221031223133.278452-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1]
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
