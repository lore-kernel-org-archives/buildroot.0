Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4614AC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A225608C3;
	Wed, 14 Aug 2024 21:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTLyJUo0FdjL; Wed, 14 Aug 2024 21:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1DD608F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1DD608F0;
	Wed, 14 Aug 2024 21:46:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1041A1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F08B580D24
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufssbYEhO7jl for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB59D802D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB59D802D3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:46:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D784185D4D; Wed, 14 Aug 2024 21:46:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 23:45:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5f76c30024dab07cad46f952c74e171733a32730
X-Git-Newrev: 52e9d8785a33b5fd3aa3dd8f1af60fa17a17f4d0
X-Patchwork-Hint: ignore
Message-Id: <20240814214622.D784185D4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unbound: enable
 tfo-client for uClibc-ng systems
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

commit: https://git.buildroot.net/buildroot/commit/?id=52e9d8785a33b5fd3aa3dd8f1af60fa17a17f4d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

uClibc-ng systems have MSG_FASTOPEN since 2018 so no need
to disable support for TCP fastopen client mode.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unbound/unbound.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index ff0262bef1..04386e8d5b 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -18,18 +18,11 @@ UNBOUND_CONF_OPTS = \
 	--with-pidfile=/var/run/unbound.pid \
 	--with-rootkey-file=/etc/unbound/root.key \
 	--enable-tfo-server \
+	--enable-tfo-client \
 	--with-libevent=$(STAGING_DIR)/usr \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
-# uClibc-ng does not have MSG_FASTOPEN
-# so TCP Fast Open client mode disabled for it
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-UNBOUND_CONF_OPTS += --disable-tfo-client
-else
-UNBOUND_CONF_OPTS += --enable-tfo-client
-endif
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 UNBOUND_CONF_OPTS += --with-pthreads
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
