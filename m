Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5F9C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 17:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DA3240445;
	Sat, 31 Dec 2022 17:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA3240445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SEMmqlVSJHZ; Sat, 31 Dec 2022 17:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 857C6403A9;
	Sat, 31 Dec 2022 17:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 857C6403A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84E771BF33F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D32B81457
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D32B81457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fwY765WAKNl for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 17:42:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C17981453
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 17:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C17981453
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88FD5854A7; Sat, 31 Dec 2022 17:42:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 18:41:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 415c7af0796e1f2212170bcad5a13e9cd16d5d7f
X-Git-Newrev: 2f54c2a841861ba587c9bbdd66d5164b6774d9e5
X-Patchwork-Hint: ignore
Message-Id: <20221231174248.88FD5854A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] security hardening: add support for glibc
 _FORTIFY_SOURCE=3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f54c2a841861ba587c9bbdd66d5164b6774d9e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new _FORTIFY_SOURCE=3 level was introduced in glibc, in commit:
https://sourceware.org/git/?p=glibc.git;a=commit;h=c43c5796121bc5bcc0867f02e5536874aa8196c1

This commit was first included glibc 2.33. At that time, it was only
supported by llvm/clang 9, and not by any released gcc version.

To support _FORTIFY_SOURCE=3, the needed gcc features were introduced
in version 12. The gcc 12 support was added in glibc commit:
https://sourceware.org/git/?p=glibc.git;a=commit;h=86bf0feb0e3ec8e37872f72499d6ae33406561d7
This commit was first included in glibc 2.35.

Buildroot updated to glibc 2.35 in commit:
https://git.buildroot.org/buildroot/commit/?id=68d0aede597d32816c5b2ff32de0ce33cc14eb93

Buildroot introduced gcc 12 support in commit:
https://git.buildroot.org/buildroot/commit/?id=0f1ad4fc93286adaba852c99d6e1c2565b5c4258

Support for _FORTIFY_SOURCE=3 can now be added.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in           | 9 +++++++++
 package/Makefile.in | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/Config.in b/Config.in
index 64604a0aed..86699f58c6 100644
--- a/Config.in
+++ b/Config.in
@@ -930,6 +930,15 @@ config BR2_FORTIFY_SOURCE_2
 	  Also adds checks at run-time (detected buffer overflow
 	  terminates the program)
 
+config BR2_FORTIFY_SOURCE_3
+	bool "Extended"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	help
+	  This option sets _FORTIFY_SOURCES to 3 and even more
+	  checking is added compared to level 2. Extends checks at
+	  run-time that can introduce an additional performance
+	  overhead.
+
 endchoice
 
 comment "Fortify Source needs a glibc toolchain and optimization"
diff --git a/package/Makefile.in b/package/Makefile.in
index 43d214bcbe..7f1b00ba24 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -160,6 +160,8 @@ ifeq ($(BR2_FORTIFY_SOURCE_1),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=1
 else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=2
+else ifeq ($(BR2_FORTIFY_SOURCE_3),y)
+TARGET_HARDENED += -D_FORTIFY_SOURCE=3
 endif
 
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
