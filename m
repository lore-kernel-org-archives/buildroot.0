Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D01C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 889A460525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 889A460525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 638DE40266;
	Tue,  3 Aug 2021 22:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5PP7qqjyYuH; Tue,  3 Aug 2021 22:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68EB401D2;
	Tue,  3 Aug 2021 22:54:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 169D21BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10F7E4061D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sbh52SAUHzrS for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FB47405A0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 94C9C843F5; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 2 Jun 2021 23:08:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4526078d1b4be109d13343243151a6eb98f0532f
X-Git-Newrev: 8a313b019c7d7e898186a8b08f9c25ae0194fa16
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.94C9C843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lvm2: fix installation
 of systemd units
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8a313b019c7d7e898186a8b08f9c25ae0194fa16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since we bump the version in commit 80997acd3587 (package/lvm2: bump
version to 2.03.12), the installation of systemd units is no longer
functional without a full installation.

As Pascal puts it: the systemd service files don't make a whole lot of
sense when there isn't a full lvm2 install.

Move the conditional block that install system units, so that it only
occurs when we do a full installation.

Fixes;
    http://autobuild.buildroot.org/results/f47/f470ffb55625e2639cecde713442550eb532d0d7/
    http://autobuild.buildroot.org/results/954/9547929292e81671fbe3a5b4bbc87a6424edb1ca/
    http://autobuild.buildroot.org/results/303/30359c351a6ce2f9139494a531e036f0b0406ccf

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Co-Developped-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lvm2/lvm2.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 00baa50a86..70787fe91b 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -49,14 +49,15 @@ endif
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LVM2_INSTALL_STAGING_OPTS += install
 LVM2_INSTALL_TARGET_OPTS += install
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
+endif
 else
 LVM2_MAKE_OPTS = device-mapper
 LVM2_INSTALL_STAGING_OPTS += install_device-mapper
 LVM2_INSTALL_TARGET_OPTS += install_device-mapper
 endif
 
-ifeq ($(BR2_INIT_SYSTEMD),y)
-LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
 endif
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
