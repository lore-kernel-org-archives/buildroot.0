Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536A7C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F08B86063F;
	Sun, 20 Sep 2026 10:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVQMdIObPEeb; Sun, 20 Sep 2026 10:28:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4051160684
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789900125;
	b=MEuDfSYIdjcgxVOSWYU77v3IXKvMYzhP6dMqs8MHAlQqKo43PylgMT55JEeN3lKWSBmk
	 7Om3GDRmKBTY2ehLtCZ/CPZ/fqaQr+b4Bdg59xylvcjTvz35Z6MvGuhKoIgw9bdEwjJG5
	 35+/w+u1YRZwlklpTaHzNx7ryIjJR/ipbinjUk4Yt1Og+12YSscZB3/et854oOsz0X9lX
	 aB/xFagwjFpJi9Hlm9WU/iRSj0KUyVi4Zit8HnKtJLOyfCLhIv80H7ziCbeCN/g9T9O8Z
	 1hdZUqVZTp8LoAiLQpgOtxIrg+WRqO52KDJeCeHj0czQA5UGKZA3eBY10bhwW6ygufg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789900125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0rDkc8qiiBFahvD6+FvK6oNCTNK4v0KKQJWck9E+FPM=;
	b=JW8XyfWGGBp0Nac+qpHoG1PGEQznF7hJTcGOXQd/BPzB7/ay0ksyG5R+kSVIPv4qTgg1
	 Nw1n/qZlAyBiKMXXtbTqXln5PrEhMbpPJM74iQUZmKsTGo8PjGpxuAkp//LIeSI6HcbMh
	 lkBpV1uwzh5jLqKlizz0DdMSTtr89tL0c28GfpyNthlDx+omxOXXymSmEWPhju8RIlsOP
	 bn6c9C0fEU/I8dQ12GQJVrFoJuV9vK348qdNYtgJfauVB6GgBpS+AFy9kiwtIjsIbS//I
	 P4TUW0lQXAHVpfuHIo6pyXLL4aYpBPaaHRE1ILHvlIegENX9xBrvwJO7yy8Tk2NNiKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789900125;
	bh=0rDkc8qiiBFahvD6+FvK6oNCTNK4v0KKQJWck9E+FPM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j+idiv9copLU6qdFxwUPmo7xjhjkqz8VZ9AlpaTsekf18fOvxUNwt90U8VDVQA1q0
	 IGW8DIkqn5ierzf1vAPDKdKg+ZWJkF/wI2Y5tH3gAm9Ammeh3nVgs7s3lFONc9kBVH
	 eH2b6eOedygSGITQTqNB6Y6Ciixv80kJEilrJpSPcHt0LXXzOjniEQ52A9PTPpC8TN
	 EU5UQRMH3TGnU3BUWiaJ8I8mJG1eyiVYfkfbKK9NS1yqC1mgjZNFGK85ptNOp7qQJW
	 46ioHIgKplZTANkBb5egnTZ5ZCpBpOE8euhpDQTMUODTR6wh4sSOsbSo35oQpHRE3b
	 a2eI7IU5/bewQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4051160684;
	Sun, 20 Sep 2026 10:28:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0829E24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E307F4071F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khFJ17e6M3RW for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:28:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 194E44075D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789900121;
 b=jbSEqODuaKzfATdyb+nqfwhdL20fuVdXnweTENBXy4KZvo0NTvfw9+r4O9SoCYprfAre
 GyMwVzxcchVIdmYA1AiMUuJufAtqt5kuucTGjJ1Jo6UYjYUBEMAgu2xxo3h8rHCTltUpz
 4WV/I1gJ7YABH/YuF+SAVymLRYp1zeyqtN9pLYW2PKLV0ed7BKug5+VjCf/j4WODiOi/I
 oFM5qYqfwxtjPgdGPlrI5PtLzvn5wTyIwv82dLD9p9G8Z31IaNciNCN9u7lI7IFet2Rh+
 SwH1jG492URBlw0hwHTgnUD4FgtVmBrmCa+6cmYnZ4/aAoNwjtsl/3D1aOzIdIOHctQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789900121;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FmaDsJufY/aEWhJqWhjzJ+FYrzuZRyuFYeHoB94Fzjo=;
 b=Yr2iIAzhbwO4sPrG1NJa5xKfwCzNnrUMPsO3Tx1yG5WCuBhDuOEwFra3iX2ideeOTSM2
 pfjeS1pJpQRWXe8eh0R9DQr1DfYrUu7jgNdvoNs5xangiUftpsvbMJatTYJnKv1ki36wf
 Isf+AcoCI0hO31mrjSg5F+pM7m+mirdlcfliTHqhd53zvDw6cP0fThhGCKLpLnKh+chE/
 HQ2xjlHLd6RSpCa6vu+UAU0hxi5ser5kTz06os/yPPTY+Y4YuEODnpKe58abDOh2aF/Rn
 eXEVr1WqjIb4iyWFs/ZdGuCAjYsFJifAZqtbmLOp3vj5L7C/O+yYt01njo+NOwg4fkQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 194E44075D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:28:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C92D38DB1F; Sun, 20 Sep 2026 10:27:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 12:26:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c78e85430023667fa0aedc5ba646df7fa6376b8
