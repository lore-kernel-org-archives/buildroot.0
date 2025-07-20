Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F71C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 14:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6948B614B5;
	Sun, 20 Jul 2025 14:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjf9o3CBHlyK; Sun, 20 Jul 2025 14:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 605A061C3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605A061C3E;
	Sun, 20 Jul 2025 14:30:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E695117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 14:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F96A84290
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 14:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3u0pwcSTUYo for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 14:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B4D984475
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B4D984475
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B4D984475
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 14:30:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so1609657f8f.0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 07:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753021852; x=1753626652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zaafrwKWYm4AQbvRL3V2BnvsJDYB6WpQ8SW0rMt7Oso=;
 b=l0BAEhpkSfWVlN4WLXPgKPvBnYsA+iBB/ghT2Rscdvb/sQtJK2gHSWF12VRzhTq6zp
 l4k++Q4YNXGo94VK12GmGj3uMB7w8SDFUvqWKN69d4zsKlnnlp6fkSjySJQPorzq3Pr1
 MFepDau0FdvJHeHOO5/cDgGFQ1VpGPzCvlCh4KPOGAPHaDOLSpg3BAOjZthbZ1g8vNOm
 +eZ1nFcY2VU+7Kgzi+VJh5P83EYByElkDkJzTSXJUsBVemmyCQSrK8VDTu/iC6ClAXu0
 dfOeyd6oag3nyM8rsLSbHh/sm7P44/Hl9xOGIYrAB1yfek/UYWdMfQsokJlUDszpDAIA
 CUXg==
X-Gm-Message-State: AOJu0YyGy9jmgVqpVkfwC0uHtsl6eVo9eLnZupudllNH5Pg/4K0hGqzb
 nwX7ttS+D1FV8UTpH8boRT+3O5Bcy6YKV69G9b7vEDWUHzobnwm6EELj3WPIyw==
X-Gm-Gg: ASbGncuZCMoNVSig/plYHQ7NreIzNFw3/FxhNuHhhUPfl5Ncmm/sFreQeI6jfO2jNKT
 xciWXTc9QWX7xotRs+7WBiyhiy83WfS0iua0/CY9wFxUHnot2NHRVR8IKXKYB5A61CvN7sjRTt0
 Q1Eyo6Bbbe/MKSGrXUqqc/sUvHu9alLpZYLjmKZr9fErsJr56mrw/h7p8Ptt2psdUwlRWk7oi9l
 v7Cu+3FXPHRwVN6oEkVR4JDuAo/pPGHkwBo0+/pGA7bThrb6YdWQz5hj87zSIwXNgRZFDBSqaVY
 nuoorI6PslcNM8zucU/KjXyP2t/eJ5KL6e741YtUZug5x8+1i9YAI4k/QJUN7SIREKfmsg9QhHH
 IofOAICPwNKlOE6fslcW8DrgLfa93qpunjLqX
X-Google-Smtp-Source: AGHT+IHikYuutDHxa9GsZUX8Oj9STSfqV8tQSiXzShOca4pwW6iX0+FaUUlzMM/yxkYK03NB7sLVHA==
X-Received: by 2002:a05:6000:420f:b0:3a5:2257:17b4 with SMTP id
 ffacd0b85a97d-3b60e55003amr13660469f8f.55.1753021851566; 
 Sun, 20 Jul 2025 07:30:51 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25437sm7477499f8f.10.2025.07.20.07.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 07:30:51 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Andrea Cervesato <andrea.cervesato@mailbox.org>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 20 Jul 2025 16:30:47 +0200
Message-ID: <20250720143047.1447676-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753021852; x=1753626652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zaafrwKWYm4AQbvRL3V2BnvsJDYB6WpQ8SW0rMt7Oso=;
 b=FR48DVRqscigIlccrhlCzOE0Dv0Ul2IDzUCA+aEfCaRSNUQ4ouh7lhneh8/9ReAdWl
 8PcZS1i5Hfh0MKoMhELmi+qSosqOkon5iPZxFHU9do9YaY0mMjqJP5nEtZrdcXwwEWAz
 J4KNArRFeJNvPU/z/fhq5QoypNcnKMLe6rFdAl5Jfge9wmojTlFI50Xh25hfL0EGgOQS
 A7cvpGRyCPj0dLXpRBwLlcggNDGOzBlJ4OGOQc4T4SijzEflqlyvragro1ykeBz01fiP
 254KLm1jaxH7N0bZfNobRvh/wrp+8tD2GiyIQILxNhtJTHMKRAG4xSZGLRYyqZRb8e9Y
 nQZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FR48DVRq
Subject: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: backport musl
 build fixes
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
v1: https://lore.kernel.org/buildroot/20250718040903.1386179-1-petr.vorel@gmail.com/

Changes v1->v2:
Add LTP_TESTSUITE_AUTORECONF = YES (Julien)

Hi Julien, all,

Yes, the following command reproduce the problem:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_BUILDROOT_MUSL=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_LATEST_VERSION=y
    BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
    BR2_PACKAGE_LTP_TESTSUITE=y
    EOF
    make olddefconfig
    make ltp-testsuite

which got fixed by this patch.

Kind regards,
Petr

 ...ure-Fix-build-on-kernel-6.14-headers.patch | 51 ++++++++++++++++++
 ...002-statmount02-Remove-linux-btrfs.h.patch | 52 +++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.mk        |  3 ++
 3 files changed, 106 insertions(+)
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
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 1a401c0421..265b7eda70 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -92,4 +92,7 @@ endef
 
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED_TESTCASES
 
+# 0001-configure-Fix-build-on-kernel-6.14-headers.patch
+LTP_TESTSUITE_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
