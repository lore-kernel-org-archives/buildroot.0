Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0A1C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A244415BA;
	Mon,  6 Jun 2022 13:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mp-G6s48yj5; Mon,  6 Jun 2022 13:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F6884090B;
	Mon,  6 Jun 2022 13:36:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 473BC1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09EC8415BA
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlwabNPKfMZ0 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:36:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBE6040299
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AD07686DB6; Mon,  6 Jun 2022 13:24:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 15:35:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2810b51e52177147cf9b2e113b2afd3ab1194d3f
X-Git-Newrev: b4d301c6413074ba88be2625305631524476f417
X-Patchwork-Hint: ignore
Message-Id: <20220606132414.AD07686DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: fix missing CA bundle
 when wolfssl is SSL/TLS provider
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4d301c6413074ba88be2625305631524476f417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without CA bundle curl can not verify the remote peer and work with https.
This is fixed by adding a config option pointing to the default location
for CA bundle in buildroot. Alternatives like OpenSSL and MbedTLS use the
same path, however the wolfSSL build options for libcurl did not include
this path until now.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/libcurl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 15943f7512..11f1e4de59 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -77,6 +77,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_WOLFSSL),y)
 LIBCURL_CONF_OPTS += --with-wolfssl=$(STAGING_DIR)/usr
+LIBCURL_CONF_OPTS += --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
 LIBCURL_DEPENDENCIES += wolfssl
 else
 LIBCURL_CONF_OPTS += --without-wolfssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
