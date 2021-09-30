Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61171C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:38:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 281AD619E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 18:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 281AD619E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB55841B7;
	Thu, 30 Sep 2021 18:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lChub0OLtX-9; Thu, 30 Sep 2021 18:38:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD28841B9;
	Thu, 30 Sep 2021 18:38:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39AAF1BF289
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2826A4019A
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 18:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hi2R2Pt_Q63a for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 18:38:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B3FF40181
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 18:38:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h15so10026992wrc.3
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rPSJKtQYWl62UdpGtqZCP0pF+P8RyOOKJtDZnfBcs8g=;
 b=Ap8AxN0w5gN8dA2Jie3cVjtwAGg3DDJdhuq9PVn5YacjFNNwknGnOtY7DwTFGTF0UA
 3RV/5fNCxnSk+ynehBpmilNbwUuUDJffKnWcpNR8aWdJQbl/TWDiDwz3a0a1sz/Sctkr
 iMKVa+eiTwEDJi6KKvev24vJzXw94LAlzcQAHU3mTXYx2MjnN0o+bc6sUXzF1pNGoFkh
 glDtMwLGLXrQTx6uYkoAeRB5GDiNBC+kY8G4wSu7Ef1DJqtFUvdWMUOZE1BC+P4Mx/qt
 AV4E+OH5b4y/Sh1CNu/i+ue/nGEEE3Lkv/IK890/acxjond3NcEMLxS2KI5fXQ6TgD0o
 3z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rPSJKtQYWl62UdpGtqZCP0pF+P8RyOOKJtDZnfBcs8g=;
 b=Tz191KQuFrEnQ0tAk+RpCp54/pfrCAqXR5hGec0Lc5K4kfJuY3IktpYlvnBZ8GjQYn
 PCSP9iZjYfUyXiyk/aTM7Qmtnb4Sq/D/glhy9bpgYG2mtLxUAAUkiqt10sfkwCkD0FVT
 Xv4Dxb6rmcRc0oBNRnu6P/Gkwcnsz6aNDmOdfdHGK/OP933OBO/VxpOUH0s11TuZJvAH
 eIz1O7WF4f5IlLSSflZco1R1HIMLlZWiIOSUsreKWf4KLXPB2ONB5XQya2uAqPp+Fns4
 EgdEMWmGTwhWOsaIq3JONMQd/G4Ud79sYEqjtTqg6yh22cOPsVV/q17Hq8W+QJeJQ9Ku
 sDRw==
X-Gm-Message-State: AOAM532AHGijf+d9MXeaLsaLT0vrh6o8g2sJAUth9LBNoChIcqWgatRu
 x5NMnSMbeSs7lzIWvUmi9bEsgRJX/TE=
X-Google-Smtp-Source: ABdhPJwcmBo0DRKE/XCxJ/EObbZobrFIZVyTr23STZviDAwOaouNILEpmXB4h948bsMSdb5IQ6lTzw==
X-Received: by 2002:a05:6000:8e:: with SMTP id
 m14mr7834531wrx.308.1633027127371; 
 Thu, 30 Sep 2021 11:38:47 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id l16sm3932312wmj.33.2021.09.30.11.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:38:46 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 20:38:36 +0200
Message-Id: <20210930183836.25592-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20210927
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* Update unsupported testcases for musl (process.c has been removed in
this release)

