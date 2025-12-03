Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6611BD116F3
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 03:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAE824126E;
	Wed,  3 Dec 2025 03:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFh2kvOBAiy6; Wed,  3 Dec 2025 03:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA80341270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764733406;
	bh=xkqqbSloj4dZWlDgLn4NATySLcP5GMT0mhePrF10Cew=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kb0C2Y9lv+yNWNO1hp91lu8ExLE9+9bAiIUxGMIjsHSocVi2hGZNYBBKEwp+MZ9eQ
	 MZfdqjOLsFAXXblLmFG/W7/RY5wSlZ/WP8yiMLlB2CLXl7r8ALDyk0tj84jQEIxnJT
	 qh6jp3+6xefPst+myaWfRWdkYtWlW16OtJdS+SsIg09KuAJMqME5LkhppXhHJC1F87
	 zuJ/xkjwfdkTEXK9ABv8OImwfY9lBZq0fxn+mWWzLuMkpykI9g2bqLjIVr1ASvwgpQ
	 qYjYbnruf/5k409dHLgqziBiun01dsnNg0cu9XNamo//a2y10ebjmM2Zj1fe4EevOj
	 RYmr+tp3auU9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA80341270;
	Wed,  3 Dec 2025 03:43:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19C30D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 03:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BE7D400C1
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 03:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWrlrTGq-sgl for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 03:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DC5140079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC5140079
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DC5140079
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 03:43:22 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-bdcae553883so5265452a12.0
 for <buildroot@buildroot.org>; Tue, 02 Dec 2025 19:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764733402; x=1765338202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5EqnddnPxZUK/gCd+Ip2ilVD9KqUTCC16ygEoj7mls=;
 b=e715AeLxvEXuHzbikXjuG8Brgbtb3RHEl7FuJ4jB2a52pKKSX8LdhbfY21B+bt4DE3
 7d2F2Ebz9dGKRlPfWWiXsWpFv+gloWXIfgbDmiNpvKVNkdIxMQ8lg2DyGqkj512t+vFo
 Wkleez6QqQac5iKnNtt/neADpdUiiIbmpYXoKiLSGEf+lW+BKGFMIoT58ZKrqcn7LKYh
 NkAev2nY4xvI00yTxGVj5GA+M/ucuzIRwo4bP7cF8+ifjxoVbXNSXm4+T1GXj/J59BJK
 0CdMlZmKcx2ck+38iKFaklCnmzeCm8SSzA9ZvnQv+E1gEj3kHb26VaFrKxNryMdIbRx5
 iMvw==
X-Gm-Message-State: AOJu0Yxw9KQT1S0dPEBQBs2sbbSVZHd/4Y0X7qIe3Hqe+zEXCD/d8s+z
 /A13Ha7EgW6WyfydGb+7vVvxUP5JDXKRzXYkP8k2Ek2r2sObSUeNDaaAM1MlLA==
X-Gm-Gg: ASbGncvAvJ1eDpk2zZh/9gZ6vPfh1mmkhVKiyfoT+u6C51rJIg2uCye1E+5A74wSCjv
 OXAanvGr/ptvl3ncKoDNWGe7FPvTWXoza6iQuanoSXCjgCGOotJ+dGbVFN7wNVglMoUFDhHY/uz
 PslJUG3HLmaUAgeP9kG+2W7tPCXfzW7Alb2IEhnqdb8yZKtumlIEfkqmrSDZGd4ZP+N6+VpvuhX
 JdmQgRfRRjFkt7R0z4t1axB7rc6wKlXq/4Wr2D+hPpKXbJvdcj0e9StnP7rr/tZ1wAEvDM1CeFg
 5ThoQS3YmfafK7qeY9piIadnjoGnSTBHk95QNS/Eg3xeklCbuGgD6bYTuePtfRwWjlCd24XFehM
 qjo+Pe+6ynSR2H4yrs9VtnM/zZzP/rJfkqCITimvk+jkQgtc9FeajJdw8d1Himdy8MOyPbofbdP
 f3UhjRuNID49KsSZOvlZgcIro8sMGIQdA0XBDEMDZQ+13kVpzfru1W22PDvLSG5Ex4HZ1luxQxS
 okUA8IWJeFzMSKARCowwX1NuudBFw==
X-Google-Smtp-Source: AGHT+IG4ThIQDvreERuI+mxUBvgSdK3bERGAK/0iVv2CrCxqxA6kGy0VyHMA5nHEXyuWBjZx1a+ivg==
X-Received: by 2002:a05:7300:2142:b0:2a7:1863:b155 with SMTP id
 5a478bee46e88-2ab92e938eemr736428eec.31.1764733401895; 
 Tue, 02 Dec 2025 19:43:21 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a9655ceb04sm60004190eec.1.2025.12.02.19.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 19:43:21 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue,  2 Dec 2025 19:43:17 -0800
