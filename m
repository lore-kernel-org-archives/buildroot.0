Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB776EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35C50417EC;
	Mon, 10 Jul 2023 18:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35C50417EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9umZbJTnHctE; Mon, 10 Jul 2023 18:31:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C11417F6;
	Mon, 10 Jul 2023 18:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C11417F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEA8F1BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A85E661008
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85E661008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bF9Zwus8JpJl for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:31:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58F6606F9
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58F6606F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C293886CAC; Mon, 10 Jul 2023 18:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 20:30:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a4e7da7e78ceaa89e93a5a93cb9631e1db7ee62
X-Git-Newrev: 36c29522ae6840eb8815a4e0c037f4cd17b1f126
X-Patchwork-Hint: ignore
Message-Id: <20230710183113.C293886CAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gkrellm: link with -latomic if
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=36c29522ae6840eb8815a4e0c037f4cd17b1f126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5df/5dffba341cfe5e4d41b3c88e58d92b0747318c07/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gkrellm/gkrellm.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 2a68722663..27a87be190 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -12,7 +12,13 @@ GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
 GKRELLM_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 GKRELLM_BUILD_OPTS = \
 	STRIP="" \
-	SYS_LIBS=$(TARGET_NLS_LIBS)
+	SYS_LIBS="$(GKRELLM_SYS_LIBS)"
+
+GKRELLM_SYS_LIBS = $(TARGET_NLS_LIBS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GKRELLM_SYS_LIBS += -latomic
+endif
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 GKRELLM_DEPENDENCIES += lm-sensors
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
