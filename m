Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BA5C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5603661396;
	Wed, 22 Feb 2023 22:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5603661396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEyNz7B3h9he; Wed, 22 Feb 2023 22:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C3C4612DC;
	Wed, 22 Feb 2023 22:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C3C4612DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFBC1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56C2C40323
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56C2C40323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9R728CDyoe1 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A192F40131
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A192F40131
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F4C086905; Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 23:23:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5be4abc574d6f2acfde4e523c73f4cee7ac373e
X-Git-Newrev: efe2734fc58cc6bfcc8fa1b696bba81a9797efb9
X-Patchwork-Hint: ignore
Message-Id: <20230222222356.8F4C086905@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsurf: force libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=efe2734fc58cc6bfcc8fa1b696bba81a9797efb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

netsurf raises the following build failure since bump of libressl to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

content/fetchers/about.c: In function 'ns_X509_get_signature_nid':
content/fetchers/about.c:548:25: error: dereferencing pointer to incomplete type 'X509 {aka struct x509_st}'
  return OBJ_obj2nid(cert->cert_info->key->algor->algorithm);
                         ^~

Fixes:
 - http://autobuild.buildroot.org/results/c225aaac31398ba495921bd4b85e588199822561

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index 4f7d5c2713..394befcf28 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_NETSURF
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_OPENSSL if BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if BR2_PACKAGE_LIBCURL
 	help
 	  NetSurf is a compact graphical web browser which aims for
 	  HTML5, CSS and JavaScript support.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
