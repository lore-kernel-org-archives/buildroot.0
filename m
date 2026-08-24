Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65EBC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 18:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5788D80C34;
	Mon, 24 Aug 2026 18:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hpIf4uIqcHe; Mon, 24 Aug 2026 18:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787597119;
	bh=TK3Je6aF7fBCFgLXiQpixc5j/8yVhuHHgWenKFTOVLE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EC2XPzo2ddckPg/uVXiKSKgnSO2qeM/+0XNn7BtRdg5+W48n2fulDFOxO+tHZXd8o
	 J3lRj0SyPgZdaXBvN72LQd7rD23tXOpH5Ll1gPBURIiEP6UpskMI6MlQSq1vSBkmdM
	 9RBvqoSvqb/DFx5J0SQjSLgB/l9XHKLtWXNey21+aYlVGg3cx5MhV/sVS1MwHJqLoa
	 WMeiuxCpHBPIDIIXzy14aGgQ9MIuuLYcd9sg0xS/x8QzjFh7b4S26AlPxk4xxzHZCI
	 dad6/Ss1vjUO4d/s52Gg1s1osiy6FDzx5GPRnSSOEK3Wg/7NvU6Y+/7CdeTqBk+CSx
	 E8Hh9lJi8Re+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6364080C38;
	Mon, 24 Aug 2026 18:45:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02225279
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7EFA80C38
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVvfug7nXKe2 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 18:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C977080C34
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 18:45:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 171A65FFAF;
 Mon, 24 Aug 2026 20:45:12 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 24 Aug 2026 20:45:02 +0200
Message-ID: <20260824184502.676800-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: php: fix test by switching
 to "Debian" filesystem layout
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

Buildroot commit [1] (package/apache: use "Debian" filesystem
layout to fix read-only rootfs) changed the filesystem layout.
This had the effect of installing files to different locations
and breaking the test_php runtime test.

This commit fixes the issue by updating the file paths to their
right locations. The "httpd.conf" was updated by following the
same recipe described in the comment (starting from a config
file as installed by the apache Buildroot package).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152979

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/1006666f67ba2837ba4cf1014186f3b1cc8f3415

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/16075500679
---
 .../rootfs-overlay/etc/apache2/httpd.conf     | 22 +++++++++----------
 .../apache2/default-site}/htdocs/script.php   |  0
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename support/testing/tests/package/test_php/rootfs-overlay/usr/{ => share/apache2/default-site}/htdocs/script.php (100%)

diff --git a/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
index 109247514b..75bad163db 100644
--- a/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
+++ b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
@@ -5,14 +5,14 @@
 # - "ServerName localhost:80" added to remove startup warning,
 # - "AddType application/x-httpd-php .php" added to enable php.
 
-ServerRoot "/usr"
+ServerRoot "/"
 Listen 80
 
-LoadModule authz_core_module modules/mod_authz_core.so
-LoadModule mime_module modules/mod_mime.so
-LoadModule log_config_module modules/mod_log_config.so
-LoadModule unixd_module modules/mod_unixd.so
-LoadModule php_module modules/libphp.so
+LoadModule authz_core_module usr/lib/apache2/modules/mod_authz_core.so
+LoadModule mime_module usr/lib/apache2/modules/mod_mime.so
+LoadModule log_config_module usr/lib/apache2/modules/mod_log_config.so
+LoadModule unixd_module usr/lib/apache2/modules/mod_unixd.so
+LoadModule php_module usr/lib/apache2/modules/libphp.so
 
 <IfModule unixd_module>
 User daemon
@@ -27,8 +27,8 @@ ServerName localhost:80
     Require all denied
 </Directory>
 
-DocumentRoot "/usr/htdocs"
-<Directory "/usr/htdocs">
+DocumentRoot "/usr/share/apache2/default-site/htdocs"
+<Directory "/usr/share/apache2/default-site/htdocs">
     Options Indexes FollowSymLinks
     AllowOverride None
     Require all granted
@@ -38,7 +38,7 @@ DocumentRoot "/usr/htdocs"
     Require all denied
 </Files>
 
-ErrorLog "/var/logs/error_log"
+ErrorLog "var/log/apache2/error_log"
 LogLevel warn
 
 <IfModule log_config_module>
@@ -49,10 +49,10 @@ LogLevel warn
       LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
     </IfModule>
 
-    CustomLog "/var/logs/access_log" common
+    CustomLog "var/log/apache2/access_log" common
 </IfModule>
 
 <IfModule mime_module>
-    TypesConfig /etc/apache2/mime.types
+    TypesConfig etc/apache2/mime.types
     AddType application/x-httpd-php .php
 </IfModule>
diff --git a/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php b/support/testing/tests/package/test_php/rootfs-overlay/usr/share/apache2/default-site/htdocs/script.php
similarity index 100%
rename from support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php
rename to support/testing/tests/package/test_php/rootfs-overlay/usr/share/apache2/default-site/htdocs/script.php
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
