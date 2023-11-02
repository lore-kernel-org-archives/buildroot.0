Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CC5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E3568519C;
	Thu,  2 Nov 2023 18:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E3568519C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1EkCL3SK-LZ; Thu,  2 Nov 2023 18:42:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9151585234;
	Thu,  2 Nov 2023 18:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9151585234
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D17BB1BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B835C85223
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B835C85223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEwjIqCj6Coo for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:42:01 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 280CC8519C
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280CC8519C
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6be0277c05bso1298622b3a.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 11:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698950520; x=1699555320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OG2ke3p7xbGdjWQM//YxqharoYfRUd+8YzgGF51k7F8=;
 b=SGdWlOm5EhccGcuzx97cfLaFLlWRt6MbKeSTfz1V2IfEj9H4nEyOb4uPxwPIWyLA1E
 W0lOcyOrXDyQxrtGKOnZ5TGEiJk6Ar8jb7VuxXVXjoiQa3lfpehXSOsLtE1CUoxvDl8S
 B21ijkDpdHxVJ37p3o4Ot57RMxmt/lAQxgjBwD2tkYMmUtG7s7mewUrHfarBaqkHXRs5
 xdjz8ODs8KjaMqu+QyHieOkejH/qAL4gDcYXYaODKk5PbzqhvBUKE/A4MOQYDvKU/Wwg
 S/cyWg2UcNMh22kAsETlvRyW3ZVeswqOn4sPyBlueVdWmrIjo0LzMbt12LyIQWTPAyDH
 YCow==
X-Gm-Message-State: AOJu0YzdbLEZ/6fi+x2meQMfps+o3MBMC1Hq9gPx1lCm67/IV5l3OKul
 boA70/F6U18f/4efglRweUnFsYfBXxDImqJQM1FW/ObP
X-Google-Smtp-Source: AGHT+IG2nj660dGo6P3MfcXd/CdQBLUAKkRrII/rbRLN9kspEHbB4mhlhMjjrLRzLLg90ju0tFk+vQ==
X-Received: by 2002:a05:6a00:1505:b0:6be:2649:8c6b with SMTP id
 q5-20020a056a00150500b006be26498c6bmr18277838pfu.32.1698950520114; 
 Thu, 02 Nov 2023 11:42:00 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a056a0002d500b00688965c5227sm77604pft.120.2023.11.02.11.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 11:41:59 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 12:41:54 -0600
Message-ID: <20231102184154.46185-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
References: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698950520; x=1699555320;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OG2ke3p7xbGdjWQM//YxqharoYfRUd+8YzgGF51k7F8=;
 b=VJQqb8R5scZBnKDHnOIzBR53U3XO/PD/AdaQ3fCTTIivxq3BgKTLZ+CdAWRWcy3+S8
 47Ugu1TnYQCIH53nf7S1nYaKL+4LZ59cgJKDfpUUFBdy/C+w9UhJRiYfgxiTCgXD2C5T
 de/4c+E30IKR41ABT06kR0FhdYguK9MzTzoe0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VJQqb8R5
Subject: [Buildroot] [PATCH v2 2/2]
 support/testing/tests/package/test_postgresql.py: new test
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Perform a basic check that performs the following:
  - Check if /var/lib/pgsql/postmaster.pid exists.
  - Check if 'psql -c SHOW server_version;' returns sucessfully.

Note: systemd takes quite a while to start up, so check the output of
      `systemctl is-active postgresql` until it shows "active" with a timeout
      of 15 seconds.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2:
  - Drop ": str" in front of config (Thomas)

  - Drop BR2_PER_PACKAGE_DIRECTORIES (Thomas)

  - Rename TestPostgreSQLInitd to TestPostgreSQLInitSysV (Thomas)

  - Use BASIC_TOOLCHAIN_CONFIG for TestPostgreSQLInitSysV (Thomas)

  - Move self.assertRunOk("ls /var/lib/pgsql/postmaster.pid") to after
    `systemctl is-active postgresql` returns successfully. (Yann)

  - Add an explination as to why the systemd test is not using
    BASIC_TOOLCHAIN_CONFIG.

 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_postgresql.py  | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 support/testing/tests/package/test_postgresql.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 26b25edd98..548cf25646 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	support/testing/tests/package/test_flutter.py
+F:	support/testing/tests/package/test_postgresql.py
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/support/testing/tests/package/test_postgresql.py b/support/testing/tests/package/test_postgresql.py
new file mode 100644
index 0000000000..fa692bab7b
--- /dev/null
+++ b/support/testing/tests/package/test_postgresql.py
@@ -0,0 +1,73 @@
+import os
+import time
+import infra.basetest
+
+
+class TestPostgreSQLInitSysV(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_POSTGRESQL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(
+            arch="armv5",
+            kernel="builtin",
+            options=["-drive", f"file={img},if=scsi,format=raw"],
+            kernel_cmdline=["root=/dev/sda"])
+        self.emulator.login()
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/lib/pgsql/postmaster.pid")
+
+        # Check if we can connect to the database.
+        self.assertRunOk("su postgres -c \"psql -c 'SHOW server_version;'\"")
+
+
+class TestPostgreSQLInitSystemd(infra.basetest.BRTest):
+    # Taken from test_systemd.py
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_INIT_SYSTEMD=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_POSTGRESQL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(
+            arch="armv7",
+            kernel="builtin",
+            options=["-drive", f"file={img},if=sd,format=raw"],
+            kernel_cmdline=["root=/dev/mmcblk0"])
+        self.emulator.login()
+
+        # It may take some time for PostgreSQL to finish startup. Give it at least 15 seconds.
+        is_active = False
+        for i in range(15):
+            output, _ = self.emulator.run("systemctl is-active postgresql")
+            if output[0] == "active":
+                is_active = True
+                break
+            time.sleep(1)
+        if not is_active:
+            self.fail("postgresql failed to activate!")
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/lib/pgsql/postmaster.pid")
+
+        # Check if we can connect to the database.
+        self.assertRunOk("cd / && su postgres -c \"psql -c 'SHOW server_version;'\"")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
