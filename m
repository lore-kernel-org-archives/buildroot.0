Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FB3C531C9
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 13:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D63E64055D;
	Sun, 26 Jul 2026 13:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQLf_zVLX0Nu; Sun, 26 Jul 2026 13:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 991A840587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785072420;
	bh=BPVYX5914ymLkYpQUXYVhPRcbll/ptVTn4awy2OkiaQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LuOFVHKNRI3rmltmloNTe6QeNLqog6KIuwAB3XvT4ZrtoyQENoUAmLAo4BF1m2DJ8
	 zzYPo49xYM3HkdUI7zBIsuOdGe2q1CezYX4XztYa8OlKQV0KwZn5XNmSN/bu2e0Bzm
	 pJ5SvQve5s3K+YNAGNoKa8cVRUZp4rAwCsnp2uUWfVcFyCa3KlEuDc5BLKW7CNrsyM
	 uEyLx7TZWKtdvINKBzc08l6IPMlNzFs+ETTbGVUl3cufBg21cXuQWINnTq6WKfoskZ
	 g61d79yj6imsMlVhIwfLHFdF3y8+Xe/HSc1btMMI+iPxJTkCNdBlhJL2zych12Czrt
	 25TSSqOkvEwdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 991A840587;
	Sun, 26 Jul 2026 13:27:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 043124C4
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 13:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E981680C47
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 13:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6vk9vJ63yxR for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 13:26:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1BDF80C48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1BDF80C48
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1BDF80C48
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 13:26:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1034D5FFB1;
 Sun, 26 Jul 2026 15:26:54 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 26 Jul 2026 15:26:50 +0200
Message-ID: <20260726132650.1438371-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785072415;
 bh=+J7Unt76fttBj/uJ3qfh1o9ux6jzM/TVUXhJUgpRAkI=;
 h=From:To:Cc:Subject:Date:From;
 b=rbUE5taNWVQUQ1B4k77+fRdqP2QYkLzs37pIQYYtBVNlLHE2G2sU4i1wxL6lofHqp
 PEC/gWQJNF4qJXJYH7vthQC0wjRBydI5kQWGT8Ckp4FNCWE2QIVN10j/nXZy6mK1yb
 tb6A5ItP+SwYZt2SL7qE5FdVIfnKT7TUlwTuVfa/LYucZ9Ma9IvHvpBi4NnYDfzGBW
 6hLXlVE/6rUp/LnNnySmbv9paxqpAh4soM4a3PEbgGZXkdfZri3gaBnHbA4u/j888/
 0mf+L4jAWaaZaMWOq4vqfo7s48xX5n76L2hh+OPrDDPlHDIm9KapmuMTiOH90Bw0Kh
 GFKAG18rDJaaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rbUE5taN
Subject: [Buildroot] [PATCH 1/1] support/testing: php: new runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/15538708895
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_php.py     | 61 +++++++++++++++++++
 .../rootfs-overlay/etc/apache2/httpd.conf     | 58 ++++++++++++++++++
 .../test_php/rootfs-overlay/root/mandel.php   | 19 ++++++
 .../rootfs-overlay/usr/htdocs/script.php      |  1 +
 5 files changed, 141 insertions(+)
 create mode 100644 support/testing/tests/package/test_php.py
 create mode 100644 support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
 create mode 100644 support/testing/tests/package/test_php/rootfs-overlay/root/mandel.php
 create mode 100644 support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php

diff --git a/DEVELOPERS b/DEVELOPERS
index f2713c7239..b4ca50a10e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1991,6 +1991,8 @@ F:	support/testing/tests/package/test_patch.py
 F:	support/testing/tests/package/test_patch/
 F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
+F:	support/testing/tests/package/test_php.py
+F:	support/testing/tests/package/test_php/
 F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_postgresql.py
 F:	support/testing/tests/package/test_pppd.py