Message-Id: <20251203034317.48715-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764733402; x=1765338202; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A5EqnddnPxZUK/gCd+Ip2ilVD9KqUTCC16ygEoj7mls=;
 b=AXi54EAxOD2mc4FDGJU+LyjX47MJSC0So09SNn5igOSVlkRxvIKdHwpZf4ayQemLKj
 7NjVgxBhWwiE0EnNeF3BcMS5cXNBqmjf7Z5sLt50wH5FjGH+sD/0Vy1D46NN4O0rK/hj
 0yLiWIJhLkteI3mfk277A/Yhk8FSAf4oDvIauPP8HyvxpO3JyO6cnnr255fa4wXFyxjG
 KTdHGlBQ7rytN0aRseBiVu/M8B3bjm+orj2u/6UXTom+RHLHI8mz+MZ+wxLNlJjaQgcs
 JBN2IBrRmV8nN4QxvOYQrTxt6Lbqz2GBkMjzBQ7mwMzSaoGV2UOcPaehIfsOwqtfvKKf
 o4dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AXi54EAx
Subject: [Buildroot] [PATCH 1/1] package/iperf3: bump to version 3.20
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
Content-Type: multipart/mixed; boundary="===============2162987370977473811=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2162987370977473811==
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

Release notes:
https://github.com/esnet/iperf/releases/tag/3.20

Drop the upstreamed 001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 ...n-issue-with-uClibc-due-to-a-missing.patch | 51 -------------------
 package/iperf3/iperf3.hash                    |  4 +-
 package/iperf3/iperf3.mk                      |  2 +-
 3 files changed, 3 insertions(+), 54 deletions(-)
 delete mode 100644 package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch

diff --git a/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch b/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch
deleted file mode 100644
index cc2f4bd595..0000000000
--- a/package/iperf3/0001-Fix-a-compilation-issue-with-uClibc-due-to-a-missing.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From e5c4263c6b2c5b84a6edeb1cf3c95bddd73d4d7c Mon Sep 17 00:00:00 2001
-From: Kadambini Nema <kadambini.nema@gmail.com>
-Date: Sat, 17 May 2025 16:20:07 -0700
-Subject: [PATCH] Fix a compilation issue with uClibc due to a missing include
- file.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-------
-In file included from t_auth.c:35:
-iperf_api.h:395:77: error: unknown type name ‘va_list’
-  395 | void iperf_exit(struct iperf_test *test, int exit_code, const char *format, va_list argp) __attribute__ ((noreturn));
-	  |                                                                             ^~~~~~~
-iperf_api.h:33:1: note: ‘va_list’ is defined in header ‘<stdarg.h>’; did you forget to ‘#include <stdarg.h>’?
-   32 | #include <setjmp.h>
-  +++ |+#include <stdarg.h>
-   33 | #include <stdio.h>
------
-
-Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
-Upstream: https://github.com/esnet/iperf/pull/1888
----
- src/iperf_api.c | 1 -
- src/iperf_api.h | 1 +
- 2 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/iperf_api.c b/src/iperf_api.c
-index aeec91dd3..d4a06bec9 100644
---- a/src/iperf_api.c
-+++ b/src/iperf_api.c
-@@ -53,7 +53,6 @@
- #include <sys/stat.h>
- #include <sched.h>
- #include <setjmp.h>
--#include <stdarg.h>
- #include <math.h>
- 
- #if defined(HAVE_CPUSET_SETAFFINITY)
-diff --git a/src/iperf_api.h b/src/iperf_api.h
-index 03d273e8c..cd82e6f9b 100644
---- a/src/iperf_api.h
-+++ b/src/iperf_api.h
-@@ -30,6 +30,7 @@
- #include <sys/socket.h>
- #include <sys/time.h>
- #include <setjmp.h>
-+#include <stdarg.h>
- #include <stdio.h>
- #include <stdint.h>
- #ifdef __cplusplus
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 3d9ff0cf5d..ee60d717e6 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.19.1.tar.gz.sha256
-sha256  dc63f89ec581ea99f8b558d8eb35109de06383010db5a1906c208a562ba0c270  iperf-3.19.1.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.20.tar.gz.sha256
+sha256  3acc572d1ecca4e0b20359c7bf0132ddc80d982efeee20c86f6726a9a6094388  iperf-3.20.tar.gz
 # Locally computed
 sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index df6b32abc1..bb8eece6b2 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.19.1
+IPERF3_VERSION = 3.20
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.25.1


--===============2162987370977473811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2162987370977473811==--
