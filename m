Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1803CD3423
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 17:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413148576F;
	Fri,  1 May 2026 17:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UP-y1ZG4oOd; Fri,  1 May 2026 17:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D378576B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777655678;
	bh=hLG5H8Jn9DYoO9zYidAdT2yM+dlUgZiBi+gJ33h5BlQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nVMcc18USglc3jTvRdFed2DLmVHV2qmlRXe/bKQ4bVgjY5zTGMRKvzHA6aCr8Tlsq
	 uQxOnaeMXRYMOEKKvpHsgEwnQVPz3LoistGvzUacpYljF09rnqX9UPuuqfUaI2yPyl
	 q2YHqiQkcDvgYZAo3Ya1jpv8tN2QiMK44+vSxNxSw4uJpbVkMt7DT9eLvhuBsWa/gE
	 eQPqMBVU1dgI/h0nmC+ad0FhiYADg4cPh9km8yY1Am/teJDSeHyS4/8bTrb3lvjO2x
	 R3KtCOgBNlbgmF2XPa23ceWBpxR7DujrsfNcpEFNSH6HW0QuGJmQS7l8PCWIeTIlH/
	 i7HJdu0O2xDWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69D378576B;
	Fri,  1 May 2026 17:14:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A718293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 17:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6435A41103
 for <buildroot@buildroot.org>; Fri,  1 May 2026 17:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkhHiGq2B5Vo for <buildroot@buildroot.org>;
 Fri,  1 May 2026 17:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64DE4405EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64DE4405EE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64DE4405EE
 for <buildroot@buildroot.org>; Fri,  1 May 2026 17:14:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A55CCA4C0247;
 Fri,  1 May 2026 19:14:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42852)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIrRg-0000000035j-31jH;
 Fri, 01 May 2026 17:14:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri,  1 May 2026 19:14:32 +0200
Message-ID: <20260501171432.1701736-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777655672;
 bh=Xqdu+DPGn2BQKTGQM527nGUzp7fZdzBku76/BjZBn/c=;
 h=From:To:Cc:Subject:Date:From;
 b=oOmibN1LF+xijUVFaI5h2YVAGiFJzs5UYhd6nOpm6pGfq6mX17LQiOXw28BzIUTGJ
 Tae2mxTJ1LxvHOXpH0zt/uwLLyRurWvP5J+fZNEkRVUyMj3g6OPT45smlcenlhOz+S
 w/kJN33ndN2vi2A+//9JYW5US9hfXkrA4Amn1S388oBac7kaKUd5LoiOLEz2kTt3e6
 9wRd1/g8XO+sLlc1D7N3k6PaVhITGeqhMIod+fuOdTDF8sj+oTx1fKi4k2SSYdiTKj
 GRZtv/yVcA6mu1h2dPQ27/ULia16OGTzpWjM7P99LDHUn9gc0cLRE2wPsUkco+bCSD
 Td2QMqVCdd3Eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oOmibN1L
Subject: [Buildroot] [PATCH 1/1] package/glibc: add upstream patch to fix
 build error with glibc 2.43
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

Seen with this defconfig

BR2_x86_64=y
BR2_GCC_VERSION_15_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_PICOTOOL=y

output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bits/struct_mutex.h:35:9:
 error: declaration does not declare anything [-fpermissive]
   35 |   short __unused;

No related autobuilder error was recorded.
The build error does not occur with glibc-2.42 on the 2026.02.x branch.

The build error was reported to picotool upstream:
https://github.com/raspberrypi/picotool/issues/300

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-__unused-fields-to-__glibc_reserved.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch

