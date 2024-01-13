Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E49CC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39E6C60ED0;
	Sat, 13 Jan 2024 20:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E6C60ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id moQubbytAXme; Sat, 13 Jan 2024 20:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9408C60F1B;
	Sat, 13 Jan 2024 20:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9408C60F1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9021BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87B4B83B4A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B4B83B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BkieWyIzZVw for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 441E583B67
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 441E583B67
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23DE586062; Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:29:34 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 53f9551e973b69f40372c360debc58fb202e159a
X-Git-Newrev: b003fea63bb676e142f3f048091cf51697c86c6c
X-Patchwork-Hint: ignore
Message-Id: <20240113203308.23DE586062@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/micropython: drop
 GIT_DIR=. workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=b003fea63bb676e142f3f048091cf51697c86c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Now that it is handled globally in TARGET_MAKE_ENV.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9024e18665232dc4047203edb6d012021baeedfa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index e6eb536ea5..3d356c51d8 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -14,11 +14,6 @@ MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
 
-# Set GIT_DIR so package won't use buildroot's version number
-MICROPYTHON_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	GIT_DIR=.
-
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
