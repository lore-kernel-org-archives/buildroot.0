Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAD0C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 17:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84145820CE;
	Mon, 18 Dec 2023 17:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84145820CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60K92_GpFEOD; Mon, 18 Dec 2023 17:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E061182089;
	Mon, 18 Dec 2023 17:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E061182089
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4FC1BF385
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76EE54018B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76EE54018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbAaIToRuk6T for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 17:42:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC1A1400EA
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 17:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1A1400EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A34A887BE8; Mon, 18 Dec 2023 17:42:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 18:41:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c207c40eb0215cb51a756f94c755e31c72d0734
X-Git-Newrev: 96d0d677790e659b822761b50561b0316b4abf43
X-Patchwork-Hint: ignore
Message-Id: <20231218174256.A34A887BE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libldns: fix libressl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=96d0d677790e659b822761b50561b0316b4abf43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of libressl to version
3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:

./keys.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
  167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
      |                                   ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/37cc05b78a7004caa1b45d896121f059a4f8ca00

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
