Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE35F55137
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 08:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EE16085E;
	Sun,  8 Mar 2026 08:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heKMw3a9NPCF; Sun,  8 Mar 2026 08:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB92C608A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772957547;
	bh=mrl+a6cm0A7RWt/ZmCw5ck/EqfMpP5pWods0OvUVcg8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RMkj/6vzz2AZvxV6SIJxWYFI9ULyBe+elu/2ED1iYv55KsIHe/hxs/7l1pvHepLp7
	 O9GBMeIheT78r3u+baceRUU2nu9FO8PwuZHuZsGz0IF8p3Va0Nv1SgMOZcCdIzEnWM
	 IkJVwsqtw5sYwQory7Y56ZGlIFL5oIrs9pxTaTvMmvfe4RXYgl8/TiFEVgJHYlCkN3
	 sx1PGv/9bxX2o/OaWyS4auy3XvBBtmOZBPo5y2wrIjQqWkMVaDUmNOOmRGSJL9pY8O
	 +n3vTF+JcFFNuxQkAhoMc1vUL8VZdNuFuArhMivX+ZBSwBPDzw/qqnVSq9OpaVWz4V
	 yANfMbctqFRnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB92C608A4;
	Sun,  8 Mar 2026 08:12:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA1FB223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC9776085E
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZjWDbJSnOEF for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 08:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.42;
 helo=mail-wr1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D66546083C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D66546083C
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D66546083C
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:23 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-439c4bde55cso3283957f8f.1
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 00:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772957542; x=1773562342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hZJDYVDNyyq0sccsxB1sWwxSATZwtn+UROD/yLwZfls=;
 b=RX1KpLKg4pnOu08fGfxB3wiEweN64zbVRJyWmn0JsX+4NpVORfAWtx3SvdkcKrBI58
 cyxyWzTj9Xbt/UN4OLLsBrVxYsX/xbqbiwNdj2KgPe7dF4XZBqz4C4u5WwopyjlFJgeE
 b++LPoKwom0525szQNtckpPuzE+d+wq85x+mZBEWrtkbVBAo1+ieo5QHjF3nf1HSIQbZ
 guRHJPPNFubnAGpH8Rm1uNx8u3ngLsh0bqFDF8QxvrcIRUr1IulZt/QSsrOt8xUpKbXT
 MyhhZH95PNSKwceJZHYfI3oOHoCG9BhgaRZzIPgU0aUzc2qtVQgF0jnebEd874YxMGbF
 9L6Q==
X-Gm-Message-State: AOJu0Yw5JeSwvxw/mfiIRW5DtiCtA+I++HzZAmtwuDSamBvMSfOTofc+
 sQlQukhz9Ec8HxhLeq8wHcOCmcXcZbPJUcLs7L90Zl/uuWpcReUREaaq7jUOKQ==
X-Gm-Gg: ATEYQzxr7atDe3RVUknQz20pHNBlxJSCWpHtt7p+47dDGMJWL2KNeQ3gPJE3c7CJ9Ff
 xyfMsTeZetBZte5ukRBNHcqtk+TiwP2hj8GU92SW4JhShj7hVNc47XCpa/yeXeUnfiwgvlPq2eR
 F3G0nY7k+Yl4AncuYWYAmcKjpKmWMZ1qErQ3/5Krkot2RFP4r+vXU9tuzM4sGK1gT+2j/vHh6lD
 kI6lJHntC5MsEMWVZzT/HaroQSFqTFbRG4cx228/yoPN/KtiblDKwUj3en3LlxdSvUnLeKretTJ
 gv0K3eAYc0tqvyEeEZqDeOlPV3a7rc89SsXJ62ZeeZOQhNsV7dV2zTlIV+BmHVYNCwLD+2by7ab
 aCJDsGRXf7EzUwjMpDsPYhCVhZOB15BNE2v9jZDsgM5YQgTfnTbUI0xmVpJQh2v/25SPajdGmyJ
 vMaI1nDwwUwPNxfUEALi3XGae/P7i6B0drvgUnlZgRjzJsM0WmVGAzjDQjP8HRT+t1zcwQ99ywE
 RiEj8jOfrp6dzHzNM7n5wNxC5rgl/XJUDlg+EEjusYhuGGBQr9MYH+D0V1P3YAXyRy5bUUv
X-Received: by 2002:a05:6000:2509:b0:439:c9e0:83a5 with SMTP id
 ffacd0b85a97d-439da6526d5mr12495379f8f.54.1772957541504; 
 Sun, 08 Mar 2026 00:12:21 -0800 (PST)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:eed7:f3f8:4231:158f])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm18170732f8f.32.2026.03.08.00.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 00:12:21 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org
Date: Sun,  8 Mar 2026 09:12:12 +0100
Message-ID: <20260308081212.777547-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308081212.777547-1-thomas@devoogdt.com>
References: <20260219221253.2217784-1-thomas@devoogdt.com>
 <20260308081212.777547-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 3/3]
 support/testing/tests/package/test_fluent_bit.py: new runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: no change
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_fluent_bit.py  | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/test_fluent_bit.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f7c5b077067..dcd25eba388 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3197,6 +3197,7 @@ F:	package/fluent-bit/
 F:	package/librdkafka/
 F:	package/libsoup3/
 F:	package/yq/
+F:	support/testing/tests/package/test_fluent_bit.py
 
 N:	Thomas Huth <th.huth+br@posteo.eu>
 F:	package/ascii-invaders/
diff --git a/support/testing/tests/package/test_fluent_bit.py b/support/testing/tests/package/test_fluent_bit.py
new file mode 100644
index 00000000000..825e4ec6d2d
--- /dev/null
+++ b/support/testing/tests/package/test_fluent_bit.py
@@ -0,0 +1,46 @@
+import os
+import json
+import time
+
+import infra.basetest
+
+
+class TestFluentBit(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_FLUENT_BIT=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Enable the http server
+        cmd = ("sed -i 's/http_server  Off/http_server  On/g' "
+               "/etc/fluent-bit/fluent-bit.conf && "
+               "/etc/init.d/S99fluent-bit restart")
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        # Give some runtime
+        time.sleep(5)
+
+        # Check the uptime
+        cmd = "wget -qO- http://127.0.0.1:2020/api/v1/uptime"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        uptime = json.loads(output[0])
+        self.assertGreater(uptime["uptime_sec"], 3)
+
+        # Check the metrics
+        cmd = "wget -qO- http://127.0.0.1:2020/api/v1/metrics"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        metrics = json.loads(output[0])
+        self.assertGreater(metrics["input"]["cpu.0"]["records"], 0)
+        self.assertGreater(metrics["output"]["stdout.0"]["proc_records"], 0)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
