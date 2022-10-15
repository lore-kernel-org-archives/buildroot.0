Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB1EC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 06:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4341406E0;
	Sat, 15 Oct 2022 06:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4341406E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BheR9EQYrssP; Sat, 15 Oct 2022 06:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6544C404A6;
	Sat, 15 Oct 2022 06:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6544C404A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BADA1BF836
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 06:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3552A404A6
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 06:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3552A404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2cNwlUG2Hqj for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 06:04:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA8C40324
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBA8C40324
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 06:04:22 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id r14so9414502edc.7
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 23:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v34Ltq6Yy+6bRSfdqmAPqB9P+0kdwjQoXFOHO63/UZk=;
 b=G4AoqXnvvv7WlaAyybUyK0k/mS9J4+KrbWQ6Zr30VjfnkJL6FYgLSmapJBWfP6x3zx
 ODplsE0NgNBKw3m6+DUZ4TQ4oBb/N7iPq7jjVxR9UakRnAeNQ0Y2S4GeMwuLHgDErFy/
 Sh0jhtMAcGjoWbIoUdpKy/+0rN30pufavMuqJGUq0DiCvv7dg/8+YyfvZFe0ao3LS0Gb
 GnN/qi/jmsQ9iNKRgPrtRKP6AcRw7siMN5UECyqRGn2jHUYHtHUqeSxHZ9zzNAhVbohH
 11t+7TF+h4Po54RVvulvquGoCd2jiIUTtKrC6YnnRPX8Z2AcLNgiV9Tl0+sozE5ScNqr
 M7Tw==
X-Gm-Message-State: ACrzQf3jBF0Oet0XkkV/umR2WiC0hjjx7LGHdrp/ASFb8PVUWKlXv0fJ
 0oPARbBKee6Q9qQlHq21+Eu2gqxSpOg=
X-Google-Smtp-Source: AMsMyM6INeFZJGZthwjaIGyoX2RhmE3ybYnsQ1fhQEJCtjP6m8W6+LzBDoY6u9DLXyY3/eqTB77G0A==
X-Received: by 2002:a05:6402:2793:b0:45c:d273:8c18 with SMTP id
 b19-20020a056402279300b0045cd2738c18mr1119508ede.337.1665813860767; 
 Fri, 14 Oct 2022 23:04:20 -0700 (PDT)
Received: from localhost.localdomain (tmo-082-129.customers.d1-online.com.
 [80.187.82.129]) by smtp.gmail.com with ESMTPSA id
 w16-20020a50fa90000000b004582a37889csm3062258edr.16.2022.10.14.23.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 23:04:20 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 08:04:11 +0200
Message-Id: <20221015060411.326933-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/frotz: Add a missing dependency to the
 Makefile to fix build problems
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are currently some build jobs failing where blorblib is built before
hash.h has been created. This patch should hopefully fix these issues.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 See e.g. here for a failed build:
 http://autobuild.buildroot.net/results/9cd213ce2d36f797041c7b21044c2b2c223dd546/build-end.log

 ...0001-Makefile-blorb-lib-needs-hash.h.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/frotz/0001-Makefile-blorb-lib-needs-hash.h.patch

diff --git a/package/frotz/0001-Makefile-blorb-lib-needs-hash.h.patch b/package/frotz/0001-Makefile-blorb-lib-needs-hash.h.patch
new file mode 100644
index 0000000000..3bde10b6ba
--- /dev/null
+++ b/package/frotz/0001-Makefile-blorb-lib-needs-hash.h.patch
@@ -0,0 +1,40 @@
+From cdf0ad4aff2d8937034e02e41a5aadcca320ea18 Mon Sep 17 00:00:00 2001
+From: Thomas Huth <huth@tuxfamily.org>
+Date: Fri, 14 Oct 2022 20:29:41 +0200
+Subject: [PATCH] Makefile: blorb-lib needs hash.h
+
+If running "make blorb-lib" on a vanilla source directory, the
+compilation fails with:
+
+ make -C src/blorb
+ make[1]: Entering directory '/home/thomas/src/frotz/src/blorb'
+ cc -Wall -std=c99 -O3  -g -D_POSIX_C_SOURCE=200809L -I../common -fPIC
+  -fpic -o blorblib.o -c blorblib.c
+ In file included from blorblib.c:11:
+ ../common/frotz.h:74:10: fatal error: hash.h: No such file or directory
+    74 | #include "hash.h"
+       |          ^~~~~~~~
+ compilation terminated.
+
+Looks like we also have to make sure that hash.h is in place before
+compiling the blorb target, thus add the dependency to the Makefile.
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1d27b09..3d2bc45 100644
+--- a/Makefile
++++ b/Makefile
+@@ -461,7 +461,7 @@ $(SDL_LIB): $(COMMON_DEFINES) $(HASH) $(SDL_DIR)
+ $(DUMB_LIB): $(COMMON_DEFINES) $(HASH)
+ 	$(MAKE) -C $(DUMB_DIR)
+ 
+-$(BLORB_LIB): $(COMMON_DEFINES)
++$(BLORB_LIB): $(COMMON_DEFINES) $(HASH)
+ 	$(MAKE) -C $(BLORB_DIR)
+ 
+ $(SUB_CLEAN):
+-- 
+2.37.3
+
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
