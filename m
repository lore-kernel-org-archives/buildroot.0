Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4064CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF3561B9B;
	Sun, 31 May 2026 06:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jj1J3Oe8cF-g; Sun, 31 May 2026 06:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1337961AC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208398;
	bh=oP7sDzrO9F7xm9zkzJvUvhh+WeFh+d5UtHQ0EYTDh3I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CroutcmLVZoH6ly4i3ftDKF1RTzUiQ9LBFQz42B1hde1L+PLCYPYRTR5YA5IMQmCF
	 xw+53AQaZzkJ0EiAA2bVcLTWR1yzOJaYaLwJnb/4M4J5Or4ngzCqF97nQh7xzAXzOy
	 mAzrxG9kjTwEI/+jIXtEnzzvazoVAdsITSmpk/Ujb9uZs/Cn+YWUWFRK4xA8JuS+kE
	 Nl8NMTcNr3pgc/wzovXM4q7US/OHVcN7Bbu6ZOyJ1gXLs4I+6Z9hQ7NsBb24kf96A9
	 gtpRiIn/zyN522RWWhpCbW/weuBgKm+xAZ2E2CnfPFdpfhNx6Ao24y1JXLoFI+TqKJ
	 JRJBofFzSc8nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1337961AC4;
	Sun, 31 May 2026 06:19:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2AB6257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4A1A61AC4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nfbm7k8ceEGV for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1880E617AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1880E617AE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:19:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADE3F843CA; Sun, 31 May 2026 06:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 08:18:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77697100875b525d247d93c5b344f127664c1f6b
X-Git-Newrev: 49a4dc97456b9b777c25acb0cc3d1fdaacf9859d
X-Patchwork-Hint: ignore
Message-Id: <20260531061942.ADE3F843CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: add upstream patch to fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49a4dc97456b9b777c25acb0cc3d1fdaacf9859d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ename-__unused-fields-to-__glibc_reserved.patch | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
