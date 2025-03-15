Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8C2C28B2F
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C68F83B9C;
	Tue, 18 Mar 2025 15:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hB3cWbr-eibc; Tue, 18 Mar 2025 15:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B77683C9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B77683C9F;
	Tue, 18 Mar 2025 15:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0D1D5
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C11C9816E9
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uF-QRNWpV0NX for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7893F81776
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7893F81776
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72AD284755; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:16:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ae4c36dfe392c2a0a729f2d5bc823759e83cf51
X-Git-Newrev: 2795fecc50ca91d7303ae817cdfa260eabd0975e
X-Patchwork-Hint: ignore
Message-Id: <20250318150245.72AD284755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: add an option to force
 JSON support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2795fecc50ca91d7303ae817cdfa260eabd0975e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, nftables JSON support is implicit: if jansson is enabled,
JSON support is enabled, otherwise it is not.

Some packages will require that nftables be built with JSON support;
that's the case of netavarks, for example (to come in a later patch).
So, in the current state, it would mean a package would have to select
jansson, although it does not itself use it, so that nftables has JSON
support. This does not feel right.

Instead, introduce an option to nftables, to explicitly enabled JSON
support. Packages such as netavark would then just have to require JSON
support in nftables.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nftables/Config.in   | 7 ++++++-
 package/nftables/nftables.mk | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 833a3a38a2..514682ec48 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -13,9 +13,14 @@ config BR2_PACKAGE_NFTABLES
 
 	  http://www.netfilter.org/projects/nftables/index.html
 
-# Legacy: this used to be handled in nftables.mk
 if BR2_PACKAGE_NFTABLES
+# Legacy: this used to be handled in nftables.mk
 source "package/nftables/nftables-python/Config.in"
+
+config BR2_PACKAGE_NFTABLES_JSON
+	bool "json support"
+	select BR2_PACKAGE_JANSSON
+
 endif
 
 comment "nftables needs a toolchain w/ wchar, headers >= 3.12"
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 380e553cde..f6e6a64efd 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -42,7 +42,7 @@ else
 NFTABLES_CONF_OPTS += --without-cli
 endif
 
-ifeq ($(BR2_PACKAGE_JANSSON),y)
+ifeq ($(BR2_PACKAGE_NFTABLES_JSON),y)
 NFTABLES_DEPENDENCIES += jansson
 NFTABLES_CONF_OPTS += --with-json
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
