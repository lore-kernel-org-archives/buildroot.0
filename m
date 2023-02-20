Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A17AC64EC7
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D569E60746;
	Mon, 20 Feb 2023 09:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D569E60746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5wA4QUEJsPf; Mon, 20 Feb 2023 09:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E6F6076C;
	Mon, 20 Feb 2023 09:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E6F6076C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 381C01BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE7460746
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE7460746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emozErZUcG-5 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:33:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92FAD6076C
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92FAD6076C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:33:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l1so114589wry.10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 01:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mztngCcBFqAP1bSp206mgJj1SdrwZti33HUp0jNRSrE=;
 b=oX/W7KCScoMkzz6Kjy3Jn+IsB8g1KKP14zkwrz7pDxxnyPLcMNUw2naUFNTIEcZc1J
 4iRufAQG9DgZuD97rxR47nVqxoxQa3zeIc4Uyiu1G+NQQvDxsAwoCvoRnnQvw4K0hB+3
 okvlb4JTNdZOEsYbTipFWIjDp0EizgBxK1Uo0UYYxStP/GUBkwmYbAXfZgkzZYs6skC0
 tL+81s3xcckXFGgQW8eILvP1x1gkIM5qCxbG4Jsp0hio6+HjMAJP3m49V36xMxu03upv
 Mu+SETZyQDr+rK2+sqT/XGySDgyoqFPELBGq5mAQRieg8I2pEadoxWoQlLTmGApb7D9b
 BKoQ==
X-Gm-Message-State: AO0yUKUlkdbr6ebw4On6x+x/3aqKw44qgsoulr7B5DQEYWzEI/jBkOHf
 oBrCc12Da5QeUH7dzFQc6HiF2RRu3LU=
X-Google-Smtp-Source: AK7set9DRGn1FrHxN9Go0mrtQ7vJJQ+GHPvBJer8KWInMBZ2a/SjBeb1QTPpN3NRnJtjrIaPnVew2g==
X-Received: by 2002:adf:f208:0:b0:2c5:9ab9:60f6 with SMTP id
 p8-20020adff208000000b002c59ab960f6mr595904wro.62.1676885620401; 
 Mon, 20 Feb 2023 01:33:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a8-20020adfed08000000b002c55cdb1de5sm832465wro.116.2023.02.20.01.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:33:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 10:33:36 +0100
Message-Id: <20230220093336.77462-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mztngCcBFqAP1bSp206mgJj1SdrwZti33HUp0jNRSrE=;
 b=izKeddLJVzdKEwOSswxNj99soM0AyMwODjzG2Hge6t0uy61Rjk9LtaDw9DQKVgZGVR
 XlMLHRV/Vwqz7S3X5HTsUnXOmO6Syay7iVRxD30U2kIH/EPQneRxuLaXf6WtloGWgm/O
 hq4vl3LDGc7mKbBiV2HE8e6MqOh9ucj9Izk4NhxUPq1Vykl4JgyhD+1gOm9wO/rbvpDe
 jQZiRt2gFZKlyS8yCmjoNXP4SlJgGxapvaY1cu4OhAwz6Thd4vqJImjEgbRMo2p4z9vQ
 QACemIe7+waGTDfPH1RWtNLHjhvAj2glpb+5311TTlXDClc0XW4dkFXiX31YT/teGKy7
 D8nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=izKeddLJ
Subject: [Buildroot] [PATCH 1/1] package/zabbix: fix libcurl build
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following libcurl build failure:

In file included from /tmp/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/curl/curl.h:3195,
                 from ../../../../include/sysinc.h:384,
                 from ../../../../include/common.h:23,
                 from simple.c:20:
simple.c: In function 'check_https':
simple.c:167:65: error: invalid use of void expression
  167 |         if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_USERAGENT, "Zabbix " ZABBIX_VERSION)) ||
      |                                                                 ^

Fixes:
 - http://autobuild.buildroot.org/results/053a62e9969046a7f8a0e1890c24d2bfb099ae42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...se-parentheses-to-ensure-compilation.patch | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/zabbix/0002-Use-parentheses-to-ensure-compilation.patch

