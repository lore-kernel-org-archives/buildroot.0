Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A9EC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE38970B4D;
	Mon, 19 May 2025 10:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQ7axrmOqjnQ; Mon, 19 May 2025 10:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1689A70B47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1689A70B47;
	Mon, 19 May 2025 10:57:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E3F3E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 526A341456
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3BJfhhMivFk for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D8F41461
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2D8F41461
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECC39873D4; Mon, 19 May 2025 10:39:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 May 2025 17:42:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 30cf5a07546602e6e88d1501ac1ec182b693fcbb
X-Git-Newrev: 6d09b25d08fe72e9781578fb512d5aa391b08c3f
X-Patchwork-Hint: ignore
Message-Id: <20250519103959.ECC39873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bash: fix build with
 host GCC 15
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d09b25d08fe72e9781578fb512d5aa391b08c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

bash uses K&R function declarations which have been removed in C23.

Since part of the build process (like the mkbuiltins helper) is written
in C, building bash now fails on hosts with GCC 15 (which defaults to
C23).

Since properly fixing this on the source code level is a larger
endeavor, just set the C standard to an old enough version for now.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bash/bash.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 81f698f166..84f581da79 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -26,6 +26,10 @@ BASH_CONF_ENV += \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_printf_a_format=yes
 
+ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
+BASH_CONF_ENV += CFLAGS_FOR_BUILD="$(HOST_CFLAGS) -std=gnu17"
+endif
+
 # The static build needs some trickery
 ifeq ($(BR2_STATIC_LIBS),y)
 BASH_CONF_OPTS += --enable-static-link
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
