Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6D3E7D0C5
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 05:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8638613F2;
	Tue, 26 Sep 2023 05:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8638613F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3sT-EwT8T1O; Tue, 26 Sep 2023 05:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27DD760DFD;
	Tue, 26 Sep 2023 05:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27DD760DFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E6F51BF33A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44E07404A8
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E07404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzG4OJ2YctT9 for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 05:50:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FC54404A6
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 05:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC54404A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EEFD877CF; Tue, 26 Sep 2023 05:50:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 07:43:47 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b57090af18fde4961eebd322e7cad9ab2ce864a4
X-Git-Newrev: d741d59342036cedda9129cc9001ca560c58ad27
X-Patchwork-Hint: ignore
Message-Id: <20230926055057.4EEFD877CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/fio: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=d741d59342036cedda9129cc9001ca560c58ad27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
