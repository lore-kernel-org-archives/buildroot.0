Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57523C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13D785E42;
	Fri, 28 Feb 2025 17:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7lGYmiNDc4J; Fri, 28 Feb 2025 17:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C2AE85E3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C2AE85E3E;
	Fri, 28 Feb 2025 17:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C5D68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80D5A42DA8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDorYj0I5FWP for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42DBC46A5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42DBC46A5D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 341BF80807; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 21:40:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 004db1f5f3adaab7264b84e0896f9761cd9a2657
X-Git-Newrev: 8a1ae9e0b151063528e67b8b34a1229dc729df3c
X-Patchwork-Hint: ignore
Message-Id: <20250228163043.341BF80807@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sqlite: fix build
 issue if C++ is not enabled since bump to 3.49.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a1ae9e0b151063528e67b8b34a1229dc729df3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot commit [1] bumped sqlite to 3.49.0, and commit [2] fixed the
package infra. But if the toolchain does not have C++ support enabled,
the following error will occur.
  Error: failed to find: no

The reason was CXX has been set to 'no' in the package/Makefile.in file.
ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
TARGET_CONFIGURE_OPTS += CXX=no
endif

Then the autosetup script will look for a required path ('no' above),
and will exit with an error if not found.

To solve it, we can set CXX to 'false' instead of 'no', so that the
autosetup script will skip checking for a C++ compiler.

Fixes:
  https://autobuild.buildroot.org/?reason=sqlite-3.49.0
  https://autobuild.buildroot.org/results/569a3750681cc10688ac663450dc2773a317bb07/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/db85638cea3414ca0293cbbb2352e5b0b63a2579
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/a93680be30bc35f7d2465ef576035fb937ea1d64

Signed-off-by: Scott Fan <fancp2007@gmail.com>
[Julien: add a link to an actual build failure]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 255ddc937b..8016ff1c4c 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -65,7 +65,9 @@ endif
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
 
 define SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
+		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
+		$(SQLITE_CONF_ENV) ./configure \
 		--prefix=/usr \
 		--host="$(GNU_TARGET_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
@@ -87,7 +89,8 @@ define SQLITE_INSTALL_TARGET_CMDS
 endef
 
 define HOST_SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) \
+		$(SQLITE_CONF_ENV) ./configure \
 		--prefix=/usr \
 		--host="$(GNU_HOST_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
