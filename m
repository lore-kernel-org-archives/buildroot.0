Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9620CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85E1540AA2;
	Sun, 15 Oct 2023 09:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85E1540AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NlDnjEKjw_S5; Sun, 15 Oct 2023 09:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 524B140C53;
	Sun, 15 Oct 2023 09:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 524B140C53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB581BF870
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7423D610D4
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7423D610D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id po9opPYFfcnJ for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC06160B6A
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC06160B6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97FB484600; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 10:53:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 796ebbcf34298ef56ff63fc845cd97a5acb7dc8a
X-Git-Newrev: 648502bdbdcf6a8996db897af731fd2219d777d1
X-Patchwork-Hint: ignore
Message-Id: <20231015090300.97FB484600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pound: force libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=648502bdbdcf6a8996db897af731fd2219d777d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force libopenssl to avoid the following build failure with libressl
raised since bump to version 4.8 in commit
525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc:

pound.c: In function 'main':
pound.c:971:27: error: 'l_id' undeclared (first use in this function)
  971 |   CRYPTO_set_id_callback (l_id);
      |                           ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/692db714aa8b0dcfb67fd99977fb6f33c5d4810c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pound/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pound/Config.in b/package/pound/Config.in
index 60fafff935..aa0f103273 100644
--- a/package/pound/Config.in
+++ b/package/pound/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_POUND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  The Pound program is a reverse proxy, load balancer and HTTPS
 	  front-end for Web server(s). Pound was developed to enable
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
