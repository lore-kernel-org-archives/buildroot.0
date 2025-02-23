Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FFCC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 20:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A6460B61;
	Sun, 23 Feb 2025 20:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HJXUGpSx3es; Sun, 23 Feb 2025 20:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFBEC60BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBEC60BB4;
	Sun, 23 Feb 2025 20:50:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A51943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 954BD811BF
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLqF_EC6AgJE for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 20:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF43D811BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF43D811BA
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:50:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3D568616F; Sun, 23 Feb 2025 20:50:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 21:49:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6faa08a9e3f3ad170b70439a14bf8da6256f887e
X-Git-Newrev: 544249ff7761db2df61783c8731e834574df957a
X-Patchwork-Hint: ignore
Message-Id: <20250223205024.B3D568616F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fontconfig: fix build with
 toolchains without pthread
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=544249ff7761db2df61783c8731e834574df957a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

../test/test-crbug1004254.c:28:10: fatal error: pthread.h: No such file or directory
   28 | #include <pthread.h>
      |          ^~~~~~~~~~~

Commit cef7358 "package/fontconfig: fix compilation on targets without pthread support"
fixed compilation for targets without pthread support, but that was apparently nog enough.

Back then, I tested all the targets by using `./utils/test-pkg -p fontconfig -a`,
but somehow these targets didn't enable the fontconfig tests, so I didn't see this
compile failure. Fix it now by explicitly disabling the fontconfig tests.

Fixes:
 -  https://autobuild.buildroot.org/results/5f0/5f0c716c20788ba49a3a9f185251ded373a764cd/build-end.log

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
[Julien: reword commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fontconfig/fontconfig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 21eba76a83..7ac8872e82 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -18,6 +18,7 @@ FONTCONFIG_CPE_ID_VALID = YES
 
 FONTCONFIG_CONF_OPTS = \
 	-Dcache-dir=/var/cache/fontconfig \
+	-Dtests=disabled \
 	-Ddoc=disabled
 
 FONTCONFIG_CFLAGS = $(TARGET_CFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
