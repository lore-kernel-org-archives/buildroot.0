Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD8BC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 05:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217606077B;
	Mon, 12 Aug 2024 05:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvgVE3Dxj81f; Mon, 12 Aug 2024 05:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B25576076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B25576076D;
	Mon, 12 Aug 2024 05:16:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4294B1BF2B5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 05:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FE7E401CA
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 05:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfewhqmG0gbU for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 05:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 279BC40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 279BC40025
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 279BC40025
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 05:16:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 36BD535211D4; Mon, 12 Aug 2024 07:16:04 +0200 (CEST)
Date: Mon, 12 Aug 2024 07:16:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrmalIJlys/dTgYy@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723439764; bh=to/rXEaqfUziucbTJNGiycfpnD20J2AAoGkHtGjANgo=;
 h=Date:From:To:Subject:From;
 b=iU3CuQXoX3XyIBFqQJSdumKUWlH5b2AlEZNfXDReF+nZRGOoXhMOTwrZEQh4prp7X
 /szcOo8wILRT9+BhnUN2C8Y48q2TfPLn0GkJCCaF50NA6Cr5qL31TVhAuqoLJm2d+c
 wO5qtuZqMLl+NTNKmk162CQQlkxICp7YOsjTUq6c2LLlhEqrt2WVwkPALOspEeDp/Z
 ejz5W65fU/nKnvaIGWXfDG5l5JuBtwDixJRSePVNn+lQC5hcQSBvYfcpiKwCQKd6Fi
 Vl+H005hT9teSYTmb/HrGqwhYj+VbsSuNexogFHRL61t09e4sfPSeokPHcoX+bQCu7
 elaOkUca2ellw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=iU3CuQXo
Subject: [Buildroot] [PATCH] package/unbound: allow TFO for uClibc-ng,
 add user
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc-ng toolchains have MSG_FASTOPEN since 2018 so no need
to disable support for TCP fastopen.

Add the missing unbound user, which prevents unbound daemon
startup on boot.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/unbound/unbound.mk | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index ff0262bef1..d46317ed99 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -18,18 +18,11 @@ UNBOUND_CONF_OPTS = \
 	--with-pidfile=/var/run/unbound.pid \
 	--with-rootkey-file=/etc/unbound/root.key \
 	--enable-tfo-server \
+	--enable-tfo-client \
 	--with-libevent=$(STAGING_DIR)/usr \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
-# uClibc-ng does not have MSG_FASTOPEN
-# so TCP Fast Open client mode disabled for it
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-UNBOUND_CONF_OPTS += --disable-tfo-client
-else
-UNBOUND_CONF_OPTS += --enable-tfo-client
-endif
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 UNBOUND_CONF_OPTS += --with-pthreads
 else
@@ -54,4 +47,8 @@ define UNBOUND_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S70unbound
 endef
 
+define UNBOUND_USERS
+	unbound -1 unbound -1 * /etc/unbound - - unbound daemon
+endef
+
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
