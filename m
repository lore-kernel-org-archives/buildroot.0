Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A06C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 09:33:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C296120E
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 09:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30C296120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE3480DC8;
	Fri,  5 Nov 2021 09:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PN3qYsJGrSte; Fri,  5 Nov 2021 09:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D11980D82;
	Fri,  5 Nov 2021 09:33:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E95C21BF3CD
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 09:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D76C84043A
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 09:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMnXjTZdOBiJ for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 09:33:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EAA3400AF
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 09:33:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n29so1021915wra.11
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tv2W4HTuGSIJifZp17UEDWlx9tZ31IW3S/9q1u0g3ps=;
 b=DHUYdT5vIca9zVrbRJBAHA2MUQ1NNwPfqMlF/6YnRaWz+HlfkrVPJcdUdbK6AqYX7u
 lwCdjXjcxaqekF2jPq107n8th/9irhWSCAluUO4hxZpP/sTf94R34Qda0yVqko9P9Bjf
 0dP7zdz500VL+d6KG6TFhhXy72tUna2SWJzc6O6GUmT9n5iTU12oK1MbOYdscAPtkY/b
 DVD4jrJHhaTm5KNg8pEhix017cH6xhN/FrP1wYVrsyMOrcu+2ooVNuPNaOA9Cuw7zxZ3
 z0uMXi1aN7fwOHB0yKFL4hjF9WJqXluDKzm6j6ut6YkFdBaW6F0LOws93uMyIqkUEzy8
 1EzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tv2W4HTuGSIJifZp17UEDWlx9tZ31IW3S/9q1u0g3ps=;
 b=LZrLuOecs6NlGjX0Nb+TIXuYnSXM0NKYqDD3CD2cmG8TcSz8SEN4hZOwSjkhHz2ohL
 Z//ZLp8LiIGKHHj/rhISS2hl1MD3MCBe2Bg1O/G3T+ZKpXbeCYKnfly3jDUXv5mUosLc
 MimqyyDYDT2Q4wVHZJK77jw3aysKJpYaV5Zk2+ntJD4Du+5ibSQ6qkSi1BsEjmZGPIHs
 /HOfy6VzNZWZ0u7z9km0inTJ+XlY+ClYo10XCiSdmiAxkYQ3i0GlYCNhtwSlu6SwXHyc
 mO7Gdyg32lhmCNj/UJTlJtVdxRFgfLG+dlYUYSualxzVb9O+wHULIFAs9uxzqfZjjyo+
 05wg==
X-Gm-Message-State: AOAM533jhcGuIJCh5GPG0f/mhjtZfo8kwZafPsMdSndBv4gc5/7pTucA
 FyGEz864txy1t+9y7rMd5Kx+o/4T4mY=
X-Google-Smtp-Source: ABdhPJxgBfAnn5nEU5UV4X0kuIhLEVAQU0YCrvliN5Y5ASWaluRMsdoJE4b2KCBD4IF3HzPFLd6dRQ==
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr21528142wry.424.1636104806132; 
 Fri, 05 Nov 2021 02:33:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t17sm254686wmq.13.2021.11.05.02.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 02:33:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 10:31:35 +0100
Message-Id: <20211105093135.2239592-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liburcu: fix build with gcc 4.8
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following lttng-tools build failure raised since bump of liburcu
to version 0.13.0 in commit 9cedbcf494e647371f92368014d31091848772bb and
https://github.com/urcu/userspace-rcu/commit/109267f653502cf5ef5ada5d098167b9726daa2d:

In file included from ../../../src/common/error.h:16:0,
                 from directory-handle.c:9:
../../../src/common/error.h:44:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'struct'
 extern DECLARE_URCU_TLS(struct log_time, error_log_time);
                         ^

Fixes:
 - http://autobuild.buildroot.org/results/70d645593c9e164d0d044da1b0128cda9c96e830

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-don-t-use-C-thread_local-on-MacOs.patch | 41 ++++++++++++++
 ...-Thread-local-storage-except-on-MSVC.patch | 53 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
 create mode 100644 package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch

