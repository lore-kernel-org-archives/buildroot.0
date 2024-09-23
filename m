Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2915FCF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 16:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEB234019A;
	Mon, 23 Sep 2024 16:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6bLW30S1ZfN; Mon, 23 Sep 2024 16:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46C32402E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46C32402E0;
	Mon, 23 Sep 2024 16:14:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD72D1BF355
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 16:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABEBD6064A
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 16:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS4e1CXlSW1I for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 16:14:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5248B605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5248B605A6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5248B605A6
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 16:14:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-374c962e5adso2783783f8f.1
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 09:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727108055; x=1727712855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fnqoR34mjoix6aaxD92jG0lXeeKLb86Lqk0PdwShbIo=;
 b=T3LzPoVYavXbGOI77mNjmxAAzgpAHVDm2HRRmbZhYFMa/K98V3TpKR8S4VfXAfsqLv
 calHxiwXNb6QPpPdElnMWTqza3NeIavfRhsPNEcgXGzALuXuUpF9s/GHRiN8s7gqzX9h
 Gvio8gcJToZRL/Hjik0/nRcJ2ZbFINSgQSCgPV4FrWRUoVZQ3rmdNr+mSTO+C3gi/ZGx
 P4SzpBdKGkr+dXPmmpv9YGjStWxkOQrVP4loE1aMMF7ylzb10uVBrr/uEeKbPdJGwyen
 FCmxf7RXuiwR7ykhE70dg3vu4ZEbivm1DkQ4R/scmNqPFVPAw4tcp0JRCV4Si6qdqYvQ
 I3sg==
X-Gm-Message-State: AOJu0YwEGxAGAdXB9E7RJTNH7b45paRyu+i2wbP1RnaQwwxWn6yoA5bn
 CtvwDckpdSYgIlBwkTwLK77nN5p50LrqKlBOh8PyCdNzgwZOhyywPllqvn1U9wrLzGabQQDS8o6
 I4Ls=
X-Google-Smtp-Source: AGHT+IGs9MN29jJPOjxsKhRwOYPvmhB6QdVTtl0LhYS93DUXMqYvMjzCdGm4B3f7xcs4gwlXlxSZsw==
X-Received: by 2002:adf:ea50:0:b0:374:bfd8:eeee with SMTP id
 ffacd0b85a97d-37c7ebab1c1mr104440f8f.10.1727108054850; 
 Mon, 23 Sep 2024 09:14:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.197])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e71f0699sm24708814f8f.15.2024.09.23.09.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 09:14:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 18:14:09 +0200
Message-ID: <20240923161409.2937293-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727108055; x=1727712855;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fnqoR34mjoix6aaxD92jG0lXeeKLb86Lqk0PdwShbIo=;
 b=nZXY3M9Z/dhJsu3ZieBbqxWxiQmYB8Z3gJO/wu1McncNBN92JKSG2jfNMA5DTwmA8n
 xAAeJNpA5fFJorwLJAnnOseKRS1UPOCBtMce2fWxKR45mpkohWMIi9MRUegl2EvM+Q7L
 DcLbS6Rjt+6bD1dqDZRsSQuvE4v1HF+jvOvqQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nZXY3M9Z
Subject: [Buildroot] [PATCH v2 1/1] package/babeld: bump to version 1.13.1
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Implemented the per-interface option "probe-mtu", which automatically
  discards links with a mis-configured MTU.
- Fixed a typo in the handing of the option "v4viav6".

Release notes:
https://github.com/jech/babeld/blob/master/CHANGES

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Replace the added patch with the merged one.

 .../babeld/0001-Fix-uclibc-build-issue.patch  | 38 +++++++++++++++++++
 package/babeld/babeld.hash                    |  2 +-
 package/babeld/babeld.mk                      |  2 +-
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 package/babeld/0001-Fix-uclibc-build-issue.patch

diff --git a/package/babeld/0001-Fix-uclibc-build-issue.patch b/package/babeld/0001-Fix-uclibc-build-issue.patch
new file mode 100644
index 000000000000..fb2f69e98bb1
--- /dev/null
+++ b/package/babeld/0001-Fix-uclibc-build-issue.patch
@@ -0,0 +1,38 @@
+From f8e5fbb33690b516b8516590def5136e6619de4c Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 17 Sep 2024 21:48:01 +0200
+Subject: [PATCH] Fix uclibc build issue
+
+This patch fixes the following compilation error raised by the bump to
+version 1.13.1 in Buildroot [1] using uclibc as the C library for the
+cross-compilation toolchain:
+
+net.c: In function 'babel_send':
+net.c:199:27: error: 'IPV6_DONTFRAG' undeclared (first use in this function)
+  199 |         cmsg->cmsg_type = IPV6_DONTFRAG;;
+
+[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240917201030.11583-1-dario.binacchi@amarulasolutions.com/
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/jech/babeld/pull/121
+---
+ net.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net.c b/net.c
+index 7a7b57844e6c..30de3dafe1d9 100644
+--- a/net.c
++++ b/net.c
+@@ -37,6 +37,10 @@ THE SOFTWARE.
+ #include <arpa/inet.h>
+ #include <errno.h>
+ 
++#if defined(__UCLIBC__)
++#include <linux/in6.h>
++#endif
++
+ #include "babeld.h"
+ #include "util.h"
+ #include "net.h"
+-- 
+2.43.0
+
diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 3eb5d2208153..ab2ffc6ef811 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d085ccccfb06a11d7fa5b54c51d9c410f5f3b0a9389f584951336ff178f293b8  babeld-1.13.tar.gz
+sha256  15f24d26da0ccfc073abcdef0309f281e4684f2aa71126f826572c4c845e8dd9  babeld-1.13.1.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 67ff553b8bed..e9d20111f93d 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.13
+BABELD_VERSION = 1.13.1
 BABELD_SITE = https://www.irif.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