diff --git a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
new file mode 100644
index 0000000000..5b7172df44
--- /dev/null
+++ b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
@@ -0,0 +1,85 @@
+From 243bdfec8f7cd4a85a8ce6e4e9a5a5accd3ce1aa Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Tue, 17 Feb 2026 17:06:48 +0100
+Subject: [PATCH] Rename __unused fields to __glibc_reserved.
+
+__unused is often defined to __attribute__((unused)) in BSD
+sources and furthermore libstdc++ testsuite uses it as a macro
+to verify libstdc++ headers don't use __unused identifiers.
+In ~2012 glibc headers have been cleaned up, but some new
+uses of __unused have reappeared (s390 fenv.h already many
+years ago, the rest last November).
+
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+
+Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=243bdfec8f7cd4a85a8ce6e4e9a5a5accd3ce1aa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ sysdeps/powerpc/nptl/bits/struct_mutex.h | 2 +-
+ sysdeps/s390/fpu/bits/fenv.h             | 8 ++++----
+ sysdeps/s390/nptl/bits/struct_mutex.h    | 2 +-
+ sysdeps/x86/nptl/bits/struct_mutex.h     | 2 +-
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/sysdeps/powerpc/nptl/bits/struct_mutex.h b/sysdeps/powerpc/nptl/bits/struct_mutex.h
+index 1472af21f7..ebf2d50922 100644
+--- a/sysdeps/powerpc/nptl/bits/struct_mutex.h
++++ b/sysdeps/powerpc/nptl/bits/struct_mutex.h
+@@ -32,7 +32,7 @@ struct __pthread_mutex_s
+   int __kind;
+ #if __WORDSIZE == 64
+   short __spins;
+-  short __unused;
++  short __glibc_reserved;
+   __pthread_list_t __list;
+ # define __PTHREAD_MUTEX_HAVE_PREV      1
+ #else
+diff --git a/sysdeps/s390/fpu/bits/fenv.h b/sysdeps/s390/fpu/bits/fenv.h
+index b9e844e393..33e88fbe9d 100644
+--- a/sysdeps/s390/fpu/bits/fenv.h
++++ b/sysdeps/s390/fpu/bits/fenv.h
+@@ -76,10 +76,10 @@ typedef unsigned int fexcept_t; /* size of fpc */
+ typedef struct
+ {
+   fexcept_t __fpc;
+-  void *__unused;
+-  /* The field __unused (formerly __ieee_instruction_pointer) is a relict from
+-     commit "Remove PTRACE_PEEKUSER" (87b9b50f0d4b92248905e95a06a13c513dc45e59)
+-     and isn't used anymore.  */
++  void *__glibc_reserved;
++  /* The field __glibc_reserved (formerly __ieee_instruction_pointer) is a
++     relict from commit "Remove PTRACE_PEEKUSER"
++     (87b9b50f0d4b92248905e95a06a13c513dc45e59) and isn't used anymore.  */
+ } fenv_t;
+ 
+ /* If the default argument is used we use this value.  */
+diff --git a/sysdeps/s390/nptl/bits/struct_mutex.h b/sysdeps/s390/nptl/bits/struct_mutex.h
+index d069b485d1..571265267c 100644
+--- a/sysdeps/s390/nptl/bits/struct_mutex.h
++++ b/sysdeps/s390/nptl/bits/struct_mutex.h
+@@ -32,7 +32,7 @@ struct __pthread_mutex_s
+   int __kind;
+ #if __WORDSIZE == 64
+   short __spins;
+-  short __unused;
++  short __glibc_reserved;
+   __pthread_list_t __list;
+ # define __PTHREAD_MUTEX_HAVE_PREV      1
+ #else
+diff --git a/sysdeps/x86/nptl/bits/struct_mutex.h b/sysdeps/x86/nptl/bits/struct_mutex.h
+index 9c19dff660..13c9894ad4 100644
+--- a/sysdeps/x86/nptl/bits/struct_mutex.h
++++ b/sysdeps/x86/nptl/bits/struct_mutex.h
+@@ -32,7 +32,7 @@ struct __pthread_mutex_s
+   int __kind;
+ #ifdef __x86_64__
+   short __spins;
+-  short __unused;
++  short __glibc_reserved;
+   __pthread_list_t __list;
+ # define __PTHREAD_MUTEX_HAVE_PREV      1
+ #else
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
