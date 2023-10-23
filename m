Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A72CC25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E419423DA;
	Mon, 23 Oct 2023 17:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E419423DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtNsI6jc376E; Mon, 23 Oct 2023 17:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F25423FD;
	Mon, 23 Oct 2023 17:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F25423FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 747B01BF371
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E11C612BB
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E11C612BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jk47QaVUg5ff for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CA9D612B6
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CA9D612B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D7E085E8A; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 19:18:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d55ba0f8aa6b64f0b2df921934af2814e20680f
X-Git-Newrev: 23a669456f304e6bf0a5e61278efd2f89a07ed7e
X-Patchwork-Hint: ignore
Message-Id: <20231023172717.1D7E085E8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg: add xz suspport
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

commit: https://git.buildroot.net/buildroot/commit/?id=23a669456f304e6bf0a5e61278efd2f89a07ed7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: drop option, use package as condition]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg/opkg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index f14c850440..5a4c08e0b2 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -22,6 +22,13 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+OPKG_DEPENDENCIES += xz
+OPKG_CONF_OPTS += --enable-xz
+else
+OPKG_CONF_OPTS += --disable-xz
+endif
+
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 OPKG_DEPENDENCIES += zstd
 OPKG_CONF_OPTS += --enable-zstd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
