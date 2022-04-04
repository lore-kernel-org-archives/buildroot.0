Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABDDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00845827F3;
	Mon,  4 Apr 2022 20:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2YvuX_aLd4K; Mon,  4 Apr 2022 20:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B2F827CE;
	Mon,  4 Apr 2022 20:21:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4A401BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6820E400D9
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpwUN-WQRau2 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAF574056A
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4B63582DF6; Mon,  4 Apr 2022 20:09:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 22:12:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7da45d9b635d93cc7c0339796462a8e401407402
X-Git-Newrev: 0796c878f4c9ad786a6c4c4716e4239fa070cd73
X-Patchwork-Hint: ignore
Message-Id: <20220404200948.4B63582DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcoap: doesn't build with
 libressl
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
Content-Type: multipart/mixed; boundary="===============4747771637473477376=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4747771637473477376==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0796c878f4c9ad786a6c4c4716e4239fa070cd73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since commit
8b14f6b49b962d4d8f7135d85afa15658ea8f94b:

src/coap_openssl.c:107:3: erreur: nom de type « BIO_ADDR » inconnu
  107 |   BIO_ADDR *bio_addr;
      |   ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/30022e437f349459994dccfb612773d529d97a20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcoap/libcoap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 8a85ff3a2e..edcc1bbef8 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -18,7 +18,7 @@ ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
 LIBCOAP_CONF_OPTS += \
 	--enable-dtls --with-gnutls --without-mbedtls --without-openssl
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+else ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBCOAP_DEPENDENCIES += openssl
 LIBCOAP_CONF_OPTS += \
 	--enable-dtls --without-gnutls --without-mbedtls --with-openssl

--===============4747771637473477376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4747771637473477376==--
