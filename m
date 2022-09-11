Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53A3C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 20:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A4828458E;
	Sun, 11 Sep 2022 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A4828458E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdO0hfhqHff1; Sun, 11 Sep 2022 20:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85DE68458D;
	Sun, 11 Sep 2022 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85DE68458D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1911BF591
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 20:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3F0D424D3
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3F0D424D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rwnKCFJR0GpC for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 20:52:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2834042533
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2834042533
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 20:52:10 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so1484755wmk.1
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 13:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=i4afPxZ+rtpI6wWN7sJsoZzPlbce532eVe8zTgnA8a0=;
 b=Ec26mQO+fUoZJ9Yclk49GbKsx6yQ9i02HCPvmQ0hGvTJP5ddC5P2sssJo2VonlPg+4
 ST8AAe89n/hZALzVQPClAhFqr1kHZSIK1SZB/Tgv4p59hrNCqW7jjnN4uoHeCtkowUm6
 S+t6FTjc0YxIJAGL3qPiIn1hRN8rBuTxxfui+nTIf1/GXBZ80Cr4M2e08aqBpiOCHmdL
 MVgOvPnsq1u9OQinsdBQrM69ToXBOBONR30pqQE98MQrHaDHn9Ov1BvM1868z7ApxjpM
 PNwB9XC8098oJ+m3xsSWBIkS8j7WuROIIlSoPVbXKcJu80Aab1evM+dlrGh+GXpuT6bo
 12MQ==
X-Gm-Message-State: ACgBeo0sC/avq41q1WkFwus3qMIh3/zTGbtRDRbUdlEXY5rIyqXdAXr5
 W8/ErfL2j0b9oY2/+1Rrh+xc76ZCon8=
X-Google-Smtp-Source: AA6agR7VnD13XoH0kV3Gp/0MyhLFLrtzE+KNV/q8c4xnRyzCEPzQQNn5y0qeNB05HM8SuLhgbjbdtA==
X-Received: by 2002:a05:600c:a0b:b0:3ab:945:77c2 with SMTP id
 z11-20020a05600c0a0b00b003ab094577c2mr11964353wmp.201.1662929526715; 
 Sun, 11 Sep 2022 13:52:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b00228de58ae2bsm5575016wrq.12.2022.09.11.13.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 13:52:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 22:52:03 +0200
Message-Id: <20220911205203.5750-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=i4afPxZ+rtpI6wWN7sJsoZzPlbce532eVe8zTgnA8a0=;
 b=iQVvkjp15pL0CP8MOtPLLF5Zv890PrAsfcX+a9huj3IlhC26v+7VzIJBKT58JcUbeN
 NtPCQFXMve9Vna4efwlUILDMwevH+it5ocTdZHvzJdWc5SAnRNY0tF82E0+Y+Mjt+Ft6
 A5PXGJqZu5yfsGzrnHFKRbUvRlRgyL7ak96KFT+IQNKwIQVWO4VFQRDKn8fdA6eUsoq2
 gZKKt9xov1gKxPYIGx153OD5/oz8fTh70OfwFVTusnVB+hPOi93NQxwgDZAq6clSkTpL
 v8M45+T36eTg21gkKmUrTiQdKEpLt1VMQ9kG+K0TqMELKCIPurliC0SX3BU22kaG0kbD
 h41A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iQVvkjp1
Subject: [Buildroot] [PATCH 1/1] package/gensio: fix musl build
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

Fix the following musl build failure raised since bump to version 2.5.2
in commit 5bb747f0b783a0d3f1712350ca3277263045b299:

gensiotool.c:47:10: fatal error: sys/unistd.h: No such file or directory
   47 | #include <sys/unistd.h>
      |          ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/99a60831da94f94fdf798c1c30cc09f0e51416c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-tools-gensiot-Fix-build-with-musl.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch

diff --git a/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch b/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..7cda950c9e
--- /dev/null
+++ b/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
@@ -0,0 +1,29 @@
+From 64f8f754447572a6b7bed4038a9a29a12b448479 Mon Sep 17 00:00:00 2001
+From: Jan Luebbe <jlu@pengutronix.de>
+Date: Thu, 25 Aug 2022 12:19:16 +0200
+Subject: [PATCH] tools:gensiot: Fix build with musl
+
+According to POSIX getpid() is available in unistd.h, not sys/unistd.h.
+
+Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
+
+[Retrieved from:
+https://github.com/cminyard/gensio/commit/64f8f754447572a6b7bed4038a9a29a12b448479]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/gensiotool.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gensiotool.c b/tools/gensiotool.c
+index cac531bb..ab0bb958 100644
+--- a/tools/gensiotool.c
++++ b/tools/gensiotool.c
+@@ -44,7 +44,7 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <sys/types.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ #include <syslog.h>
+ #endif
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
