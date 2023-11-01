Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC588C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACD94EEE0;
	Wed,  1 Nov 2023 22:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACD94EEE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3J6zEP4ITut; Wed,  1 Nov 2023 22:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0BAE4EEF3;
	Wed,  1 Nov 2023 22:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0BAE4EEF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 272C51BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3FD6432A2
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3FD6432A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AF-zasb4eaNZ for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:44:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01751432A5
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01751432A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0D00864FF; Wed,  1 Nov 2023 22:44:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 23:43:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 278f4f43a34b40c6713d55fb8237d95b4fb2755f
X-Git-Newrev: 4c05f8d143f27a604ad51ab065b7047585e50c53
X-Patchwork-Hint: ignore
Message-Id: <20231101224409.E0D00864FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/monit: fix openssl static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c05f8d143f27a604ad51ab065b7047585e50c53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following openssl static build failure raised since bump to
version 5.33.0 in commit 8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:

configure: error: Could not find SSL library, please use --with-ssl-lib-dir option or disabled the SSL support using --without-ssl

Fixes:
 - http://autobuild.buildroot.org/results/b2fe4ecd1d84c3cf7d0eb8f606b20bc6638d6d65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/monit/monit.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index aa068302e3..4766ce3d9e 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -26,8 +26,9 @@ MONIT_CONF_OPTS += \
 	--with-largefiles
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MONIT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
-MONIT_DEPENDENCIES += openssl
+MONIT_DEPENDENCIES += host-pkgconf openssl
 else
 MONIT_CONF_OPTS += --without-ssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