diff --git a/package/zabbix/0002-Use-parentheses-to-ensure-compilation.patch b/package/zabbix/0002-Use-parentheses-to-ensure-compilation.patch
new file mode 100644
index 0000000000..482480e5e0
--- /dev/null
+++ b/package/zabbix/0002-Use-parentheses-to-ensure-compilation.patch
@@ -0,0 +1,65 @@
+From 2fe3c652bd6a6522d5be3fd41c6ed39ddc2d21fa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 13 Feb 2023 14:32:38 +0100
+Subject: [PATCH] Use parentheses to ensure compilation
+
+Compiler fails with latest Curl release. Use parenthesis to ensure
+compiler evaluates expression correctly:
+
+In file included from /tmp/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/curl/curl.h:3195,
+                 from ../../../../include/sysinc.h:384,
+                 from ../../../../include/common.h:23,
+                 from simple.c:20:
+simple.c: In function 'check_https':
+simple.c:167:65: error: invalid use of void expression
+  167 |         if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_USERAGENT, "Zabbix " ZABBIX_VERSION)) ||
+      |                                                                 ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/053a62e9969046a7f8a0e1890c24d2bfb099ae42
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent (no feedback on first patch)]
+---
+ src/libs/zbxsysinfo/simple/simple.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/libs/zbxsysinfo/simple/simple.c b/src/libs/zbxsysinfo/simple/simple.c
+index fc16a784cf..c3ce974492 100644
+--- a/src/libs/zbxsysinfo/simple/simple.c
++++ b/src/libs/zbxsysinfo/simple/simple.c
+@@ -177,14 +177,14 @@ static int	check_https(const char *host, unsigned short port, int timeout, int *
+ 	else
+ 		zbx_snprintf(https_host, sizeof(https_host), "%s%s", (0 == strncmp(host, "https://", 8) ? "" : "https://"), host);
+ 
+-	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_USERAGENT, "Zabbix " ZABBIX_VERSION)) ||
+-		CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_URL, https_host)) ||
+-		CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_PORT, (long)port)) ||
+-		CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_NOBODY, 1L)) ||
+-		CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_SSL_VERIFYPEER, 0L)) ||
+-		CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_SSL_VERIFYHOST, 0L)) ||
+-		CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_TIMEOUT, (long)timeout)) ||
+-		CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = ZBX_CURLOPT_ACCEPT_ENCODING, "")))
++	if (CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = CURLOPT_USERAGENT), "Zabbix " ZABBIX_VERSION)) ||
++		CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = CURLOPT_URL), https_host)) ||
++		CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = CURLOPT_PORT), (long)port)) ||
++		CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = CURLOPT_NOBODY), 1L)) ||
++		CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = CURLOPT_SSL_VERIFYPEER), 0L)) ||
++		CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = CURLOPT_SSL_VERIFYHOST), 0L)) ||
++		CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = CURLOPT_TIMEOUT), (long)timeout)) ||
++		CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = ZBX_CURLOPT_ACCEPT_ENCODING), "")))
+ 	{
+ 		zabbix_log(LOG_LEVEL_DEBUG, "%s: could not set cURL option [%d]: %s",
+ 				__func__, (int)opt, curl_easy_strerror(err));
+@@ -193,7 +193,7 @@ static int	check_https(const char *host, unsigned short port, int timeout, int *
+ 
+ 	if (NULL != CONFIG_SOURCE_IP)
+ 	{
+-		if (CURLE_OK != (err = curl_easy_setopt(easyhandle, opt = CURLOPT_INTERFACE, CONFIG_SOURCE_IP)))
++		if (CURLE_OK != (err = curl_easy_setopt(easyhandle, (opt = CURLOPT_INTERFACE), CONFIG_SOURCE_IP)))
+ 		{
+ 			zabbix_log(LOG_LEVEL_DEBUG, "%s: could not set source interface option [%d]: %s",
+ 					__func__, (int)opt, curl_easy_strerror(err));
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
