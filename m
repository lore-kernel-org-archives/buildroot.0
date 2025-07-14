Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E322C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B705882115;
	Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AkXMp1ZnKcv; Mon, 14 Jul 2025 20:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B971E820C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B971E820C7;
	Mon, 14 Jul 2025 20:26:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E37F8967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9BEC4037A;
 Mon, 14 Jul 2025 20:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FLqsBWFh-g7; Mon, 14 Jul 2025 20:26:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E91CC401B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E91CC401B9
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E91CC401B9
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so32284645e9.1
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524769; x=1753129569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zKtYZjAT99mAuffUMFJ+aZYNzI31gMQ2kW0Fxdq/dvw=;
 b=EfNHGMyf6tj77wMuWnivj8ETCEJVwfkvOkNXUnxTm43gqdv1Kn8EbchCkbqWInUk+w
 U8J6p8ftodHJ1TC5RU2UbayM5u7znWLFFZnN0LD0u6FzZbI1xT2D2AOyDg/9s3KS5gbO
 Ca7eSOHeb0WWUX0BthSYf807b5kfzGuIOqy/t3Zrt4259mfNmgHu0exdA4ZDH+mjK4z0
 eTpmbkQrgAWHAuZmGVFmmR2gYg0R3Ee/2oRu4Sb9UW6ft41+NQCWotPT557WtcCmgeDw
 D+Xwk9SDcS6yEqtwBqiuZIVEJEequqRcPE7855sERCF/ZqJ45rtDQLScabutgVeRQPaK
 jM3w==
X-Gm-Message-State: AOJu0YyfuF0EoWbxS53VVFvwAQX8ZOzqpXWplRaiO1OH76a48GgJlAko
 HhKx//nlIXOfRqMwTg5ecJ5co6YD6NmyvTd3f5/KwSC89o7/Tjd3vuZpjfORRQ==
X-Gm-Gg: ASbGnctMdz3gePsCna+QT4bHvwf1rA0HrDMFTnZBeoepCuK0KY7Ic7PfvKDlCGFO235
 buCWHKa4YgYvt4Ns2rH6TnpDxgMqH8AE8C43aTxBDahE8J5pl0tHrkfqkoK8X6IdxsGQ5yAck1o
 T5ZjUrSxv4BXjToxU/7LtDLsiduKMK+85Q76IrRxbdkXnVsZo1RLWW9hOcqcqCVIn1czRz7Jfwh
 nKqVZzoBPgGhNH18ZqsRQD2SvmF9PxQbhd1prlxZ1Zwth5FL0Yemuy27yJYMRCMWeJz+4DvV8dF
 HxJV2t9uZ6eCZO9e6LzsTr3tHnhrO86Ruga9yA0rB8YRY/6VQYsciprAuc9yDj4PcX3rBMGvznb
 gGwAVibqQoa//Bj4r1A6KSh9BlognhxmV
X-Google-Smtp-Source: AGHT+IFpwIuy1ymwB5GIsN1oc+hPBQkAshnA+YaNuJqVXupoIcCxbWxZ05Lm6oquHKRbIUAM4rTbUw==
X-Received: by 2002:a05:600c:4684:b0:453:5fde:fb5b with SMTP id
 5b1f17b1804b1-454f4255f4dmr133004665e9.19.1752524768646; 
 Mon, 14 Jul 2025 13:26:08 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2025 22:25:55 +0200
Message-ID: <e3682b2190a8db8a5e815cb0d76835700fde43fb.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524769; x=1753129569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zKtYZjAT99mAuffUMFJ+aZYNzI31gMQ2kW0Fxdq/dvw=;
 b=MMHEuima+jbgDTHr44aCuQ/T6gt/IfDY61HUQUIIDWwmrwtqAqVPiOZLMKQHlZ1ewt
 PzRP2lAFL8S+0velE0+8esPDbhpnKizHEgEA7cp7S3t2UwjJoHYjrWU/gglox6WhS36p
 DgcGHdWhsgD7/aof8T1DiJwZX4KQcZNczYVAlBMFR013Tr186EddO0Y1WMto9FlZepKV
 bVqeQiPahI1AYT81aeu5lEMnAbay57lbIS9ckRJCG8rQc77CfLYwhSr+YNepZGY7TEj4
 RRTlG88azbCxbC0cPcKbyLh4CwBoLg4MZQwcY1R1eFc+ho8ja/4Mr1Jtu7tQag2IJmQF
 g3Hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MMHEuima
Subject: [Buildroot] [PATCH 01/13] support/testing: add a crun-based runtime
 test for docker-compoe
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Via the docker-compose runtime test,m we can exercise the full suite of
the docker-related packages: docker-compose, of course, but also
docker-engine, which in turn allows exercising containerd. The latter
by defualt uses runc as the container runtime, but can alternatively use
crun.

Extend the docker-compose runtime test with a variant that enables crun.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tests/package/test_docker_compose.py       | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 16027c9c3a..6a8f6f4010 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -3,7 +3,7 @@ import os
 import infra.basetest
 
 
-class TestDockerCompose(infra.basetest.BRTest):
+class BaseTestDockerCompose(infra.basetest.BRTest):
     scripts = ["conf/docker-compose.yml",
                "tests/package/sample_python_docker.py"]
     config = \
@@ -53,7 +53,7 @@ class TestDockerCompose(infra.basetest.BRTest):
     def python_docker_test(self):
         self.assertRunOk('python3 ./sample_python_docker.py', 120)
 
-    def test_run(self):
+    def do_test(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
         rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
         self.emulator.boot(arch="x86_64",
@@ -70,3 +70,17 @@ class TestDockerCompose(infra.basetest.BRTest):
         self.docker_test()
         self.docker_compose_test()
         self.python_docker_test()
+
+
+class TestDockerComposeRunc(BaseTestDockerCompose):
+    def test_run(self):
+        self.do_test()
+
+
+class TestDockerComposeCrun(BaseTestDockerCompose):
+    config = BaseTestDockerCompose.config + """
+        BR2_PACKAGE_CRUN=y
+        """
+
+    def test_run(self):
+        self.do_test()
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
