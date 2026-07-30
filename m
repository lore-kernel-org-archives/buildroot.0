Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DCC55162
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 14:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E4D80D52;
	Thu, 30 Jul 2026 14:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxs-AHmNo-6e; Thu, 30 Jul 2026 14:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF58A80F87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785422769;
	bh=wdwxthy4XAs7R0MswwH82Ub3gEYFom0Y9YVMsdDPrXY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=G9v/pZ2J+fQmwVlnENMeYaSoQia/i3HKGMYrUBwf8ViVzmsa23gYhbWx/hOg/nxtl
	 xRIjW+zV6Fmbylsl5miWfLVPMMIM8DfGe+D864hSGr3wizZkZeKLfipIq+CV1WAB/6
	 g4PzauVd9SXgyueG6KjxdA8YWYVSJT2AGzHbtEB+TvfHeBaRo0xJrlhFUh2l6xeclA
	 GcHjZNnEm+P0STQgF/AK5M6zH9+9ztVVE4OWg6P3jxkCKz+vH0n0ueTtqrgRssW7+n
	 4dDjgyYb05iUD/X9UG0iYZc+QkJfO+DCIzVxVIhZ/09RMA5S7d8voM5wyIpqxRSV40
	 iU52cIcrfh6ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF58A80F87;
	Thu, 30 Jul 2026 14:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2133352
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3FE580FC6
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs6DOaiBjFQv for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 14:46:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BCEB80F87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BCEB80F87
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BCEB80F87
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:46:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1x8DrJ3U1c-00uuUq; Thu, 30
 Jul 2026 16:46:01 +0200
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 30 Jul 2026 16:45:40 +0200
Message-ID: <20260730144541.1079191-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OWg5nF8kBkOFcXRYy1uLNIqwgRsbWN7qW9BNALDMSfkQTU8TPHE
 U60Ea0BEJfguNgxp67fFu10lBvKZRv3Is/DWJkBGnHDdK/8Z2pSoL5S1pLMOnRQkYXI36ir
 jw5sbDOAPZWFsht91+OanC4yeuiBPRCH0j9Zg+NJOgSrI83OFoBY+F1OhKCz/RA5VZ6me9/
 kZ/f2YS7UccqI0jMQUfCQ==
UI-OutboundReport: notjunk:1;M01:P0:Yu1wJI83jv0=;RoizwNPyQRMTRDm5nfGJoATOypd
 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
 uKF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785422762; x=1786027562; i=fiona.klute@gmx.de;
 bh=QZpXYwvO0H3EXPBYgBY18dlqB2eSULj1jxggaw9wrWw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=jakff3ah8jzl57gggOgacJb/gFP7+YRKA55IpUwlYdDe0OIeafZhw89ap9NSiJ9w
 98BaCEEUuuSoqNRsb5U0s9W8KuMhl4LZTR6jsDsFpNx3w4XBS9nKjXg1aYiX8I+mc
 J4mJqHCXL3pF/LGbjY+KpW8457QGKarfTdxSoEh1Y7wjVC2ZFcwfg8NWw28KGeYF9
 yxjC78lXt69lF5UeHsnXSyZl2Nrjn2I+3qPHj6Gfona+m9KtSJfV+BTp6DPm1q0nh
 egskQtH5cSBOZ/DgG7sYkGX7PEzKUtoIWL/aEmU1IBwq1evbDTGmHheDJzfMZ2/5r
 kbat85hxNS2ydkve0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jakff3ah
Subject: [Buildroot] [PATCH 1/2] package/glibc: fix license information
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

The COPYINGv3 license file was added with upstream commit
e067e53080386e93dcf8b07e25fb6656f2c8941e, it applies to scripts used
during build.

LGPL-3.0+ applies to sysdeps/htl/raise.c, which is used for the Hurd
platform. Buildroot builds only Linux, so the file should not be
compiled, but it is part of the downloaded (and possibly shared, if
"make legal-info" is used) archive. The same applies to the manual.

Checked against the copyright file of the Debian "libc6" package (as
of 2.42-17 and 2.43-2), note that Debian excludes the manual.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/glibc/glibc.hash |  2 ++
 package/glibc/glibc.mk   | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 97862aef14..ef4580b5bf 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -4,4 +4,6 @@ sha256  647325cc2e9f2c6260f3c48d0385ac5e30cb60d2ec2e5afd649555c518c9bf60  glibc-
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
 sha256  b22a69aa3f80a5201818c66cb0df0f25f9fa13cf5861b0093a058dbd12d50dce  LICENSES
+sha256  297ad42928811894f3abc955526431b1e7856e6766eecb7de2a5a0aa2915e5cf  manual/fdl-1.3.texi
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5aa2ef5f99..6ceb629370 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -11,8 +11,14 @@ GLIBC_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
-GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
-GLIBC_LICENSE_FILES = COPYINGv2 COPYING.LESSERv2 LICENSES
+GLIBC_LICENSE = \
+	GPL-2.0+ (programs), \
+	LGPL-2.1+, BSD-2-Clause, BSD-3-Clause, BSL-1.0, FSFAP, ISC, other permissive licenses, public domain (library), \
+	LGPL-3.0+ (sysdeps/htl/raise.c, for Hurd only), \
+	GPL-3.0+ (scripts/move-if-change), \
+	GPL-3.0+ WITH Texinfo-exception (manual/texinfo.tex), \
+	GFDL-1.3-or-later (manual)
+GLIBC_LICENSE_FILES = COPYINGv2 COPYING.LESSERv2 COPYINGv3 LICENSES manual/fdl-1.3.texi
 GLIBC_CPE_ID_VENDOR = gnu
 
 # Extract the base version (e.g. 2.38) from GLIBC_VERSION in order to
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
