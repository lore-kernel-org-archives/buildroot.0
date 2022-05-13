Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DD4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C57840170;
	Fri, 13 May 2022 22:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmnfymAn1i-H; Fri, 13 May 2022 22:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA14F40155;
	Fri, 13 May 2022 22:17:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1DF51BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34EA0409A0
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGZpsB7c1laG for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CBA241487
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D6F3285E29; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d6abde27c98a1c6d8965a1ee2aa4afce8a34c5d
X-Git-Newrev: ef7642c5065784a28a29d9a21cc66398d2bd1cf1
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.D6F3285E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson: do not pass
 -j$(PARALLEL_JOBS) to ninja
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef7642c5065784a28a29d9a21cc66398d2bd1cf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we are using ninja with jobserver support we should not pass
-j$(PARALLEL_JOBS) to ninja.

Fixes:
ninja: warning: -jN forced on command line; ignoring GNU make jobserver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 9987fb73bb..0835e08e3a 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -27,7 +27,7 @@
 #
 MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
 NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
-NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
+NINJA_OPTS	= $(if $(VERBOSE),-v)
 
 # https://mesonbuild.com/Reference-tables.html#cpu-families
 ifeq ($(BR2_arcle)$(BR2_arceb),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
