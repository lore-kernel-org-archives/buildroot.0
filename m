Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A7EC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C4CB41558;
	Sat, 12 Aug 2023 19:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4CB41558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIOECkvRz0j7; Sat, 12 Aug 2023 19:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7ED408FC;
	Sat, 12 Aug 2023 19:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E7ED408FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2880E1BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01F6540477
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01F6540477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnbMtmzVg4bd for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:39:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22DBF40003
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22DBF40003
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E06E848D1; Sat, 12 Aug 2023 19:39:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:39:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55b47a406095085bad3dc7e147f1162ba9d2ff30
X-Git-Newrev: 2bd93a30a60ad224f0ee974878d9d9b5dd1206af
X-Patchwork-Hint: ignore
Message-Id: <20230812193944.0E06E848D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xfsprogs: fix linking error when
 -O0 is used
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bd93a30a60ad224f0ee974878d9d9b5dd1206af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Urcu does not like -O0 it needs gcc optimizations.
Force -O1 in this case. Inspired by package fwts.

The issue got introduced in commit 2f8f69012e0eee7f3e98212fb3da118c211f3c0b:
before this commit, xfsprogs builds fine at -O0, after this commit, it fails
to build at -O0. As this commit went into 2022.02, the fix needs to be
backported to stable branches.

Fixes:
 - http://autobuild.buildroot.net/results/3bd/3bd7de784953ab1fa70bf5572eccd7b10e4a0e17

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xfsprogs/xfsprogs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 695471bddc..09f59a76f4 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -27,6 +27,10 @@ else
 XFSPROGS_CONF_OPTS += --disable-libicu
 endif
 
+ifeq ($(BR2_OPTIMIZE_0),y)
+XFSPROGS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
