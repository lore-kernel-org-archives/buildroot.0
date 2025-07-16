Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFF6C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 22:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C987B4159D;
	Wed, 16 Jul 2025 22:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oM9D0-LhjkX; Wed, 16 Jul 2025 22:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAACD415BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAACD415BA;
	Wed, 16 Jul 2025 22:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53D3F234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44B2883EBC
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 22:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdnXtvFI7PDP for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 22:06:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3152183E97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3152183E97
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3152183E97
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 22:06:42 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45600581226so3057125e9.1
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 15:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752703600; x=1753308400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSvl37SqY0x/JHXxWPYnntVePI1L5X6hu7nCvYrmYK0=;
 b=h5Q3j+JCI8sxcNrkCh9CeOKNZENKdYjXMIT4x5wzxYm2shUFB9r/trFtdjFLUaNEyI
 mmeCZiIXAlOdkimaBbeC8nK1eiJXmJvIx1Gqwf2XzeF6YG4ppYJuQ8w4TvFHM5lUoKhV
 ec+E9Ny0oILwTlmHIZtL2pnEu9hYR6xhFxs1DTkk26vsf/H0jzkDqhqnMUolj5AhVGwv
 YhgpS0dfc0SbJIZ2RGWjn42puW1w5sV3UhpDDr2+PSGurbAxOutVGrXjuZpKLmLLMRxU
 GZt7ZnjWbZ4XOFGQwuP1yEqq2QvhHRRo/DQOGtLYHsCLQvNYWrLOfrGq0QySKbYwQlLm
 rkkg==
X-Gm-Message-State: AOJu0YxfKo/nl37+m1Ft5uQe2Pxo6oa2j5W1nS5BJyw509K5Jp5ODPxx
 3Sr8bk4RddLEeKE9g3dyWmzqFG4bcQixgoCHosA5Au3vwA+rFqy6ifbJz0BVzQ==
X-Gm-Gg: ASbGncurYLi3BsezMVQmGtOPAUs7NLPh9j2JucZb73n4tECYHNtIeUx2GRZ25sgvvbl
 7uBkNE7YPVCaavwdcB2G1fZphtnUqqbclejQmEhYLwPTLX2PsrMfreLszO07s3lDf4RD5rmiFWd
 88VB7ciV4G4XbtWw2mlc4fiyNNC5VOYaw231ya9IicVPfd/xa6/9Bcur5jDo0cUu968+6NwqITD
 wvc3/o2rux40WoPm5lVvpwT+uQlJlq0PH0/ip4YzHVi9afCysE8etWEBilmevz8vPLL7/kC5oxa
 h7WFTABwNAp1sQ8S9yOAMvqQC8IPMUw+qqkC0RTvID5HM2jjh6KEBLxGOKccE46rTvKxasaVpjj
 Ql2UDZYhu15O9MTlcaB+ObfGWkQ==
X-Google-Smtp-Source: AGHT+IEIu2E2eo3UWWYziwHVGAVtTOQCpaeYp8TEf+lymubJe8VCD7Z6JzSYk7dfcEaAdtMyZY2mlg==
X-Received: by 2002:a05:600c:548b:b0:453:8bc7:5cbb with SMTP id
 5b1f17b1804b1-4562e28628cmr37197585e9.25.1752703599964; 
 Wed, 16 Jul 2025 15:06:39 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45634f8dba0sm3997765e9.27.2025.07.16.15.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 15:06:39 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Andrea Cervesato <andrea.cervesato@mailbox.org>
Date: Thu, 17 Jul 2025 00:06:34 +0200
Message-ID: <20250716220634.326760-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752703600; x=1753308400; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wSvl37SqY0x/JHXxWPYnntVePI1L5X6hu7nCvYrmYK0=;
 b=DL1HBDCYVhCIbzgo43CXovbQfDv+8oaScACKXXp4kIXNscMhLVCXEDsL9Dm+d44QP4
 XIMWpRfqaulpyuN6c/X9ZR8pmObHiPmwb+DUAdn2VixFlDsXAZh2IWpYO16GLgNMGm+N
 2o+jLAWDrMe4s4N4aPEYP0wReJDA5VeGnA0fpgoKegwggcNWzA8E2mnMiSYrjBWgchOZ
 MD5eI2lxBvW4fXJpDkVyk0pQpNIN25oN1liAue6zxX1ABpJ4AkPwhAhfs0SC7K1vbJZ+
 /zK3Cd/uTDuV+ylniyNOMu6mFoBT/a9nnbvfBjdEyFeL/NTYipUA+Mi9X/4i3uTwocZ8
 BwXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DL1HBDCY
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: backport musl build
 fixes
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

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

hopefully this fix a problem reported by Andrea.

