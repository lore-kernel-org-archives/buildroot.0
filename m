Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFB5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9723847DC;
	Wed, 23 Mar 2022 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5zX4SYD3pQN; Wed, 23 Mar 2022 21:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD21780B4A;
	Wed, 23 Mar 2022 21:44:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6438D1BF489
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1A5441919
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3K7eVuNjnMfV for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D3341A2D
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 31AB0856EE; Wed, 23 Mar 2022 21:31:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:10:38 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 92f0dbbcbd34ad39834fcc83dc5991a315d4a793
X-Git-Newrev: b9adf86d9b64c32acfb9e2a1b0c1567b06ab8fe6
X-Patchwork-Hint: ignore
Message-Id: <20220323213134.31AB0856EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: fix libxml2
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9adf86d9b64c32acfb9e2a1b0c1567b06ab8fe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libxml2 raised since bump to
version 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92:

configure: error: Specifying libxml2 installation path is not supported, adjust PKG_CONFIG_PATH instead

Fixes:
 - http://autobuild.buildroot.org/results/648d29e4cfa6a40bb6e54793c044e9c834f03a1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 33413b7e5326591dbfc29050a0d1136dcae868c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 72f1e4dcdc..a595baabc5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -67,7 +67,7 @@ BIND_CONF_OPTS += --with-gssapi=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
+BIND_CONF_OPTS += --with-libxml2
 BIND_DEPENDENCIES += libxml2
 else
 BIND_CONF_OPTS += --with-libxml2=no
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
