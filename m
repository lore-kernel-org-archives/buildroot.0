Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D37C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35F540800;
	Thu, 27 Aug 2026 19:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VOS39vcPsQt; Thu, 27 Aug 2026 19:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787857223;
	bh=6CG39TCV3/+URGTTUxbZ3htc4qe/wISjH3tFoTYiTFQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0mpnkdUC8cHdmYCT1YsDmJn4BX+xa63YEDZ3sK9OSxO9BaIR1tpyMvPo8y0ePwmK
	 W/N33plkAa8SakqY3XJ1gNc1XBrCc4rnmr9B5FctevrMCx+tUt3sdmuwHnnEzgxB9M
	 GfbsB0YhXfWFhoPnXbc0g0fMAunQoFFuRxNMK1rTCJ+dq70Chrme8h8zv61JAnNhLl
	 qbSa7YjScDnRltEml/4sTvTpRAflHBtZMRXA+Sz5qVD1N/w+h2AVjTnrUxo7w7T6ZO
	 XBd3P+16S+YzwVyMPrFbPccDGOJV5CbmUktwnoKoNtx5eLI3IwnfueDwbg8rcQ8/n9
	 APXn1yXOIIvXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F4F407FF;
	Thu, 27 Aug 2026 19:00:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F3DB2C
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A6D7407FF
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBXN9Q6Rhj_w for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=h6uQl09b
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39EA1407E9
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:00:20 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-4b21f71613fso237855b6e.2
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787857220; x=1788462020; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Uxq0gKmP6j1IkKn2OcOsMzoCY+SmgoibwrtvRHY/C/8=;
 b=h6uQl09b7fukzOxpuW/29V155eQS93+FO0m2kfWL9VQzsFKqQ49xt6V64d3h5ff3IT
 +aJ7Qk+JSnMQi8YtZN2fS2rYXp8ewAeq2l5rCgQ88C1ua5cGLAPm3csQNlVgEs1nbwKU
 sS4IRBcxecsacafj/OrCEEtJ+hEwf3Zkqa1Wp1rbssVCt3bzGEFI9PTwjm7sRhJIS2l/
 f3+iO/LlOoMzNzRcBL5q0xroew9t6L1qX4Scw+Sh/IdfoBZlPb8f1OrmpWA2ZoBAvVZl
 I7gDlyFdhT7neDYAvr+QaZR4D6tVlK1QrQCtHMxW7PP4zjH/WofYCt4MSXv7OeBmcZEv
 790g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787857220; x=1788462020;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Uxq0gKmP6j1IkKn2OcOsMzoCY+SmgoibwrtvRHY/C/8=;
 b=i11Y4k2AL1yW0iEiSSUxJbLgxFKUt+fYvG8LVe27ZbYE89ifO1pNqkGu2b2NFkK5sZ
 0Afb/lkrVEFpLTybI0Qdpm5pvguEDdn7vKMX/UFTyUgL/r9/X2kSmGnEW6xZiyaOsphD
 pc7Do0f8vDucr1KTgkeY7BxOiRPD2S+sXy/1ke4wkHRiW4acA1IefvwU7ypoj6uZuwv6
 ToNzzbOJPUceDud2DPJP8Ry32AlWxUrTj+Ng12x8rCs2QV7PTCa1bMWI0gSRH8eIlijP
 QDsTu0JKkf4XISu6rvuHfvfEuObmHgOtnKNfX28gaXi5rPlahvQmOfTh/edugsQblE2K
 e3sw==
X-Gm-Message-State: AFuF++nGdqiN5EvZ8YmA0Y+dY3AcKi46MbHXiJgBT9WAjZ4K8f/7a5kI
 PRZzEEbMrlWQh3yClrfB8qJ8dQBgrg8UxLWLFpofhUhkSAQEXxj0RmSyazQ7pscH
