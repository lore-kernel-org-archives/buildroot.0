Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A04E9DE68
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAFD2410C3;
	Thu,  9 Apr 2026 08:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRGj75_04K6E; Thu,  9 Apr 2026 08:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B29410BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724340;
	bh=sJurT1sp+mgXOh5R06HaSxim/QxIrXd2E+DH7SogP6U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KtoQmGfMSZNgPdgy7FXFd0JGhmeEK5XbTNgOevKdpOhktQp7jduv3Cp+W4ydtlns8
	 30CRgtKutOoOQu7XqiyEoZG0iNN7I34gw5QITPY1bZnXpumf7SebjPe6unL6QRmvlO
	 FreQ48osRPMJRZJCiZ2d1FtXZPuua80G5AbBBcIvGqKPZjZk0yKEunWE1KCpxaeMFF
	 YrKi+pz25ByqwlStWcNHO4/+q1IF4M6WGg/aPYS/b7B1HeAEz9njw42+IgvEH8gzo9
	 pqTmG9C8dotCNSEPc3Lw74IFT7IJTuQMCAmnxnSu/F4Dmj9XkgtOWGf+gqGAJpYVFs
	 1G/XF+2pB0A/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6B29410BC;
	Thu,  9 Apr 2026 08:45:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92171237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7473E41053
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjT5ThdSNF4b for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:45:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 647E5410C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 647E5410C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 647E5410C3
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1BE3CA4C0937;
 Thu,  9 Apr 2026 10:43:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyh-000000004SH-1o0m;
 Thu, 09 Apr 2026 08:43:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:56 +0200
Message-ID: <20260409084305.3960494-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724199;
 bh=iDgkban0eaib51CQhcLR24K10aJCTXKqo+1nfjyZbM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GD+T9/9Zu+2bKCRINE4Li8d9FRYX48Ouzaur9gw6t44P2qgrOeE8gfcMXLOzdQ1/1
 IJksxL/4xMSu+VY4Re5EVxmto5sMeSAtSF6WOM2IlpwZhLWILri/ZYbq1EMJD2faOE
 MkIBJ8x7guCW3dXCVp6EnywQDYU5Z1RRzhb9SDza3U+33YxeFHrHRm5dDyTwJJGFNl
 NlIhqVrWxPTA828MhgB4kkmtZu6ldVtpcJbrW01jo1PSeUetNXqIHOlGu1CTuZDqdr
 FYVIWpDHs+BF/CKM5BUbs+DoyVmCbFWpnnUoyWnkxCjVeIkfglTT89FJRHaVD7TBrl
 Fx6jywPj0EO8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GD+T9/9Z
Subject: [Buildroot] [PATCH 12/20] package/wget: remove optional support for
 pcre, keep pcre2
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
 package/wget/wget.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index e3143647d7..de03ec9cef 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -12,6 +12,8 @@ WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 WGET_CPE_ID_VENDOR = gnu
 
+WGET_CONF_OPTS += --disable-pcre
+
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 WGET_CONF_OPTS += --with-libpsl
 WGET_DEPENDENCIES += libpsl
@@ -63,13 +65,10 @@ WGET_CONF_OPTS += --without-cares
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
-WGET_CONF_OPTS += --disable-pcre --enable-pcre2
+WGET_CONF_OPTS += --enable-pcre2
 WGET_DEPENDENCIES += pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-WGET_CONF_OPTS += --enable-pcre --disable-pcre2
-WGET_DEPENDENCIES += pcre
 else
-WGET_CONF_OPTS += --disable-pcre --disable-pcre2
+WGET_CONF_OPTS +=  --disable-pcre2
 endif
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
