Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148CFC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92601416C4;
	Sun, 17 Jul 2022 21:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92601416C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpuqiooWC-AM; Sun, 17 Jul 2022 21:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62FFA416C1;
	Sun, 17 Jul 2022 21:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62FFA416C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF601BF29D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 152C9416C1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152C9416C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iYOQzghbo9n for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:23:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85641416BE
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85641416BE
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7C9F783C48; Sun, 17 Jul 2022 21:10:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 23:21:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91923baf49f358160fe6e0850bdba3d03329a7f5
X-Git-Newrev: 0a09bd7088e0f222772757055244f6753694ea04
X-Patchwork-Hint: ignore
Message-Id: <20220717211032.7C9F783C48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvazaar: add cryptopp support
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a09bd7088e0f222772757055244f6753694ea04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-pkgconf is only needed to find cryptopp when it is explicitly
enabled, but a check for pkg-config is still done either way.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: keep host-pkgconf as unconditional dep]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kvazaar/kvazaar.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index e2ab132203..17e2ea8caf 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -11,6 +11,12 @@ KVAZAAR_LICENSE = BSD-3-Clause, ISC (greatest, x264asm)
 KVAZAAR_LICENSE_FILES = LICENSE LICENSE.greatest LICENSE.x264asm
 KVAZAAR_INSTALL_STAGING = YES
 KVAZAAR_DEPENDENCIES = host-pkgconf
-KVAZAAR_CONF_OPTS = --without-cryptopp
+
+ifeq ($(BR2_PACKAGE_CRYPTOPP),y)
+KVAZAAR_DEPENDENCIES += cryptopp
+KVAZAAR_CONF_OPTS += --with-cryptopp
+else
+KVAZAAR_CONF_OPTS += --without-cryptopp
+endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
