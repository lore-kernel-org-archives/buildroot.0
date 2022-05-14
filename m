Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1913C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 15:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D3E060E02;
	Sat, 14 May 2022 15:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0e6fH-qFdZA; Sat, 14 May 2022 15:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D71C60E50;
	Sat, 14 May 2022 15:45:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90CB11BF2F8
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71C9D40183
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtuDzNplYUdc for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 15:45:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B6F7400A6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:45:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m1so14962892wrb.8
 for <buildroot@buildroot.org>; Sat, 14 May 2022 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BLlnsX2pKYJWQnKjkRNCpAJR5JDqqE7cb6LoHNtyhAg=;
 b=pcyPLAxxgS3D2uh8jo5eDf2I5EIhROuAw0+I93rTOgrwbNSHhvzEAATYru10rKMCaY
 5HsB8W1//9rBen38y+KuI6UJHJPw3NYwn6xIqXO9gYE7XScuZuYUa9yHIbVcu/qnfNzl
 UuzB7W9JHLujnrDdyyYAezTB+MAW3In7ieuwP1nXyCqasJ7PHBRZSLP4yCF/d1M1KP4M
 495mBgeMPwDPuLU9oBUUhB1hDyElS7YtUTPuk2paDYmtapeczJ+JDJdibd4zyr/r60+x
 iiYe6/fBZ8BhsjHbJgizsmE0TTViT5KzstmqFAVvDRL8fuINagpj2aSTPrV32POSOxCH
 WM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BLlnsX2pKYJWQnKjkRNCpAJR5JDqqE7cb6LoHNtyhAg=;
 b=IpekYKXIssDoG9s5m4u96dJlr+nXjnc+90Scn+FV+1zWCll16oRTOh0d0bc8WhDCPT
 Jmg8tb6dox4Y0K0jabz5CkJ+xOlwDE6Tc7SWuTxW00yYaPEhfemxumSFP2Mz5pAK1a3/
 sI4PSHEW7TNgp2UGpuLIsBczTBBYFWzXQtEtOOPeTgxkqwiCg/Z5nPultewWkPjtFiro
 mv+IrPvHvrFrWkwV7h0zH6h7D7tEE4B5zSKOdlK6nCi6Id6yAEpa/bR9MS27i04Jm0R7
 XGgPH/p98JDXVup+RX4Jop1G7HsWiY6fZydM+E4OnUn7y3IcJr2Tpsk+iR/17pzXafeL
 r5tQ==
X-Gm-Message-State: AOAM53346pf+TJRW6uByqLIFCy0r1wqHng9kVnMWq8fM/L12E2GD3CyN
 kWK5ddhWrcejCLz7wLzbyY6KXkqTJsM=
X-Google-Smtp-Source: ABdhPJwE1Ui/aall3bPizGXLx/RfW2V4Dyp35BUmpoBaJk13F2HchrO8s7c2XO3QwjmczL5vRq5B3Q==
X-Received: by 2002:a5d:680f:0:b0:20a:d858:f703 with SMTP id
 w15-20020a5d680f000000b0020ad858f703mr7987711wru.414.1652543123332; 
 Sat, 14 May 2022 08:45:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a7bc252000000b003942a244f54sm9801885wmj.45.2022.05.14.08.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 08:45:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 17:42:33 +0200
Message-Id: <20220514154233.4092-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/postgresql: fix BR2_OPTIMIZE_FAST
 comment
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Asaf Kahlon <asafka7@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit e702a05d8998a1f2416225eb62b43b6585738fe9 wrongly added a
dependency on !BR2_OPTIMIZE_FAST instead of BR2_OPTIMIZE_FAST

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bandwidthd/Config.in      | 2 +-
 package/collectd/Config.in        | 2 +-
 package/lighttpd/Config.in        | 2 +-
 package/php/Config.ext            | 4 ++--
 package/poco/Config.in            | 2 +-
 package/postgresql/Config.in      | 2 +-
 package/python-psycopg2/Config.in | 2 +-
 package/qt5/qt5base/Config.in     | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index 7537552390..e2a6f1acb1 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -48,7 +48,7 @@ comment "postgresql support needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "postgresql support can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_BANDWIDTHD_SQLITE3
 	bool "enable sqlite3 log storage"
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index da8465beee..dc6ecd2b72 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -487,7 +487,7 @@ comment "postgresql support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 comment "postgresql support can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_COLLECTD_PROCESSES
 	bool "processes"
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 9522b80426..5d9e624506 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -103,7 +103,7 @@ comment "pgsql support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 comment "pgsql support can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	bool "webdav support"
diff --git a/package/php/Config.ext b/package/php/Config.ext
index e4aced66df..1c2af9fd15 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -151,7 +151,7 @@ comment "PostgreSQL extension needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL extension can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_PHP_EXT_SQLITE
 	bool "SQLite3"
@@ -186,7 +186,7 @@ comment "PostgreSQL drivers need a toolchain w/ wchar, dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL drivers can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
diff --git a/package/poco/Config.in b/package/poco/Config.in
index d2852ba03e..95f9a46e6e 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -57,7 +57,7 @@ config BR2_PACKAGE_POCO_DATA_PGSQL
 	select BR2_PACKAGE_POSTGRESQL
 
 comment "Data/PostgreSQL can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_POCO_DATA_SQLITE
 	bool "Data/SQLite"
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 7c48577daf..f3e918458c 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -40,4 +40,4 @@ comment "postgresql needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "postgresql can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 361c40cfa9..4aa86c7690 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -27,4 +27,4 @@ comment "python-psycopg2 needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 comment "python-psycopg2 can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 6f2309dffd..b876f1948e 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -85,7 +85,7 @@ comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL plugin can't be built with Optimize for fast"
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_OPTIMIZE_FAST
 
 choice
 	prompt "SQLite 3 support"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
