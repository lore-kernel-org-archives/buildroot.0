Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB21C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF78D40179;
	Tue, 30 Apr 2024 20:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jItQVvWsGi5Y; Tue, 30 Apr 2024 20:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE764028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAE764028D;
	Tue, 30 Apr 2024 20:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8141BF3E1
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88550402FB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iB2zr_4bfp9J for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8946C402DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8946C402DC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8946C402DC
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:47:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41adf155cffso44508025e9.2
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 13:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714510068; x=1715114868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Krq1lCR9Oc7ss/1Ae/XGIxI73qYgz9XGUeFKrZRqerc=;
 b=oZ5toCUWe4Y50Mk/WUQSp8YHo3ttDVY0l1zYEx2Qmk5H6TRNP+zCY7CeEurlExSrWF
 B4rTvaYcXT3Ln/boh9o3IZEwU5l6Pz2XZr0geSXF3fMA/gn/Q89+xNHkHG+J/szhH8fg
 CP5eSb17toz5zxbAGY1OjSXl/t6yxT5vh5f5NG9MM9YvgeYhaSkqDxrH2ZonkB9T98+p
 VztuzYkRqfwnPYXG40UK2TwPB2JNG/2z+AACOvz661SmFcqwTVAjZad4yTYwfIN6YxVr
 37bnIr11ZIaZJEj9f252wGbt/fY1ddVigKKzoHKtHLVgJrs4p3jsRO4fRJ3jdzrYgJBj
 ZuaQ==
X-Gm-Message-State: AOJu0YxJVf7qCLjZj0NvT5pl50RwM8lihGLyNY2lPwXAxmiYYhmS65fZ
 NfJsqhEjY6ERHwfs7Ibx0VjHUhAw68Eyy+eF8nTswIcRP8IMQnFN5HUpx8DRzdKTwTd4ioUm+np
 8
X-Google-Smtp-Source: AGHT+IGYYbp7BL7Z9GZy4oEib+7hrMtn2Rt60YepmMMrV+Mw3M1bzZ2n7neTz7sswxXYAdtbswzUug==
X-Received: by 2002:a05:600c:1988:b0:418:f5a9:b91c with SMTP id
 t8-20020a05600c198800b00418f5a9b91cmr376358wmq.33.1714510068321; 
 Tue, 30 Apr 2024 13:47:48 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c308a00b00418f7605249sm47346wmn.24.2024.04.30.13.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 13:47:48 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 22:47:44 +0200
Message-ID: <20240430204744.1014238-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430204744.1014238-1-romain.naour@smile.fr>
References: <20240430204744.1014238-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714510068; x=1715114868;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Krq1lCR9Oc7ss/1Ae/XGIxI73qYgz9XGUeFKrZRqerc=;
 b=Cs7ycWsKZ0S4YBbMQRbBOwrqQlc7QYecGTSOvi+ySya8//kVIaNOcSe3YD2+ajCgEk
 OSJCxFfU4AJYQcEWjZy8Pp6cfzTzFXIh+Od/oODRJHVpN84+slE1GSVP0XLS05qBwN5C
 /dVwWlwOcDYiO22w69GqEbHi74RyW/OtHp3WPNdB9LKjVK+cHmJsK9knNkzwSTm0a12E
 aRoLFpvGxURpHajOKGF/9tcIOp/FS3WiwMbF9tZveMuq8cVjucF4Wlg6Qql8P2QFu5rW
 O14B20TQStSv20KVJ5LbFvueZTOHfAU7pN8aJ29iixuR321v2u5D85Qg/paYKGiPionB
 XK3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Cs7ycWsK
Subject: [Buildroot] [PATCH 2/2] package/perl-dbd-mysql: fix runtime issue
 with MariaDB
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that the TestPerlDBDmysql can be run normally, a new runtime issue
appear due to switch from oracle-mysql to MariaDB:

  # perl -MDBI -e '1'
  # echo $?
  0

  # perl -MDBD::mysql -e '1'
  Can't load '/usr/lib/perl5/site_perl/5.38.2/arm-linux/auto/DBD/mysql/mysql.so'
  for module DBD::mysql: /usr/lib/perl5/site_perl/5.38.2/arm-linux/auto/DBD/mysql/mysql.so:
  undefined symbol: net_buffer_length at /usr/lib/perl5/5.38.2/arm-linux/DynaLoader.pm line 206.

This is fixed by an upstream commit [1] from 4.046_01 release.

[1] https://github.com/perl5-dbi/DBD-mysql/commit/0f0cebe87fab335873fd3701bc304922da826940

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654506

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...net_buffer_length-macro-if-available.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/perl-dbd-mysql/0001-Use-net_buffer_length-macro-if-available.patch

diff --git a/package/perl-dbd-mysql/0001-Use-net_buffer_length-macro-if-available.patch b/package/perl-dbd-mysql/0001-Use-net_buffer_length-macro-if-available.patch
new file mode 100644
index 0000000000..d7767c1f42
--- /dev/null
+++ b/package/perl-dbd-mysql/0001-Use-net_buffer_length-macro-if-available.patch
@@ -0,0 +1,41 @@
+From 9189ef77679c22de3bbd2142031858373236520b Mon Sep 17 00:00:00 2001
+From: Michiel Beijen <michiel.beijen@gmail.com>
+Date: Fri, 23 Feb 2018 07:52:33 +0000
+Subject: [PATCH] Use net_buffer_length macro if available
+
+Upstream: https://github.com/perl5-dbi/DBD-mysql/commit/0f0cebe87fab335873fd3701bc304922da826940
+
+(cherry picked from commit 0f0cebe87fab335873fd3701bc304922da826940)
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ mysql.xs | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/mysql.xs b/mysql.xs
+index 8edee55..9b4d60f 100644
+--- a/mysql.xs
++++ b/mysql.xs
+@@ -819,15 +819,14 @@ dbd_mysql_get_info(dbh, sql_info_type)
+ 	    retsv = newSVpvn("`", 1);
+ 	    break;
+ 	case SQL_MAXIMUM_STATEMENT_LENGTH:
+-#if !defined(MARIADB_BASE_VERSION) && MYSQL_VERSION_ID >= 50709
+-        /* MariaDB 10 is not MySQL source level compatible so this
+-           only applies to MySQL*/
+-	    /* mysql_get_option() was added in mysql 5.7.3 */
+-	    /* MYSQL_OPT_NET_BUFFER_LENGTH was added in mysql 5.7.9 */
++        /* net_buffer_length macro is not defined in MySQL 5.7 and some MariaDB
++        versions - if it is not available, use newer mysql_get_option */
++#if !defined(net_buffer_length)
++            ;
++	    unsigned long buffer_len;
+ 	    mysql_get_option(NULL, MYSQL_OPT_NET_BUFFER_LENGTH, &buffer_len);
+ 	    retsv = newSViv(buffer_len);
+ #else
+-	    /* before mysql 5.7.9 use net_buffer_length macro */
+ 	    retsv = newSViv(net_buffer_length);
+ #endif
+ 	    break;
+-- 
+2.44.0
+
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