X-Git-Newrev: 5f79161e4a8756acdb25c8500de9b2dee663f2ac
X-Patchwork-Hint: ignore
Message-Id: <20260920102732.C92D38DB1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 23.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5f79161e4a8756acdb25c8500de9b2dee663f2ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-23-1-0-released/91654

Removed compiler-rt patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-libc-Fix-detection-of-cfloat128.patch     | 70 ----------------------
 package/llvm-project/llvm-project.hash             |  4 +-
 package/llvm-project/llvm-project.mk               |  4 +-
 3 files changed, 4 insertions(+), 74 deletions(-)

diff --git a/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch b/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch
deleted file mode 100644
index 4587dbfd7d..0000000000
--- a/package/llvm-project/compiler-rt/0001-libc-Fix-detection-of-cfloat128.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 4e1af872f819782bd233ab21953ab92cf36ff9c3 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Mon, 9 Mar 2026 19:07:10 +0100
-Subject: [PATCH] [libc] Fix detection of cfloat128
-
-Building compiler-rt with aarch64-buildroot-linux-gnu-gcc 15.2 causes a
-build error:
-
-compiler-rt-22.1.0/cmake/Modules/../../libc/src/__support/CPP/type_traits/is_complex.h:44:31:
- error: 'cfloat128' was not declared in this scope; did you mean 'float128'? [-Wtemplate-body]
-
-According to https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Floating-Types.html
-__float128 is not available on aarch64.
-
-Analyzing the gcc defines for aarch64 seems to prove it:
-
-$ aarch64-buildroot-linux-gnu-gcc -v
-Target: aarch64-buildroot-linux-gnu
-gcc version 15.2.0 (Buildroot 2026.02-114-gdadec9da56)
-
-$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep __GCC_IEC_559_COMPLEX
-  #define __GCC_IEC_559_COMPLEX 2
-
-$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep __STDC_IEC_60559_COMPLEX__
-  #define __STDC_IEC_60559_COMPLEX__ 201404L
-
-$ echo | aarch64-buildroot-linux-gnu-gcc -dM -E - | grep -i float128
-$
-
-In contrast gcc for x86_64:
-
-$ x86_64-buildroot-linux-gnu-gcc -v
-Target: x86_64-buildroot-linux-gnu
-gcc version 15.2.0 (Buildroot 2026.02-112-gd12ac02486)
-
-$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep __GCC_IEC_559_COMPLEX
-  #define __GCC_IEC_559_COMPLEX 2
-
-$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep __STDC_IEC_60559_COMPLEX__
-  #define __STDC_IEC_60559_COMPLEX__ 201404L
-
-$ echo | x86_64-buildroot-linux-gnu-gcc -dM -E - | grep -i float128
-  #define __SIZEOF_FLOAT128__ 16
-
-This patch changes the or-condition to an and-condition for
-__STDC_IEC_60559_COMPLEX__ and __SIZEOF_FLOAT128__.
-
-Upstream: https://github.com/llvm/llvm-project/pull/185486
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libc/include/llvm-libc-macros/cfloat128-macros.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libc/include/llvm-libc-macros/cfloat128-macros.h b/libc/include/llvm-libc-macros/cfloat128-macros.h
-index 5f28cfa21aae..ff4aa530685d 100644
---- a/libc/include/llvm-libc-macros/cfloat128-macros.h
-+++ b/libc/include/llvm-libc-macros/cfloat128-macros.h
-@@ -27,7 +27,7 @@
- #define LIBC_TYPES_HAS_CFLOAT128
- #endif
- #elif defined(__GNUC__)
--#if (defined(__STDC_IEC_60559_COMPLEX__) || defined(__SIZEOF_FLOAT128__)) &&   \
-+#if (defined(__STDC_IEC_60559_COMPLEX__) && defined(__SIZEOF_FLOAT128__)) &&   \
-     (__GNUC__ >= 13 || (!defined(__cplusplus)))
- #define LIBC_TYPES_HAS_CFLOAT128
- #endif
--- 
-2.47.3
-
diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 96cdd76c92..35aa544014 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.8
-sha256  922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888  llvm-project-22.1.8.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.0
+sha256  ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653ee0d8fcee479ff  llvm-project-23.1.0.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 5cbbda6e06..31b2a4dae7 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
+LLVM_PROJECT_VERSION_MAJOR = 23
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
