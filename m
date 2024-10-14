Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B927CFC538
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 10:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66002607E3;
	Mon, 14 Oct 2024 10:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drRgdKCIpP2X; Mon, 14 Oct 2024 10:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA9D2607FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA9D2607FF;
	Mon, 14 Oct 2024 10:21:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E20B1BF2F0
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3CE6078D
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMcXNuLt06Em for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 10:21:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A57460619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A57460619
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A57460619
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 10:21:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-430549e65a4so4756645e9.0
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 03:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728901292; x=1729506092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1mavsrIjvfLoG+tApnNzLr59J36j13o2wctDfMrxVo=;
 b=MqFFRN/nQPy6r3yjgxOdjw6COehHUlAWcixAR4Ww1M6q/d02EBlGqtrcOF52B4T1Pg
 8q2Lf40jMAI+L1dGn7fKqCjJh6zWjQijyBt+vNPhXTBlljvT4wjEHbMKirV3o/amIxCV
 gnbnK5zR2exSF2d6BoUYnebUL2kpmMqUmYrpOHqtoCQ4n3yUejr7zrynVt7J9WTfXnpg
 mjRp4ULPj3kwWbt+38eXO34GNfdRififBisQ6nEqMyPLEAQVkNxiZHyjS9eEJUkkb7u+
 xfitt7zu7tboEVXBkOAeExKytFWI87rJx/Upz4RWS3LqJK57kjSirGEczsG+Ox5CXU6t
 gzkw==
X-Gm-Message-State: AOJu0YwEynINlgFECOWwJO5USwUVLpaKWhEVpxN6LJ8xCAcw2tQEvhgH
 GanSYJ3mAz4ERiZBnF740ITr77rn1mUIgKkU9RbOKgtS3RSkwtCZ8D0QaByj6Eet2/BdOJqPWBj
 YBSc=
X-Google-Smtp-Source: AGHT+IG0F39qQhRZGbdbFOjLyZNWEKBYr77xpz26PmeIBOoGRV77Kdahgv8LO/7gmOutHP7kFbCyKQ==
X-Received: by 2002:a05:600c:1c29:b0:42c:bab1:b8cc with SMTP id
 5b1f17b1804b1-4311df39d6dmr43622985e9.4.1728901292054; 
 Mon, 14 Oct 2024 03:21:32 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7ca3sm116402605e9.2.2024.10.14.03.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:21:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 12:21:21 +0200
Message-ID: <20241014102123.3727883-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728901292; x=1729506092;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1mavsrIjvfLoG+tApnNzLr59J36j13o2wctDfMrxVo=;
 b=dmjYfeXuCqR4xjoL9wADQoY2JBuwgCS6/XMP/MPsTfQbW2Y6mb/jvxjEsQznRlGUaX
 C/Pu+M4vMgzdSDQKWow1OwMJoBD5es0Oepndf9O+RZQJS1TjI0KR785Gf8r1VvkLS1hD
 DY+BznfKuX8DS7yotylDlSUvROXFSzN2RV5RQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dmjYfeXu
Subject: [Buildroot] [PATCH 4/6]
 support/testing/tests/package/test_mender.py: Add a systemd test
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  - Move the check for /var/run/mender.pid to before self.run_mender_test()
    for the two tests using sysvinit.

  - Instead of checking for /var/run/mender.pid during the systemd test,
    check to ensure "systemctl is-active mender-client" returns "active"

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/tests/package/test_mender.py | 21 ++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index 0938cb77e1..7f606eb729 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -20,8 +20,6 @@ class TestMenderInfra(infra.basetest.BRTest):
         self.emulator.login()
 
     def run_mender_test(self):
-        # Check if the Daemon is running
-        self.assertRunOk("ls /var/run/mender.pid")
         self.assertRunOk("ps aux | egrep [m]ender")
 
         # Check if a simple Mender command is correctly executed
@@ -35,6 +33,9 @@ class TestMenderInfra(infra.basetest.BRTest):
 class TestMenderRW(TestMenderInfra):
     def test_run(self):
         TestMenderInfra.base_test_run(self)
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/run/mender.pid")
         self.run_mender_test()
 
 
@@ -47,4 +48,20 @@ class TestMenderRO(TestMenderInfra):
 
     def test_run(self):
         TestMenderInfra.base_test_run(self)
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/run/mender.pid")
+        self.run_mender_test()
+
+class TestMenderSystemd(TestMenderInfra):
+    config = \
+        """
+        {}
+        BR2_INIT_SYSTEMD=y
+        """.format(TestMenderInfra.config)
+
+    def test_run(self):
+        TestMenderInfra.base_test_run(self)
+        output, _ = self.emulator.run("systemctl is-active mender-client")
+        self.assertEqual(output[0], "active")
         self.run_mender_test()
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
