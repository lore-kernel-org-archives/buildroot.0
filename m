Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B282AFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 23:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F62060BFF;
	Mon, 31 Oct 2022 23:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F62060BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Ce8cvvwgf_r; Mon, 31 Oct 2022 23:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B661F60BEF;
	Mon, 31 Oct 2022 23:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B661F60BEF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2419B1BF297
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F143B40272
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F143B40272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lILMVJZCd49q for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 23:28:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BBB6400CC
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BBB6400CC
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 23:28:05 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id k5so4120848pjo.5
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 16:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGP9zH+Y6k5a+zj0HMG8T4vThY47ARcE1Ls7jlr893o=;
 b=LxlD1uHXc7PcbPKSbmUi7RyDR4kBVACUZzTWEbyNrjORG+gPuhMr3dKv2ts2oj243v
 oYI3Qi5e0+QymxolaJN3kr/huH58IPZfZqQTEpMPBfSDwPLPWHRW8OYNlyK2jV8jvFo5
 bjXeVY4epvckDjesUVufQju5heffOibTl8Gzvv1GWUu+DEMtgD8p+JDIBRXXYmx1WsxG
 qM+HqQOCSxnvFAHHV19vv29BHReQhvoGmP0KSL4i7A8nvMjiYis5NXyntHeYNAVjl7xZ
 /8pETpJAwTUaP8E0oikUK3p6CrOb3KIRbHuUqEqGJ42CufLHWSw0nYZnHu3dQ9TMz6p/
 U8bg==
X-Gm-Message-State: ACrzQf34ZmbHWJ+pL1xJzM5PnCFELtWq8rUo2VZJLWRm+giaNuNhvRKs
 Q8ljbYolR2ForVb/bZ2S+r9JlFSxlN5Gmw==
X-Google-Smtp-Source: AMsMyM4LPrONiW/akqegHM2W01NJifZZKPZPJl1SuewpIyYY/oj7Mn1ZtMXqhPLCx3Qbw7GlFvD+0g==
X-Received: by 2002:a17:902:8e88:b0:185:3cea:6335 with SMTP id
 bg8-20020a1709028e8800b001853cea6335mr16711853plb.96.1667258884455; 
 Mon, 31 Oct 2022 16:28:04 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n8-20020a170902d2c800b00186a1b243basm4932590plc.226.2022.10.31.16.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 16:28:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 16:27:50 -0700
Message-Id: <20221031232752.626154-2-christian@paral.in>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031232752.626154-1-christian@paral.in>
References: <20221031232752.626154-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4]
 support/testing/tests/package/test_docker-compose: fix docker compose
 container name
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

Signed-off-by: Christian Stewart <christian@paral.in>
---
 support/testing/tests/package/test_docker_compose.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 10ceee3167..c940cc8839 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -42,7 +42,7 @@ class TestDockerCompose(infra.basetest.BRTest):
         # will download container if not available, which may take some time
         self.assertRunOk('docker compose up -d', 120)
         # container may take some time to start
-        self.assertRunOk('while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done', 120)
+        self.assertRunOk('while ! docker inspect root-busybox-1 2>&1 >/dev/null; do sleep 1; done', 120)
         self.assertRunOk('wget -O /tmp/busybox http://127.0.0.1/busybox', 120)
         self.assertRunOk('cmp /bin/busybox /tmp/busybox', 120)
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
