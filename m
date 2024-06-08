Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760CAC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E87405E3;
	Sat,  8 Jun 2024 07:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkAJu_ga-N9x; Sat,  8 Jun 2024 07:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704DC405E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 704DC405E6;
	Sat,  8 Jun 2024 07:53:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 302551BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9B2C40223
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5i1YK8DBHZvN for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 185C3401B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 185C3401B7
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EC0687D8F; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 09:43:30 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 188d0e5f6f3685db4c0228e7a91a876a5f887465
X-Git-Newrev: 3326cbd2e528170c1d86d3cbe4c7853467dbfa47
X-Patchwork-Hint: ignore
Message-Id: <20240608075253.5EC0687D8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zip: fix build
 with GCC 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=3326cbd2e528170c1d86d3cbe4c7853467dbfa47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Builds with GCC 14 print the following error

> zip.h:726:10: error: conflicting types for 'memset'; have 'char *(char *, int,  unsigned int)'

This is because with GCC 14, Zip incorrectly detects that the memset functions
exist. Which enables the ZMEM flag and declares its own version of memset.

This is because the ./unix/configure script attempts to compile a C file using
'memset' but it does not include the <string.h>. This was allowed in gnu89, but
in GCC 14 -Werror=implicit-function-declaration is enabled by default[1].

We forcefully set '-std=gnu89' so that Zip will compile everything against
gnu89, which suppresses the warning.

[1] https://gcc.gnu.org/gcc-14/porting_to.html#warnings-as-errors

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 29c6fe13d37ab1a3305005b42441a49afe4d1895)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zip/zip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 67958a4a66..3aa59e7ba7 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -31,7 +31,7 @@ ZIP_TARGET_CFLAGS = \
 define ZIP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(ZIP_TARGET_CFLAGS) $(ZIP_CFLAGS)" \
-		AS="$(TARGET_CC) -c" \
+		CC="$(TARGET_CC) -std=gnu89" AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
 
@@ -43,7 +43,7 @@ endef
 define HOST_ZIP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
-		AS="$(HOSTCC) -c" \
+		CC="$(HOSTCC) -std=gnu89" AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
