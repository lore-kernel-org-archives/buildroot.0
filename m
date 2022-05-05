Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358FFC433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEFCE419D9;
	Thu,  5 May 2022 20:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6bKv-cJYIng; Thu,  5 May 2022 20:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6AD8419D4;
	Thu,  5 May 2022 20:40:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF6B1BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5882C40383
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTH8i1WxawEy for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:40:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADE194011F
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C2B2E85BA2; Thu,  5 May 2022 20:29:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 22:37:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0c7cb01a960c6892d6082c74b7c07320ddaef0a
X-Git-Newrev: 5e2482678f1604b9fefb17090d8dd9ade7df4625
X-Patchwork-Hint: ignore
Message-Id: <20220505202953.C2B2E85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: Fix powerpc64 build w/o
 optimisation
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e2482678f1604b9fefb17090d8dd9ade7df4625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following build failure was reported by the autobuilder:

powerpc64   |        libgcrypt-1.10.1        | NOK |
http://autobuild.buildroot.net/results/eb60bb95411076b92f5c63f9b21c6e576998031c | ORPH

This config is building with BR2_OPTIMIZE_0=y.

The code relies on the compiler turning the series of preprocessor
macros in to a constant for the second argument to vec_sld:

 chacha20-ppc.c:60:10: error: argument 3 must be a 4-bit unsigned literal
    60 |   return vec_sld (v, v, (16 - (4 * idx)) & 15);

The argument is a constant, but it would require a significant rework to
make this build without optimisation. Instead disable the vectorised
powerpc code when building with optimisation disabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libgcrypt/libgcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index f28552c6e7..8f4e5ec8c0 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -18,6 +18,7 @@ LIBGCRYPT_CPE_ID_VENDOR = gnupg
 LIBGCRYPT_AUTORECONF = YES
 LIBGCRYPT_CONF_OPTS = \
 	--disable-tests \
+	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
 # Libgcrypt doesn't support assembly for coldfire
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
