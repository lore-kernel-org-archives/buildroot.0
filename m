Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F43C77B7F
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 09:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48E2160F82;
	Mon, 23 Jun 2025 09:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RBNWz_2t3lw; Mon, 23 Jun 2025 09:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749F460EBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 749F460EBC;
	Mon, 23 Jun 2025 09:01:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94CA012C
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 09:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A8BD60EBC
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 09:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuhPwwaCQYzw for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 09:01:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 755B960B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 755B960B93
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 755B960B93
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 09:01:04 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ae04d3d63e6so497493966b.2
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 02:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750669262; x=1751274062;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CjgsWrciAPdnFsvVVVI+thSRbMrJC+obE2dDF9XPknk=;
 b=VvOUmGqP31vPOUwYmGX1Ytp4Folip8AAcGUEwmcK4IwkaDpV0mez7IazhwZUGDIvFR
 4gmyB2UcPCvRUKmqDexK6s+FMMfMGcFU20LBC8jltLBhLxF3OpQLI3H2ddSLcVLNe54r
 qqEkI+yKLWllQPS9EDNqnIIVOsAVLmIt+A4Xf7XgIvmx75egD1wBC90tKrHtvzmLl3zb
 doD2m/vWQf8218ufwwcbM0OSAQAIvimHg5+zfJJt0G8iEcRmBWsjteBe9FVp68g0YEhm
 DoKvDEGnyhBznys6LwzF7e8m26dFCnRNAk1asen7xUg86FEvM9fjdWPuOa8poSgDsBv0
 hAWw==
X-Gm-Message-State: AOJu0YzVa5AfLXCOmkFBUlABtgwBLCBMsFosT5CAPRekcEcDe1G+8d5H
 ad5sr+7vWc4YB8UsV+DjYI6UNw/kGnIQUjZZTeOeE1ndqc6oJ3Ox9UkK9naNr2gwtwmvvXjlswA
 KUhaR8a4DLMLyx4mSmhhcdGpveHK1+wO62agm
X-Gm-Gg: ASbGnct/ovnCXSkZcBXGADphhBzJqHzC7DJMjIivBDKB0UhuaAZb6Q5HgX+jvulfg3o
 CewQovZpBmRqFPUTtlskjuY/CsDSrm2SvM3E9phoNH0JjaVsDTsXxVsiCMRvxzVnFFMJNBZ2n1t
 3buMF3w7JJ+qrVQey1XLNLwUaiRtSMRqupq8SFO9A0rbKR
X-Google-Smtp-Source: AGHT+IGMRuv9gQ2jIBGKu4crt2YQP1+KzvKCZ9tI8ZZzbBGNGbiBJ1LKnGYv6zVOvrsibUZHD4Tor+//HUwYiGIdWW8=
X-Received: by 2002:a17:907:fd04:b0:ae0:66e8:9dd9 with SMTP id
 a640c23a62f3a-ae066e8d70bmr791113466b.8.1750669261734; Mon, 23 Jun 2025
 02:01:01 -0700 (PDT)
MIME-Version: 1.0
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Mon, 23 Jun 2025 11:00:51 +0200
X-Gm-Features: Ac12FXxY0klgDAITDL08zUv5wLBqq3-3gxt27ZmQqA3ZGgkCX8Ajd_U1Z0ZfegI
Message-ID: <CAGkXw1XQXKAxnjudTsiM4jcVcH0pYhzLD6bxg4H5VGDi1bt1tQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750669262; x=1751274062; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CjgsWrciAPdnFsvVVVI+thSRbMrJC+obE2dDF9XPknk=;
 b=WSdFclAnneWVBHJg5xBnVrFs+s28MPIs+/ugWLkexeJk9RBtnaHR0+Yk5CaTc1MrsR
 /kqE1V9Wo3Y7y3sipcu6drq1VZmkXD+fnUroJ0L09UYNCYvF3eYHPbRkvlaFcrsUOmvr
 +1LQ45+1teYR0VoCqPDq/zMrdIX4vroli8FB2rRskWaMjSl++IX6mS4+X1Em4sYS7JRu
 l7MI28+Ie2Dvx28pv4gXBTf2mos4zVSVRJxjRXKu/szjT/njdCamveIw6hBfjnmbr3s8
 MpQwj6U83BUkQacT6vmyRhJ080I/TNrZoYHz+GJ6OzSLUloJZlm6caUzWUaAqlyJ8Qix
 meyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WSdFclAn
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 3.2.1 (lts
 branch)
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

Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
 ...mic.h-may-need-compiler.h-on-ARMv8.2.patch | 36 -------------------
 package/haproxy/haproxy.hash                  |  4 +--
 package/haproxy/haproxy.mk                    |  4 +--
 3 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644
package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch

diff --git a/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
b/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
deleted file mode 100644
index b3b1f732ab..0000000000
--- a/package/haproxy/0001-BUILD-atomic-atomic.h-may-need-compiler.h-on-ARMv8.2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5ab3c61932af7619518169da744ba6346f060405 Mon Sep 17 00:00:00 2001
-From: Willy Tarreau <w@1wt.eu>
-Date: Thu, 8 Dec 2022 08:32:57 +0100
-Subject: [PATCH] BUILD: atomic: atomic.h may need compiler.h on ARMv8.2-a
-
-We get a build error in ncbuf.c when building for ARMv8.2-a because ncbuf
-has minimal includes and among them bug.h which includes atomic.h. Atomic.h
-may use "forceinline" without including compiler.h, hence the build error.
-It was verified that adding it doesn't inflate the total headers.
-
-Since all other C files include api.h which already covers this, there's
-no real need to bapkport this. The issue was already there in 2.3 though.
-
-Upstream: https://git.haproxy.org/?p=haproxy.git;a=commitdiff;h=5ab3c61932af7619518169da744ba6346f060405#patch1
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/haproxy/atomic.h |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/haproxy/atomic.h b/include/haproxy/atomic.h
-index f60be95..7e3c826 100644
---- a/include/haproxy/atomic.h
-+++ b/include/haproxy/atomic.h
-@@ -23,6 +23,8 @@
- #ifndef _HAPROXY_ATOMIC_H
- #define _HAPROXY_ATOMIC_H
-
-+#include <haproxy/compiler.h>
-+
- /* A few notes for the macros and functions here:
-  *  - this file is painful to edit, most operations exist in 3 variants,
-  *    no-thread, threads with gcc<4.7, threads with gcc>=4.7. Be careful when
---
-1.7.10.4
-
diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 42f340fa80..2ab8bcef47 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.22.tar.gz.sha256
-sha256  4c0797f450f997dc287d2c7aafa7a0e5b7a2d71593a2cd58e664e8f3aea614fa
 haproxy-2.6.22.tar.gz
+# From: http://www.haproxy.org/download/3.2/src/haproxy-3.2.1.tar.gz
+sha256  bb3f967a797c8851d08683ec43dfafe4ad7bf5ad86fa6b0721cad033ea9e5ae5
 haproxy-3.2.1.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28
 LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a
 doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 77195d966b..06d0c7bd26 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################

-HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
+HAPROXY_VERSION_MAJOR = 3.2
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).1
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
