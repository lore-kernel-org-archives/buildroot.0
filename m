Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738CCC47258
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 07:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FED040960;
	Mon, 15 Jan 2024 07:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FED040960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PaUY939t0Mdf; Mon, 15 Jan 2024 07:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 503564176B;
	Mon, 15 Jan 2024 07:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 503564176B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1DF1BF396
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 07:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54CB7607F7
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 07:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54CB7607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NkWzP_L9C9SS for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 07:41:26 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74C25607F1
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 07:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74C25607F1
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e7e55c0f6so10051168e87.0
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 23:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705304484; x=1705909284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4TTfH38LqRm1d8yr8OjO3czx/4zD4czcXjV2PwxnDlw=;
 b=OAnpeE5Nrmg5iK0CRAUaDogIgWBQuaerBljJims2NLVoaKmBqBLZuL0HT2R7B1uqxW
 PIp1jhoIk8pIs4LL3eFqMoO3QU89Mr5piaGG9zglMgQbHO/nS3YIWVzuv/B6+ClJ7NyZ
 JrSXihOGzNVZDexcFlqbGFHZV64KV871uhccuYpJP9T/d8X3t2/kGE7/PqoqxyOSpsk9
 LTSYFp0Yw1JeU0XI2O1+tELixou3LkjwidrXLTrZpvy4FjFVdGg5BYUO3bytkE0/dDqZ
 6CIK47Y3eY4H2GsSvHhiDg8ZHyZM1CJKcKDRJHFqVElfmjwAlFn+IwCqg6TYm5Ned+Zq
 3fRQ==
X-Gm-Message-State: AOJu0YyuJAJdl8x8ITGGCPqlySDD8zUQDAVFy+bg252plZdqreiMJ0Gm
 AMcz6Sk4WwytEnFccOExJ/YjE9oIeqTC4g==
X-Google-Smtp-Source: AGHT+IE1WHMYItZ1kNkjKD12xQ1l6h5trDq4tDbfeHsue301T1PeDtnB+pqE/rD4Gyozvr2DM7GLtQ==
X-Received: by 2002:a05:6512:3d1b:b0:50e:80dc:b118 with SMTP id
 d27-20020a0565123d1b00b0050e80dcb118mr1268871lfv.62.1705304483779; 
 Sun, 14 Jan 2024 23:41:23 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.204])
 by smtp.gmail.com with ESMTPSA id
 fc6-20020a056512138600b0050e9c5b289asm1383913lfb.91.2024.01.14.23.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 23:41:23 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 08:41:10 +0100
Message-Id: <20240115074112.157216-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115074112.157216-1-troglobit@gmail.com>
References: <20240115074112.157216-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705304484; x=1705909284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4TTfH38LqRm1d8yr8OjO3czx/4zD4czcXjV2PwxnDlw=;
 b=Pfh/rKNza/MuRVWLw9G9mDYY9HlqQhcxHYtTAYFNasHZOZBfTkBtqZz2KymXIEyQkd
 qD/7YOCl6Vf6OBHhVVj9qQiVZYlCphsUEnpwrfXx2CGzOiw7rWIUsayBDz5/EB896J7V
 3NmKcK0qai8Y/MQTsHpwLIHJnAlHv3yDp9WEd0lCQfm9BQnL6xPA+Us3mvNUWsKaihhn
 LciRTP+IX3d8PAtnFCS8W+EtTdNaCKtDRKuEhRHmSiKw1Elw25Mba4BI96+KGQ+UtCsm
 jjvoP6/TZxKUFSdfsSIgwa5T2Rb5DSthOl+jjlH7gUythju/9K1AN9iu4iishLdBtzMs
 NjFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pfh/rKNz
Subject: [Buildroot] [PATCH 2/3] package/watchdogd: convert Config.in
 options, int -> bool
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enabling the optional system monitor plugins have changed syntax
upstream.  The `--with-foo=SECONDS` is now `--with-foo`.

This patch converts the menuconfig options from int to bool by renaming
the config options and adding legacy option conversion support.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/watchdogd/Config.in    | 36 +++++++++++++++-------------------
 package/watchdogd/watchdogd.mk | 17 ++++++++--------
 2 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
