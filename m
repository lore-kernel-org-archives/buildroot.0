Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25626C54755
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EADA861242;
	Fri, 16 May 2025 11:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzwbPZwA6sdR; Fri, 16 May 2025 11:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 224B161315
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 224B161315;
	Fri, 16 May 2025 11:23:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5508413D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E027832A9
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEZA5nLMQgrP for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C9D83AC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98C9D83AC5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 969FC81152; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:06:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8c31fb8d11f765b957098461716bfe440f0dda7f
X-Git-Newrev: 1c7120d159582da0be8b249aac573c16455eb6e1
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.969FC81152@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bash: fix build
 with host GCC 15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c7120d159582da0be8b249aac573c16455eb6e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

bash uses K&R function declarations which have been removed in C23.

Since part of the build process (like the mkbuiltins helper) is written
in C, building bash now fails on hosts with GCC 15 (which defaults to
C23).

Since properly fixing this on the source code level is a larger
endeavor, just set the C standard to an old enough version for now.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6d09b25d08fe72e9781578fb512d5aa391b08c3f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
