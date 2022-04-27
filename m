Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB4CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE5A831D6;
	Wed, 27 Apr 2022 18:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 730OoFax-3qe; Wed, 27 Apr 2022 18:58:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73E783163;
	Wed, 27 Apr 2022 18:58:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 548561BF9CB
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83C4F60ED5
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Myt8NFWzmafN for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D619A60EE2
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3E8D5845FF; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abb1286fa02bf89be32e84ccb86a441da10147ea
X-Git-Newrev: 915c1d0aa4cee24bf9f8d9c60cafd708fe4e2f19
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.3E8D5845FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/pure-ftpd: doesn't build
 with libressl"
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

commit: https://git.buildroot.net/buildroot/commit/?id=915c1d0aa4cee24bf9f8d9c60cafd708fe4e2f19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e87e6fd085b8a4965b9dc84635fd36e380da4dde as
pure-ftpd can be built with libressl since bump to version 3.5.2 in
commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2 and
https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8eb2ee2ba8.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pure-ftpd/pure-ftpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 0354949e28..f3cbef84b9 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -45,7 +45,7 @@ else
 PURE_FTPD_CONF_OPTS += --without-ldap
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
 PURE_FTPD_DEPENDENCIES += host-pkgconf openssl
 PURE_FTPD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
