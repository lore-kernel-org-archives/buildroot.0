Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CC0C3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FE140D2B;
	Sat, 27 Jul 2024 14:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNm6DLBoiP_R; Sat, 27 Jul 2024 14:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE70F403C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE70F403C9;
	Sat, 27 Jul 2024 14:19:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6669F1BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51BD16073E
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kDqbPDlnuye for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8568660630
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8568660630
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:19:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 610BE875C5; Sat, 27 Jul 2024 14:19:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 16:18:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94951ff187b305bc18f2e24e8f642c26c777a6a2
X-Git-Newrev: 4a97ba343e55d4f269256579a0d5d483a89317e1
X-Patchwork-Hint: ignore
Message-Id: <20240727141951.610BE875C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softhsm2: select
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a97ba343e55d4f269256579a0d5d483a89317e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

softhsm2 unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

OSSLCryptoFactory.cpp: In constructor 'OSSLCryptoFactory::OSSLCryptoFactory()':
OSSLCryptoFactory.cpp:146:9: error: 'ENGINE_load_rdrand' was not declared in this scope
  146 |         ENGINE_load_rdrand();
      |         ^~~~~~~~~~~~~~~~~~

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/9d0047755d19f1f27a42a758277de8d7a3366832

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/softhsm2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index 78fccc9512..ab409a2c96 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SOFTHSM2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	help
 	  SoftHSM is an implementation of a cryptographic store
 	  accessible through a PKCS#11 interface. You can use it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