* refresh 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
  (unfortunately still needed, it'd be great to update all toolchains)

* Backport fix after this release:
  - 3 patches for build fix on sourcery-arm
  - functional fix from e42149e28 ("lib: fix MemAvailable parsing")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 61 +++++++++++--------
 .../0002-lib-fix-MemAvailable-parsing.patch   | 36 +++++++++++
 ...-lapi-rtnetlink.h-Fix-include-guards.patch | 37 +++++++++++
 ...f_addr.h-and-reuse-it-in-rtnetlink.h.patch | 58 ++++++++++++++++++
 ...0005-lapi-if_addr.h-Define-IFA_FLAGS.patch | 60 ++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.hash      |  6 +-
 package/ltp-testsuite/ltp-testsuite.mk        |  3 +-
 7 files changed, 231 insertions(+), 30 deletions(-)
 create mode 100644 package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch
 create mode 100644 package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch
 create mode 100644 package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
 create mode 100644 package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch

diff --git a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
index 2893026c03..246e35ad7d 100644
--- a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
+++ b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
@@ -1,7 +1,7 @@
-From ac3e262cba81889c0bb04ce87a50a1709f2726e7 Mon Sep 17 00:00:00 2001
+From bee452dfa2a34ba7df7db677e5673cbdcd23f61e Mon Sep 17 00:00:00 2001
 From: Petr Vorel <petr.vorel@gmail.com>
 Date: Thu, 1 Oct 2020 23:28:39 +0200
-Subject: [PATCH] lapi: Add sysinfo.h to fix build with MUSL libc
+Subject: [PATCH 1/5] lapi: Add sysinfo.h to fix build with MUSL libc
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -27,7 +27,9 @@ x86_64-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: origin
 
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 
-[ upstream status: https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-petr.vorel@gmail.com/
+[ upstream status:
+https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-petr.vorel@gmail.com/,
+rebased for 20210927 ]
 
 But this patch is not going to get upstreamed because it got fixed in Linux kernel:
 a85cbe6159ff "uapi: move constants from <linux/kernel.h> to <linux/const.h>"
@@ -36,6 +38,8 @@ This patch was also backported to stable and LTS versions,
 which we use since buildroot 54584d233b "{linux, linux-headers}: bump
 5.{4, 10}.x 4.{4, 9, 14, 19} series".
 We just wait for all musl based toolchains to be rebuilt. ]
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  include/lapi/sysinfo.h                        | 22 +++++++++++++++++++
  include/tst_safe_macros.h                     |  2 +-
@@ -46,7 +50,8 @@ We just wait for all musl based toolchains to be rebuilt. ]
  testcases/kernel/syscalls/sysinfo/sysinfo01.c |  2 +-
  testcases/kernel/syscalls/sysinfo/sysinfo02.c |  2 +-
  testcases/kernel/syscalls/sysinfo/sysinfo03.c |  2 +-
- 9 files changed, 30 insertions(+), 8 deletions(-)
+ .../interfaces/pthread_cond_broadcast/1-2.c   |  2 +-
+ 10 files changed, 31 insertions(+), 9 deletions(-)
  create mode 100644 include/lapi/sysinfo.h
 
 diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
@@ -78,7 +83,7 @@ index 000000000..d0e0e93d7
 +
 +#endif /* SYSINFO_H__ */
 diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
-index ee3df4142..3cb1623f9 100644
+index d99441c86..0d26e9d45 100644
 --- a/include/tst_safe_macros.h
 +++ b/include/tst_safe_macros.h
 @@ -12,7 +12,7 @@
@@ -111,7 +116,7 @@ index a5b6bc504..20d01d304 100644
  char *safe_basename(const char *file, const int lineno,
  		    void (*cleanup_fn) (void), char *path)
 diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
-index dd09db490..085392365 100644
+index 69077861f..ae1cad29b 100644
 --- a/lib/tst_memutils.c
 +++ b/lib/tst_memutils.c
 @@ -5,11 +5,11 @@
@@ -148,64 +153,70 @@ index 9676ea4b5..33b2ac822 100644
  
  #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
 diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
-index 962554163..aa4d3bc91 100644
+index 263b8e78b..4fa52e6ea 100644
 --- a/testcases/kernel/syscalls/madvise/madvise06.c
 +++ b/testcases/kernel/syscalls/madvise/madvise06.c
-@@ -41,7 +41,7 @@
+@@ -46,7 +46,7 @@
  #include <errno.h>
  #include <stdio.h>
  #include <sys/mount.h>
 -#include <sys/sysinfo.h>
 +#include "lapi/sysinfo.h"
  #include "tst_test.h"
+ #include "tst_cgroup.h"
  
- #define CHUNK_SZ (400*1024*1024L)
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
-index 2ea44a2be..a95066bf5 100644
+index 2ea44a2be..a237345ef 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
-@@ -69,9 +69,9 @@
+@@ -69,7 +69,7 @@
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <sys/signal.h>
 -#include <sys/sysinfo.h>
++#include "lapi/sysinfo.h"
  
  #include "test.h"
-+#include "lapi/sysinfo.h"
  
- void setup();
- void cleanup();
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
-index 678b8f1d3..5ce65d20e 100644
+index 7ad0e8bdc..61fa1ab75 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
-@@ -65,10 +65,10 @@
+@@ -65,7 +65,7 @@
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <sys/signal.h>
 -#include <sys/sysinfo.h>
++#include "lapi/sysinfo.h"
  #include <stdint.h>
  
  #include "test.h"
-+#include "lapi/sysinfo.h"
- 
- #define INVALID_ADDRESS ((uintptr_t)-1)
- 
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
-index af7cb6421..3b61a05b1 100644
+index af7cb6421..dc5ae65e3 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
-@@ -13,9 +13,9 @@
+@@ -13,7 +13,7 @@
  
   */
  
 -#include <sys/sysinfo.h>
