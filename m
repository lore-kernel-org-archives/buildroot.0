Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E590C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2E6140370;
	Sun,  7 Jan 2024 16:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2E6140370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rcFiishi8i4; Sun,  7 Jan 2024 16:23:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3E6B403A5;
	Sun,  7 Jan 2024 16:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3E6B403A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8B0E1BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B894415D4
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B894415D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeF76J8rKmpe for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37537415DC
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37537415DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25CDD84761; Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 12:14:36 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 9fa2a798dce508f1f8d21e503a26716d9975b2fa
X-Git-Newrev: d51cd29632650dc9dbc8e6828878127cd3f92982
X-Patchwork-Hint: ignore
Message-Id: <20240107162200.25CDD84761@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libldns: fix
 libressl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d51cd29632650dc9dbc8e6828878127cd3f92982
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure raised since bump of libressl to version
3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:

./keys.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
  167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
      |                                   ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/37cc05b78a7004caa1b45d896121f059a4f8ca00

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 96d0d677790e659b822761b50561b0316b4abf43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libldns/libldns.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 06564e3d9f..d6af6a2b97 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -17,7 +17,6 @@ LIBLDNS_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--enable-dane \
 	--enable-ecdsa \
-	--enable-gost \
 	--enable-sha2 \
 	--without-examples \
 	--without-p5-dns-ldns \
@@ -30,6 +29,12 @@ else
 LIBLDNS_CONF_OPTS += --disable-dane-verify
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+LIBLDNS_CONF_OPTS += --enable-gost
+else
+LIBLDNS_CONF_OPTS += --disable-gost
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBLDNS_DEPENDENCIES += host-pkgconf
 # missing -lz breaks configure, add it using pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
