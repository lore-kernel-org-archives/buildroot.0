Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0DACAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C316E8078A;
	Mon,  8 Sep 2025 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaizlev_zdnq; Mon,  8 Sep 2025 14:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3CA980819
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3CA980819;
	Mon,  8 Sep 2025 14:18:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52975CA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B044340095
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRX6D4yqhnsA for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB97D40058
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB97D40058
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D795A80DA7; Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:55:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49fa20e6678ee32e4b26979f5cb4d149876fbedd
X-Git-Newrev: 01a765d3aefaf22a78ae5d0ac966e70545facca7
X-Patchwork-Hint: ignore
Message-Id: <20250908141630.D795A80DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: fix GCC 15.x build issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=01a765d3aefaf22a78ae5d0ac966e70545facca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream commit 4b9d7f7c107f01a61600fddcd8cde3812d0366a2
would allow to solve GCC 15.x issues, but it's a 313 KB patch. So
instead, let's build with -std=gnu99. It requires a bit of
reorganization on how CFLAGS are handled.

Fixes:

  http://autobuild.buildroot.net/results/4460089f5989277e6143f6e3d66f71371913ee4b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7d0456d510090ee90634486702a73c75102e99f1)
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libkrb5/libkrb5.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index e57a2b98a2..d0ec877d35 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -16,6 +16,8 @@ LIBKRB5_CPE_ID_PRODUCT = kerberos_5
 LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
+LIBKRB5_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+
 # The configure script uses AC_TRY_RUN tests to check for those values,
 # which doesn't work in a cross-compilation scenario. Therefore,
 # we feed the configure script with the correct answer for those tests
@@ -38,9 +40,11 @@ LIBKRB5_CONF_OPTS = \
 # Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode
 # so, we deactivate Thumb mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+LIBKRB5_CFLAGS += -marm
 endif
 
+LIBKRB5_CONF_ENV += CFLAGS="$(LIBKRB5_CFLAGS)"
+
 # Enabling static and shared at the same time is not supported
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 LIBKRB5_CONF_OPTS += --disable-static
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
