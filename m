Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC52ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 21:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1386741D63;
	Fri, 16 Sep 2022 21:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1386741D63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAS2W1VFbhNc; Fri, 16 Sep 2022 21:58:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC1041D69;
	Fri, 16 Sep 2022 21:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC1041D69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5E521BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE49E6FAE8
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE49E6FAE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfS6vu7ZaSnH for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 716406FAE4
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 716406FAE4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5EAE483DF3; Fri, 16 Sep 2022 21:57:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 23:50:23 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 0f74e1b9089fcac5c5ddab58e81e81552b99d6ea
X-Git-Newrev: 4d4534495f8b42ea6fdbfb567acd851bee2be008
X-Patchwork-Hint: ignore
Message-Id: <20220916215759.5EAE483DF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/uacme: fix crypto
 backend preference order
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d4534495f8b42ea6fdbfb567acd851bee2be008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 192e047fda587b7b8c52140f13ba0fc9f323ed14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