index ca5933848d..db1bee94c2 100644
--- a/package/watchdogd/Config.in
+++ b/package/watchdogd/Config.in
@@ -27,32 +27,28 @@ config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
 	  They can be used to verify correct operation of watchdogd and
 	  the kernel watchdog driver.
 
-config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
-	int "Generic script monitor poll interval (sec)"
-	default "300"
+config BR2_PACKAGE_WATCHDOGD_GENERIC
+	bool "Generic script monitor"
+	default y if BR2_PACKAGE_WATCHDOGD_GENERIC_POLL != 0 # legacy
 	help
-	  Poll interval for generic script monitor, in seconds.  A value
-	  of zero (0) disables the monitor.
+	  Enable generic script monitor.
 
-config BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL
-	int "CPU load average monitor poll interval (sec)"
-	default "300"
+config BR2_PACKAGE_WATCHDOGD_LOADAVG
+	bool "CPU load average monitor"
+	default y if BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL != 0 # legacy
 	help
-	  Poll interval for CPU load average monitor, in seconds.  A
-	  value of zero (0) disables the monitor.
+	  Enable CPU load average monitor.
 
-config BR2_PACKAGE_WATCHDOGD_FILENR_POLL
-	int "File descriptor leak monitor poll interval (sec)"
-	default "300"
+config BR2_PACKAGE_WATCHDOGD_FILENR
+	bool "File descriptor leak monitor"
+	default y if BR2_PACKAGE_WATCHDOGD_FILENR_POLL != 0 # legacy
 	help
-	  Poll interval for file descriptor leak monitor, in seconds.  A
-	  value of zero (0) disables the monitor.
+	  Enable file descriptor leak monitor.
 
-config BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL
-	int "Memory leak monitor poll interval (sec)"
-	default "300"
+config BR2_PACKAGE_WATCHDOGD_MEMINFO
+	bool "Memory leak monitor"
+	default y if BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL != 0 # legacy
 	help
-	  Poll interval for memory leak monitor, in seconds.  A value of
-	  zero (0) disables the monitor.
+	  Enable memory leak monitor.
 
 endif
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index d140039540..9af71dbfaa 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -20,28 +20,29 @@ else
 WATCHDOGD_CONF_OPTS += --enable-builtin-tests
 endif
 
-ifeq ($(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL),0)
+ifeq ($(BR2_PACKAGE_WATCHDOGD_GENERIC),y)
 WATCHDOGD_CONF_OPTS += --without-generic
 else
-WATCHDOGD_CONF_OPTS += --with-generic=$(BR2_PACKAGE_WATCHDOGD_GENERIC_POLL)
+WATCHDOGD_CONF_OPTS += --with-generic
 endif
 
-ifeq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL),0)
+ifeq ($(BR2_PACKAGE_WATCHDOGD_LOADAVG),y)
 WATCHDOGD_CONF_OPTS += --without-loadavg
 else
-WATCHDOGD_CONF_OPTS += --with-loadavg=$(BR2_PACKAGE_WATCHDOGD_LOADAVG_POLL)
+WATCHDOGD_CONF_OPTS += --with-loadavg
 endif
 
-ifeq ($(BR2_PACKAGE_WATCHDOGD_FILENR_POLL),0)
+ifeq ($(BR2_PACKAGE_WATCHDOGD_FILENR),y)
 WATCHDOGD_CONF_OPTS += --without-filenr
 else
-WATCHDOGD_CONF_OPTS += --with-filenr=$(BR2_PACKAGE_WATCHDOGD_FILENR_POLL)
+WATCHDOGD_CONF_OPTS += --with-filenr
 endif
 
-ifeq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL),0)
+ifeq ($(BR2_PACKAGE_WATCHDOGD_MEMINFO),y)
 WATCHDOGD_CONF_OPTS += --without-meminfo
 else
-WATCHDOGD_CONF_OPTS += --with-meminfo=$(BR2_PACKAGE_WATCHDOGD_MEMINFO_POLL)
+WATCHDOGD_CONF_OPTS += --with-meminfo
+endif
 endif
 
 define WATCHDOGD_INSTALL_INIT_SYSV
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