Kind regards,
Petr

 ...ure-Fix-build-on-kernel-6.14-headers.patch | 51 ++++++++++++++++++
 ...002-statmount02-Remove-linux-btrfs.h.patch | 52 +++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
 create mode 100644 package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch

diff --git a/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch b/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
new file mode 100644
index 0000000000..6638ee2ccd
--- /dev/null
+++ b/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
@@ -0,0 +1,51 @@
+From 3ef4bac1dd253628dfdb8a823b51ae0d24fa0616 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 2 Jun 2025 19:08:30 +0200
+Subject: [PATCH] configure: Fix build on kernel 6.14 headers
+
+We decided in a2300dc0f5 to remove <linux/mount.h> in lapi/mount.h and
+use only <sys/mount.h>. But later in 5c5411ea8e we add autotools checks
+in configure.ac which use <linux/mount.h> for detection, but kept using
+lapi/mount.h. This worked until now, because no toolchain used new
+header enough. Recent Alpine update broke that.
+
+This fixes CI build on Alpine v3.22 (the default Alpine version in
+GitHub action), which uses 6.14.2 kernel headers, which already define
+struct mnt_id_req (configure.ac detect it but lapi/mount.h was not using
+a correct header):
+
+    listmount.h: In function 'listmount':
+    listmount.h:18:16: error: variable 'req' has initializer but incomplete type
+       18 |         struct mnt_id_req req = {
+	  |                ^~~~~~~~~~
+
+Link: https://lore.kernel.org/ltp/20250602170831.404641-1-pvorel@suse.cz/
+Fixes: 5c5411ea8e ("Add listmount/statmount fallback declarations")
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Acked-by: Jan Stancek <jstancek@redhat.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream: https://github.com/linux-test-project/ltp/commit/3ef4bac1dd253628dfdb8a823b51ae0d24fa0616
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9ff098b273..69c5be7362 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -254,8 +254,10 @@ AC_CHECK_TYPES([struct mount_attr],,,[
+ 
+ AC_CHECK_TYPES([struct cachestat_range],,,[#include <sys/mman.h>])
+ AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
+-AC_CHECK_TYPES([struct mnt_id_req],,,[#include <linux/mount.h>])
+-AC_CHECK_TYPES([struct statmount],,,[#include <linux/mount.h>])
++
++# Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/mount.h> */
++AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
++AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
+ 
+ # Tools knobs
+ 
+-- 
+2.50.0
+
diff --git a/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch b/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
new file mode 100644
index 0000000000..c82c422000
--- /dev/null
+++ b/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
@@ -0,0 +1,52 @@
+From fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Wed, 4 Jun 2025 16:13:18 +0200
+Subject: [PATCH] statmount02: Remove <linux/btrfs.h>
+
+statmount02.c does not need <linux/btrfs.h> because it's skipped.
+
+Avoid using it fixes the problem due the old problem of indirect include
+<linux/mount.h> by <linux/fs.h> on Alpine v3.22 (the default Alpine
+version in GitHub action), which uses 6.14.2 kernel headers:
+
+    In file included from /usr/include/linux/fs.h:19,
+                     from /usr/include/linux/btrfs.h:29,
+                     from statmount02.c:23:
+    /usr/include/linux/mount.h:155:8: error: redefinition of 'struct statmount'
+      155 | struct statmount {
+          |        ^~~~~~~~~
+    In file included from statmount.h:12,
+                     from statmount02.c:20:
+    ../../../../include/lapi/mount.h:58:8: note: originally defined here
+       58 | struct statmount {
+          |        ^~~~~~~~~
+    /usr/include/linux/mount.h:193:8: error: redefinition of 'struct mnt_id_req'
+      193 | struct mnt_id_req {
+          |        ^~~~~~~~~~
+    ../../../../include/lapi/mount.h:49:8: note: originally defined here
+       49 | struct mnt_id_req {
+          |        ^~~~~~~~~~
+
+Fixes: 5f9942dffe ("Add statmount02 test")
+Suggested-by: Jan Stancek <jstancek@redhat.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream: https://github.com/linux-test-project/ltp/commit/fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435
+---
+ testcases/kernel/syscalls/statmount/statmount02.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/statmount/statmount02.c b/testcases/kernel/syscalls/statmount/statmount02.c
+index 504c558a11..07f877e040 100644
+--- a/testcases/kernel/syscalls/statmount/statmount02.c
++++ b/testcases/kernel/syscalls/statmount/statmount02.c
+@@ -20,7 +20,6 @@
+ #include "statmount.h"
+ #include "lapi/stat.h"
+ #include "lapi/sched.h"
+-#include <linux/btrfs.h>
+ 
+ #define MNTPOINT "mntpoint"
+ 
+-- 
+2.50.0
+
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
