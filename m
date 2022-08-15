Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54ABC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D07860B68;
	Mon, 15 Aug 2022 19:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D07860B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGMQEBCdrwOD; Mon, 15 Aug 2022 19:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4B5160B56;
	Mon, 15 Aug 2022 19:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B5160B56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6EC71BF38D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A11540872
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A11540872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mvOKdxHLfD4g for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:30:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 842C84087A
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 842C84087A
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 910EF876B8; Mon, 15 Aug 2022 19:15:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 21:17:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25ecee3f173763cdf54350cbf4115c123843627c
X-Git-Newrev: 192e047fda587b7b8c52140f13ba0fc9f323ed14
X-Patchwork-Hint: ignore
Message-Id: <20220815191551.910EF876B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uacme: fix crypto backend
 preference order
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

commit: https://git.buildroot.net/buildroot/commit/?id=192e047fda587b7b8c52140f13ba0fc9f323ed14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 96c3b52132b4 (package/uacme: don't allow ualpn with mbedTLS), the
preference order moved openssl before mbedtls, because ualpn was not
compatible with mbedtls. That caused the preference order in the .mk to
diverge semantically from the preference order in the Config.in.

Indeed, openssl is only selected when neither gnutls nor mbedtls are
enabled, so openssl is clearly leastpreferred crypto backend. But when
both openssl and mbedtls were enabled, then uacme would use opensslC
because of ualpn.

The ualpn limitation was lifted in 6c7b46945e65 (package/uacme: allow
ualpn with mbedTLS), but the preference order in the .mk was not
restored to match that of the Config.in.

Restore the order in the .mk so that openssl is again treated as the
least-preferred crypto backend.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - split off to its own patch
  - write the full commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uacme/uacme.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 2be96d534e..84e0105762 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -18,12 +18,12 @@ UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-UACME_CONF_OPTS += --with-openssl
-UACME_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+UACME_CONF_OPTS += --with-openssl
+UACME_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_UACME_UALPN),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
