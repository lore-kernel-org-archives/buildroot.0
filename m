Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0A0C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 21:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D2360A87;
	Sat, 30 Dec 2023 21:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D2360A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdcF2rLLxdWQ; Sat, 30 Dec 2023 21:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444A760810;
	Sat, 30 Dec 2023 21:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444A760810
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5F61BF487
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E774C813F3
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 21:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E774C813F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01XjQOrqgbsR for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 21:09:20 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C28D6812E6
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 21:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C28D6812E6
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so102397025e9.3
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 13:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703970557; x=1704575357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=frQ8isHKcEs7jBk61/LZyVoX8bgbvkPgCDycWQi0+x4=;
 b=McpQESjFfkdNORuabD8Ipyh1EkhEyx21y5uljKSXC+ppTdSv8b1z3vKXAY5RQJfdP0
 wViP13yE95ijNZH1CuVQ6zhL2v47jh93DJUcXYFXetfMFXEB07TbzvFpLZfZzu9RiGsB
 g+jjsswboLx7m6MLb34csO9rB/DAjlu4E8aD/0VXppFLjn0reqQGHUvpcWHvw1QW9Rg5
 Lv9zG8sGJZHPAowNvUmNiPInSNRguM0C6lIeU7YERn7gprsN1vb6HMY7C+hw6Tzmf9KN
 eHq1ovEWTgjuzhQu726MpXwBoh1Se8HWiTmfupEo872XYdj/DSax/Qi2fWToFnpEF6xw
 nbuA==
X-Gm-Message-State: AOJu0YxU0Nc8EtO9FyKXEdE6/EjcToXqzvZ0fSp+fQIbgzKO22ca1jxI
 sqcMyIifR/5QG8ZgvOg/qzSWBMAg3Yk=
X-Google-Smtp-Source: AGHT+IFpafC7uXgzClQ1Fslwl2eyZVJVehhxuM4Q0fpaen7ZmbOKr4ghrWlYAitMhW/9/Wsn0eOSYA==
X-Received: by 2002:a05:600c:1f8e:b0:40d:6b08:e8cb with SMTP id
 je14-20020a05600c1f8e00b0040d6b08e8cbmr2229942wmb.78.1703970556947; 
 Sat, 30 Dec 2023 13:09:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j10-20020adff00a000000b003365fc41bcasm22172493wro.51.2023.12.30.13.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 13:09:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 22:09:13 +0100
Message-ID: <20231230210913.1279427-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703970557; x=1704575357; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=frQ8isHKcEs7jBk61/LZyVoX8bgbvkPgCDycWQi0+x4=;
 b=eSV1jLTPUBqBlGQ5KpFL5/JFNan8xjSawgiStaCw+Ev11G49zqsksrZXRmK/cqbPUN
 qZ8OdsIBHrWHZ86AzL3fHG3e+wcxj7/319mAZ3fDaoa55yJ0NET6et9ETvv08usCVJDt
 qfER+z6quPznHXVbV2isEp43K72+95N6LBgLd5fXrwuLZICnjl8YFFZUlVZeRquPIZL8
 g9+9AXXPu/1d2qnS6VmQsueC/8/k4rBKTbThVXswQ1bfNzUoXwjAUykgpIP+GCreWjnm
 t6NV05P49geFzqK7El9JspAiLBCn5dygUUwN/W1ehe/bgq7eDL2Tsae97suHm9t/gswg
 4vrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eSV1jLTP
Subject: [Buildroot] [PATCH 1/1] package/log4cpp: bump to version 1.1.4
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
Cc: Damien Lanson <damien@kal-host.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

configure script has been fixed and so autoreconf can be dropped

https://log4cpp.sourceforge.net/#releases

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cpp/log4cpp.hash | 6 +++---
 package/log4cpp/log4cpp.mk   | 5 +----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/log4cpp/log4cpp.hash b/package/log4cpp/log4cpp.hash
index f4084c8112..20b5ade32d 100644
--- a/package/log4cpp/log4cpp.hash
+++ b/package/log4cpp/log4cpp.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/log4cpp/files/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/
-md5  b9e2cee932da987212f2c74b767b4d8b  log4cpp-1.1.3.tar.gz
-sha1  74f0fea7931dc1bc4e5cd34a6318cd2a51322041  log4cpp-1.1.3.tar.gz
+md5  d56ef8240014528c354da5b7e93015ca  log4cpp-1.1.4.tar.gz
+sha1  b32e6ec981a5d75864e1097525e1f502cc242d17  log4cpp-1.1.4.tar.gz
 # Locally computed
-sha256  2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d  log4cpp-1.1.3.tar.gz
+sha256  696113659e426540625274a8b251052cc04306d8ee5c42a0c7639f39ca90c9d6  log4cpp-1.1.4.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  log4cpp/COPYING
diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index 8664a54385..53c97e554d 100644
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LOG4CPP_VERSION_MAJOR = 1.1
-LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).3
+LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).4
 LOG4CPP_SITE = http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-$(LOG4CPP_VERSION_MAJOR)
 LOG4CPP_SUBDIR = log4cpp
 # The "or later" is indicated in the HTML documentation
@@ -13,9 +13,6 @@ LOG4CPP_LICENSE = LGPL-2.1+
 LOG4CPP_LICENSE_FILES = log4cpp/COPYING
 LOG4CPP_INSTALL_STAGING = YES
 LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no
-# needed to fix broken configure script
-LOG4CPP_AUTORECONF = YES
-LOG4CPP_AUTORECONF_OPTS = -I m4
 
 # The default <pkg>_CONFIG_SCRIPTS handling does not apply
 define LOG4CPP_STAGING_CONFIG_SCRIPT_FIXUP
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
