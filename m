Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96297C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 09:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7B380A8A;
	Sat, 12 Sep 2026 09:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXiTrvsa1JZD; Sat, 12 Sep 2026 09:14:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0D78E80E26
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789204468;
	b=YDpKL8ZIgHgHdC8+sNkJqS/N0dKRwnBEFOOm1nPEnsFepv+qD5r76R3SoPtwL9QTQP0e
	 QXEku+4073SkS6ZIe25jnAM5YCKx6SMep4z/RG8s8dEM+jyctt3nCNgF/GD+LpTsH3Rwt
	 doRNWqgjzIuumaIVDqrjzizw9DQqc1XZruVDeJaGPfFiiIT80JYlF4u2uY1eRcVNFSknU
	 ow1nsVrxHche+dbtgsyKIc2NTbPBjbrDzDxGsnFLqulo6fvV5X6ENXPWVcWCTuYirc3FG
	 eKEroXIVkznk9ql/Jl7D3i0tYvw10R7wWXnEkPvYUjsV9rYehIN+K6Ber7XhmRy/D3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789204468;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZuXRode8yMT/0O1ROmSvGeNqLEvn2j/yFGEc8PbO/1k=;
	b=Ei1Hcoy7PZAZkTHL9tOH0Q275YsIjbNoHAC5muMmxwZAKC9B7MJozLf7Nt7w2AjfSh6w
	 LyJLrRXa7BT5MSbUXW0Uwa59qn613JgRHHfloW7npuiJ2d3ndL6okKeqtWDf67+5r+O0l
	 finMHup4S28V1f592a4B3+hBhgzbxfCr1f0rUwFsY2SyRObuTSek1iBugy7T/m3ee0CUH
	 GNIE+OKn1L6OzXjmlWeTqwFPKquTbYI26qyaYs18yWgvDDnFMK5ATc1yF5GeJhcFGj5FM
	 LagbWuD6benH7MWKtqtaVYrUuj+z4Kgv8T1Mk8ZFV7HP0gx+X38LAFH1f0nRE5XZsAg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789204468;
	bh=ZuXRode8yMT/0O1ROmSvGeNqLEvn2j/yFGEc8PbO/1k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eWZGCsJZZwmRVnGyK+QdWuwMBsTC4jNQGRb8k7NbQTd6aqb/P/SEvBVUELy/s7Hrw
	 /5I1u4ZPeiadYbZ1jAV3AB/1eczO9rF9s5ZFpW98985Jm1f1rGVqwAofNeEs7NYn2E
	 xksDA8jzXq35dmJ5cpBQ6POuvCgQofVOd3/jcEZc1/0/QN/smqPFSJK4Jeg0dlWQLS
	 d6zT55AyYDpfYplYk5BzMSeVE3dOzMWFp9OribxBGwKADlRNgf+F8bgeUDi2R8MtZT
	 8o/gY4E5t476Z2NjZNHgeKFECPx68VpQ1pfPVvpTTHxTgtDlGmcwOXQfcmr7qYl+kb
	 cno2MGwrrgn5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D78E80E26;
	Sat, 12 Sep 2026 09:14:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A87549D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4927580E26
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNlaO-WNWMwQ for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 09:14:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0872D80A8A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789204466;
 b=L+tmCHThbDY+UnDkFjKoC//8mG5ZJbJtOl9w3iS54+4HLG0an743qMg+BURhzVGMR0B9
 Vjk6vHnzqJN1PgiJrJcSuXitSSFIWkRYCRwURc2ayc653KOIFuoMGYCYPBNUMU/7KTp3H
 PBcaXwwWRHdCOffqX7X4+Po7DYjyC9zRqxrxFH3zyiSrbH2OQPdljULS46ZP7cQu1wuqC
 12NA/+n+6M6QVlpYZYCK5BCRfzjqPxNQlgj+y9xGzKJmSGJ6FOlKhiQyX7BzIn6b7IrcV
 vjvTGpgtQ67w5VyEj94nohtqLyX4P7oIcJ6NX9K/Nx6JVH0ASJJBEV/c7GtngNydPdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789204466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jb8rte4TAGKJqgEVrcMyTaL4AiRjKMkfAKuGenLKYdY=;
 b=WpTs+KdU+AxAnrPvEMjn83reY4xrbG1Y8Eu/9QasIZPXDUwtK9KgAW/bm6k/S+zC3v5C
 2W6STxOT4lf0FNTgJT1vC/u4LIY2r9yk9q2UXepIZcbzP2FUnU+NKS+hyNWAw8TxwoVQl
 18UyNG0/JZpCL1CE3L9LBJVKgAfAJD89kBJL1V7EW7QchABZDVjcu+HVcDgwm8qzvP2aa
 QI/52VjmvmZqZ2Ee+LzbYzdmUFgcHjEG46e8vz2RMN6OWA+8r63B4L0JabSGpAcQFcxdB
 /1ImyB95TdLgc6O8L5tBjzZNIykh+QctdYtGU781TfbHctjd7u2AU+z3itrVipV8jKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0872D80A8A
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:14:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEA2E934E9; Sat, 12 Sep 2026 09:13:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 11:13:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a1c11c9971b454b3b38c4eb111ac5e42a15cf1c
X-Git-Newrev: dc1f1818d9e603b67164c20ae8dfe423e14abc4f
X-Patchwork-Hint: ignore
Message-Id: <20260912091321.AEA2E934E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.129
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc1f1818d9e603b67164c20ae8dfe423e14abc4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop local patch that has been upstreamed.