diff --git a/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch b/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
new file mode 100644
index 0000000000..002df34d70
--- /dev/null
+++ b/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
@@ -0,0 +1,41 @@
+From e915ab84fd0c02d37504f3eb1e1f3be93ea6dc37 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 9 Sep 2021 12:11:16 -0400
+Subject: [PATCH] fix: don't use C++ thread_local on MacOs
+
+Recent versions of Apple's clang++ do support 'thread_local' but the
+implementation generates additional helper symbols. This is a problem
+when accessing an extern TLS variable in a C++ compile unit that is
+provided by a C library that doesn't have those extra symbols.
+
+Fallback to using '__thread' on MacOs.
+
+Change-Id: I87cb5b3c9293f7bf66f7115f453b546dd793a449
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+[Retrieved from:
+https://github.com/urcu/userspace-rcu/commit/e915ab84fd0c02d37504f3eb1e1f3be93ea6dc37]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/urcu/tls-compat.h | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/include/urcu/tls-compat.h b/include/urcu/tls-compat.h
+index 24ef1b9a..25cf375a 100644
+--- a/include/urcu/tls-compat.h
++++ b/include/urcu/tls-compat.h
+@@ -34,7 +34,12 @@ extern "C" {
+ 
+ #ifdef CONFIG_RCU_TLS
+ 
+-#if defined (__cplusplus) && (__cplusplus >= 201103L)
++/*
++ * Don't use C++ 'thread_local' on MacOs, the implementation is incompatible
++ * with C and will result in a link error when accessing an extern variable
++ * provided by the C library from C++ code.
++ */
++#if defined (__cplusplus) && (__cplusplus >= 201103L) && !defined(__APPLE__)
+ # define URCU_TLS_STORAGE_CLASS	thread_local
+ #elif defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)
+ # define URCU_TLS_STORAGE_CLASS	_Thread_local
diff --git a/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch b/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
new file mode 100644
index 0000000000..aa71cf2f20
--- /dev/null
+++ b/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
@@ -0,0 +1,53 @@
+From 2e359284497c361e3208501fc70d49b2c54dc4ef Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 14 Sep 2021 10:41:08 -0400
+Subject: [PATCH] Always use '__thread' for Thread local storage except on MSVC
+
+Use the GCC extension '__thread' [1] for Thread local storage on all C
+and C++ compilers except MSVC.
+
+While C11 and C++11 respectively offer '_Thread_local' and
+'thread_local' as potentialy faster implementations, they offer no
+guarantees of compatibility when used in a library interface which might
+be used by both C and C++ client code.
+
+[1] https://gcc.gnu.org/onlinedocs/gcc/Thread-Local.html
+
+Change-Id: If4fe8bcdbda24b21dedf382112bd5c5f836c00c8
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+[Retrieved from:
+https://github.com/urcu/userspace-rcu/commit/2e359284497c361e3208501fc70d49b2c54dc4ef]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/urcu/tls-compat.h | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/include/urcu/tls-compat.h b/include/urcu/tls-compat.h
+index 25cf375a..a2c94ded 100644
+--- a/include/urcu/tls-compat.h
++++ b/include/urcu/tls-compat.h
+@@ -35,15 +35,14 @@ extern "C" {
+ #ifdef CONFIG_RCU_TLS
+ 
+ /*
+- * Don't use C++ 'thread_local' on MacOs, the implementation is incompatible
+- * with C and will result in a link error when accessing an extern variable
+- * provided by the C library from C++ code.
++ * Default to '__thread' on all C and C++ compilers except MSVC. While C11 has
++ * '_Thread_local' and C++11 has 'thread_local', only '__thread' seems to have
++ * a compatible implementation when linking public extern symbols across
++ * language boundaries.
++ *
++ * For more details, see 'https://gcc.gnu.org/onlinedocs/gcc/Thread-Local.html'.
+  */
+-#if defined (__cplusplus) && (__cplusplus >= 201103L) && !defined(__APPLE__)
+-# define URCU_TLS_STORAGE_CLASS	thread_local
+-#elif defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)
+-# define URCU_TLS_STORAGE_CLASS	_Thread_local
+-#elif defined (_MSC_VER)
++#if defined(_MSC_VER)
+ # define URCU_TLS_STORAGE_CLASS	__declspec(thread)
+ #else
+ # define URCU_TLS_STORAGE_CLASS	__thread
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
