Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4B9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 187E0843A2;
	Tue, 29 Mar 2022 20:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2r079txXFSx; Tue, 29 Mar 2022 20:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1804D84394;
	Tue, 29 Mar 2022 20:29:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34D2A1BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 231BD8433E
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mn4A17zgTGd for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 767A684394
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2F01485F4E; Tue, 29 Mar 2022 20:20:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 22:19:53 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 45fcdf9bf9a54401f77b8f268d5494151de93c90
X-Git-Newrev: 7a1c2492d29b7b51e1ce4b563e9ec09b109d2802
X-Patchwork-Hint: ignore
Message-Id: <20220329202014.2F01485F4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/unbound: use
 system libevent
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a1c2492d29b7b51e1ce4b563e9ec09b109d2802
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The file descriptor limit when using the builtin mini-event
cannot handle more than 1024 file descriptors.

https://unbound.docs.nlnetlabs.nl/en/latest/topics/performance.html?highlight=libevent#using-libevent

Without explicit --with-libevent, it uses the builtin mini-event.

Signed-off-by: Kyle Harding <kyle@balena.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 929df7c483d19cf08badc36ef19a56735896b5d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 37456db416..78a817fdb3 100644
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
