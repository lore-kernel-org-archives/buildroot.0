Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E39ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 22:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E5441DC2;
	Fri, 16 Sep 2022 22:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E5441DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ys6fpRBD6_Kf; Fri, 16 Sep 2022 22:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B4E417A3;
	Fri, 16 Sep 2022 22:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B4E417A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43E1E1C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B0CA84368
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B0CA84368
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRQq-I5yVmAm for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50E8184334
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E8184334
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3C01B83E6F; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 23:50:31 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 010a8a239577fce09b54b45623dcb54b38515e12
X-Git-Newrev: 5eb9b65467d4954fd5d136292c1e78c29c659d30
X-Patchwork-Hint: ignore
Message-Id: <20220916215809.3C01B83E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uacme: fix crypto
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eb9b65467d4954fd5d136292c1e78c29c659d30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
