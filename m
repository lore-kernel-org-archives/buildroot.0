Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E125AC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9760607F5;
	Sun, 21 Jul 2024 16:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAch7KFY7kIz; Sun, 21 Jul 2024 16:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F105E607D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F105E607D5;
	Sun, 21 Jul 2024 16:25:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A10471BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4341240231
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bSIkSU6Fow8 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68C9B40242
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68C9B40242
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:25:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5EE286F10; Sun, 21 Jul 2024 16:25:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:25:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ecca28e209b811b1ece19f114a2bde4bf5639be
X-Git-Newrev: 18e25b023c193ffb088296e346bc0978b78e38ee
X-Patchwork-Hint: ignore
Message-Id: <20240721162548.D5EE286F10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librelp: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

commit: https://git.buildroot.net/buildroot/commit/?id=18e25b023c193ffb088296e346bc0978b78e38ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

librelp unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

tcp.c: In function 'relpTcpExitTLS_ossl':
tcp.c:1992:17: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
 1992 |                 ENGINE_cleanup();
      |                 ^~~~~~~~~~~~~~
      |                 EVP_PBE_cleanup

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/68a1e94e077d8d57690a2543e557ba3f2974b03e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/librelp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/librelp/Config.in b/package/librelp/Config.in
index c0ae5fbe89..f1744bb60c 100644
--- a/package/librelp/Config.in
+++ b/package/librelp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBRELP
 	bool "librelp"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Reliable Event Logging Protocol library
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
