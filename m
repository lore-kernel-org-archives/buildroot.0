Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF62C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 15:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E783440BB5;
	Tue, 18 Oct 2022 15:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E783440BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9F6Q30kH89Y; Tue, 18 Oct 2022 15:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1533040BA7;
	Tue, 18 Oct 2022 15:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1533040BA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3578B1BF488
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 15:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EF2883E79
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 15:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF2883E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ln6f1Fa7GG0m for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 15:01:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB3B83E36
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CB3B83E36
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 15:01:29 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id t25so8795237qkm.2
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 08:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x4YVKQsszGxAot8jnGUUaY6bYyiZEats+lZdu1Pskt4=;
 b=JA5GJcb9Yc4VnIyg8HkZOM99sHlIow1kDwS1K9kO/+bUI1OCntbYMNUlbFzAIihQ6B
 zr2wgrnMCsDeeQ5yY37Liscb0I5Kpt7ZcoIjtVQj0vtPGlFcD9SjyXW6qgrCKesQRP5Q
 xA+rW0YEXl1I+QrtYkNOGq6lZoyhOCzHktktXPEpxDUu2lUaYtvgpJN8Fa8JsIfxaNKL
 0CvAT7/f48TVxizQ2sPB/Ub6az5p5KIPJfi8L+I5sNCloi5/H2iGUtEEKYsWWjnmodmm
 +tt7WMaN6epfIX8CZk7rQbth2OueNYsmNGR3IEBBONnd7dM2E/U7lIxKFIw1AOX97Hb9
 awYA==
X-Gm-Message-State: ACrzQf0+6iNH5kgRbBxokpavrPy3Z36x3uSBUdCOFmJ8M7oPYgRJPLzY
 PSdN1DKzx5j0+egoeLjh/9+mdU1nRXFtZA==
X-Google-Smtp-Source: AMsMyM7mTjVOKwR4LGx9bjzt54WJzn6XFN3CIax4fIytn+rd3cW1lspkJniw6BDKpmeli/grxpL4tA==
X-Received: by 2002:ae9:efca:0:b0:6ee:b349:fd20 with SMTP id
 d193-20020ae9efca000000b006eeb349fd20mr2143082qkg.772.1666105288415; 
 Tue, 18 Oct 2022 08:01:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 bk18-20020a05620a1a1200b006ec771d8f89sm2559173qkb.112.2022.10.18.08.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 08:01:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 09:01:19 -0600
Message-Id: <20221018150119.2305656-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x4YVKQsszGxAot8jnGUUaY6bYyiZEats+lZdu1Pskt4=;
 b=Im+4caoWO4+6WLuvpjPQaArQK/R5pXhdXkfkCzQw9UzbwbS5vw/BOEAxG/hgIQLhpI
 yHqdgEWzn9odIrTNuK6a1fUs6tzSdVMoLPJaBth1XpzrQsImZw8zaLHzmvCeiZN//5Jl
 ZbzB5DjzuivJMgXMJoCzBy14E0OEDJzQ2I06PbbW5+cGdVZckl1guEKYU6j7woEX9j6t
 0Wc+zSJprynoBzU1rCD+Y6NTFgRxxBRNMfQhWVF1K/Q8kJzIJPncHQ5trjxM0ra531QW
 FkG6n6qEoGSPkPt5rDeCxj5oVxf500jD8FphiJUJ05/zaNxRPMkrJvIsq20UVhDuDfd/
 +Z1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Im+4caoW
Subject: [Buildroot] [PATCH 1/1] package/umtprd: fix make shuffle build
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch fixing a makefile dependency issue that
breaks when using make 4.4's shuffle mode.

Fixes:
 - http://autobuild.buildroot.net/results/c7ce975d398190fc191ccc03813f8ec0b3464c7d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-Fix-output_dir-make-dependency.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/umtprd/0001-Fix-output_dir-make-dependency.patch

diff --git a/package/umtprd/0001-Fix-output_dir-make-dependency.patch b/package/umtprd/0001-Fix-output_dir-make-dependency.patch
new file mode 100644
index 0000000000..2d4d6980f4
--- /dev/null
+++ b/package/umtprd/0001-Fix-output_dir-make-dependency.patch
@@ -0,0 +1,47 @@
+From d84216a678edaca81c0899318231cdcca2100d38 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 17 Oct 2022 16:39:56 -0600
+Subject: [PATCH] Fix output_dir make dependency
+
+Object file targets need to depend on the output_dir target.
+
+Fixes:
+make --shuffle=reverse -j1
+cc -o obj/mtp_op_truncateobject.o src/mtp_operations/mtp_op_truncateobject.c -c  -I./inc -lpthread -Wall -O3
+Assembler messages:
+Fatal error: can't create obj/mtp_op_truncateobject.o: No such file or directory
+make: *** [Makefile:19: obj/mtp_op_truncateobject.o] Error 1 shuffle=reverse
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+d84216a678edaca81c0899318231cdcca2100d38]
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7c98b63..c28e186 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,15 +7,15 @@ objects := $(sources:src/%.c=obj/%.o)
+ ops_sources := $(wildcard src/mtp_operations/*.c)
+ ops_objects := $(ops_sources:src/mtp_operations/%.c=obj/%.o)
+ 
+-all: output_dir umtprd
++all: umtprd
+ 
+ umtprd: $(objects) $(ops_objects)
+ 	${CC} -o $@    $^ $(LDFLAGS) -lpthread
+ 
+-$(objects): obj/%.o: src/%.c
++$(objects): obj/%.o: src/%.c | output_dir
+ 	${CC} -o $@ $^ -c $(CPPFLAGS) $(CFLAGS)
+ 
+-$(ops_objects): obj/%.o: src/mtp_operations/%.c
++$(ops_objects): obj/%.o: src/mtp_operations/%.c | output_dir
+ 	${CC} -o $@ $^ -c $(CPPFLAGS) $(CFLAGS)
+ 
+ output_dir:
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
