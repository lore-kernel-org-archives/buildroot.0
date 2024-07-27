Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41331C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 08:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D6C40B4B;
	Sat, 27 Jul 2024 08:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_WFvqfgx7eF; Sat, 27 Jul 2024 08:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F3240B93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37F3240B93;
	Sat, 27 Jul 2024 08:43:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 933141BF488
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 08:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80B524026D
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 08:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSV8SPafPf0p for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 08:42:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 212834024D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 212834024D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 212834024D
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 08:42:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so3139945e9.2
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 01:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722069775; x=1722674575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=90K/VjdaoKvPgpQncCJYCXs9AMeNjaR1zT05y3+8RLI=;
 b=gr0Ndvr1mQSE0R2Er1lQdyUWK9q0FDpLfh/6boAB83qniM8BBUXhGUY7xPEVjajGIm
 fcJgMAMEtBu1KLtGGBq4ko6wmFHWmnnz9fuHCYaCnxa3l0hExpjsY1iD3YsNsT/1heVO
 rQ+Rsq2HopaRKsJG6oEvOp8o7N5yziVxPYZ5p4R0HbbYI6gdn9u4c1NGiv63MGFTvcLh
 ejrAROqMGGOX2/cnHqRUzbeak+ZYFWrn8O2BVUx+KDT0NSv6twtt8apHZl8biR1MtPhm
 DAsiXn7yN1nfse0mcgeTa6rU90WWecUKGxwrsI7LMgW6emKokFL0gNMam+JN2xXL1595
 wggg==
X-Gm-Message-State: AOJu0YxHrqKlVHmjqOQ2Nba882a8vYq1VT+TdMlL2RejvFwLkyq9nMlR
 zkRBufS52SwPlQl88g2rc7GD8YyCx2zcNajB5d3EKQoaFAF0sKaFPK/RHw==
X-Google-Smtp-Source: AGHT+IH8c5SYPR45ZHl/1qEAfPFpBqu3Cl5sSMmmIzqgnw0F5tBpltWoRhyFsS3iFsTLT1YD+Ht4AA==
X-Received: by 2002:a05:6000:120f:b0:367:8a00:fac3 with SMTP id
 ffacd0b85a97d-36b5cefdf1bmr1206832f8f.30.1722069774518; 
 Sat, 27 Jul 2024 01:42:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367c028bsm7086771f8f.24.2024.07.27.01.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 01:42:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 10:42:48 +0200
Message-ID: <20240727084248.18600-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722069775; x=1722674575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=90K/VjdaoKvPgpQncCJYCXs9AMeNjaR1zT05y3+8RLI=;
 b=DZ6GJYJwI9RWq7mKOX28qQ6S+5gh2/p2FMlxi0fcpMJdm67HwbLbtyT8t+cYooxw25
 uZp7GgcgvM+N3ttUQB/gIc8HMsmzJkwMzA+F/EPRqPgIJmBATSDFLdgJUq3b6NAiJwv5
 s63TU2ujBoV/IgMGXqXLqgeYJ9VsfLO5CZ3tad+gDAFimfIEoAT2u0nW+k8FoW1MQCan
 8hMrVzmchc/pFW+XKlgsklSphlwlo6cVO1AD03LFrNEmBY8dEUdqKgIGkQZ7QzdlnpQP
 DnoEERY3kYKWamm/6cwE1LTlrXxXq7oQeFe2whAwF81VbzxssP8KR0y0L6XIG+avDFs2
 vN0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DZ6GJYJw
Subject: [Buildroot] [PATCH 1/1] package/libnfs: fix build with gcc >= 14
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

Fix the following build failure with gcc >= 14 which enables
-Werror=implicit-function-declaration
(https://gcc.gnu.org/gcc-14/porting_to.html):

nfs-stat.c: In function 'main':
nfs-stat.c:287:30: error: implicit declaration of function 'ctime' [-Wimplicit-function-declaration]
  287 |         printf("Access: %s", ctime( (const time_t *) &st.nfs_atime));
      |                              ^~~~~
nfs-stat.c:177:1: note: 'ctime' is defined in header '<time.h>'; this is probably fixable by adding '#include <time.h>'
  176 | #include <pwd.h>
  +++ |+#include <time.h>
  177 | char *uid_to_name(int uid)

Fixes:
 - http://autobuild.buildroot.org/results/73c3828a4e5d275ca0dfdd5b314494e2b00393c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0002-utils-nfs-stat.c-include-time.h.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch

diff --git a/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch b/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch
new file mode 100644
index 0000000000..649d84524c
--- /dev/null
+++ b/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch
@@ -0,0 +1,39 @@
+From 034205b6b3acd64f9c75010d8da27e2c9f1bc82f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jul 2024 18:04:05 +0200
+Subject: [PATCH] utils/nfs-stat.c: include time.h
+
+Include time.h to fix the following build failure with gcc >= 14 which
+enables -Werror=implicit-function-declaration
+(https://gcc.gnu.org/gcc-14/porting_to.html):
+
+nfs-stat.c: In function 'main':
+nfs-stat.c:287:30: error: implicit declaration of function 'ctime' [-Wimplicit-function-declaration]
+  287 |         printf("Access: %s", ctime( (const time_t *) &st.nfs_atime));
+      |                              ^~~~~
+nfs-stat.c:177:1: note: 'ctime' is defined in header '<time.h>'; this is probably fixable by adding '#include <time.h>'
+  176 | #include <pwd.h>
+  +++ |+#include <time.h>
+  177 | char *uid_to_name(int uid)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/73c3828a4e5d275ca0dfdd5b314494e2b00393c8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/sahlberg/libnfs/commit/39e1ae0206fb519c551b48b0e6de57f3e764e886
+---
+ utils/nfs-stat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/nfs-stat.c b/utils/nfs-stat.c
+index 17ddb311..0ec33544 100644
+--- a/utils/nfs-stat.c
++++ b/utils/nfs-stat.c
+@@ -50,6 +50,7 @@ WSADATA wsaData;
+ #include <inttypes.h>
+ #include <sys/types.h>
+ #include <fcntl.h>
++#include <time.h>
+ #include "libnfs.h"
+ #include "libnfs-raw.h"
+ #include "libnfs-raw-mount.h"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
