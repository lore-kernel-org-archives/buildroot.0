Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B2C433FE
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B93E82893;
	Mon, 10 Jan 2022 07:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5l-ouXAj0-HX; Mon, 10 Jan 2022 07:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60E6E827FD;
	Mon, 10 Jan 2022 07:19:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93BA91BF97F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82D4B82730
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UARIK8Oq8fdd for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:19:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F33D5824E2
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:19:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B786D82DFE; Mon, 10 Jan 2022 07:13:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 08:17:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d01f3401320077c6d572135e47ffc4ae218a6ef5
X-Git-Newrev: 4043bc0c9c55e1bcac58677c361cd1b8724716b8
X-Patchwork-Hint: ignore
Message-Id: <20220110071316.B786D82DFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiawatha: mbedtls is mandatory,
 not optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=4043bc0c9c55e1bcac58677c361cd1b8724716b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hiawatha is unconditionally using mbedtls since bump to version 11.1 in
commit 24e4c888c3d36e3943206ea55894b84344cc8b2e (e.g. wigwam.c includes
"mbedtls/md5.h")

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hiawatha/hiawatha.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 017592de1e..ed9f8aba54 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -11,7 +11,10 @@ HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
 HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
 
+# Disable system mbedtls as hiawatha needs mbedtls 3.x
 HIAWATHA_CONF_OPTS = \
+	-DINSTALL_MBEDTLS_HEADERS=OFF \
+	-DUSE_SYSTEM_MBEDTLS=OFF \
 	-DENABLE_TOOLKIT=OFF \
 	-DCONFIG_DIR=/etc/hiawatha \
 	-DLOG_DIR=/var/log \
@@ -20,11 +23,7 @@ HIAWATHA_CONF_OPTS = \
 	-DWORK_DIR=/var/lib/hiawatha
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
-# Disable system mbedtls as hiawatha needs mbedtls 3.x
-HIAWATHA_CONF_OPTS += \
-	-DENABLE_TLS=ON \
-	-DINSTALL_MBEDTLS_HEADERS=OFF \
-	-DUSE_SYSTEM_MBEDTLS=OFF
+HIAWATHA_CONF_OPTS += -DENABLE_TLS=ON
 else
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
