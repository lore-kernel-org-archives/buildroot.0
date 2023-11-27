Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30087C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 21:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADA38198A;
	Mon, 27 Nov 2023 21:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BADA38198A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3KAsuvS7fCnU; Mon, 27 Nov 2023 21:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C7288188A;
	Mon, 27 Nov 2023 21:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C7288188A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB411BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5713B4097A
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5713B4097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fiXz0RPNg1T7 for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 21:26:04 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15DDE40968
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 21:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15DDE40968
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32fd7fc9f19so2955692f8f.2
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 13:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701120361; x=1701725161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VSNrIp+AkU2raAFw3DvHPjFMO+zr7yyEvP4wCxAGUj8=;
 b=VGjFStE5qJSsZnVbciwO3Z0+lgglwnVSnTCFalsTEAGXc/g1/AkMWReMwC+VDxZkcP
 6iY2Ns3nTM7SebiTmtQ4B8hrD3yT6+EnPZqb0koQZUu3zkISlPMpdRa13aLngLSWStJ/
 sen3FCEye5xNjeEcluKORkq/jdYzHsUR2Tg+6iCFjio5L8WT5BNyAH8wHw4XaqvWPOyO
 /u92gSzvXIN+9f+w5627K6GAm6NtyDBcAw94f0z8MZdh/yScOf6OELk6llzQnF1wq2k1
 2uPEE/p+63SGzFJsv3i7cuY6sSqt3f/SjR0XAJi/juFVrMZXgc7LDClNqOQ1WR4NbIOy
 WFyg==
X-Gm-Message-State: AOJu0YwgdKp8PQ0t6FWIHmBQmIBHz0PabLyfnn07tEj8bfaFqGThzz9L
 wSd/vdqUInwL8b2sCxyyIOw/+ShghHw=
X-Google-Smtp-Source: AGHT+IHzE8KMZaVcKiMBWrDOOfhfrxK5pHohlbL/NRz6ZlHJYroltq6QSRAUFGrarUCBZU/v5VOsHQ==
X-Received: by 2002:a5d:67c8:0:b0:31a:ed75:75df with SMTP id
 n8-20020a5d67c8000000b0031aed7575dfmr9821566wrw.15.1701120360935; 
 Mon, 27 Nov 2023 13:26:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c468400b003fc0505be19sm15369218wmo.37.2023.11.27.13.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 13:26:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 22:25:58 +0100
Message-ID: <20231127212558.1058376-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701120361; x=1701725161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VSNrIp+AkU2raAFw3DvHPjFMO+zr7yyEvP4wCxAGUj8=;
 b=ZF5tYGA79cG9dnrHZA6updcyXJrGVqpE7S7yM38AnfqFRl8VH77OS+qAQeLeBLCV5f
 238bTpUGBgdBsacdBPpME/swNai5Zxgj+5QGe89jr5GRfqiGv/SwrHglVBpccsw9lIXa
 /NHFnsLoYxgFHU0ZJHa2ua3lFLxa99kSULQXCfcWNz1FvL1ITZ8UMEXxoKEG/M4v1EIS
 FQhwYT5XIzOe4uN+prPyuD8t057/JBAO7qLaXcbTa0MV+qN6mrLf/wCDamtbrCBdTfNN
 Q5WUxEpOq84xkz3oVnO5I2Kys1DBUKb6F4KE0uI9Etk1+Fm9PQtj0rG8/AZkfXFTzSmQ
 c6kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZF5tYGA7
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: security bump to
 version 1.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-45897: exfatprogs before 1.2.2 allows out-of-bounds memory
access, such as in read_file_dentry_set.

https://github.com/exfatprogs/exfatprogs/blob/1.2.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfatprogs/exfatprogs.hash | 4 ++--
 package/exfatprogs/exfatprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 49135b1da7..9f3100db7f 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.0/exfatprogs-1.2.0.tar.xz.sha256
-sha256  56d9a49465deafc367d428afc71c8098705a30ee19a3cdf3c5320650b8880742  exfatprogs-1.2.0.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.2/exfatprogs-1.2.2.tar.xz.sha256
+sha256  61d517231f8ec177eeb5955fd6edb89748d3f88ba412c48bcb32741b430e359a  exfatprogs-1.2.2.tar.xz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index fcc9ff0788..40d9072571 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.2.0
+EXFATPROGS_VERSION = 1.2.2
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
