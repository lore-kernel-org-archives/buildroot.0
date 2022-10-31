Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBA7FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 23:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FEE040292;
	Mon, 31 Oct 2022 23:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FEE040292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grRdtJ52PFwX; Mon, 31 Oct 2022 23:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5814040157;
	Mon, 31 Oct 2022 23:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5814040157
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3C281BF297
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD7ED400CC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD7ED400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hPTGQ8LaHIy for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 23:28:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07DDD40157
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07DDD40157
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 23:28:06 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id q1so11963867pgl.11
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 16:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Irr+A/Gt4uu+BzWA9CbObncUzNDC1HFEoeTe7Jp48GY=;
 b=759KtctugE+ywGgn1Qhf7YOpScB1qeGGaQutkgG8MHIvYomExu0tbYz/3HpSZsG/Cu
 SZe7m8dUS1nRX7LSZdCJ+c/4TKu2eNrQqafJOTSh0gVEqTtT+tp79t0mMhLOSQgoc/2v
 uNixJ4QTncJKNicfV82O9CE/q98sZzlP341p/geutT9+eYc9VFy5FxC0Tj7TXax1PBVI
 62TTrH5kPir6+MCc4+EXBivC7mIW53pUDi0DvyGPByF3rzozy4vUJcImlib+oZxWYLtc
 zRqJMxy01+uWGIvsEFEzqXyi1P3iHe6KoMt0rSG4mrREcqKl/OH0eduRTHKwYatM4pkz
 J1zA==
X-Gm-Message-State: ACrzQf16vT95kj7BWkRHRY0QjPo4bwE83eX3pZ6915HOE9mimtPtAkkF
 bJ77CuGu5nqTXx647BDP96avM3oYOnTUJA==
X-Google-Smtp-Source: AMsMyM4qTdDYZaY4kFM6i2SfqGwffan0RestBZfAOLhL17K7rrwXcojMe8T6XfHhBHy5FiJeBNABtQ==
X-Received: by 2002:a05:6a00:3392:b0:56d:67a5:6454 with SMTP id
 cm18-20020a056a00339200b0056d67a56454mr8828531pfb.68.1667258885958; 
 Mon, 31 Oct 2022 16:28:05 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n8-20020a170902d2c800b00186a1b243basm4932590plc.226.2022.10.31.16.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 16:28:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 16:27:51 -0700
Message-Id: <20221031232752.626154-3-christian@paral.in>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031232752.626154-1-christian@paral.in>
References: <20221031232752.626154-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4]
 support/testing/tests/package/test_docker-compose: quiet overly verbose
 output
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

Docker compose up outputs terminal control characters intended for
interactive output viewing.

Wget similarly can use the -q option to produce quieter logs.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 support/testing/tests/package/test_docker_compose.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index c940cc8839..a833c68233 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -40,10 +40,10 @@ class TestDockerCompose(infra.basetest.BRTest):
 
     def docker_compose_test(self):
         # will download container if not available, which may take some time
-        self.assertRunOk('docker compose up -d', 120)
+        self.assertRunOk('docker compose up -d --quiet-pull', 120)
         # container may take some time to start
         self.assertRunOk('while ! docker inspect root-busybox-1 2>&1 >/dev/null; do sleep 1; done', 120)
-        self.assertRunOk('wget -O /tmp/busybox http://127.0.0.1/busybox', 120)
+        self.assertRunOk('wget -q -O /tmp/busybox http://127.0.0.1/busybox', 120)
         self.assertRunOk('cmp /bin/busybox /tmp/busybox', 120)
 
     def test_run(self):
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
