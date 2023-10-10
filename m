Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B850DCD8CAB
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 16:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38A641BDD;
	Tue, 10 Oct 2023 16:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F38A641BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eS64LOt-azXX; Tue, 10 Oct 2023 16:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF23241798;
	Tue, 10 Oct 2023 16:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF23241798
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 069281BF326
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 16:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA4F41798
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 16:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA4F41798
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Wo9AMsKRFqJ for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 16:46:06 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85FF341762
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 16:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85FF341762
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53da80ada57so985780a12.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 09:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696956364; x=1697561164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+krB32P7ZCyllYqO7i45v6LKeanIysO55mnjNwqrgu0=;
 b=v6MA+3E2NPL8KqFyfSJyf2asbEa0u+gE9aS9v38+ISttmimsWoIAqxu9WtJuRZMYAW
 6ncsjKlAUgxZCIV38W+FR0fhOQTHc0+YwZxtAE5GQJeUNJRfIEImq9frABqF7oPE/DNj
 OVhl9MyGRThWz/yfzGyu27gznMISGaEaKZbY+K7Oce848EpbCg3571AknxPz03SypCDa
 7k8+ThppVtJCpAfFnZ3Jcqa7JjfU3OseCTJUSSN4pn5riQC/6mT6tTEATMWxSadjQsl1
 cI+ZlHS/j1bN66f1iKJOtOhR8Jr42d3rgYc4ywrpCEJVmO5Rj54kCV/iZihXbR3gxgj8
 o9YA==
X-Gm-Message-State: AOJu0YyAkKG1wF4QuqBbw2B3V+lr7ESbBYN6jBmSsByex4ZTUs64u8Jb
 YL0F+jOYwhYaEcMDaIAki9SJq+JPBZ/A57CjZDZzkw==
X-Google-Smtp-Source: AGHT+IHfqr7p3/v5NuuXAqS/bEQZttokVqpa5sByG947EhqZKil4q2aBX5lccVE2H6Kp0Zg3a5gQiw==
X-Received: by 2002:a17:906:8452:b0:9b2:a7c9:fcfe with SMTP id
 e18-20020a170906845200b009b2a7c9fcfemr14554448ejy.36.1696956364324; 
 Tue, 10 Oct 2023 09:46:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170906379100b009b957d5237asm8582838ejc.80.2023.10.10.09.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 09:46:04 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 18:45:54 +0200
Message-ID: <20231010164554.2954023-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010164554.2954023-1-adam.duskett@amarulasolutions.com>
References: <20231010164554.2954023-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696956364; x=1697561164;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+krB32P7ZCyllYqO7i45v6LKeanIysO55mnjNwqrgu0=;
 b=SJ+EJ9VCoWJLhR6gnSrEbgR1Y5vwoMwpc4N0jkK6bxy7181bZn7/PmJXijkJJOBVH9
 WRYgOvRQ7TRBjHiah68PJPk85uxaRgjnIhTx+/4q69riboDRC9wOaB8RRvQ9N8CmNSJ5
 D+TuVUPmmQ3Qy9fDFwCCF+hMq6NB064dme7M4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SJ+EJ9VC
Subject: [Buildroot] [PATCH 2/2]
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
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
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_postgresql.py  | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 support/testing/tests/package/test_postgresql.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 3fffc4346c..2421bf8ff7 100644
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
index 0000000000..b510a02f44
--- /dev/null
+++ b/support/testing/tests/package/test_postgresql.py
@@ -0,0 +1,76 @@
+import os
+import time
+import infra.basetest
+
+
+class TestPostgreSQLInitd(infra.basetest.BRTest):
+    config: str = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PER_PACKAGE_DIRECTORIES=y
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
+            kernel_cmdline=["root=/dev/mmcblk0"],
+            options=["-drive", f"file={img},if=sd,format=raw"])
+        self.emulator.login()
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/lib/pgsql/postmaster.pid")
+
+        # Check if we can connect to the database.
+        self.assertRunOk("su postgres -c \"psql -c 'SHOW server_version;'\"")
+
+
+class TestPostgreSQLSystemd(infra.basetest.BRTest):
+    config: str = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PER_PACKAGE_DIRECTORIES=y
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
+            kernel_cmdline=["root=/dev/mmcblk0"],
+            options=["-drive", f"file={img},if=sd,format=raw"])
+        self.emulator.login()
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/lib/pgsql/postmaster.pid")
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
+            self.fail("postgresql failed to active.")
+        # Check if we can connect to the database.
+        self.assertRunOk("cd / && su postgres -c \"psql -c 'SHOW server_version;'\"")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
