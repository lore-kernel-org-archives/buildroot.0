Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57A5C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B8360A9A;
	Sat, 13 Jan 2024 20:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B8360A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gq8-BCX8Rv4f; Sat, 13 Jan 2024 20:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D8660BAA;
	Sat, 13 Jan 2024 20:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D8660BAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4AF1BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 049F24059D
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 049F24059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PjbznSiEG-nB for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:31:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E84424026F
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E84424026F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D33418600E; Sat, 13 Jan 2024 20:31:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 16:10:09 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7796294112383448c2ce27b33a29d5245bb536b0
X-Git-Newrev: 75ed72cec32e2ed0ea9b94f2c15204ab94da56f0
X-Patchwork-Hint: ignore
Message-Id: <20240113203128.D33418600E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/exim: do not
 build perl-based utilities
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

commit: https://git.buildroot.net/buildroot/commit/?id=75ed72cec32e2ed0ea9b94f2c15204ab94da56f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Upstream added various utilities, for example exim_id_update
with commit https://github.com/Exim/exim/commit/46a36afae41f63de654269c8a0b7cf5852a85a14
which is a "Utility for one-time upgrage/downgrade between exim message-
id formats, around the 4.97 transition" which would add a dependency to
host-perl/perl so we build and install only the needed exim binary.

Fixes:

  http://autobuild.buildroot.net/results/111302dc3b4763befe9b159ae59b1b72de9162ea/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9bf9cac489bfe313623d0382446a1504d4f75992)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 98b6097957..84fe96218c 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -144,16 +144,15 @@ define EXIM_BUILD_CMDS
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_CFLAGS)"
+		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_CFLAGS)" exim
 endef
 
 # Need to replicate the LFLAGS in install, as exim still wants to build
 # something when installing...
 define EXIM_INSTALL_TARGET_CMDS
-	DESTDIR=$(TARGET_DIR) INSTALL_ARG="-no_chown -no_symlink" build=br \
-	  $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS)" \
-		install
+	cd $(@D)/build-br; \
+		DESTDIR=$(TARGET_DIR) build=br \
+		../scripts/exim_install -no_chown -no_symlink exim
 	chmod u+s $(TARGET_DIR)/usr/sbin/exim
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
