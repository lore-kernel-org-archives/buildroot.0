Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC71E8181D
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 05:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0978E61410;
	Tue, 26 Sep 2023 05:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0978E61410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o624HxjWqAmf; Tue, 26 Sep 2023 05:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 516DD6140A;
	Tue, 26 Sep 2023 05:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 516DD6140A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3AB41BF969
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EAD360DFD
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EAD360DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyV_OG3hUCPm for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 05:50:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B249860D51
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 05:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B249860D51
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DA89877CF; Tue, 26 Sep 2023 05:50:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 07:44:22 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: b362115b259e65f1e575001da5b029c64df61972
X-Git-Newrev: 395d92503cfc85f8b6a46ba93f34048f634ce40d
X-Patchwork-Hint: ignore
Message-Id: <20230926055057.9DA89877CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/fio: remove
 -march=native
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

commit: https://git.buildroot.net/buildroot/commit/?id=395d92503cfc85f8b6a46ba93f34048f634ce40d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Per default, the fio package uses the "-march=native" GCC option. This
is of course wildly inappropriate for cross-compilation and can result
in illegal instructions. Thus we make sure fio will not use that
compiler option by passing --disable-native to configure.

Signed-off-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 056958724b8c7581aff2bc022841c1ca6db1e590)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/fio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 13818b60fd..b46ece7702 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -26,7 +26,8 @@ FIO_DEPENDENCIES += zlib
 endif
 
 define FIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
+	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --disable-native \
+		--cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
 endef
 
 define FIO_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
