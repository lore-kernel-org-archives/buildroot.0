Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D67C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54B18486F;
	Sun, 15 Sep 2024 21:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzTHElwHg-Ru; Sun, 15 Sep 2024 21:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE9F81F19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BE9F81F19;
	Sun, 15 Sep 2024 21:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 731A51BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7306340A0E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoJ81-qvsbo2 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B4BE4042C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B4BE4042C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6831A83682; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 12:05:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a68b855e7ae7a492d2fcfa9f7624f5d70c122e6b
X-Git-Newrev: ccbca4754d0e7f1d6326d7a04a5959ebe2a689dd
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.6831A83682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: fix mips64 n32 big endian
 issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ccbca4754d0e7f1d6326d7a04a5959ebe2a689dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a real fix for the time64 issue instead of disabling
time64 for mips64 n32 big endian.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch | 28 ------------------
 ...4n32-time64-Select-correct-_dl_fstat-impl.patch | 34 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch b/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch
deleted file mode 100644
index 5a12231b42..0000000000
--- a/package/uclibc/0001-mips64-time64-for-n32-ABI-breaks-a-lot-of-tests-disa.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From dd01754e21da71706af07f3e56eade66fc9164fb Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 16 Aug 2024 16:59:28 +0200
-Subject: [PATCH] mips64: time64 for n32 ABI breaks a lot of tests, disable it
- for now
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=dd01754e21da71706af07f3e56eade66fc9164fb
----
- extra/Configs/Config.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
-index 454b6ddb8..86bd20d76 100644
---- a/extra/Configs/Config.in
-+++ b/extra/Configs/Config.in
-@@ -1032,7 +1032,7 @@ config UCLIBC_USE_TIME64
- 		   TARGET_i386                           || \
- 		   TARGET_m68k                           || \
- 		   TARGET_microblaze                     || \
--		   (TARGET_mips && !CONFIG_MIPS_N64_ABI) || \
-+		   (TARGET_mips && !(CONFIG_MIPS_N64_ABI || CONFIG_MIPS_N32_ABI)) || \
- 		   TARGET_or1k                           || \
- 		   TARGET_powerpc                        || \
- 		   TARGET_riscv32                        || \
--- 
-2.30.2
-
diff --git a/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch b/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch
new file mode 100644
index 0000000000..c27e606b89
--- /dev/null
+++ b/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch
@@ -0,0 +1,34 @@
+From 0dedba1051d781bfb3dd3b50101aa0e880cb6cde Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Sat, 7 Sep 2024 10:48:47 +0300
+Subject: [PATCH] mips64n32, time64: Select correct _dl_fstat impl
+
+With time64 enabled we have to use statx() instead of stat() or fstat()
+If the _dl_fstat implementation isn't selected correctly
+we can have multiple errors inside dynamic linker
+during startup of the system and of the almost every process
+Add sparc exclusion like in other places inside this header
+
+Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=0dedba1051d781bfb3dd3b50101aa0e880cb6cde
+---
+ ldso/include/dl-syscall.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
+index 180d03012..c143b8d45 100644
+--- a/ldso/include/dl-syscall.h
++++ b/ldso/include/dl-syscall.h
+@@ -168,7 +168,7 @@ static __always_inline int _dl_stat(const char *file_name,
+ #if defined __NR_fstat64 && !defined __NR_fstat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))
+ # define __NR__dl_fstat __NR_fstat64
+ static __always_inline _syscall2(int, _dl_fstat, int, fd, struct stat *, buf)
+-#elif defined __NR_fstat
++#elif defined __NR_fstat && !defined __UCLIBC_USE_TIME64__ || defined(__sparc__)
+ # define __NR__dl_fstat __NR_fstat
+ static __always_inline _syscall2(int, _dl_fstat, int, fd, struct stat *, buf)
+ #elif defined __NR_statx && defined __UCLIBC_HAVE_STATX__
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