For release notes since 3.127, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_128_RTM/doc/src/releases/nss_3_128.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_129_RTM/doc/src/releases/nss_3_129.md

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add link to 3.128 release notes in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Fix-build-failure-due-to-missing-gcm-stu.patch | 116 ---------------------
 package/libnss/libnss.hash                         |   4 +-
 package/libnss/libnss.mk                           |   2 +-
 3 files changed, 3 insertions(+), 119 deletions(-)

diff --git a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
deleted file mode 100644
index f2c48c8fee..0000000000
--- a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 897ebeb9c38d4dc4844f5f414db5aaa17c261eee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 30 Mar 2026 17:06:14 +0200
-Subject: [PATCH] Bug 2027768 - Fix build failure due to missing gcm stubs if
- on big endian
-
-Building gcm on Big Endian architectures lead to linking failure due to
-missing gcm stubs. This is because those stubs are guarded by
-DHAVE_PLATFORM_GHASH that at the moment is defined for every architecture
-that provides acceleration. But at the moment we can also build without
-acceleration but DHAVE_PLATFORM_GHASH is defined in any case.
-So let's add to coreconf/Linux.mk a runtime test to find out which
-endianness toolchain is by setting the new introduced LITTLE_ENDIAN
-variable. And later on, in lib/freebl/Makefile let's guard
-DHAVE_PLATFORM_GHASH definition depending on LITTLE_ENDIAN VARIABLE.
-
-Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=2027768
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: rebased to version 3.127]
----
- nss/coreconf/Linux.mk   |  8 ++++++++
- nss/lib/freebl/Makefile | 28 ++++++++++++++++++++++------
- 2 files changed, 30 insertions(+), 6 deletions(-)
-
-diff --git a/coreconf/Linux.mk b/coreconf/Linux.mk
-index dcb432415f..cf1f62378d 100644
---- a/nss/coreconf/Linux.mk
-+++ b/nss/coreconf/Linux.mk
-@@ -188,6 +188,14 @@ endif
- endif
- endif
- 
-+# Test toolchain for endianness and set LITTLE_ENDIAN variable accordingly
-+ENDIANNESS := $(shell echo | $(CC) -dM -E - | grep __BYTE_ORDER__)
-+ifeq ($(findstring __ORDER_LITTLE_ENDIAN__,$(ENDIANNESS)),__ORDER_LITTLE_ENDIAN__)
-+    LITTLE_ENDIAN := 1
-+else
-+    LITTLE_ENDIAN := 0
-+endif
-+
- USE_SYSTEM_ZLIB = 1
- ZLIB_LIBS = -lz
- 
-diff --git a/lib/freebl/Makefile b/lib/freebl/Makefile
-index 0ab50b093a..21c3cf62d8 100644
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -112,7 +112,10 @@ endif
- # NSS_X64 means the target is a 64-bits 64 CPU architecture
- # NSS_X86_OR_X64 means the target is either x86 or x64
- ifeq (,$(filter-out i386 x386 x86 x86_64,$(CPU_ARCH)))
--        DEFINES += -DNSS_X86_OR_X64 -DHAVE_PLATFORM_GHASH
-+        DEFINES += -DNSS_X86_OR_X64
-+        ifeq ($(LITTLE_ENDIAN),1)
-+            DEFINES += -DHAVE_PLATFORM_GHASH
-+        endif
-         EXTRA_SRCS += ghash-x86.c aes-x86.c
- $(OBJDIR)/ghash-x86.o: CFLAGS += -mpclmul -maes
- $(OBJDIR)/aes-x86.o: CFLAGS += -mpclmul -maes
-@@ -138,7 +141,10 @@ endif
- endif
- ifeq ($(CPU_ARCH),aarch64)
-     ifdef CC_IS_CLANG
--        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+        DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+        ifeq ($(LITTLE_ENDIAN),1)
-+            DEFINES += -DHAVE_PLATFORM_GHASH
-+        endif
-         EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-     else ifeq (1,$(CC_IS_GCC))
-         # GCC versions older than 4.9 don't support ARM AES. The check
-@@ -146,11 +152,17 @@ ifeq ($(CPU_ARCH),aarch64)
-         # and then rejects any major versions prior to 5. Note that
-         # there has been no GCC 4.10, as it was renamed to GCC 5.
-         ifneq (,$(filter 4.9,$(word 1,$(GCC_VERSION)).$(word 2,$(GCC_VERSION))))
--            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+            ifeq ($(LITTLE_ENDIAN),1)
-+                DEFINES += -DHAVE_PLATFORM_GHASH
-+            endif
-             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-         endif
-         ifeq (,$(filter 0 1 2 3 4,$(word 1,$(GCC_VERSION))))
--            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
-+            DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-+            ifeq ($(LITTLE_ENDIAN),1)
-+                DEFINES += -DHAVE_PLATFORM_GHASH
-+            endif
-             EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
-         endif
-     endif
-@@ -183,7 +195,9 @@ ifeq ($(CPU_ARCH),aarch64)
- endif
- ifeq ($(CPU_ARCH),arm)
- ifndef NSS_DISABLE_ARM32_NEON
--    DEFINES += -DHAVE_PLATFORM_GHASH
-+    ifeq ($(LITTLE_ENDIAN),1)
-+        DEFINES += -DHAVE_PLATFORM_GHASH
-+    endif
-     EXTRA_SRCS += ghash-arm32-neon.c
- endif
-     ifdef CC_IS_CLANG
-@@ -316,7 +330,9 @@ ifeq ($(CPU_ARCH),arm)
-     MPI_SRCS += mpi_arm.c
- endif
- ifeq ($(CPU_ARCH),ppc)
--    DEFINES += -DHAVE_PLATFORM_GHASH
-+    ifeq ($(LITTLE_ENDIAN),1)
-+        DEFINES += -DHAVE_PLATFORM_GHASH
-+    endif
-     EXTRA_SRCS += ghash-ppc.c
- ifdef USE_64
-     DEFINES += -DNSS_NO_INIT_SUPPORT
--- 
-2.47.3
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index b87c3376b4..1851b1e5fd 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_127_RTM/src/SHA256SUMS
-sha256  5a899cad21ae2c9d3c5132de79726eda8df3b7fdf18eeb239fc544d43b87338b  nss-3.127.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_129_RTM/src/SHA256SUMS
+sha256  38baa3b0a18a3f674843473b549753c96419a0151abd1e7a9b214ce0493d0785  nss-3.129.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 734376f61b..42021503f7 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.127
+LIBNSS_VERSION = 3.129
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
