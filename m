Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51A7C83F17
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 04:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B6E60866;
	Fri, 18 Jul 2025 04:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMkm51jcWAuV; Fri, 18 Jul 2025 04:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FFD961277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FFD961277;
	Fri, 18 Jul 2025 04:09:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3990523C
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 04:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B61F4173F
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 04:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUcP3woBxl3H for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 04:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1328E4173D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1328E4173D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1328E4173D
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 04:09:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b5e6bfb427so922383f8f.2
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 21:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752811748; x=1753416548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M8w0hvDQrvLGVGO/dPtjf9xVQH4Xf0X/9OhokxJs2Uk=;
 b=XYOYFM4zQBc1Y0vVGhX+Hblu10tQl69m8S/F/1m24ITl+7d8X9v4nLDsvYH1kT89oZ
 axHlFpW3NVwiDQe7Be5ANHCfwp2YWeE4Vrr+/iUmMeqdv8IXjx3zorjpOoB8+/fFBXJT
 lw6oiuqFsogvqUxQhIZsTpDGoTAWhivskvMP4kD3ChQDImhTERHv8NDt6LI1g5+FD2H9
 1P8mwVQwWNg9o343KWTfuIVI1U47YpP590KAfbVOR1XzTYuQ87Cv4IyadIDPtQNBr+Mw
 JY2/y1/u05TdSpuArv91RzynWH2OfDD8PdZtlQt6/z2mvXKn//a5rZAzWDgRWzw1q4V5
 m0vg==
X-Gm-Message-State: AOJu0Yxp6fPMHhPOsUClDc2v9nOvwwbklBPwG8Ygfv5QQXwZihtSPdfk
 6DmEnzD2T/SMv5Ok2xjPfEdn72Yi36b6mvQhge0k6UECV7dlDH7DlprrfeNxUA==
X-Gm-Gg: ASbGncvECtOfJMCvgkEbwSlmj3tmdVmjLZpp6x+7R/Ax5zq+IeJlvmqIpLmGt0HIPg3
 ES8rvRHavTMRIP2XXNKFkC1KBv0L01AMbXCuX4O8nDScxoqs8umWXxyCQVrupXel/O6zIGx+rMO
 k23Gjg7O0DdFC59bTNF4uLNm1EPvyPmceu8qiO/dXp9GowrpWrxN+SksKIBvDnCMcgHxTQQsH0q
 Oi0XwNJx36gjFw4+kQA0/wiQ2/tFkfuaa3guQ4iODw+/x5ZUSVbeOd1rv+acgD230c9LlL86gCg
 G/B8RmcF4gQx0ZdrpX/bs9uVlkNH9HhbYoGI2uehcFI+Civa68gbBRj/3R56BTD1aNDsViaZDve
 Ld17maE18KL+abYIj8aJwIcyJow==
X-Google-Smtp-Source: AGHT+IG8/csd6H/3QgipcQAhZYCLJKbj7t7uz0ygmNdUbNWcuiRKFUp3cu45N8JMfUwm1iKoDnSY9A==
X-Received: by 2002:a05:6000:4716:b0:3b4:98f6:dd77 with SMTP id
 ffacd0b85a97d-3b61b217fd7mr836283f8f.36.1752811747744; 
 Thu, 17 Jul 2025 21:09:07 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4d581sm633546f8f.64.2025.07.17.21.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 21:09:07 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Andrea Cervesato <andrea.cervesato@mailbox.org>,
 Julien Olivain <ju.o@free.fr>
Date: Fri, 18 Jul 2025 06:09:03 +0200
Message-ID: <20250718040903.1386179-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752811748; x=1753416548; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M8w0hvDQrvLGVGO/dPtjf9xVQH4Xf0X/9OhokxJs2Uk=;
 b=jVX1LjaAb4sU09hdpYYkR66DnVo9OJruDMguwJuUkymDOSqzLmStm88pXBK2xZg4HI
 JPG3bxcIzji1S0AfqX9hkfrbqCtCcSYHIMlVSFZ9mv1TUYqvRj0/SKFjNRHgkP29zz/5
 jyPTKcOSwFLJJhM6hoPzvxhdfA/x4jAUYaaIZXpi+5wqjw/2+pMv4DjBgRLZf2q5aG1c
 UJdhkmzdhFKCF2KFUvYhuPyfy2fuF9H65mSmPMMaPppvYRN9LHqwPUdizdyD8Mqeyz1F
 dx9/yz2X1gusktEKcT+BPX5NhYRYWsed3zSF0uw/OcANkhUSauzpZryZR64Liiu0La0s
 io5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jVX1LjaA
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

Backport 2 commits from upstream which fixes LTP on musl on kernel >= 6.14.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

I did not experience the problem on current bootlin-x86-64-musl
toolchain (used via utils/test-pkg), but Andrea is using a different
toolchain based obviously on newer headers.

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
