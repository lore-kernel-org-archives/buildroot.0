Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED565C6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DCEB409FB;
	Sun,  5 Mar 2023 17:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DCEB409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vjo6dYvGKDMr; Sun,  5 Mar 2023 17:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F177409F1;
	Sun,  5 Mar 2023 17:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F177409F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1920E1BF868
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C9D60BE0
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C9D60BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxJMRemW9Kvl for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1E1660E46
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1E1660E46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E249686328; Sun,  5 Mar 2023 17:39:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:32:25 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b9a06799e9ded0367c71a7b288d39a63a1cca9a5
X-Git-Newrev: f8c1d7a2fa770e2194b566bae1a5c3e3968267ae
X-Patchwork-Hint: ignore
Message-Id: <20230305173947.E249686328@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/netsurf: force
 libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8c1d7a2fa770e2194b566bae1a5c3e3968267ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit efe2734fc58cc6bfcc8fa1b696bba81a9797efb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
