Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3003C1061B18
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 18:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA19260DD2;
	Mon, 30 Mar 2026 18:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYVFWSEn5SuX; Mon, 30 Mar 2026 18:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 141B160BDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774895160;
	bh=T3NZmG7qIykHLSDSVIPkJflTQ+86qPajV1wEK6Xeixk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k+LpcJ8lXdhubeWxlP+Q6YvE66isE0sKA/JP6XpJVAjgaly/ZiKJmIg8HOrM6oJzl
	 NvWKvgKwjA9pQnNCqPZ5acdlMq7h5AZriAgaUXdHTm82yaT2+ikKFaq2+602qTrfWA
	 UaPVJo+u/GJZLjl1FHptsJJ1IxaQtXrEQJHeh3KEidOWQwstkqRH06eAuOcU2stNbe
	 lIbphqU/+dTVVLA2uIYt0CTdAMBxuhraEWsXMBwdESO7vt0jHecRY46aiag0BkMV8z
	 d2zJE0B0JGKCjNxCo8zoLxbsRrOxmXRL4j5fLH8b3+VK+AepvZyrWW28eJYWLwqksi
	 Ri3LRja5J/R6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 141B160BDE;
	Mon, 30 Mar 2026 18:26:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BDED10F
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 18:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5103381160
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 18:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkfnkp2USCZD for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 18:25:57 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom;
 client-ip=2a01:e0c:1:1599::12; helo=smtp3-g21.free.fr;
 envelope-from=ignacy.gawedzki@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E83B80FF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E83B80FF5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E83B80FF5
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 18:25:56 +0000 (UTC)
Received: from mail.qult.net (unknown [IPv6:2a01:e34:ec12:1270::2])
 by smtp3-g21.free.fr (Postfix) with ESMTPS id 19A2E13F89C
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 20:25:55 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1] helo=zenon.qult.net)
 by mail.qult.net with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1w7HJC-0000000B8Tp-3nHq for buildroot@buildroot.org;
 Mon, 30 Mar 2026 20:25:54 +0200
Received: from ig by zenon.qult.net with local (Exim 4.98.2)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1w7HJC-0000000GjYs-1QuB for buildroot@buildroot.org;
 Mon, 30 Mar 2026 20:25:54 +0200
Date: Mon, 30 Mar 2026 20:25:54 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <xxphlblukou5lkvmaskvh5ojthysbluh7shjhw6fyjd4csqnna@oyjufu7hs4wm>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH v2] package/libcurl: Use certificate bundle
 conditionally
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Configure with --with-ca-bundle option only if package ca-certificates
is selected, otherwise curl will fail connecting with HTTPS, since the
specified /etc/ssl/certs/ca-certificates.crt file does not exist.

The use of --with-ca-bundle was introduced by the following commit:
"5a63ee3c09 package/libcurl: also specify the CA bundle location"

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
 package/libcurl/libcurl.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3d00a4a33a..3410317b6d 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -58,8 +58,10 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES +=3D openssl
 LIBCURL_CONF_OPTS +=3D --with-openssl=3D$(STAGING_DIR)/usr \
-	--with-ca-path=3D/etc/ssl/certs \
-	--with-ca-bundle=3D/etc/ssl/certs/ca-certificates.crt
+	--with-ca-path=3D/etc/ssl/certs
+ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
+LIBCURL_CONF_OPTS +=3D --with-ca-bundle=3D/etc/ssl/certs/ca-certificates.c=
rt
+endif
 else
 LIBCURL_CONF_OPTS +=3D --without-openssl
 endif
-- =

2.51.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
