Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443DBC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB99E81E7E;
	Tue,  6 Dec 2022 22:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB99E81E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0ja67W7HOEo; Tue,  6 Dec 2022 22:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E66081E90;
	Tue,  6 Dec 2022 22:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E66081E90
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 876991BF39E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DE91400AC
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE91400AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwAKXJ6R6ojj for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 738F6408EA
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 738F6408EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6231985CD3; Tue,  6 Dec 2022 22:12:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Dec 2022 23:12:10 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: f5b73fc5c99b74da90aa251df6ad373706db719a
X-Git-Newrev: b422af7890f7fec9b6a5bfbad8f51eff58139d04
X-Patchwork-Hint: ignore
Message-Id: <20221206221242.6231985CD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/dash: fix static
 with shared build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b422af7890f7fec9b6a5bfbad8f51eff58139d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

When BR2_SHARED_STATIC_LIBS is enabled we pass both --enable-static and
--enable-shared to configure. dash configure.ac only looks for
--enable-static to make the build static. But when linking against
libedit pkg-config only returns dynamic linking dependencies, so the
indirect ncurses dependency in not mentioned. The end result is that
libedit can't find ncurses symbols on link.

BR2_SHARED_STATIC_LIBS only makes sense for libraries, not executable
binaries. Pass --disable-static unless BR2_STATIC_LIBS is enabled for
static only build.

Fixes:
http://autobuild.buildroot.net/results/137d39cc5ec436759a2fde3f26ce5633e0ad6c2e/
http://autobuild.buildroot.net/results/55a38e0e45212bf7403d9ccb626c9422e3affe72/
http://autobuild.buildroot.net/results/8f109f1a04a6a2ff6d8c4c920e499fbaec3f72b9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e3c14de0dfc047817917fb4dbc20c211e751bb3f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dash/dash.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index fed3a99551..6efc71e568 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -27,6 +27,10 @@ else
 DASH_CONF_OPTS += --without-libedit
 endif
 
+ifeq ($(BR2_STATIC_LIBS),)
+DASH_CONF_OPTS += --disable-static
+endif
+
 define DASH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