++#include "lapi/sysinfo.h"
  #include "lapi/namespaces_constants.h"
  #include "lapi/posix_clocks.h"
-+#include "lapi/sysinfo.h"
  #include "tst_test.h"
+diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
+index 22e7c3638..572701f9f 100644
+--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
++++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
+@@ -43,7 +43,7 @@
+ #include <sys/wait.h>
+ #include <semaphore.h>
+ #ifdef	__linux__
+-#include <sys/sysinfo.h>
++#include "lapi/sysinfo.h"
+ #endif
  
- static int offsets[] = {
+ #include "../testfrmw/testfrmw.h"
 -- 
-2.30.0
+2.33.0
 
diff --git a/package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch b/package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch
new file mode 100644
index 0000000000..bf0c71e45d
--- /dev/null
+++ b/package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch
@@ -0,0 +1,36 @@
+From 29a096fe2bd356f419bd8a8404d5b652c996b92f Mon Sep 17 00:00:00 2001
+From: Ralph Siemsen <ralph.siemsen@linaro.org>
+Date: Mon, 27 Sep 2021 22:18:50 -0400
+Subject: [PATCH 2/5] lib: fix MemAvailable parsing
+
+The amount of available memory was not being returned correctly, which
+resulted in tests being executed when they should have been skipped.
+
+Fixes: 8759f4 ("lib: adjust the tmpfs size according to .dev_min_size and MemAvailable")
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+Signed-off-by: Li Wang <liwang@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: e42149e28 ("lib: fix MemAvailable parsing") ]
+---
+ lib/tst_memutils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
+index ae1cad29b..a46de78f5 100644
+--- a/lib/tst_memutils.c
++++ b/lib/tst_memutils.c
+@@ -65,9 +65,9 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
+ 
+ long long tst_available_mem(void)
+ {
+-	long long mem_available;
++	unsigned long long mem_available = 0;
+ 
+-	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
++	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %llu",
+ 		&mem_available)) {
+ 		mem_available = SAFE_READ_MEMINFO("MemFree:")
+ 			+ SAFE_READ_MEMINFO("Cached:");
+-- 
+2.33.0
+
diff --git a/package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch b/package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch
new file mode 100644
index 0000000000..8a09c3bf8d
--- /dev/null
+++ b/package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch
@@ -0,0 +1,37 @@
+From 881709d1e4d1bba5bf8ca365bc058f338bd72dc2 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:38:42 +0200
+Subject: [PATCH 3/5] lapi/rtnetlink.h: Fix include guards
+
+Fixes: 5fea0638a ("lapi: Add missing IFA_FLAGS")
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: a2a212cf8 ("lapi/rtnetlink.h: Fix include guards") ]
+---
+ include/lapi/rtnetlink.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
+index 8a1b5385b..04e9ad51a 100644
+--- a/include/lapi/rtnetlink.h
++++ b/include/lapi/rtnetlink.h
+@@ -1,8 +1,8 @@
+ // SPDX-License-Identifier: GPL-2.0-or-later
+ /* Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com> */
+ 
+-#ifndef LAPI_IF_ADDR_H__
+-# define LAPI_IF_ADDR_H__
++#ifndef LAPI_RTNETLINK_H__
++# define LAPI_RTNETLINK_H__
+ 
+ #include <linux/rtnetlink.h>
+ 
+@@ -10,4 +10,4 @@
+ # define IFA_FLAGS 8
+ #endif
+ 
+-#endif	/* LAPI_IF_ADDR_H__ */
++#endif	/* LAPI_RTNETLINK_H__ */
+-- 
+2.33.0
+
diff --git a/package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch b/package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
new file mode 100644
index 0000000000..6048390e9c
--- /dev/null
+++ b/package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
@@ -0,0 +1,58 @@
+From b13440627bd4a9f060a33d400a47a40daa2bc12e Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:37:19 +0200
+Subject: [PATCH 4/5] lapi: Create if_addr.h and reuse it in rtnetlink.h
+
+There will be fix in next commit for missing IFA_F_NOPREFIXROUTE which
+requires creating lapi/if_addr.h. Thus move IFA_FLAGS to lapi/if_addr.h,
+as it belongs there and reuse lapi/if_addr.h in lapi/rtnetlink.h just
+like <linux/rtnetlink.h> includes <linux/if_addr.h>.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: https://lore.kernel.org/ltp/20210930183058.5240-3-petr.vorel@gmail.com/T/#u ]
+---
+ include/lapi/if_addr.h   | 16 ++++++++++++++++
+ include/lapi/rtnetlink.h |  5 +----
+ 2 files changed, 17 insertions(+), 4 deletions(-)
+ create mode 100644 include/lapi/if_addr.h
+
+diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
+new file mode 100644
+index 000000000..4e50a0a4e
+--- /dev/null
++++ b/include/lapi/if_addr.h
+@@ -0,0 +1,16 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
++ */
++
++#ifndef LAPI_IF_ADDR_H__
++#define LAPI_IF_ADDR_H__
++
++#include <linux/if_addr.h>
++
++#ifndef IFA_FLAGS
++# define IFA_FLAGS 8
++#endif
++
++
++#endif /* LAPI_IF_ADDR_H__ */
+diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
+index 04e9ad51a..089bf1a0d 100644
+--- a/include/lapi/rtnetlink.h
++++ b/include/lapi/rtnetlink.h
+@@ -5,9 +5,6 @@
+ # define LAPI_RTNETLINK_H__
+ 
+ #include <linux/rtnetlink.h>
+-
+-#ifndef IFA_FLAGS
+-# define IFA_FLAGS 8
+-#endif
++#include "lapi/if_addr.h"
+ 
+ #endif	/* LAPI_RTNETLINK_H__ */
+-- 
+2.33.0
+
diff --git a/package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch b/package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
new file mode 100644
index 0000000000..6229aa3840
--- /dev/null
+++ b/package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
@@ -0,0 +1,60 @@
+From 9e357fb4fc00ab9c303e314b85b9ae3836141f81 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 29 Sep 2021 19:56:29 +0200
+Subject: [PATCH 5/5] lapi/if_addr.h: Define IFA_FLAGS
+
+and use it in icmp_rate_limit01.c.
+
+This fixes error on toolchains with very old kernel headers, e.g.
+Buildroot sourcery-arm:
+
+icmp_rate_limit01.c:82:3: error: 'IFA_F_NOPREFIXROUTE' undeclared (first use in this function)
+   IFA_F_NOPREFIXROUTE);
+
+Fixed because IFA_F_NOPREFIXROUTE was added in 3.14 and the oldest
+system we still support is Cent0S 7 with 3.10 kernel.
+
+NOTE: Cent0S 7 is obviously heavily patched thus it contains
+IFA_F_NOPREFIXROUTE and therefore CI build didn't catch this error.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: https://lore.kernel.org/ltp/20210930183058.5240-4-petr.vorel@gmail.com/T/#u ]
+---
+ include/lapi/if_addr.h            | 3 +++
+ testcases/cve/icmp_rate_limit01.c | 3 ++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
+index 4e50a0a4e..0f7e44784 100644
+--- a/include/lapi/if_addr.h
++++ b/include/lapi/if_addr.h
+@@ -12,5 +12,8 @@
+ # define IFA_FLAGS 8
+ #endif
+ 
++#ifndef IFA_F_NOPREFIXROUTE
++# define IFA_F_NOPREFIXROUTE	0x200
++#endif
+ 
+ #endif /* LAPI_IF_ADDR_H__ */
+diff --git a/testcases/cve/icmp_rate_limit01.c b/testcases/cve/icmp_rate_limit01.c
+index b3a237b30..3ada32675 100644
+--- a/testcases/cve/icmp_rate_limit01.c
++++ b/testcases/cve/icmp_rate_limit01.c
+@@ -27,11 +27,12 @@
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+-#include <linux/if_addr.h>
+ #include <linux/errqueue.h>
+ 
+ #include <sched.h>
+ #include <limits.h>
++
++#include "lapi/if_addr.h"
+ #include "tst_test.h"
+ #include "tst_netdevice.h"
+ 
+-- 
+2.33.0
+
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index ed2a50cd4f..a9f3cfdfe1 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,5 +1,5 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20210524/ltp-full-20210524.tar.xz.sha1
-sha1 08d84f8ac3ba0c800f3070768c651703869105d7  ltp-full-20210524.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20210927/ltp-full-20210927.tar.xz.sha1
+sha1 dad7737f609e358c4060cb446b9cae5c026fc137  ltp-full-20210927.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  831678c64b85a8c24957c71632752537b2266890f2d2f352da9ed0ec45458189  ltp-full-20210524.tar.xz
+sha256  779e9e5cc9af4f2b3d4cb32f5439ebd635504d2c4591bf900f0942dac290ed15  ltp-full-20210927.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index badd161d5a..3d8fe3b78c 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20210524
+LTP_TESTSUITE_VERSION = 20210927
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
@@ -70,7 +70,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_UCLIBC) += \
 	testcases/misc/math/float/float_bessel.c
 
 LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_MUSL) += \
-	testcases/kernel/sched/process_stress/process.c \
 	testcases/kernel/syscalls/confstr/confstr01.c \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
