Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DD2C54754
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 08:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B994B40B45;
	Wed, 28 Aug 2024 08:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQoJ-iBiC-ko; Wed, 28 Aug 2024 08:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 735E740B39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 735E740B39;
	Wed, 28 Aug 2024 08:53:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCEE11BF980
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 08:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A89788131C
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 08:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRAEPC1YtjUT for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 08:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12CB81318
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D12CB81318
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 08:53:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC06C865BA; Wed, 28 Aug 2024 08:53:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 10:48:41 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: b10a791c08641038998159dc89b73f0e9f122445
X-Git-Newrev: 029a9060538d398205a5317aed680cdb6744f33f
X-Patchwork-Hint: ignore
Message-Id: <20240828085309.CC06C865BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/busybox: fix
 build with glibc 2.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=029a9060538d398205a5317aed680cdb6744f33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97, it removed the deprecated
libcrypt support.

Until the upgrade of glibc to 2.39, Busybox could rely on the libcrypt
provided by glibc. Since version 2.39, glibc no longer provides
libcrypt, causing a build failure with Busybox configurations that
have CONFIG_USE_BB_CRYPT disabled.

To fix this, add the libxcrypt dependency to Busybox when
BR2_PACKAGE_LIBXCRYPT is selected. The user is still responsible for
enabling BR2_PACKAGE_LIBXCRYPT when their Busybox configuration has
CONFIG_USE_BB_CRYPT disabled.

Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a22f17881cce09c285067be096a683c523620826)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb5e7ad922..d25e5bf468 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -164,6 +164,10 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+BUSYBOX_DEPENDENCIES += libxcrypt
+endif
+
 # sha passwords need USE_BB_CRYPT_SHA
 ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256)$(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
 define BUSYBOX_SET_CRYPT_SHA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
