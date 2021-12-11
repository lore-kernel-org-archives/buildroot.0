Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779AEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D8F34021E;
	Sat, 11 Dec 2021 20:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0vw7Umy_XvR; Sat, 11 Dec 2021 20:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DBE640173;
	Sat, 11 Dec 2021 20:55:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB39E1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 788E780AB3
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id at_EjAGbr6Zb for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 677B484F38
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 375C982965; Sat, 11 Dec 2021 20:48:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:46:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50c4fd9363c1e7ee864e3892e7c066ce4b38fdd4
X-Git-Newrev: ac0ddf8bdfc3c9ab0c5fc89ca200a81c3906c75d
X-Patchwork-Hint: ignore
Message-Id: <20211211204815.375C982965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: bump version to 1.42.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ac0ddf8bdfc3c9ab0c5fc89ca200a81c3906c75d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* update patch 0001 to match changed target code
* BSD-3c and MPL-2.0 licenses were added to LICENSE

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ly-detect-the-availability-of-pthread_setname_.patch | 17 ++++++++++++++++-
 package/grpc/grpc.hash                                  |  4 ++--
 package/grpc/grpc.mk                                    |  2 +-
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
index 32493ac1a0..92dc5a6c45 100644
--- a/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0001-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -11,6 +11,14 @@ non-POSIX function in all cases.
 
 Upstream: https://github.com/grpc/grpc/pull/17610
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+[buildroot@heine.tech:
+  1.42.0 added new logic to handle older glibc without pthread_setname_np()
+  but is still not sufficient for all cases. So alter the patch to wrap all
+  this with our cmake based workaround.
+  See: https://github.com/grpc/grpc/pull/27540
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
  CMakeLists.txt                            | 6 ++++++
  include/grpc/impl/codegen/port_platform.h | 2 ++
@@ -37,15 +45,22 @@ diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codeg
 index 4f213ff..55ecd9d 100644
 --- a/include/grpc/impl/codegen/port_platform.h
 +++ b/include/grpc/impl/codegen/port_platform.h
-@@ -168,7 +168,9 @@
+@@ -186,6 +186,7 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
 +#if defined(HAVE_PTHREAD_SETNAME_NP)
+ #ifdef __GLIBC_PREREQ
+ #if __GLIBC_PREREQ(2, 12)
+ #define GPR_LINUX_PTHREAD_NAME 1
+@@ -194,6 +195,7 @@
+ // musl libc & others
  #define GPR_LINUX_PTHREAD_NAME 1
+ #endif
 +#endif /* HAVE_PTHREAD_SETNAME_NP */
  #include <linux/version.h>
  #else /* musl libc */
  #define GPR_MUSL_LIBC_COMPAT 1
+
 -- 
 2.26.63
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 26d0d315d8..0e81410358 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5fb30aae1fa1cffa4ce00aa0bbfab908c0b899fcf0bbc30e268367d660d8656  grpc-1.41.0.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  b2f2620c762427bfeeef96a68c1924319f384e877bc0e084487601e4cc6e434c  grpc-1.42.0.tar.gz
+sha256  277adcc1dcef8359b1efb48e628635f88b40be8fbd64e82fd0169930d135d7a5  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 110e5e640a..025ab40777 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.41.0
+GRPC_VERSION = 1.42.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
