Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68867CFD30D
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 22:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A3240BD0;
	Sat, 22 Nov 2025 22:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3qfENr1v6E1; Sat, 22 Nov 2025 22:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04DE040AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04DE040AF2;
	Sat, 22 Nov 2025 22:23:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B34234E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 291F440AF2
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sN2Fdo6mkW8 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 22:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6EF140AF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6EF140AF0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6EF140AF0
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:23:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50040A4C220A;
 Sat, 22 Nov 2025 23:23:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51218)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMw0t-0000000041D-3965;
 Sat, 22 Nov 2025 22:23:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Nov 2025 23:23:25 +0100
Message-ID: <20251122222327.1913289-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763850208;
 bh=LmH5hsUurs2Lf9600y42LAUuXC1v2pp3472s8FqXYUw=;
 h=From:To:Cc:Subject:Date:From;
 b=Qghj1chOKXa6JRHvUJEwhcSP/2gvPIhykGpBU3B6aPY/exloTt3T45YEj9LLCKuBB
 u5p7208VMknks/MAXfzMKTu7eEqo6ybPBTW+3tPo5Rh1b7XGrDboxRk/Gtyu4l87zM
 cXiEidrehiyqskt+im8JmpbSn5iEcJHeL8O6w4hJ5/V/q/HaQGThIwUSDdwczphudQ
 i+8t/ocljSaYPBWyU0cwfF+4U4bcdUcKC7wUOGnhLUBKXymp5v7yXPKsA4fGzfwMmy
 dspCsX2n0T5xrIAXZggo0uHqkzGbFviwKnlM3pa+HA8xwgqYawlWEmNLARrCk/42H6
 blIm6IKQweZ2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Qghj1chO
Subject: [Buildroot] [PATCH 1/3] package/libnpupnp: bump version to 6.2.3
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

Release notes:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html

Switched _SITE to https.

Switched build system to meson after autotools were removed in version
6.1.2.

This bump fixes a gerbera build error already present since January
29th, 2025:
https://autobuild.buildroot.net/results/c3f/c3f49c2eadefa7ba000da20119c538a2a407a23f/

Fixes:
https://autobuild.buildroot.net/results/b6b/b6bd96cb9dbcaff9351ef156edaec7d1b5290b9e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 15ee26c6d2..9e4f211ecc 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.2.2.tar.gz.sha256
-sha256  cb3968773d30e2bfc765547df514fdc8927b9a37ecccca2e260ee8b612e756bc  libnpupnp-4.2.2.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-6.2.3.tar.gz.sha256
+sha256  563d2a9e4afe603717343dc4667c0b89c6a017008ac6b52262da17a1e4f6bb96  libnpupnp-6.2.3.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index d7192ec3f1..68da209554 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.2.2
-LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+LIBNPUPNP_VERSION = 6.2.3
+LIBNPUPNP_SITE = https//www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
 LIBNPUPNP_INSTALL_STAGING = YES
 LIBNPUPNP_DEPENDENCIES = expat libcurl libmicrohttpd
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