X-Gm-Gg: AR+sD13BU6P1Rl/nTXvheYfU20qa7wT9MQ0ZlTYUzgZI7KkVOmfBOZhHAk9gjnwswV7
 cPQHr2wuqjt74E3Z/t1VAp7n6j92JIcfYvmReDnVe2kiIILLHBUR16XnzoLOp6T1a6qU8R+JuDR
 unjDAeITomxZn50hZ3rbRcxmLI2ZlRHA3S+wd1Cvo/x/hzX5korMdIEk8j6l8tEzwPMQMQM/c+4
 4WYHs7cVHVBAH5RKNd8TTKafzcS7Gs2MnLRz2Y82t+TvxyUNtCkhiGZUkYeoHE2XyUwtfkdznBI
 7BAYEe0YkqUCVyxtSul4hKIbUWln8Kg7xU00HT57Gn1ItlDENDSs9FpZdebuJhoZZOz/GNu1hoK
 Ci51v3m9YpNClZpwOts8OfLH/IxJA2fVGUOlLTRaL85KaRkPmB2bBurLoq+7tmPmk4FSsz989ww
 /EWovHlpJTyVlnoADagkuWISjvXwBCkIfh/yjka78IWBjhBfznVFfcAG3esKdJ8nV63CQTlCsQc
 GNz3l0AWsq6x1G9f5oCCAMd+/CbMuHuChvxNRV8EKuQF7iSHhopF4QizFn8AieJymE0ouhoGZ4u
X-Received: by 2002:a05:6808:5094:b0:48a:ddd4:d36f with SMTP id
 5614622812f47-4b39803e01fmr1213446b6e.8.1787857219596; 
 Thu, 27 Aug 2026 12:00:19 -0700 (PDT)
Received: from 4769c4e2f3e3.nos.boeing.com
 (138-28-90-168.fttx.imoncommunications.net. [138.28.90.168])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b3984e0d40sm263428b6e.9.2026.08.27.12.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 12:00:17 -0700 (PDT)
From: matt@thewebers.ws
To: buildroot@buildroot.org
Cc: "Matthew Weber" <matthew.l.weber3@boeing.com>,
 Clayton Shotwell <clayton.shotwell@boeing.com>
Date: Thu, 27 Aug 2026 18:59:51 +0000
Message-Id: <20260827185951.3180679-4-matt@thewebers.ws>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827185951.3180679-1-matt@thewebers.ws>
References: <20260827185951.3180679-1-matt@thewebers.ws>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] support/testing: libc-test: add POSIX
 functional test cases
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
Content-Type: multipart/mixed; boundary="===============1069323229053323536=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1069323229053323536==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: "Matthew Weber" <matthew.l.weber3@boeing.com>

Extend the libc-test runtime test with test cases exercising the
POSIX functional tests added by patch 0002:
- pthread attributes (init, destroy, get/set for scope, stack, sched)
- pthread operations (self, sigmask, testcancel, mutex_trylock)
- POSIX timers and message queues
- Scheduler and time functions
- Process (execve, posix_spawnattr_setflags)

