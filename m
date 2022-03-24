Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FD0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCC0C41087;
	Thu, 24 Mar 2022 21:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4dH0vcq0eAV; Thu, 24 Mar 2022 21:46:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91FC74107E;
	Thu, 24 Mar 2022 21:46:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A78291BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4E498293F
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7r9ZqC5aSqu for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:46:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C5C182438
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:46:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D8B1385C9A; Thu, 24 Mar 2022 21:37:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 22:40:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fc5bc235990073233df6352d1208624034a6b6e
X-Git-Newrev: 929df7c483d19cf08badc36ef19a56735896b5d5
X-Patchwork-Hint: ignore
Message-Id: <20220324213751.D8B1385C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: use system libevent
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

commit: https://git.buildroot.net/buildroot/commit/?id=929df7c483d19cf08badc36ef19a56735896b5d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file descriptor limit when using the builtin mini-event
cannot handle more than 1024 file descriptors.

https://unbound.docs.nlnetlabs.nl/en/latest/topics/performance.html?highlight=libevent#using-libevent

Without explicit --with-libevent, it uses the builtin mini-event.

Signed-off-by: Kyle Harding <kyle@balena.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/unbound/unbound.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 1e6e0d99d7..782ed2b049 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -17,6 +17,7 @@ UNBOUND_CONF_OPTS = \
 	--with-pidfile=/var/run/unbound.pid \
 	--with-rootkey-file=/etc/unbound/root.key \
 	--enable-tfo-server \
+	--with-libevent=$(STAGING_DIR)/usr \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