diff --git a/support/testing/tests/package/test_php.py b/support/testing/tests/package/test_php.py
new file mode 100644
index 0000000000..b328eaa3bb
--- /dev/null
+++ b/support/testing/tests/package/test_php.py
@@ -0,0 +1,61 @@
+import os
+
+import infra.basetest
+
+
+class TestPhp(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_php/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_APACHE=y
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
+        BR2_PACKAGE_PHP=y
+        BR2_PACKAGE_PHP_SAPI_APACHE=y
+        BR2_PACKAGE_PHP_SAPI_CLI=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the php program can execute.
+        self.assertRunOk("php --version")
+
+        # We check can print a message from the command line.
+        msg = "Hello Buildroot!"
+        php_code = f"echo '{msg}' . PHP_EOL;"
+        cmd = f"php -r \"{php_code}\""
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We check we can exit with a specific code.
+        exit_code = 123
+        php_code = f"exit({exit_code});"
+        cmd = f"php -r \"{php_code}\""
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, exit_code)
+        self.assertEqual(len(out), 0)
+
+        # We check we can run a slightly more complex program.
+        self.assertRunOk("php mandel.php")
+
+        # We check the apache php module is also working.
+        # The php script reads the "message" POST variable,
+        # then write its content back in upper case.
+        cmd = "curl"
+        cmd += " -H 'Content-type: multipart/form-data'"
+        cmd += " -X POST"
+        cmd += f" -F message='{msg}'"
+        cmd += " http://127.0.0.1/script.php"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual("\n".join(out), msg.upper())
diff --git a/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
new file mode 100644
index 0000000000..109247514b
--- /dev/null
+++ b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
@@ -0,0 +1,58 @@
+# This file is a minimal Apache config to run PHP scripts for tests.
+# It was essentially written from the default package config with:
+# - all the comments removed,
+# - unneeded modules and config sections removed,
+# - "ServerName localhost:80" added to remove startup warning,
+# - "AddType application/x-httpd-php .php" added to enable php.
+
+ServerRoot "/usr"
+Listen 80
+
+LoadModule authz_core_module modules/mod_authz_core.so
+LoadModule mime_module modules/mod_mime.so
+LoadModule log_config_module modules/mod_log_config.so
+LoadModule unixd_module modules/mod_unixd.so
+LoadModule php_module modules/libphp.so
+
+<IfModule unixd_module>
+User daemon
+Group daemon
+</IfModule>
+
+ServerAdmin you@example.com
+ServerName localhost:80
+
+<Directory />
+    AllowOverride none
+    Require all denied
+</Directory>
+
+DocumentRoot "/usr/htdocs"
+<Directory "/usr/htdocs">
+    Options Indexes FollowSymLinks
+    AllowOverride None
+    Require all granted
+</Directory>
+
+<Files ".ht*">
+    Require all denied
+</Files>
+
+ErrorLog "/var/logs/error_log"
+LogLevel warn
+
+<IfModule log_config_module>
+    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
+    LogFormat "%h %l %u %t \"%r\" %>s %b" common
+
+    <IfModule logio_module>
+      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
+    </IfModule>
+
+    CustomLog "/var/logs/access_log" common
+</IfModule>
+
+<IfModule mime_module>
+    TypesConfig /etc/apache2/mime.types
+    AddType application/x-httpd-php .php
+</IfModule>
diff --git a/support/testing/tests/package/test_php/rootfs-overlay/root/mandel.php b/support/testing/tests/package/test_php/rootfs-overlay/root/mandel.php
new file mode 100644
index 0000000000..a18e5c6838
--- /dev/null
+++ b/support/testing/tests/package/test_php/rootfs-overlay/root/mandel.php
@@ -0,0 +1,19 @@
+<?php
+$points = ",.:-;!/>)|&IH%*Z";
+for ($y = -15; $y <= 15; $y++) {
+  for ($x = 1; $x <= 84; $x++) {
+    $i = 0;
+    $r = 0;
+    for ($k = 0; $k <= 111; $k++) {
+      $j = ($r*$r) - ($i*$i) - 2 + ($x/25);
+      $i = 2 * $r * $i + ($y/10);
+      if (($j*$j + $i*$i) >= 11) {
+        break;
+      }
+      $r = $j;
+    }
+    echo $points[$k & 0xF];
+  }
+  echo PHP_EOL;
+}
+?>
diff --git a/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php b/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php
new file mode 100644
index 0000000000..8f8feaedbf
--- /dev/null
+++ b/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php
@@ -0,0 +1 @@
+<?php echo strtoupper($_POST["message"]) . PHP_EOL; ?>
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
