Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A83C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5943680E70;
	Wed,  8 Mar 2023 21:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5943680E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrwiOb7WgEsa; Wed,  8 Mar 2023 21:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A700080DB9;
	Wed,  8 Mar 2023 21:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A700080DB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E864B1BF287
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 21:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF67A41839
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 21:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF67A41839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CoY_YHdQ6PL5 for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 21:27:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6A74098D
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 21:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6A74098D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95EC586A85; Wed,  8 Mar 2023 21:27:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Mar 2023 22:27:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 720a68e33be7f46c8b5866d6b8f98b400f83f979
X-Git-Newrev: 46abbffc9702be320e9d71de71ce89457a28c48e
X-Patchwork-Hint: ignore
Message-Id: <20230308212733.95EC586A85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: force libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=46abbffc9702be320e9d71de71ce89457a28c48e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mender raises the following build failure with libressl since at least
version 3.1.0 (and probably since the addition of the package):

vendor/github.com/mendersoftware/openssl/conn.go:103:61: could not determine kind of name for C.X509_V_ERR_DANE_NO_MATCH

Fixes:
 - http://autobuild.buildroot.org/results/2b032d2a4e7cfbb20444c13821003120a4d00abd
 - http://autobuild.buildroot.org/results/621c057c0b8b627c8140456a2b0af4f95d239dcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index cccb46361b..7d768cebec 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -4,8 +4,9 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
