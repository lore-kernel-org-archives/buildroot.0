Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D84AC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B577436BC;
	Wed, 10 Jan 2024 20:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B577436BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64pChsxF6YBh; Wed, 10 Jan 2024 20:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A465436E5;
	Wed, 10 Jan 2024 20:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A465436E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9D91BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A14435DF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32A14435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dmcg1C01lvY for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19985436BC
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19985436BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0597585C77; Wed, 10 Jan 2024 20:11:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:11:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22b629729667bac6aa3a9c5079be4487bb850d23
X-Git-Newrev: 9bf9cac489bfe313623d0382446a1504d4f75992
X-Patchwork-Hint: ignore
Message-Id: <20240110201141.0597585C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: do not build perl-based
 utilities
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9bf9cac489bfe313623d0382446a1504d4f75992
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added various utilities, for example exim_id_update
with commit https://github.com/Exim/exim/commit/46a36afae41f63de654269c8a0b7cf5852a85a14
which is a "Utility for one-time upgrage/downgrade between exim message-
id formats, around the 4.97 transition" which would add a dependency to
host-perl/perl so we build and install only the needed exim binary.

Fixes:

  http://autobuild.buildroot.net/results/111302dc3b4763befe9b159ae59b1b72de9162ea/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
