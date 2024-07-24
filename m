Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15099C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 11:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F748145C;
	Wed, 24 Jul 2024 11:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AMqoVGeVEDK; Wed, 24 Jul 2024 11:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE6B081453
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE6B081453;
	Wed, 24 Jul 2024 11:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 961E51BF284
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 11:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F941405C9
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 11:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OrJLSSBPTpW for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 11:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03C3B403CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C3B403CE
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03C3B403CE
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 11:01:34 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so58015695e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 04:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721818892; x=1722423692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vODp4iavzB6OmVkm69ZUwVWgu5IfDx9+Cf0DLn07urU=;
 b=RNepy0wjSTRKq1VFxar2/3UbaLlfOKeVL6fhjpxjpoTHew1ixwmGi2dnXJLAQflRSi
 ixi6+V8k/JKd0VOCRdEwd3e6nq4nHlbKsOSEsWDTJoT39iu4TX/azdOVD2Q9+yaSsVTN
 +bo+u8E6FOlWZWSUr4iUZSa1VSV/B7F8RVkmdvqmgs269cYcyAaprkkbKPLi8c7Nrw16
 JfPIskBN4gALVAG7F4JHPllI9MGryepafR04EnC7amOapRvEQSC5na8mTh9FcL35hI1l
 rH0mNeV4s6taDErXeodKeBZxmj0WiqN6rKo17jT79dJfgSVOtZwoaBcxmy6gKUXR31aD
 qk6w==
X-Gm-Message-State: AOJu0YyTIQFI6h3pd5nFUhsD+KERjKrm4watG150jI0Cpj2XHyMgdJHv
 Petd9pr3QmOlbxhdDCJfeAJ+YP6/YTNlSDdpq24qxkdQ8a/WCqCI5/2XzA==
X-Google-Smtp-Source: AGHT+IHkzSl2XMVAzECi2j3wtuwhp/PzgbTowGvDw6iG7SwHycznCvGyR3TNh7RQ2IERfiBLv4L2lw==
X-Received: by 2002:a05:600c:198b:b0:427:d735:193d with SMTP id
 5b1f17b1804b1-427f7ade9fdmr20190135e9.31.1721818888327; 
 Wed, 24 Jul 2024 04:01:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f937353dsm24632175e9.17.2024.07.24.04.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 04:01:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 13:01:26 +0200
Message-ID: <20240724110126.2133196-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721818892; x=1722423692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vODp4iavzB6OmVkm69ZUwVWgu5IfDx9+Cf0DLn07urU=;
 b=TrSgs0+117wb7uJrIHYUAalO22WzFJNT3k0/uzgI+RmIJMDK8gi4Wu2zEvchqgR76X
 ERuERZWT7PTWB3CEHm7An6e7Iv4yvcIIAxUY8Dr0elGUGDU6ZFHb6ey9DJ3qtPt5+y+O
 qKl6kpB9dTY2/4Untf24uxdZNFoY7AlMqf3q2fSU880jqCFTS1mhcFIgYMLo+n3TBaSR
 EjIK3GdXeBpoFPrKcVlDR5lZI6hhbUpjEAgOZ/Gyr+5y0nHia/OGb5CbucYvH47u16vh
 BRj7yWW2xGqzOMV4nTShEf3ZKkr5bEM25xXnVzK4bcb2jYO+sVaoe58Ii0S8vQMPOunN
 NIZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TrSgs0+1
Subject: [Buildroot] [PATCH 1/1] package/can-utils: fix build with gcc >= 14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 14:

j1939acd.c: In function 'main':
j1939acd.c:489:38: error: passing argument 1 of 'asprintf' from incompatible pointer type [-Wincompatible-pointer-types]
  489 |                         if (asprintf(&program_invocation_name, "%s.%s",
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                      |
      |                                      const char **

Fixes:
 - http://autobuild.buildroot.org/results/1e2a533a936624249cd79d34983c889c3c4c2e3b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...y-poption-prefix-to-use-when-logging.patch | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch

diff --git a/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch b/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch
new file mode 100644
index 0000000000..36c96d59e4
--- /dev/null
+++ b/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch
@@ -0,0 +1,79 @@
+From d337863d9189501dbbb15467cc3dcba85946a2a3 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 22 Jul 2024 16:12:04 +0200
+Subject: [PATCH] j1939acd: remove legacy '-p' option (prefix to use when
+ logging)
+
+- remove legacy '-p' option (prefix to use when logging), fixes uclibc
+  compile
+
+Fixes:
+
+  j1939acd.c: In function 'main':
+  j1939acd.c:489:38: error: passing argument 1 of 'asprintf' from incompatible pointer type [-Wincompatible-pointer-types]
+    489 |                         if (asprintf(&program_invocation_name, "%s.%s",
+        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
+        |                                      |
+        |                                      const char **
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Upstream: https://github.com/linux-can/can-utils/commit/d337863d9189501dbbb15467cc3dcba85946a2a3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ j1939acd.c | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/j1939acd.c b/j1939acd.c
+index 44bb826c..ae4e58ac 100644
+--- a/j1939acd.c
++++ b/j1939acd.c
+@@ -38,7 +38,6 @@ static const char help_msg[] =
+ 	"			e.g. 80,50-100,200-210 (defaults to 0-253)" "\n"
+ 	"  -c, --cache=FILE	Cache file to save/restore the source address" "\n"
+ 	"  -a, --address=ADDRESS	Start with Source Address ADDRESS" "\n"
+-	"  -p, --prefix=STR	Prefix to use when logging" "\n"
+ 	"\n"
+ 	"NAME is the 64bit nodename" "\n"
+ 	"\n"
+@@ -54,14 +53,13 @@ static struct option long_opts[] = {
+ 	{ "range", required_argument, NULL, 'r', },
+ 	{ "cache", required_argument, NULL, 'c', },
+ 	{ "address", required_argument, NULL, 'a', },
+-	{ "prefix", required_argument, NULL, 'p', },
+ 	{ },
+ };
+ #else
+ #define getopt_long(argc, argv, optstring, longopts, longindex) \
+ 	getopt((argc), (argv), (optstring))
+ #endif
+-static const char optstring[] = "vr:c:a:p:?";
++static const char optstring[] = "vr:c:a:?";
+ 
+ /* byte swap functions */
+ static inline int host_is_little_endian(void)
+@@ -466,9 +464,6 @@ int main(int argc, char *argv[])
+ 	struct sockaddr_can saddr;
+ 	uint64_t cmd_name;
+ 
+-#ifdef _GNU_SOURCE
+-	program_invocation_name = program_invocation_short_name;
+-#endif
+ 	/* argument parsing */
+ 	while ((opt = getopt_long(argc, argv, optstring, long_opts, NULL)) != -1)
+ 		switch (opt) {
+@@ -484,15 +479,6 @@ int main(int argc, char *argv[])
+ 		case 'a':
+ 			s.current_sa = strtoul(optarg, 0, 0);
+ 			break;
+-		case 'p':
+-#ifdef _GNU_SOURCE
+-			if (asprintf(&program_invocation_name, "%s.%s",
+-				     program_invocation_short_name, optarg) < 0)
+-				err(1, "asprintf(program invocation name)");
+-#else
+-			err(0, "compile with -D_GNU_SOURCE to use -p");
+-#endif
+-			break;
+ 		default:
+ 			fputs(help_msg, stderr);
+ 			exit(1);
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
