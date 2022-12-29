Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B660C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2561780D5E;
	Thu, 29 Dec 2022 09:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2561780D5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJNMVk5bJJsH; Thu, 29 Dec 2022 09:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872BB80BC9;
	Thu, 29 Dec 2022 09:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872BB80BC9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E41CD1BF962
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFEAE80C60
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFEAE80C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02di48yvaRPg for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0844880BA9
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0844880BA9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECB7087061; Thu, 29 Dec 2022 09:34:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:33:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fd6ada8dbca3370b9bb67feb2971e637cb4b11f
X-Git-Newrev: db853e24b534d54f281cecbed0eb17412cdfc710
X-Patchwork-Hint: ignore
Message-Id: <20221229093420.ECB7087061@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: add C++ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=db853e24b534d54f281cecbed0eb17412cdfc710
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tiff/tiff.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 6d761ad678..c2a4108f35 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -14,7 +14,6 @@ TIFF_INSTALL_STAGING = YES
 
 TIFF_CONF_OPTS = \
 	--disable-contrib \
-	--disable-cxx \
 	--disable-tests \
 	--without-x
 
@@ -29,6 +28,12 @@ HOST_TIFF_CONF_OPTS = \
 	--disable-tests
 HOST_TIFF_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+TIFF_CONF_OPTS += --enable-cxx
+else
+TIFF_CONF_OPTS += --disable-cxx
+endif
+
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
 TIFF_CONF_OPTS += --disable-ccitt
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
