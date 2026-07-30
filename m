Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1480C55162
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 14:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5FF7810F4;
	Thu, 30 Jul 2026 14:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5gRjxtE7ZpE; Thu, 30 Jul 2026 14:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1EDC80FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785422774;
	bh=GPBvhexKN5sYsvmwvHB6nJ8g6vzIafVdZ+AVgZHBlOU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r38yDvEdvxcrfKUtD2MYOUan+9H/k/HX5cpO0g7ekTQ1pRTpvTAjcumxrX/E3I6+X
	 z2RpLwL7Slyjs8Ntlr2DuphFgZOEDqsSbSa0KPnScTxNL7uBAI2q4LkDvYD0mAtfoI
	 7e2z1najlT4LVEcDiVxoKX/lQHn0Xr82+9LxDDDCkBHJGBJWHCTgkbVihT9oU1Qet7
	 oYS/eMr85WCsrXwgwReyaCxx/iHLBZEH6GDr3hGU7CMWzOCfEV23opDQKlNjSOmnZ3
	 aEGq6WOeRdoPSsDIh9ramQdlLriCmJsz1i4YrJc8bxQUJbLXDDlqt7/4qpwbQSeSlD
	 rzO7O21zpHaRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1EDC80FE8;
	Thu, 30 Jul 2026 14:46:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43968352
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 298E56089D
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zx8Z-1VzeUGv for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 14:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADBDD608AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADBDD608AA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADBDD608AA
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:46:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmUHp-1xFfx41nBx-00lBDZ; Thu, 30
 Jul 2026 16:46:03 +0200
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 30 Jul 2026 16:45:41 +0200
Message-ID: <20260730144541.1079191-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730144541.1079191-1-fiona.klute@gmx.de>
References: <20260730144541.1079191-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jTuynhrs4YFWGs0vdKNSctOtTKEOuRxT+kxeD6d+YcE9PkKJllm
 WEV5L2pZUBWZ9DvloupUupJ9NsFaURxu7Vj+tidmavH2tuTJPM+BVyHR6XVbJDCuYPI3a3A
 JvVi5gEwbfT33l4ffGMJ3T4K3Vd+1dj7NkUzx1Xw5DkX7IOiOIOLTf/ARQgmw/42yLkMA5O
 toip3hg1qCVNVwyqmX1yg==
UI-OutboundReport: notjunk:1;M01:P0:eSZMR8h/Uqs=;P8fAoANieM7apwW/mO8rqZOEwN/
 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
 +Lu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785422763; x=1786027563; i=fiona.klute@gmx.de;
 bh=FoT5wFEijGV/2BFpvqPIGyWNvGvae1gZ7zSWj4v1PBw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=eilbhgMVJDjzyf1hyP51I+4/jQmt7+JAyHtArzmPKpXzWJ/EhOEsySygDxuCkKNf
 FzpSzWEXAUap4A+wN+dSzXP7UcROwXTX3jKmu1eBybiHobtUgwToD1izjbpTqI3Vc
 t5/qfaJGMOA79MSxg9zx4o+gw4ZbJubdeli+l5cdSqLwCSYbwekXU5I1gWxe93/6H
 vG3J2OAAst/k8+aA44HvMiJMcRgxAqT9D1Vl1o0SMMP6pZxRyhdoaYWWnzjptx4XW
 7H5+cQ5ZJSyXXP2yUlC+t4oJF5+Bjvn/e68ouggeBNHtVUVFGtFoTQ0rJqo+txJy9
 bkUac0hr70771XOj6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=eilbhgMV
Subject: [Buildroot] [PATCH 2/2] package/localedef: copy license information
 from package/glibc
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

Localedef is built from the glibc source code, so license information
is the same.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/localedef/localedef.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 732ed6d4ad..c5e0e2b963 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# Use the same VERSION and SITE as target glibc
+# Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
@@ -13,6 +13,15 @@ LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
+LOCALEDEF_LICENSE = \
+	GPL-2.0+ (programs), \
+	LGPL-2.1+, BSD-2-Clause, BSD-3-Clause, BSL-1.0, FSFAP, ISC, other permissive licenses, public domain (library), \
+	LGPL-3.0+ (sysdeps/htl/raise.c, for Hurd only), \
+	GPL-3.0+ (scripts/move-if-change), \
+	GPL-3.0+ WITH Texinfo-exception (manual/texinfo.tex), \
+	GFDL-1.3-or-later (manual)
+LOCALEDEF_LICENSE_FILES = COPYINGv2 COPYING.LESSERv2 COPYINGv3 LICENSES manual/fdl-1.3.texi
+
 HOST_LOCALEDEF_DEPENDENCIES = \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
