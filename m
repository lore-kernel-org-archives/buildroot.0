Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717FD103A9A7
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 11:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD8376133E;
	Wed, 25 Mar 2026 11:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNIHmugjfFOU; Wed, 25 Mar 2026 11:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10F661327
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774437979;
	bh=QGiZSZIBlCFygYfcuP+XGPhFwxvBhdBJP9U1WI4HGdQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lf0/argyS2I3PAbU1UnOGo2Txpa7cDLH6wdGblEeBFcE9hHngn+VBIXflk/568t2E
	 XR3X9/daQu7i+4zoszQtafV59CR56BBrFB6FhOQQxqr+qiLsiFyDQIDg1oRxTj+yYr
	 jTmh8/bHmF3HKLZ2NMo2AjZoVXXz0If8IBjrheiPxBHv6v8kCColDN3hA1S5c5wfEm
	 yoUx+wSDo+T1ou60rukcnqwJgzgBPSLYr4HDjRiovRzQLt41NgER2w/i7VIUE+bdPI
	 q1TLAuchRXv9M42BVlkMMTymiqyGURs0uaV4HI9GOjzpBv+j9hPYYavEPU/jPNxlg5
	 xsvi+BxjeLtCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C10F661327;
	Wed, 25 Mar 2026 11:26:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C3CF5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 11:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D35DA8376B
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 11:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLV7XQfcEgnO for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 11:26:17 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom;
 client-ip=2a01:e0c:1:1599::15; helo=smtp6-g21.free.fr;
 envelope-from=ignacy.gawedzki@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A24C83760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A24C83760
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A24C83760
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 11:26:15 +0000 (UTC)
Received: from mail.qult.net (unknown [IPv6:2a01:e34:ec12:1270::2])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 053C178050F
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 12:26:12 +0100 (CET)
Received: from zenon.in.qult.net ([192.168.64.1] helo=zenon.qult.net)
 by mail.qult.net with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1w5MNI-0000000Gwvj-3Pi3 for buildroot@buildroot.org;
 Wed, 25 Mar 2026 12:26:12 +0100
Received: from ig by zenon.qult.net with local (Exim 4.98.2)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1w5MNI-00000006CSk-1oc7 for buildroot@buildroot.org;
 Wed, 25 Mar 2026 12:26:12 +0100
Date: Wed, 25 Mar 2026 12:26:12 +0100
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <dpzpiofmvjr7qshzhveo3ebyu5igb2rv3u25ti56huo4axz3m3@mqub7vltk6uv>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH] package/libcurl: Use certificate bundle
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
