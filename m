Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EE1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68AFF408D1;
	Mon,  2 May 2022 21:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7RhCniA1O7B; Mon,  2 May 2022 21:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69758405A3;
	Mon,  2 May 2022 21:59:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64A541BF968
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50B9340647
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rU8wMiHvFwhQ for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2899D40445
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E6C6084F0E; Mon,  2 May 2022 21:48:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:40:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 858e6183d663e9ceba91b9a974dfeb331ead847d
X-Git-Newrev: a667c62433d617ab0645c9ac0547aa6e854cf9d8
X-Patchwork-Hint: ignore
Message-Id: <20220502214850.E6C6084F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: bump to version 2.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a667c62433d617ab0645c9ac0547aa6e854cf9d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ot-Makefile-no-pie-is-not-a-valid-ld-flag.patch | 29 ----------------------
 package/s390-tools/s390-tools.hash                 |  2 +-
 package/s390-tools/s390-tools.mk                   |  6 ++---
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
deleted file mode 100644
index fcdf06088a..0000000000
--- a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9fd3c733c645be13a2e39a3bae3983f88530b48d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@canonical.com>
-Date: Thu, 7 Jan 2021 12:46:22 +0100
-Subject: [PATCH] zipl/boot/Makefile: -no-pie is not a valid ld flag
-
-The "-no-pie" option never has been a valid flag of ld. It breaks the build with newer binutils.
-See:
-https://sourceware.org/bugzilla/show_bug.cgi?id=27050
-https://bugs.launchpad.net/ubuntu/+source/s390-tools/+bug/1907789
-
-[Retrieved from: https://github.com/ibm-s390-linux/s390-tools/pull/106]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- zipl/boot/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/zipl/boot/Makefile b/zipl/boot/Makefile
-index a2e5f190..b81df778 100644
---- a/zipl/boot/Makefile
-+++ b/zipl/boot/Makefile
-@@ -109,7 +109,7 @@ stage3.bin:	stage3.exec
- 		$< $@
- 
- data.o: $(FILES)
--	$(LD) $(NO_PIE_LDFLAGS) -r -b binary -o data.o $(FILES)
-+	$(LD) -r -b binary -o data.o $(FILES)
- 
- data.h: data.o
- 	rm -f data.h
diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index 6ea8f7ea20..dc9209856b 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6fa6add92e896541c0ef74885a4084474fc0d77049e8ac7372872a70a46ddd74  s390-tools-2.20.0.tar.gz
+sha256  d0f56fe4f6a62dda45ccd87191e42ebfaec82671ff4b96cc2229a7fe240ce072  s390-tools-2.21.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 3c386af6fd..040db78c05 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.20.0
+S390_TOOLS_VERSION = 2.21.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
@@ -12,9 +12,7 @@ S390_TOOLS_DEPENDENCIES = zlib
 
 S390_TOOLS_MAKE_OPTS = \
 	ARCH=$(BR2_ARCH) \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
-	LINK="$(TARGET_CC)" \
-	LINKXX="$(TARGET_CXX)"
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
