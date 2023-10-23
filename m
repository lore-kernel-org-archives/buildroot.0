Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9794EC25B47
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DE9042274;
	Mon, 23 Oct 2023 17:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DE9042274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISYy5NUVaR0v; Mon, 23 Oct 2023 17:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8832A4240C;
	Mon, 23 Oct 2023 17:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8832A4240C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDDB21BF371
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 690F54146D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 690F54146D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWHGuyPBGzyC for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C9241800
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61C9241800
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BC3885E8C; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 19:18:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef2aa9e6b5894b1f361d8573c9a03ecc5f588d18
X-Git-Newrev: e0cecc326a9649bc3b89153d762c2c2a4382f60d
X-Patchwork-Hint: ignore
Message-Id: <20231023172717.4BC3885E8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg: enable sha256sum support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0cecc326a9649bc3b89153d762c2c2a4382f60d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for sha256 has no additional dependency, the size increase is
minimal, and sha256 is the smallest hash still not broken (md5 and sha1
are), so it makes sense to enable it unconditionally.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: make it unconditional and commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg/opkg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index ea870aa21a..a550543f3e 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -10,6 +10,7 @@ OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
+OPKG_CONF_OPTS = --enable-sha256
 
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
