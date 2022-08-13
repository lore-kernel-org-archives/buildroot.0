Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70D6C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 11:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC5560D70;
	Sat, 13 Aug 2022 11:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC5560D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Codu0m5_fQ-a; Sat, 13 Aug 2022 11:00:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5840A60C1D;
	Sat, 13 Aug 2022 11:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5840A60C1D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A40B1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2276782B1E
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2276782B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2PiUS3PUrEB for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 11:00:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69774829B6
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 11:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69774829B6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C568F86EE5; Sat, 13 Aug 2022 10:45:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 13:00:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0470c503982e865bec92e037a305bfb66119a25
X-Git-Newrev: 2ce6aaee9dee1fdc79470a49d1c7a9299484b384
X-Patchwork-Hint: ignore
Message-Id: <20220813104553.C568F86EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: requires DES in openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ce6aaee9dee1fdc79470a49d1c7a9299484b384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to avoid the following build failure raised since
the addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a:

In file included from sm-common.c:51:
sm-common.h:33:1: error: unknown type name 'DES_LONG'
   33 | DES_LONG DES_cbc_cksum_3des(const unsigned char *in, DES_cblock *output, long length,
      | ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/25d0933406dea28201dadc90abd32072afab720b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opensc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opensc/Config.in b/package/opensc/Config.in
index 6a0329fb39..2cec096ac2 100644
--- a/package/opensc/Config.in
+++ b/package/opensc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPENSC
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  OpenSC provides a set of libraries and utilities to work
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
