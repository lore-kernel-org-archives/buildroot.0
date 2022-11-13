Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB23FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D6C81991;
	Sun, 13 Nov 2022 16:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D6C81991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oU2blT4JYAOE; Sun, 13 Nov 2022 16:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9651181A12;
	Sun, 13 Nov 2022 16:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9651181A12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77F001BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 538748146F
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538748146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqEuDDXS8cma for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 396C681747
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 396C681747
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2991E836E9; Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 16:52:59 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5509017af22757f2ca8befbdf75b0eeb521ed78c
X-Git-Newrev: 16361553911ca48bce1b043d6f18486b6fdcd1ed
X-Patchwork-Hint: ignore
Message-Id: <20221113160416.2991E836E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/iwd: drop dbus
 check
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

commit: https://git.buildroot.net/buildroot/commit/?id=16361553911ca48bce1b043d6f18486b6fdcd1ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Since 6f5f6bc dbus is selected when iwd is selected.
It is only a runtime dependency, so drop the build
dependency.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iwd/iwd.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 6814a04bf8..5bea3f12b4 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -15,16 +15,11 @@ IWD_SELINUX_MODULES = networkmanager
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
-	--enable-external-ell
+	--enable-external-ell \
+	--enable-dbus-policy \
+	--with-dbus-datadir=/usr/share
 IWD_DEPENDENCIES = ell
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
-IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
-IWD_DEPENDENCIES += dbus
-else
-IWD_CONF_OPTS += --disable-dbus-policy
-endif
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 # iwd client depends on readline (GPL-3.0+)
 IWD_LICENSE += , GPL-3.0+ (client)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