Also enables additional build options needed by some tests:
- BR2_PACKAGE_BASH (for execve test's #!/bin/bash)
- BR2_PACKAGE_BUSYBOX_SHOW_OTHERS (bash alongside busybox)
- BR2_TARGET_TZ_INFO (for timezone-dependent time tests)

Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@boeing.com>
---
 .../testing/tests/package/test_libc_test.py   | 117 +++++++++++++++++-
 1 file changed, 115 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_libc_test.py b/support/testing/tests/package/test_libc_test.py
index e023b10e46..eaac767424 100644
--- a/support/testing/tests/package/test_libc_test.py
+++ b/support/testing/tests/package/test_libc_test.py
@@ -31,6 +31,18 @@ import infra.basetest
 # | Test                | Reason                                         |
 # +---------------------+------------------------------------------------+
 # | fcntl               | Permission/lock tests bypassed by root         |
+# | pthread_mutex_pi    | Priority inheritance scheduling as root         |
+# | mq_open             | EACCES test — root bypasses permission checks  |
+# +---------------------+------------------------------------------------+
+#
+# Tests enabled by additional packages:
+# +---------------------+------------------------------------------------+
+# | Test                | Enabled by                                     |
+# +---------------------+------------------------------------------------+
+# | execve              | BR2_PACKAGE_BASH + BR2_PACKAGE_BUSYBOX_SHOW_OTHERS |
+# | asctime_r           | BR2_TARGET_TZ_INFO + BR2_TARGET_LOCALTIME=UTC  |
+# | ctime_r             | BR2_TARGET_TZ_INFO + BR2_TARGET_LOCALTIME=UTC  |
+# | localtime_r         | BR2_TARGET_TZ_INFO + BR2_TARGET_LOCALTIME=UTC  |
 # +---------------------+------------------------------------------------+
 
 class TestLibcTestAarch64(infra.basetest.BRTest):
@@ -48,6 +60,11 @@ class TestLibcTestAarch64(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_LIBC_TEST=y
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BASH=y
+        BR2_TARGET_TZ_INFO=y
+        BR2_TARGET_TZ_ZONELIST="default"
+        BR2_TARGET_LOCALTIME="UTC"
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -70,7 +87,99 @@ class TestLibcTestAarch64(infra.basetest.BRTest):
         # Verify test executables are installed
         self.assertRunOk(f"test -x {test_dir}/src/common/runtest.exe")
 
-        # --- Upstream functional tests ---
+        # Set TZ=UTC so time functions that only need a valid TZ can work
+        self.assertRunOk("export TZ=UTC")
+
+        # --- Additional POSIX functional tests (patch 0002) ---
+
+        # pthread attributes
+        p0002_pthread_attr = [
+            "pthread_attr_init",
+            "pthread_attr_destroy",
+            "pthread_attr_getdetachstate",
+            "pthread_attr_setdetachstate",
+            "pthread_attr_getguardsize",
+            "pthread_attr_setguardsize",
+            "pthread_attr_getinheritsched",
+            "pthread_attr_setinheritsched",
+            "pthread_attr_getschedparam",
+            "pthread_attr_setschedparam",
+            "pthread_attr_getschedpolicy",
+            "pthread_attr_setschedpolicy",
+            "pthread_attr_getscope",
+            "pthread_attr_setscope",
+            "pthread_attr_getstack",
+            "pthread_attr_setstack",
+            "pthread_attr_getstacksize",
+            "pthread_attr_setstacksize",
+        ]
+
+        # pthread operations
+        p0002_pthread_ops = [
+            "pthread_self",
+            "pthread_sigmask",
+            "pthread_testcancel",
+            "pthread_mutex_trylock",
+            "pthread_mutexattr_init",
+            "pthread_mutexattr_destroy",
+            "pthread_mutexattr_getprotocol",
+            "pthread_mutexattr_setprotocol",
+            "pthread_getcpuclockid",
+        ]
+
+        # POSIX timers
+        p0002_timers = [
+            "timer_create",
+            "timer_delete",
+            "timer_gettime",
+            "timer_settime",
+            "timer_getoverrun",
+        ]
+
+        # POSIX message queues (mq_open skipped — EACCES needs non-root)
+        p0002_mq = [
+            "mq_close",
+            "mq_unlink",
+            "mq_send",
+            "mq_receive",
+            "mq_notify",
+            "mq_getattr",
+            "mq_setattr",
+            "mq_timedsend",
+            "mq_timedreceive",
+        ]
+
+        # Scheduler
+        p0002_sched = [
+            "sched_get_priority_min",
+            "sched_get_priority_max",
+            "sched_rr_get_interval",
+            "sched_yield",
+        ]
+
+        # Time functions
+        # gmtime_r is UTC-only and works without tzdata
+        # tzset uses POSIX TZ strings (setenv), no tzdata needed
+        # asctime_r, ctime_r, localtime_r enabled by BR2_TARGET_TZ_INFO
+        p0002_time = [
+            "clock_getres",
+            "clock_nanosleep",
+            "gmtime_r",
+            "asctime_r",
+            "ctime_r",
+            "localtime_r",
+            "difftime",
+            "times",
+            "tzset",
+        ]
+
+        # Process (execve enabled by BR2_PACKAGE_BASH — test writes #!/bin/bash)
+        p0002_process = [
+            "execve",
+            "posix_spawnattr_setflags",
+        ]
+
+        # --- Upstream functional tests (safe to run as root in QEMU) ---
 
         upstream_string = [
             "string",
@@ -148,7 +257,11 @@ class TestLibcTestAarch64(infra.basetest.BRTest):
             "vfork",
         ]
 
-        all_tests = (upstream_string + upstream_stdio +
+        # Combine all test lists
+        all_tests = (p0002_pthread_attr + p0002_pthread_ops +
+                     p0002_timers + p0002_mq + p0002_sched +
+                     p0002_time + p0002_process +
+                     upstream_string + upstream_stdio +
                      upstream_stdlib + upstream_pthread +
                      upstream_misc)
 
-- 
2.34.1


--===============1069323229053323536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1069323229053323536==--
