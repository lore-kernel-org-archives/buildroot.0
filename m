Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AB2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 21:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E6BF4023F;
	Thu,  2 Nov 2023 21:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E6BF4023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-DIr5JxYq9D; Thu,  2 Nov 2023 21:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 797E7402E4;
	Thu,  2 Nov 2023 21:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797E7402E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5A41BF59C
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E28F54218F
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28F54218F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfLtkNUJJ28N for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 21:41:24 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 509B542107
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 21:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509B542107
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40853c639abso10454345e9.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 14:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698961281; x=1699566081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m7tGGKxR24kI+z/GFH+6z6FKVxJwXRudOTkPhUfFH6Q=;
 b=Uc3iJwuyFEA6hNWc5fLgIKTln3/PzwDONFGEg+7zJueuHGIB/tHcfOh2ZRjVivSPzx
 1gvBdPQYKoIqUg07h8Bl1ibq10Ahlz3hQQSRsXX1Odgk+sR//TimceOq2LmdKm3hwBfB
 8RuY/MHh2ny94261LIR8UFLHJtw150FH7fnr0Mb+3YihwpJD0GPHyvau+XyINMsqEIEy
 qwzDzPvJ2e+pRpt8UppG7hgvn9Is7OsUyCZkbAeYrneDfs7mhhvnUMA1e/IDCqFn5A4b
 1KkUnr1eDzU4wMD8ed00fCJD8G8xe5OrE1IhlWG7YUYbp22m5YRcH92DWdxnXpuitntP
 hsoQ==
X-Gm-Message-State: AOJu0Yy4Wiw8MimC4F9BHuLcpx/Y3ZOD7DT58raEyZMosR2e2Phcdj6/
 PVpxe+YDbpRvbT5PRQEd8d2VccSKpfw=
X-Google-Smtp-Source: AGHT+IF8vugDRQ+AKMqqcNV6J5/RT/CkahAKv5QqV+DTA2flyJYIjElyTycn+vxI59Z6XpnHQhM8wQ==
X-Received: by 2002:a05:600c:3d8c:b0:406:5308:cfeb with SMTP id
 bi12-20020a05600c3d8c00b004065308cfebmr16129687wmb.11.1698961281329; 
 Thu, 02 Nov 2023 14:41:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c30d300b004063c9f68f2sm362620wmn.26.2023.11.02.14.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 14:41:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 22:41:15 +0100
Message-ID: <20231102214115.210138-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698961281; x=1699566081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m7tGGKxR24kI+z/GFH+6z6FKVxJwXRudOTkPhUfFH6Q=;
 b=eshxpGhkEzmvYrnAy7jPBPV60Yp6ugBoujvCa7JtzbEeL+Ki56m5LtgvH5VuW+C4QV
 Eb1l6sHh/zKN6tMdvjDW9/fagG38GEqEm6uHvVlHGuZfy4qer3OH7rgr/9y8HI7mx8MM
 sCJvfrnGfwoJoHU1GUSJLO+oDJSVvaeZ1IgSQWu+aluAxWt+1L7byk8W0aQhvZJKo2Nj
 Ch4+u3z2qxB30hmWKL5PaLpQd9AeVL+3M16uA3YylXPBGfI+ac1KQDsM6ux+5GbWKTAV
 /zA4Km82V18MIKoffwvtJEnShiX6LbZNGLGW94STEi9H6RRXgAYeC/bzILx4dBrCkSbG
 6buA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eshxpGhk
Subject: [Buildroot] [PATCH 1/1] package/gzip: bump to version 1.13
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

Update hash of COPYING (http updated to https with
https://git.savannah.gnu.org/cgit/gzip.git/commit/?id=13dab4245e071c29ef8c36e0a2e0c3fb528b57f2)

https://lists.gnu.org/r/bug-gzip/2023-08/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gzip/gzip.hash | 6 +++---
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 80b86f4797..4d9d0c721b 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.13.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956  gzip-1.12.tar.xz
+sha256  7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057  gzip-1.13.tar.xz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 2092df363c..330321352c 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.12
+GZIP_VERSION = 1.13
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
