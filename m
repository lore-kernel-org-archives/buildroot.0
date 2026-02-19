Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2264FC531E7
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 22:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D278183C35;
	Thu, 19 Feb 2026 22:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKKDhlRS6jCf; Thu, 19 Feb 2026 22:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B7483CCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771539186;
	bh=7icxHM1PJVZhDUN5JZeBOkcZVAzL7ghmHoQZJIoYVHA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPjk0+AesUmdJd8Gp3IKredJGxGeT6jpgDuYCicqyLXmuTO5nhAI3bNhiwFidvu1/
	 a0oSeE7a/yNumkPWnHF/11TzmnCFWsK3pJxTwNwvem+70897q2kEEsEmzbpGF9hunA
	 QhEf9Xk+kM0JlVFYeSRZi5hOhvmtO/DSb+dMM8wp9ChRaIv2BtQaj6fI2l2EsYtEyF
	 HShVvRuCMpmuRcvR3OvqgCI+B3uNm9oxj19WS22oNXRwthb1q5ywCy58P/yMI3xTuS
	 ukNpMh7XCcYA0o5q6JK1e2AZBs6B8p9g7V03EYM4mXS7wZJ8FAutKFuX7L+FWYoA+J
	 S0KTEGK6MAsGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B7483CCC;
	Thu, 19 Feb 2026 22:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD0CF183
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B320B83CBC
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhbgqbiopPuq for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 22:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.43;
 helo=mail-ed1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B972D83C35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B972D83C35
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B972D83C35
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:13:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-65c5a778923so2007600a12.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771539180; x=1772143980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HP6i4KFIIz/7IvBkIQmoa0uCam8lA53euVS3fbwaxy8=;
 b=sJWbnYcC/pDY7UwJKDwsBfDNvWzyzfv3OXX8z0/FPruK2vmvFn/41EcaRNE0A97wER
 Omo6an7Ceaif+T0jYBI9PY42gT5MdX30E5jPRpcf2raXRpxpymtyTmjpa5DOOh8hncwH
 ZUXPvZZIkDaE4Pzpd3Sbrw5Qu/xcl9O7tNgu15hswfyqWoxjk4x3MqQG8kRsyBZQRgFq
 lcuBVB2rb1a40J6yeICO2vk9YOBfGnqTopQviLxegABWuDpVPzdmRFXVIjDyLN3xLGtQ
 Fd1hEhhIDToYHiXTPFzBPDxQ4HutOy0gVxGSL1/kMDJYD3lN5P6n9Q74NaCXJgDo5w9y
 caMg==
X-Gm-Message-State: AOJu0YycB9qMSZauI9NSRpKyRXVQvzSE/VcInHW0vDRKRg0Jpr2KERb0
 yQOG25wjTOQzN58XsKVa40bZdWf71F6k9kPeTjKYCGoyEjvJkPOkbm4uGHtpag==
X-Gm-Gg: AZuq6aLpjmcjI4czspgaH+WEzIuSg9D91l4qFDqIklQ4P3kC7norBMG0lsXJSCbO0/n
 giU8aemPim2RGJld1QL19/SujdKDdWkw6xMpN9aAhcSE9dGoeX+UEoNSL1KYb3SIsHHpWTo+6TV
 Q5KyWxgtwiWCsBMa/m/6vg1CRz8ZeGKU/Ler6WpAdr7oI54RcBNePkcRqS3tvlsprKOTEGjlvP1
 X1QHDdmJlTT4UhuBcWFgpjCCOZyl/mOk7WnVFBetiyXLJnQoQatZVJRKuzPLH6XOOiCL4xROl+S
 gtC6NwBrVAuqa5G/7INvsEb/5UfT5hyyuc9ZCVfEAgBhMwomH0zpiJ0O3Mvu0I/e756uGqacuyd
 JoC8YJPze8hbBp8NTPfAPxG07a0T6+qCKpkI0d0NK9RrGTlEON/f9IGKwYKCVn7/xEsd9ZRabvj
 0CK6gCsa8q+IhiYCRx1kjRMnricF2VZinRxm7qRt1kiwHQ7jqMJmnOr4WFjRdkAt7VIrzOp6cu
X-Received: by 2002:a17:907:9703:b0:b8a:f7fb:4f4d with SMTP id
 a640c23a62f3a-b8fc3a3a04fmr1163423266b.16.1771539180200; 
 Thu, 19 Feb 2026 14:13:00 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:b2c8:3544:a853:192e])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8fc7627fa7sm624323566b.38.2026.02.19.14.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 14:12:59 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 19 Feb 2026 23:12:52 +0100
Message-ID: <20260219221253.2217784-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219221253.2217784-1-thomas@devoogdt.com>
References: <20260219221253.2217784-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 3/3]
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
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_fluent_bit.py  | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/test_fluent_bit.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 61c455fb638..c0735c44bb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3194,6 +3194,7 @@ F:	package/fluent-bit/
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
