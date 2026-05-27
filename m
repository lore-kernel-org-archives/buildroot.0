Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBC2CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 21:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576A54243A;
	Wed, 27 May 2026 21:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIaGdP-fH4QF; Wed, 27 May 2026 21:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 724A242419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779916012;
	bh=IRqTelP/brs559O44nm4YqcP+xYuZXwcl2cR4ahLHwI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AmKrVGLTv+JDmHspNO7PCWhe6nvVAvj/YOgvE0pTiO3hfzYRYywAf2AC8qwoiuFVB
	 x5dEmLiRTJ04K6UdL5RvCD8pz5Lxb4ps/INmf/KmujMl2tYim987U8BCz9NbaWZZ4Q
	 7KguiW/iC6UQc7T+Pr5HiinqJEMhjKN7rVh8DYakD4YNkoiHAK1F1ty31xuQBtzUWE
	 utzDJTWVtuksKn1BgXJS3cL4dzXbziJ/QHzmaF4cySUS4LnEaEdezZlEpb1cixtOdc
	 qA0/7auJ6DmI1Zgo+uXqP6vQoteHKU2rsNMdMoL6pFs+HV3mM6dfBoEOrJKV9xuA47
	 eDVnOFbdPpocA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 724A242419;
	Wed, 27 May 2026 21:06:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84189288
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73839615C3
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HK-f-6SeyMhD for <buildroot@buildroot.org>;
 Wed, 27 May 2026 21:06:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 813DB615C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813DB615C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 813DB615C2
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:06:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3EEFBA4C2050;
 Wed, 27 May 2026 23:06:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42376)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSLSg-000000006LV-1zmZ;
 Wed, 27 May 2026 21:06:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
Date: Wed, 27 May 2026 23:06:46 +0200
Message-ID: <20260527210646.3568047-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779916007;
 bh=C0w7lFbT067nNvHUKJSB3exVCMj5AvpcT8RA0yZJUOc=;
 h=From:To:Cc:Subject:Date:From;
 b=I9xrvjWRxB0gbk3rgB1rz/x1DNj1x0aaNVmVAFUBQcWuH0ZqNbgxpnXXmMzqXhQ30
 wfsoBU6kD4kDfgc5Di8r0jf+CZ4msSc49D5+s14uxkN7ZOv1fLmdybHIivAu9qAw1M
 U6YjbJLtGAKmuglVcCwzd9oXabccKxfhZAoyc/o0J+XrNwLZkNRAUr2+cktvuddA0W
 zTmkhMx0BCjJrpga+2aR2B6NENfKuoF8eZh1lMJq3cTUyqe2s0NtZwV0d7cYoPYYJ8
 6CRas/L5NCmSvCQrsaTwjho/6gFAwKjetQ3SPz7mAZyGNoSkjJWdVjBw47WQf7zHXy
 ns3QpH2kR1j5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=I9xrvjWR
Subject: [Buildroot] [PATCH v2 1/1] package/libmicrohttpd: needs host-pkgconf
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

Buildroot commit 712121326f84e2508ab161053c2b04e45511c79f bumped the
package to 1.0.5 which includes upstream commit
https://github.com/Karlson2k/libmicrohttpd/commit/a1f937422658d3c6d53853c587bc025274afac4d
that breaks the build if pkgconf was not found:
https://github.com/Karlson2k/libmicrohttpd/blame/master/m4/pkg.m4#L84

Fixes:
https://autobuild.buildroot.net/results/e3e/e3e25753c670b5d86d042d850582e2e1e0eedca5/
https://gitlab.com/buildroot.org/buildroot/-/jobs/14386351826

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added host-pkgconf as mandatory dependency (Romain)
    Gitlab pipeline passed:
    https://gitlab.com/bkuhls/buildroot/-/pipelines/2557122497

 package/libmicrohttpd/libmicrohttpd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 7a243b42cf..a3b24d363c 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -9,6 +9,7 @@ LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
 LIBMICROHTTPD_INSTALL_STAGING = YES
+LIBMICROHTTPD_DEPENDENCIES = host-pkgconf
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
@@ -16,7 +17,7 @@ LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPL-2.1+
-LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls
+LIBMICROHTTPD_DEPENDENCIES += gnutls
 LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr
 else
 LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
