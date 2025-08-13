Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9FACAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE65180596;
	Mon,  8 Sep 2025 14:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSw6Oe8Ow3Jj; Mon,  8 Sep 2025 14:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD5B080556
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD5B080556;
	Mon,  8 Sep 2025 14:16:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF37CA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 727E480517
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7moa2hKs83Y for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4A75804DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4A75804DF
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4D3C818B3; Mon,  8 Sep 2025 14:16:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 18:00:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da8587d2db2620efe9461213bbecb7c532776e64
X-Git-Newrev: 9007673de7b57c5e83c5e077f35d6948b8aa8954
X-Patchwork-Hint: ignore
Message-Id: <20250908141620.B4D3C818B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: make ECMP max configurable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9007673de7b57c5e83c5e077f35d6948b8aa8954
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream FRR accepts --enable-multipath=N in the range 1-999. Buildroot
previously hardcoded 256.

Add a config integer to set the maximum ECMP paths at build time, keeping
256 as the default. Lower values help match hardware limits or reduce
memory; higher values are useful for software routing or lab testing.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/frr/Config.in | 8 ++++++++
 package/frr/frr.mk    | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index feb1aef05a..6c26b6d2e1 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -33,6 +33,14 @@ config BR2_PACKAGE_FRR_BMP
 	help
 	  Build BGP Monitoring Protocol daemon.
 
+config BR2_PACKAGE_FRR_MULTIPATH_MAX
+	int "maximum ECMP paths"
+	default 256
+	range 1 999
+	help
+	  Compile FRR with support for up to this many equal-cost
+	  next-hops (ECMP).
+
 config BR2_PACKAGE_FRR_NHRPD
 	bool "NHRPD protocol"
 	select BR2_PACKAGE_C_ARES
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index fb7477a211..e41ee33caa 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -40,7 +40,7 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--with-moduledir=/usr/lib/frr/modules \
 	--enable-configfile-mask=0640 \
 	--enable-logfile-mask=0640 \
-	--enable-multipath=256 \
+	--enable-multipath=$(BR2_PACKAGE_FRR_MULTIPATH_MAX) \
 	--disable-ospfclient \
 	--enable-user=frr \
 	--enable-group=frr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
