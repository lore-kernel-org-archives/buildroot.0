Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833CEC07E9D
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 08:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D26864102D;
	Thu, 29 Sep 2022 08:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D26864102D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmDl0zjbDKFp; Thu, 29 Sep 2022 08:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4F5F41048;
	Thu, 29 Sep 2022 08:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F5F41048
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B6931BF2FA
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 08:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D3441A08
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 08:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D3441A08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4oXWccUEb9M for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 08:30:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E4E419F8
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40E4E419F8
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 08:30:08 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id v128so359219ioe.12
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 01:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ARtUVi12BDmxZjRy1sIFvb1iruhjwlSRhou4yVXTEuA=;
 b=6uO0iM+IoGpco0h/FnP/QYj6dbBnrfldMfZW9JU2cdkdDAGJv4ESnk1pSdwFmFeu2Q
 Q0wtgRgaRSPMXsrLnhBYQVThMD3F8VdzIIGFetqYudTsgHDe40mz1sa0XfaCC+qPV6th
 67UbI96sVw4tVTeA5AyMMr0+Y9u/XsnGiwQVsh4lk/0kCYVaEep0Jsr3dRcYb4GYd2C4
 4+4Lc3TtKiSc5lHL/6K1q9l3cRbGvy0OvhkfzOocQQvCN+EYPZwCzdlfYO1q9L6T9WCl
 mCtYbV8IpmnQifaIVXW5P5oYDykvpzDD/gesbB4q2TvMON8XfknPzaBfw02GgpoQ+0hT
 0Hwg==
X-Gm-Message-State: ACrzQf1tQkV0CdlMe12Gmn5dM5cCwrOGMGVAi9eIOcx1XyFuEmhmh4i3
 UFricz8rCnYzyg2UwqtNGk0z++U7t081/g==
X-Google-Smtp-Source: AMsMyM4i2jUcut9L0tdjSMdpJfVlnfhMXs3JR48LuRQrvBKmc0JDtGatibQic3GDj0Xlh0JQp/X3bg==
X-Received: by 2002:a05:6638:2169:b0:35b:333b:fdeb with SMTP id
 p9-20020a056638216900b0035b333bfdebmr1101986jak.25.1664440206931; 
 Thu, 29 Sep 2022 01:30:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m10-20020a923f0a000000b002e97becb248sm2483449ila.29.2022.09.29.01.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:30:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 02:30:04 -0600
Message-Id: <20220929083004.2387969-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ARtUVi12BDmxZjRy1sIFvb1iruhjwlSRhou4yVXTEuA=;
 b=JmRmrmhkhKSl6aV3NqglPu+Y//gPd9k0u4zJH2e7L/cDZiXGLAfpv8hx77jqZgLHNx
 wOgPGOW3jDt0vF8bfAZY5MPi2vg8iBYLeHNPRxuxelLumFiEfNLqAy0nyTjcS5P5cCbk
 gle4z+KwGjcyEz+jIUHmBpQeOYxlEKxiIubTt2jrYbz+hZh6Kx3BtG1X6ZQyWw/WiIAG
 1Ms3CxA0L/IRMnFkilpmO+ELb5QRyvlflOKPCL6naiAbMJXd6MESKsNGLFKRw35s3wxa
 LAxWTLF3aoAwcwp6x9QxvozdBYljXNqTP+dgYBgOY13Bj7+fdswz74p3PJydm8VAQ13w
 4UWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JmRmrmhk
Subject: [Buildroot] [PATCH 1/1] package/gensio: bump to version 2.5.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...01-tools-gensiot-Fix-build-with-musl.patch | 29 -------------------
 package/gensio/gensio.hash                    |  6 ++--
 package/gensio/gensio.mk                      |  2 +-
 3 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch

diff --git a/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch b/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
deleted file mode 100644
index 7cda950c9e..0000000000
--- a/package/gensio/0001-tools-gensiot-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 64f8f754447572a6b7bed4038a9a29a12b448479 Mon Sep 17 00:00:00 2001
-From: Jan Luebbe <jlu@pengutronix.de>
-Date: Thu, 25 Aug 2022 12:19:16 +0200
-Subject: [PATCH] tools:gensiot: Fix build with musl
-
-According to POSIX getpid() is available in unistd.h, not sys/unistd.h.
-
-Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
-
-[Retrieved from:
-https://github.com/cminyard/gensio/commit/64f8f754447572a6b7bed4038a9a29a12b448479]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/gensiotool.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/gensiotool.c b/tools/gensiotool.c
-index cac531bb..ab0bb958 100644
---- a/tools/gensiotool.c
-+++ b/tools/gensiotool.c
-@@ -44,7 +44,7 @@
- #include <signal.h>
- #include <errno.h>
- #include <sys/types.h>
--#include <sys/unistd.h>
-+#include <unistd.h>
- #include <syslog.h>
- #endif
- 
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index a0db4bc516..84af3fdab1 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  60f90f62180922e2c7550877c4bb950c  gensio-2.5.2.tar.gz
-sha1  b6c2ec39b51a56f5d28e88a59122f4c65ff844fa  gensio-2.5.2.tar.gz
+md5  c8d65e1809ed5cd1138fa309e3ab0e94  gensio-2.5.5.tar.gz
+sha1  076fc8324dedb658972a88c738131a409968e2ba  gensio-2.5.5.tar.gz
 # Locally computed:
-sha256  f7bc3d2ba9da73489dd3227a21ddd2f44a18c443185ce2b1a08ec564da06e6d1  gensio-2.5.2.tar.gz
+sha256  63c5fff536efd080fb7bc7fa084331c19fc64abd42b7f2bec86bd77b4fd10840  gensio-2.5.5.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index f1cc00bf32..5538f97b19 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.5.2
+GENSIO_VERSION = 2.5.5
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
