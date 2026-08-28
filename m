Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE10FC61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA68810CD;
	Fri, 28 Aug 2026 14:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnRtJXfLXxLZ; Fri, 28 Aug 2026 14:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927056;
	bh=HbpNYx6VWUxIazsavQLe511yhpI2GTfamQa9ul0TipM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YBw3dYmwJ+ePApn1QHkbJR/Tj+pDIp0MjBpk0yT/7GBtoxU9lFRnsIGwFthRSQJ3S
	 VI31PTlco2rkc4QCckjP4tga3TtrVY+Gj2LHl4dSe580YpGkCRz9g50iOnK/qKXNSp
	 p7gMlGAPPb6ThJmHZisz/bGbn2aFfHikDJZqL3RKIMIqFZdsr7QYP5lowzP5JfigFF
	 QuCGOZJamHhfYr1ttkqHRwfkbVxi5qMgKzfZ0z85HCcE+RxLfe+VUV+gxbvd0Dhnhx
	 z0/LZuYNUfV7Iec1CIF0Mj5K8T//XeFMrMrWhxHqCiYPOJ3XMLvNunP9qsXkq68AOJ
	 H2a/gUpskLmyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1681810BA;
	Fri, 28 Aug 2026 14:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD7FA386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3C6460705
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4rt_v9HyEIT for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFEAF60727
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1422921FD; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8d75680c0174b972b845cb7b77005350a1a2f6c7
X-Git-Newrev: f66d1f027bc3a1d623507c5108260edd2396b8d9
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.C1422921FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mosquitto: fix
 build failure with make < 4.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f66d1f027bc3a1d623507c5108260edd2396b8d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

0002-Add-configure-time-check-for-lanl.patch (taken from mosquitto
PR #3358) probes for -lanl with a $(shell ...) that pipes a small C
program into $(CC):

    NEED_LIBANL := $(shell printf '#include <stdlib.h>\n#include <netdb.h>\n...

The test program contains literal '#' characters. GNU make strips
comments before expanding functions, and only since 4.3 does it keep
'#' inside a function call argument intact. With older make the line
is truncated at the first '#', so the shell call never sees its
closing parenthesis:

    config.mk:322: *** unterminated call to function 'shell': missing ')'.  Stop.

That is why the package builds fine locally (make 4.3+) but fails on
the build server, which ships an older GNU make.

Switch to the variant that was actually merged upstream (commit
dfde35a, "Add compile time checks for whether -lanl is required").
It links an empty main() against -lanl instead of compiling a program
that calls getaddrinfo_a(), so the test source needs no #include and
contains no '#' at all, which works on every make version.

Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/dfde35aa0fa5863863f4d0c8f2bbefe39320a119
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Titouan: update "Upstream:" tag in the patch]
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0002-Add-configure-time-check-for-lanl.patch      | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
index b67164123a..182a39e7ef 100644
--- a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
+++ b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
@@ -1,4 +1,4 @@
-From 447a6aa8df882a67ca3df6f5e95be42e1463eaf0 Mon Sep 17 00:00:00 2001
+From 1db9a29f4c831b656600a64de0531516dd198641 Mon Sep 17 00:00:00 2001
 From: Titouan Christophe <titouan.christophe@mind.be>
 Date: Fri, 29 Aug 2025 19:47:34 +0200
 Subject: [PATCH] Add configure-time check for -lanl
@@ -18,7 +18,7 @@ and only add the linker flag otherwise.
 [1] https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html
 [2] https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/build-end.log
 
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3358
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/commit/dfde35aa0fa5863863f4d0c8f2bbefe39320a119
 
 Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
 ---
@@ -26,22 +26,21 @@ Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/config.mk b/config.mk
-index 34d5163f..cc7987c4 100644
+index 34d5163f..594a7267 100644
 --- a/config.mk
 +++ b/config.mk
-@@ -318,8 +318,11 @@ ifeq ($(WITH_EC),yes)
+@@ -318,7 +318,10 @@ ifeq ($(WITH_EC),yes)
  endif
  
  ifeq ($(WITH_ADNS),yes)
 -	BROKER_LDADD:=$(BROKER_LDADD) -lanl
- 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
-+	NEED_LIBANL := $(shell printf '#include <stdlib.h>\n#include <netdb.h>\nint main(){return getaddrinfo_a(0, NULL, 0, NULL);}'| $(CC) -D_GNU_SOURCE -o /dev/null -x c - 2>/dev/null || echo YES)
-+	ifeq ($(NEED_LIBANL),YES)
-+		BROKER_LDADD:=$(BROKER_LDADD) -lanl
++	NEED_LIBANL:=$(shell printf 'int main(){return 0;}' | gcc -D_GNU_SOURCE -lanl -o /dev/null -x c - 2>/dev/null || echo yes)
++	ifeq ($(NEED_LIBANL),yes)
++		BROKER_LDADD+=-lanl
 +	endif
+ 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
  endif
  
- ifeq ($(WITH_CONTROL),yes)
 -- 
-2.50.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
