Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A80C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 09:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECD2E40990;
	Mon, 11 Apr 2022 09:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWQul34qZsKf; Mon, 11 Apr 2022 09:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0746A40919;
	Mon, 11 Apr 2022 09:48:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1541C1BF44A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE918607B5
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQ9POULZVrN1 for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3294606BF
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3234483984; Mon, 11 Apr 2022 09:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 11:44:34 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 74ebf870111f0f3ea95c7daa13637866de8f59a1
X-Git-Newrev: 0397064a9a147903e9e0c16b2506319ea4a246fb
X-Patchwork-Hint: ignore
Message-Id: <20220411093637.3234483984@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dhcp: fix build
 with zlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=0397064a9a147903e9e0c16b2506319ea4a246fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

internal bind is in version 9.11 and so doesn't support pkg-config
like bind 9.16 resulting in the following build failure since commit
0c8dd6ebd656e06cf99a63eb93343715f4853503:

configure: error: include/zlib.h not found.

Fixes:
 - http://autobuild.buildroot.org/results/7a5cdf30881d208807976cf98960c5fe2abfed50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 789a08dac5808401629d6fc586b7377f54ebb316)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f1e3c22f1c..460e62a81c 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -42,7 +42,7 @@ DHCP_CONF_OPTS = \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-DHCP_BIND_EXTRA_CONFIG += --with-zlib
+DHCP_BIND_EXTRA_CONFIG += --with-zlib=$(STAGING_DIR)/usr
 DHCP_DEPENDENCIES += zlib
 else
 DHCP_BIND_EXTRA_CONFIG += --without-zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
