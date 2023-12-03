Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F462C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4758641584;
	Sun,  3 Dec 2023 16:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4758641584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlalZ6eQO8QC; Sun,  3 Dec 2023 16:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D2A741514;
	Sun,  3 Dec 2023 16:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D2A741514
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 037B01BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0D1540910
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D1540910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5Gbfi56OD7f for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:44:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 158394090F
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 158394090F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 027118779B; Sun,  3 Dec 2023 16:44:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:43:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdc9b8a3a75c4c39f23feb4e3b0e296786e0132c
X-Git-Newrev: 51cf6a8aa6132385f81c34bbd088924b653b93b8
X-Patchwork-Hint: ignore
Message-Id: <20231203164416.027118779B@busybox.osuosl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51cf6a8aa6132385f81c34bbd088924b653b93b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--with-ssl-dir will exclusively search for dynamic library so use
--with-ssl-static to fix the following openssl static build failure
raised since bump to version 5.33.0 in commit
8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:

checking for static SSL support... disabled
checking for SSL support... enabled
checking for SSL include directory... /home/buildroot/autobuild/instance-2/output-1/host/mipsel-buildroot-linux-uclibc/sysroot/usr/include
checking for SSL library directory... /lib64

[...]

mipsel-buildroot-linux-uclibc-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/lib64'

Fixes:
 - http://autobuild.buildroot.org/results/4189decbafb5d28c11d89ddac792b4610abeaff1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/monit/monit.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 4766ce3d9e..c709f903e6 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -27,7 +27,11 @@ MONIT_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONIT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+ifeq ($(BR2_STATIC_LIBS),y)
+MONIT_CONF_OPTS += --with-ssl-static=$(STAGING_DIR)/usr
+else
 MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
+endif
 MONIT_DEPENDENCIES += host-pkgconf openssl
 else
 MONIT_CONF_OPTS += --without-ssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
