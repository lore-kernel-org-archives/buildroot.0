Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA40BC27C75
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D09A400F9;
	Wed, 12 Jun 2024 09:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzJuJvwbSARP; Wed, 12 Jun 2024 09:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D74DA402E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D74DA402E5;
	Wed, 12 Jun 2024 09:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEB791BF3A9
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 09:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8B6E81EDD
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 09:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUqQm63j0EWD for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 09:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8373C81EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8373C81EDB
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8373C81EDB
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 09:42:57 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so800914666b.2
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 02:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718185375; x=1718790175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cvr5cuFDNRqPLLGf/sDyvbHZ3Is009XywII6MYTbXBE=;
 b=TBcQM/0m8Bomrxk1HOFRXDO9Y+INZpAzFtjMbQ3sGFyZsSU0Atl2giAk+W/CV0IqZo
 GS7gWaZq3ODoohupjHccF+xZRRaP+tykjmhoPh6ZJQX9Pp0S8rByAu9xdhsstwt481DN
 EgaGa6zvfba9WfN3Rnq+OtFKx4b2m/fmOcOqq2CN3l3llQZHaRllsQnbUoQA7lKmcIjO
 rvBUMQQDEqI8yOg5/Id1b5Kb1yD4Q9t3Jasqy7nSWM7U0vrRXffubuwLHJ1qGLXFUwkI
 pVqvjDnrPUSARlhaJoPwsQZMnPDBJuJK6C6O3famFNFfZ7cx1w14ZAQcsc/EBpNrt3v+
 38Sg==
X-Gm-Message-State: AOJu0YzOq2e/Yb3O5zELChHH26l/lkyaOzXA82ZwTELkTOt0dtV3mA+7
 HtfRHi4jBo7Y3rguQi9+ziTNq03ItchQTyXqzbkNkCmGeqFRI0gb0U9yb3m6El9idwQPrchTYZe
 y
X-Google-Smtp-Source: AGHT+IGkPp/ZMCNIa92dsbgHpjVX8xoNpeQJkPjUHk1/OQ1uS/KelbP7KFM48hEboaUxsJ9iDOeBpA==
X-Received: by 2002:a17:906:f8d3:b0:a6f:4aa4:c7a8 with SMTP id
 a640c23a62f3a-a6f4aa4c87cmr54601666b.27.1718185375219; 
 Wed, 12 Jun 2024 02:42:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.113])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f2d4138ccsm277687666b.220.2024.06.12.02.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 02:42:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 11:42:51 +0200
Message-ID: <20240612094251.3336896-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718185375; x=1718790175;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cvr5cuFDNRqPLLGf/sDyvbHZ3Is009XywII6MYTbXBE=;
 b=lWPYyazd0dbLWcRren5neDo7rgh7EEoHchpIkvE6QLMIir+R8O4PPzzhBEJ+h1sbN8
 3QQqjNdVWCOzFxOiWl3WBD0vCPwijJbE3fR200fHUl+ECYR+zz1SXEwIQuXWoB9AXreU
 zMAb3rSDpLUh1c1/sTxNICex55D8B2wKdsxjc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lWPYyazd
Subject: [Buildroot] [PATCH 1/1] package/libnss: fix build failure for
 missing sqlite header
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host compilation of the package fails with the following error:

../../coreconf/nsinstall/Linux6.2_x86_64_gcc_glibc_PTH_64_DBG.OBJ/nsinstall -R -m 775
Linux6.2_x86_64_gcc_glibc_PTH_64_DBG.OBJ/bltest buildroot/output/build/host-libnss-3.100/dist/bin
/usr/bin/gcc -o Linux6.2_x86_64_gcc_glibc_PTH_64_DBG.OBJ/sdb.o -c -std=c99 -g -g -fPIC
-m64 -pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR -DLINUX -Dlinux -Wall
-Wshadow -DNSS_NO_GCC48 -DXP_UNIX -DXP_UNIX -DDEBUG -UNDEBUG -D_DEFAULT_SOURCE -D_BSD_SOURCE
-D_POSIX_SOURCE -DSDB_MEASURE_USE_TEMP_DIR -D_REENTRANT -DDEBUG -UNDEBUG -D_DEFAULT_SOURCE
-D_BSD_SOURCE -D_POSIX_SOURCE -DSDB_MEASURE_USE_TEMP_DIR -D_REENTRANT -DNSS_DISABLE_SSE3
-DNSS_NO_INIT_SUPPORT -DUSE_UTIL_DIRECTLY -DNO_NSPR_10_SUPPORT -DSSL_DISABLE_DEPRECATED_CIPHER_SUITE_NAMES
-DNSS_USE_STATIC_LIBS -Ibuildroot/output/host/include/nspr -Ibuildroot/output/build/host-libnss-3.100/dist/include
-I../../../dist/public/nss -I../../../dist/private/nss  sdb.c
sdb.c:24:10: fatal error: sqlite3.h: No such file or directory
   24 | #include <sqlite3.h>
      |          ^~~~~~~~~~~

Link: https://bugzilla.mozilla.org/show_bug.cgi?id=1901932

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ing-sqlite-header.-r-jmux-kaie-gland.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libnss/0002-Bug-1901932-missing-sqlite-header.-r-jmux-kaie-gland.patch

diff --git a/package/libnss/0002-Bug-1901932-missing-sqlite-header.-r-jmux-kaie-gland.patch b/package/libnss/0002-Bug-1901932-missing-sqlite-header.-r-jmux-kaie-gland.patch
new file mode 100644
index 000000000000..3aae8d7e156a
--- /dev/null
+++ b/package/libnss/0002-Bug-1901932-missing-sqlite-header.-r-jmux-kaie-gland.patch
@@ -0,0 +1,31 @@
+From a236a40dc9055a66903efb537aa25230a767d0af Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 8 Jun 2024 18:47:25 +0200
+Subject: [PATCH] Bug 1901932 - missing sqlite header. r=jmux,kaie,glandium
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+Differential Revision: https://phabricator.services.mozilla.com/D213397
+Upstream: https://phabricator.services.mozilla.com/D213397
+---
+ nss/coreconf/location.mk | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/nss/coreconf/location.mk b/nss/coreconf/location.mk
+index 9c43394d8cb0..16e8cc7169a3 100644
+--- a/nss/coreconf/location.mk
++++ b/nss/coreconf/location.mk
+@@ -64,6 +64,10 @@ ifndef SOFTOKEN_LIB_DIR
+     SOFTOKEN_LIB_DIR = $(DIST)/lib
+ endif
+ 
++ifdef SQLITE_INCLUDE_DIR
++    INCLUDES += -I$(SQLITE_INCLUDE_DIR)
++endif
++
+ ifndef SQLITE_LIB_DIR
+     SQLITE_LIB_DIR = $(DIST)/lib
+ endif
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
