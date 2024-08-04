Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDE6C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4F08044D;
	Sun,  4 Aug 2024 20:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csOINIsrcbpX; Sun,  4 Aug 2024 20:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D608104D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D608104D;
	Sun,  4 Aug 2024 20:49:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 308221BF951
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B0066064C
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8u8N3EQwwQsL for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1115A6062F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1115A6062F
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:49:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFEBB83F67; Sun,  4 Aug 2024 20:49:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Aug 2024 22:49:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a8939378990ec007049f71bc4a1636b2f7da4b0
X-Git-Newrev: 2a8c58b5849ed2c9908cf08b596f370454c251b6
X-Patchwork-Hint: ignore
Message-Id: <20240804204917.EFEBB83F67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: fix libgpg-error
 detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a8c58b5849ed2c9908cf08b596f370454c251b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libgcrypt uses two scripts to identify libgpg-error location.
The first one is gpg-error-config. The second one is gpgrt-config.
The usage of gpg-error-config is deprecated.
Help libgcrpyt to find a correct gpgrt-config for cross-compilation.

Fixes:
 - http://autobuild.buildroot.net/results/46e/46efff01f7d0a2ce3c8523cd073302e58e0f0ae5/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgcrypt/libgcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index ae50ead343..57eca507b3 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -16,6 +16,7 @@ LIBGCRYPT_CPE_ID_VENDOR = gnupg
 
 # Patching configure.ac and Makefile.am in 0001
 LIBGCRYPT_AUTORECONF = YES
+LIBGCRYPT_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
 LIBGCRYPT_CONF_OPTS = \
 	--disable-tests \
 	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
