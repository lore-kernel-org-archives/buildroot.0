Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B624AFCC05C
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E6A2613EC;
	Fri,  6 Mar 2026 18:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmfflbz7tRB7; Fri,  6 Mar 2026 18:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9632A613EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822446;
	bh=yec6w4jYgCaPOejyj4PbzH7PqHhYCFHddKG+JVLVa3k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hPkEE/3XCNSD2QcsIISP+ehqFeFToTItjFgrEwvXEIpHyVpT8tfxJ5MqhQ1m0UyEx
	 a+I134W0hGHccWUmHw0WTogkj2bo66oHp1lOyTy6mvnajyJMz5Wo8Z++wlBWjT6qA1
	 RR97wYRwAP9hkbohhFqn4UdzqsA47yHdpR2ztFwshQOlW7qKR7bViKNmy2OTfMDaei
	 zr0gmf1tVOkgPJywQjF+0Ek7Uea2HHdSVu78HNerO7IIfC4VLZPk/iYT3HYGRqFBl6
	 FCUT7JvXuRB1N+S8lyEutQGyVpJy5mBNFpvsr8pH/f5Tlvnk/bJTFihJ3rn4pNldBe
	 7d6tmK9YuRBkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9632A613EE;
	Fri,  6 Mar 2026 18:40:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A3A25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BA87612C8
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkQ18uuuZVXn for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 834A361335
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 834A361335
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98938839D9; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d1cc4f05e4ca6f3ecabfed97d2b67f2ef28b258
X-Git-Newrev: 1f6adca8e0fc2f42a0ac05d52b525711f1054119
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.98938839D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: fix build with
 glibc 2.43
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5416017152423840914=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5416017152423840914==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f6adca8e0fc2f42a0ac05d52b525711f1054119
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t2-define-_GNU_SOURCE-and-include-fcntl.h.patch | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/package/ltp-testsuite/0001-openat2-define-_GNU_SOURCE-and-include-fcntl.h.patch b/package/ltp-testsuite/0001-openat2-define-_GNU_SOURCE-and-include-fcntl.h.patch
new file mode 100644
index 0000000000..e4b654b319
--- /dev/null
+++ b/package/ltp-testsuite/0001-openat2-define-_GNU_SOURCE-and-include-fcntl.h.patch
@@ -0,0 +1,84 @@
+From 767b3e519e85095dfee3a47d15a373a403fe3dab Mon Sep 17 00:00:00 2001
+From: Li Wang <liwang@redhat.com>
+Date: Tue, 3 Feb 2026 10:43:19 +0800
+Subject: [PATCH] openat2: define _GNU_SOURCE and include <fcntl.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On Fedora Rawhide (glibc 2.43+), libc exposes openat2() and struct open_how,
+so our configure script defines HAVE_OPENAT2 and the fallback definition in
+lapi/openat2.h gets skipped. But openat20*.c never included <fcntl.h> (and
+lacked _GNU_SOURCE), so the libc-provided prototype and struct stayed hidden,
+so compilation failed:
+
+  # uname -r
+  6.18.0-65.fc44.x86_64
+
+  # rpm -qf /usr/include/fcntl.h
+  glibc-devel-2.43-1.fc44.x86_64
+
+  # nm -D /usr/lib64/libc.so.6 | grep -w openat2
+  00000000000eb890 W openat2@@GLIBC_2.43
+
+  # make -C testcase/kernel/syscalls/openat2
+  openat201.c:27:62: error: invalid application of ‘sizeof’ to incomplete type ‘struct open_how’
+    27 |         {&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, 0, &how, sizeof(*how)},
+
+Define _GNU_SOURCE and include <fcntl.h> in openat2 tests to make the
+prototype available and fix the build.
+
+Signed-off-by: Li Wang <liwang@redhat.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+
+Upstream: https://github.com/linux-test-project/ltp/commit/767b3e519e85095dfee3a47d15a373a403fe3dab
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ testcases/kernel/syscalls/openat2/openat201.c | 3 +++
+ testcases/kernel/syscalls/openat2/openat202.c | 3 +++
+ testcases/kernel/syscalls/openat2/openat203.c | 3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/openat2/openat201.c b/testcases/kernel/syscalls/openat2/openat201.c
+index ecd63b150e4..40ac2f6d9ad 100644
+--- a/testcases/kernel/syscalls/openat2/openat201.c
++++ b/testcases/kernel/syscalls/openat2/openat201.c
+@@ -4,6 +4,9 @@
+  *
+  * Basic openat2() test.
+  */
++#define _GNU_SOURCE
++#include <fcntl.h>
++
+ #include "tst_test.h"
+ #include "lapi/openat2.h"
+ 
+diff --git a/testcases/kernel/syscalls/openat2/openat202.c b/testcases/kernel/syscalls/openat2/openat202.c
+index 6d1b5a67c7d..329c6a4a5cb 100644
+--- a/testcases/kernel/syscalls/openat2/openat202.c
++++ b/testcases/kernel/syscalls/openat2/openat202.c
+@@ -4,6 +4,9 @@
+  *
+  * openat2() tests with various resolve flags.
+  */
++#define _GNU_SOURCE
++#include <fcntl.h>
++
+ #include "tst_test.h"
+ #include "lapi/openat2.h"
+ 
+diff --git a/testcases/kernel/syscalls/openat2/openat203.c b/testcases/kernel/syscalls/openat2/openat203.c
+index 6ac49ef4c9e..cd0c00d7523 100644
+--- a/testcases/kernel/syscalls/openat2/openat203.c
++++ b/testcases/kernel/syscalls/openat2/openat203.c
+@@ -4,6 +4,9 @@
+  *
+  * Basic openat2() test to check various failures.
+  */
++#define _GNU_SOURCE
++#include <fcntl.h>
++
+ #include "tst_test.h"
+ #include "lapi/openat2.h"
+ 

--===============5416017152423840914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5416017152423840914==--
