Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3ABC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F18D56060A;
	Thu,  9 Jun 2022 20:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QE-IfnSoTNNx; Thu,  9 Jun 2022 20:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A88560672;
	Thu,  9 Jun 2022 20:49:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C25F1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 682D882893
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqdFS8L2czA9 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:48:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B939182AA7
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:48:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EF48486F32; Thu,  9 Jun 2022 20:36:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:48:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6b21598ebd3d915fc78765d50d7328cee6ffafb6
X-Git-Newrev: c29660ff2c0b2606097fdc6ada645527052dafb1
X-Patchwork-Hint: ignore
Message-Id: <20220609203659.EF48486F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcurl: fix
 missing CA bundle when wolfssl is SSL/TLS provider
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

commit: https://git.buildroot.net/buildroot/commit/?id=c29660ff2c0b2606097fdc6ada645527052dafb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Without CA bundle curl can not verify the remote peer and work with https.
This is fixed by adding a config option pointing to the default location
for CA bundle in buildroot. Alternatives like OpenSSL and MbedTLS use the
same path, however the wolfSSL build options for libcurl did not include
this path until now.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b4d301c6413074ba88be2625305631524476f417)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
