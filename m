Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21435C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C262D415E0;
	Sun, 10 Apr 2022 15:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PGxtTEPpa4Qg; Sun, 10 Apr 2022 15:40:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867A84109B;
	Sun, 10 Apr 2022 15:40:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8F481BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C4D40577
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lavxE_xyd3O0 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70C7140569
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9BB148388A; Sun, 10 Apr 2022 15:29:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:35:16 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 195e1f1383808571aae7541e76419cdaab32e853
X-Git-Newrev: e0121e94771e264c21ec1ea2dac908f79ee2af6c
X-Patchwork-Hint: ignore
Message-Id: <20220410152900.9BB148388A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcoap: doesn't
 build with libressl
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
Content-Type: multipart/mixed; boundary="===============1721709238796772397=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1721709238796772397==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e0121e94771e264c21ec1ea2dac908f79ee2af6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl raised since commit
8b14f6b49b962d4d8f7135d85afa15658ea8f94b:

src/coap_openssl.c:107:3: erreur: nom de type « BIO_ADDR » inconnu
  107 |   BIO_ADDR *bio_addr;
      |   ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/30022e437f349459994dccfb612773d529d97a20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0796c878f4c9ad786a6c4c4716e4239fa070cd73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============1721709238796772397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1721709238796772397==--
