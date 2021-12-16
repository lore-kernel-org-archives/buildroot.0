Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E594C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B679061047;
	Thu, 16 Dec 2021 18:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1v3er1yakTH; Thu, 16 Dec 2021 18:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AAC26102D;
	Thu, 16 Dec 2021 18:24:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 861481BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 755AE61041
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUzQpisYCTCl for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:24:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAB7F60D77
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:24:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 70898818E5; Thu, 16 Dec 2021 18:19:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:08:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d605443ce3fca0195d1a16dbf59514224deb3c1
X-Git-Newrev: cfc2821baf0cd18dd71125374a924cbafab44b2f
X-Patchwork-Hint: ignore
Message-Id: <20211216181916.70898818E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: add libcap support
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfc2821baf0cd18dd71125374a924cbafab44b2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/frr/frr.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index e707f50ca1..49b4a190f0 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -29,11 +29,17 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--enable-user=frr \
 	--enable-group=frr \
 	--enable-vty-group=frrvty \
-	--disable-capabilities \
 	--enable-fpm
 
 HOST_FRR_CONF_OPTS = --enable-clippy-only
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+FRR_DEPENDENCIES += libcap
+FRR_CONF_OPTS += --enable-capabilities
+else
+FRR_CONF_OPTS += --disable-capabilities
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
