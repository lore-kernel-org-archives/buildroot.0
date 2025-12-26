Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4144DE8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 066CA4075C;
	Fri, 26 Dec 2025 18:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tq3hoLakWD44; Fri, 26 Dec 2025 18:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E68EF40711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766772743;
	bh=Da+oP3goo5rjbD8EAcwwxXjvHGC9yV5VP+vktjFL18o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cMXO+X14JceZNZjbgB5Bo3mpx8ia+pB6hC7b6VjLzeCkqsqlRMUI+3sTHJC404oM0
	 0BFCaxO3c8+DSzHJwx/foCzNbRaKRKyWO33Ax2wHTVQtfXXX7Vh8pdQduIeLJAgrbG
	 AC26vng00XD4MHl7uRRQQ2ktiSlizfs55Iar0P57sxq21IK5vUNZNpvhuxapxdmd3y
	 Xasfhm/5kk8hAjHlL5SP66lqiHBs97aJZoOKWJzSiBzeqPwxqdqJPCYElYtK6EC+MC
	 /i+uDrDR9TEDP1NgsJcY0XXSYXZRnp9qP9gjD1X7LKMbYZ7WMdZN3KICs0nx2+hN9t
	 HYxCgRkWFNS0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E68EF40711;
	Fri, 26 Dec 2025 18:12:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40637EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E33D813AA
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8H8nx-a-leb for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:12:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 098CE813A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098CE813A6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 098CE813A6
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:12:20 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64b4f730a02so12242646a12.0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766772739; x=1767377539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBbSJ2bvp0WqjR9+pSMCsRJJUGzbN1pXkYx7gnvJSWM=;
 b=Gmgar5Eg7r7/LoyFFgeW8amDh+g3NmH/lZu95a6PIFcsrd4u09Qt9EiOaKdHzg2Pj4
 smEprxbNQqh9AjL8JAY54dSM0w0NDJf7YhWjW2ju7A1jSokjlhJL2BQUEKisJ1GmGVJC
 22O5NMCU+Ns7EiBUsphrAuuGtxPOIK4Q1unk87kVB3OqyNmlh7xHK8Dpcfigi2hDESpV
 6gQTk9adnUNwy9bx0pvtCsiRz9Q18WFS2XTXmFrYZ6WbV82VMX/7zxD8z+XxRZasjfZQ
 N13qiloRpDn24btB8McqV7HI3/dRtinKzeTOUJNP1QTGAVQ+ErB65KaQapaFE0MzaHwR
 k0tA==
X-Gm-Message-State: AOJu0YwdljyTaeSQB4+ZoSZpbOi7TG0vdYLnLBCorBUSKI+egiOTIA7M
 M2g26mo7x6TmMjYwc65oCebzscyxL3zZB5X7lHhPcyO6QanspzdCsvWs9Chxjwm9cUhX4IPhCMF
 vXPc7
X-Gm-Gg: AY/fxX4rtjge4uzAtLr7ZsTRfF4Hxxv8pPsq3wiJbvPjYidBtEvqmJdGrdaatdu6nMr
 Ke0ogT57mq4CqozORlqWQ6NdhYDn3kcLSX7r6DVf9FJ/ZkU+Hw09TyRfqGtGL4OM6wA2aJYWSTC
 lPgmE1VkIUmJJlS8GE3J7+jv58T5ej+1XU/QV2N/NrYMPCBlhe8WaAnZz5eDTUoLKu6vfZNHq8D
 So3tFvCzTrFYO6/IeUQeNTXLw7InnxsCwaJrC0TTxb/d6OL2VqXbmj/BP+vUC8rewpNdm+G5ISd
 dzsymN+DfSeTF+1lKZlxNY9ID5PxeZbu/N4ddV05fdMfbriSqk1sXtF1w36iwqbxJp508ND39bn
 YXhvhlEkoQmdYOPlj/uedNnYraxlv4mfL9WVKOwZBWGrtaYL2bvzOQLLQFWzjiqr4hhhWV8pyH+
 /v67fR4bjbOcMwUL8bk8wthnXtMNX5GhXH7hCHVBnyG+pjC7XoPrzBkXpg/pY4G73xKImobc6u1
 a2BewtjQt38V3MsvUp9/BTLx3y9To4jPmLeQ4yi80hfynBAYy/tGnF3C7tND9pEgAGNkXt6cAoN
 NLsSpDjoLXI=
X-Google-Smtp-Source: AGHT+IEZMIgJ85ZUhaFubLNeFd+7j1mXbFfVkZZ2TP6IpTf7BrcE3iRS8M+MfrQG7YvlnbkexVgAmA==
X-Received: by 2002:a05:6402:3591:b0:64d:ab6b:17e0 with SMTP id
 4fb4d7f45d1cf-64dab6b199dmr10413034a12.27.1766772738766; 
 Fri, 26 Dec 2025 10:12:18 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-45-45-148.retail.telecomitalia.it. [79.45.45.148])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b916adc61sm23880970a12.31.2025.12.26.10.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:12:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Dec 2025 19:12:15 +0100
Message-ID: <20251226181215.6817-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1766772739; x=1767377539;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uBbSJ2bvp0WqjR9+pSMCsRJJUGzbN1pXkYx7gnvJSWM=;
 b=fqjEGP0Ql2nqu/jze7k7ujRb+soHtMS1mbr1n2ZPgSOEZchqBc2Cxzzsyu6qz33H6R
 C2bjmnpfOs1+F8tWXCnnZEzPT0IHfMnOaOYSQuwGmnHM88IErOky983TaAON30JNCcNX
 Gbt/vCHu9qyrrM1m9SuFsignusGbYuLiQ1aAw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fqjEGP0Q
Subject: [Buildroot] [PATCH 1/1] package/libbsd: fix build with uclibc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building the package with uClibc raises the following error:

  Configure: error: unknown ABI selection for time_macros

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../libbsd/0001-build-add-uClibc-case.patch   | 31 +++++++++++++++++++
 package/libbsd/libbsd.mk                      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 package/libbsd/0001-build-add-uClibc-case.patch

diff --git a/package/libbsd/0001-build-add-uClibc-case.patch b/package/libbsd/0001-build-add-uClibc-case.patch
new file mode 100644
index 000000000000..e826c8e5662f
--- /dev/null
+++ b/package/libbsd/0001-build-add-uClibc-case.patch
@@ -0,0 +1,31 @@
+From da488ba5efe20b115e030c9212403358ff313d0a Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Fri, 19 Dec 2025 12:08:39 +0100
+Subject: [PATCH] build: add uClibc case
+
+Building the package in Buildroot with uClibc raises the following error:
+
+Configure: error: unknown ABI selection for time_macros
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/32
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2a15d720f9db..55cbb2d7837a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -148,7 +148,7 @@ AS_CASE([$host_os],
+     abi_vis=yes
+     abi_wcsl=yes
+   ],
+-  [*-musl*], [
++  [*-musl* | *-uclibc*], [
+     api_time_macros=no
+ 
+     abi_accmode=yes
+-- 
+2.43.0
+
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 557b49fca6ff..4cc207618820 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -11,6 +11,7 @@ LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-5-Clause, \
 		MIT, ISC, Beerware
 LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_CPE_ID_VENDOR = freedesktop
+LIBBSD_AUTORECONF = YES
 LIBBSD_INSTALL_STAGING = YES
 LIBBSD_DEPENDENCIES = libmd
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
