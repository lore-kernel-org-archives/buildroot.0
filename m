Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B395C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 18:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7EAE409E9;
	Sat, 13 Aug 2022 18:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7EAE409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id myggSaTMUu_e; Sat, 13 Aug 2022 18:45:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C891B400AF;
	Sat, 13 Aug 2022 18:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C891B400AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5069C1BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 18:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AEE6606B0
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 18:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AEE6606B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZbLYL20yBQ2 for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 18:44:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3E8B605E3
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3E8B605E3
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 18:44:58 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z16so4457534wrh.12
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 11:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=8KxwFB3LnAKQquFAIEuAnOTwOLh+rjiPVy+Vv6AwWyI=;
 b=5t0Y3BLOhvKgBflOj8DQIVh4Y1iqOybr+UMESJvZ55rrsWLspMqCnfsqdCsUR7rBut
 ESYAlF53T42JuOXSZLMl2di3b5hxKhSPmxwc7En7B814++0EzTX6LrOhn0oh0tX0Zh81
 pHsYwxJRcEkymYzYVl+WVlEiUf52xM6LuWpIOcsAeY7lr9tDguqbRyL9ANR9N/GNTCA1
 FZMOiUlrBta23lG3QXRaaJwO4BCWdcVE/1p0KG235OX+4NhO/mLMuUP1BUj0/MK9fIkn
 pvivGtdRbKjB5RRZM9IXfXenXkPZ5FVIbPN43M5Deavvp6/tFR7XpI7Aj4dCO/6en1Ok
 3dwg==
X-Gm-Message-State: ACgBeo1nZlI4AqypZBrMux9QkeXrhl7vpHbhE7VLrWKQQ2yKl5JLPdC7
 0nr9F9wpw5cvoJJ+8Al0m/iEAwZjbPE=
X-Google-Smtp-Source: AA6agR7gAGd6lAQ4l5x3MKBaxUrYMngTiGH9GZQFw0qyfyNeAM/ahjAW/FqV0DVK3l3HX/SSGMA2jw==
X-Received: by 2002:a5d:4906:0:b0:21f:dc9:8c86 with SMTP id
 x6-20020a5d4906000000b0021f0dc98c86mr4745920wrq.285.1660416296490; 
 Sat, 13 Aug 2022 11:44:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00b5c452e6a5e92811.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:b5c4:52e6:a5e9:2811])
 by smtp.gmail.com with ESMTPSA id
 cl5-20020a5d5f05000000b00224f7c1328dsm1019535wrb.67.2022.08.13.11.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 11:44:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 20:44:48 +0200
Message-Id: <20220813184448.2303650-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=8KxwFB3LnAKQquFAIEuAnOTwOLh+rjiPVy+Vv6AwWyI=;
 b=bVCoh5t0K9N8487FObWCNZPuFfKjVtf/yzejHuFjicHdAN29+ahFDesBP1PIcsE6+N
 aSqcUqbjff3EiAjzqq7nZnnkhGOBcrjOQVHIfw57EJrB38k4pinGzWtX7NEY8D66LY3i
 Vs2HDm/ga1iWvY+LE/23OAJ6YTKN6VQjtdXrBCswaBEuufGUzpiMQyfGHZur4zEXOfnC
 hRPL4lMZ1wezuZ0hGwPmejbzG6+Sqdum/TRYouoLt6mHWMOj7UmeBCTgJWqkGwYriMNT
 FE0JU100pn0QgGoFsbiTzn54DGSwxJ6v9ZcOZw4qfswH7rHOETHRbianDG4DRR3tR97A
 6Kvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bVCoh5t0
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: fix build with kernel >=
 5.1 and < 5.6
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with kernel >= 5.1 and < 5.6 (i.e.
before
https://github.com/torvalds/linux/commit/9e3aa61ae3e01ce1ce6361a41ef725e1f4d1d2bf)
raised since bump to version 0.12.02 in commit
e551fe76e2073f15b0fcf92a73bb6b7334b017b3 and
https://github.com/ColinIanKing/stress-ng/commit/3d6fccdbe53d0cbcb75dd4b91571aaaae7ee1ad4:

In file included from stress-io-uring.c:26:
io-uring.h:1:9: error: macro names must be identifiers
    1 | #define #define HAVE_IORING_OP_NOP 0
      |         ^

Fixes:
 - http://autobuild.buildroot.org/results/1bf3f2bbc849bdce531d56b1024fa87f0c1ae667

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-Makefile-fix-build-with-kernel-5.6.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch

diff --git a/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch b/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch
new file mode 100644
index 0000000000..4c62da3241
--- /dev/null
+++ b/package/stress-ng/0001-Makefile-fix-build-with-kernel-5.6.patch
@@ -0,0 +1,60 @@
+From 5d419c790e648c7a2f96f34ed1b93b326f725545 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 13 Aug 2022 17:17:05 +0200
+Subject: [PATCH] Makefile: fix build with kernel < 5.6
+
+Fix the following build failure with kernel >= 5.1 and < 5.5 (i.e.
+before
+https://github.com/torvalds/linux/commit/9e3aa61ae3e01ce1ce6361a41ef725e1f4d1d2bf)
+raised since version 0.11.21 and
+https://github.com/ColinIanKing/stress-ng/commit/3d6fccdbe53d0cbcb75dd4b91571aaaae7ee1ad4:
+
+In file included from stress-io-uring.c:26:
+io-uring.h:1:9: error: macro names must be identifiers
+    1 | #define #define HAVE_IORING_OP_NOP 0
+      |         ^
+
+Moreover, IORING_OP_FALLOCATE is not available before kernel 5.6 and
+https://github.com/torvalds/linux/commit/d63d1b5edb7b832210bfde587ba9e7549fa064eb
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1bf3f2bbc849bdce531d56b1024fa87f0c1ae667
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from
+https://github.com/ColinIanKing/stress-ng/commit/5d419c790e648c7a2f96f34ed1b93b326f725545]
+---
+ Makefile          | 2 +-
+ stress-io-uring.c | 6 +++++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 2f9cc9918..ee17ae08b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -528,7 +528,7 @@ stress-personality.c: personality.h
+ #
+ io-uring.h:
+ 	$(V)$(CPP) $(CFLAGS) core-io-uring.c  | $(GREP) IORING_OP | sed 's/,//' | \
+-	sed 's/IORING_OP_/#define HAVE_IORING_OP_/' > io-uring.h
++	sed 's/.*\(IORING_OP_.*\)/#define HAVE_\1/' > io-uring.h
+ 	$(Q)echo "MK io-uring.h"
+ 
+ stress-io-uring.c: io-uring.h
+diff --git a/stress-io-uring.c b/stress-io-uring.c
+index ab9fd0749..84f463611 100644
+--- a/stress-io-uring.c
++++ b/stress-io-uring.c
+@@ -311,7 +311,11 @@ static inline int stress_io_uring_complete(
+ 			break;
+ 
+ 		cqe = &cring->cqes[head & *submit->cq_ring.ring_mask];
+-		if ((cqe->res < 0) && (opcode != IORING_OP_FALLOCATE)) {
++		if ((cqe->res < 0)
++#ifdef HAVE_IORING_OP_FALLOCATE
++			&& (opcode != IORING_OP_FALLOCATE)
++#endif
++		) {
+ 			const int err = abs(cqe->res);
+ 
+ 			/* Silently ignore EOPNOTSUPP completion errors */
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
