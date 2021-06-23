Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FA7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:15:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E3D560EC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E3D560EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BF8160A4B;
	Tue,  3 Aug 2021 23:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0aAZhzjIDpd; Tue,  3 Aug 2021 23:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C5060A42;
	Tue,  3 Aug 2021 23:15:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC141BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97A3E40689
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUETQusBMJXm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 418F04063E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 853E3845E7; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Jun 2021 08:53:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 32ca386dab8c1dd3790ffe75c26a7673110be95e
X-Git-Newrev: b0f0b4c4bc2fd1dd12c54ad555614f354d1b98dc
X-Patchwork-Hint: ignore
Message-Id: <20210803210954.853E3845E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libressl: fix
 openssldir setting to match openssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b0f0b4c4bc2fd1dd12c54ad555614f354d1b98dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libressl defaults to $prefix/etc/ssl for its "openssldir" setting, E.G.
the location where configuration files and certificates are searched:

openssl version -d
OPENSSLDIR: "/usr/etc/ssl"

Change it to /etc/ssl so it matches openssl and the expectations of packages
dealing with certificates (ca-certificates, libcurl, p11-kit)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index ad345ba3f0..d09df8f40f 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -10,6 +10,7 @@ LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code
 LIBRESSL_LICENSE_FILES = COPYING
 LIBRESSL_CPE_ID_VENDOR = openbsd
 LIBRESSL_INSTALL_STAGING = YES
+LIBRESSL_CONF_OPTS = -DOPENSSLDIR="/etc/ssl"
 
 ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
 define LIBRESSL_REMOVE_BIN
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
