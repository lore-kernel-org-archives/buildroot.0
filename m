Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF2CE9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30E3E40BB1;
	Thu,  9 Apr 2026 08:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75N42clQIjS7; Thu,  9 Apr 2026 08:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4111540A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724316;
	bh=gj+UbEy7J0mWzUu4stT15ejwG6dhv0kmBanFb+Y40KM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I5WmSRVCbWpeMlKjJe0E92B+otEczhbo0O1GeJggAmioQWFju3IJjEtYlMKArQyyG
	 dcBDBQX67KyJ9h/end0wlPQpWZjvzRsW7M2SrVTufMczs0ezzF+21SoEEkfjVcg1A6
	 7Z6Xog7smqUsXAsULv/SbyoHF0aae0jEyGRK/HVQYlhn47j09DkQYwIlTJ9qEIa6PD
	 ZMPx95QiqRp8ulu8zXXoMeLXXo/yyuE2nc4+naqgH4ujYIhlb3ukBPNvkLJzn/4eIs
	 2i4rjkXWPUEmpNcl3XX/gwzYEMM3KD1iPPeOo600rztsbYzUW3cG1K4A7ckTWBTyLz
	 cTX9i0bFFpqUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4111540A9F;
	Thu,  9 Apr 2026 08:45:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40B901F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3237E4039B
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQm6cEbZ-qHS for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:45:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 230C340246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 230C340246
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 230C340246
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8DACA4C08EB;
 Thu,  9 Apr 2026 10:43:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyh-000000004SH-1Dnb;
 Thu, 09 Apr 2026 08:43:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:54 +0200
Message-ID: <20260409084305.3960494-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724198;
 bh=K/0v+co70K9k7xAxZWEmfsiiJYdtUDdQE18BfnppI3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VZU6OZOJikQFMMPq1Zj+r6TrUJZAHFvsZ1lj4DfErcPXJqI09DmRUbtxsA/Er3OQs
 7wESUDZQV3lFZt9bRRDSPgWwSvBn8INLjAQBGpd3ip7xNGz9//0rtWDFEFWCGI8G0y
 0zXWw0X4We9r7p376FKnob+nVUVZ2JSICsc4BtYmHdMn099/tknV8IS40dZ9yuNqMG
 tcmechEzuRKFO4svOXa1GOPmt/dIQ2lD7xWpME6ZZRwM5GvSVWHmFnCE2jwiYVQlUV
 A8jpspOWC6XEgGvwmCG0JFs3eZhPM+PWc4tC4PMsN75Dm++FBpVi+3nz2t4ES2Ug3E
 d/+TPzdQSYsBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VZU6OZOJ
Subject: [Buildroot] [PATCH 10/20] package/sngrep: remove optional support
 for pcre, keep pcre2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sngrep/sngrep.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 5399d041b5..1c812e0a07 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -16,7 +16,7 @@ SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 SNGREP_CONF_ENV += \
 	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
 
-SNGREP_CONF_OPTS += --disable-unicode
+SNGREP_CONF_OPTS += --without-pcre --disable-unicode
 
 # openssl and gnutls can't be enabled at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -33,12 +33,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SNGREP_DEPENDENCIES += pcre2
-SNGREP_CONF_OPTS += --without-pcre --with-pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-SNGREP_DEPENDENCIES += pcre
-SNGREP_CONF_OPTS += --with-pcre --without-pcre2
+SNGREP_CONF_OPTS += --with-pcre2
 else
-SNGREP_CONF_OPTS += --without-pcre --without-pcre2
+SNGREP_CONF_OPTS += --without-pcre2
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
