Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720FEC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 04:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D8B80E04;
	Tue, 21 Jul 2026 04:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYEq4xRHxYUd; Tue, 21 Jul 2026 04:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1924780DFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784609176;
	bh=y1YwzScFusqKfbxT1X5W4ezDl1OJC9nUBMlOmLF3jBo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VXSZcKF1m4V5360cLC23yNwVDQnjpxASIAgXoulx5UPpQiqnVg/svgQQxvm0lom7u
	 GWte0RaOOVnIJA2+/l6qJUw9enzuG+pe6bnZyew3eqcQ76uC8HApE++73pHEr0mymF
	 T41dM5JpzlLhx6TXfjk4RS0bwXLGJHVIpM6wbLSABTSKGyTZfdxPSXbN32sxfE0FqC
	 F4Zx62IAg4U/KGEaoRxN927v8Q1UhH1Fur0iQcVyr2JADBb4y2LeOuc8yX7MgNqoPE
	 GhBf0CpybHzQ1+jQKiBYQH3VqxWPaec0YcCJGPPr9yAFzie2xGP0Qj5kxUwsWcFeEW
	 T3+/9ZWd9LSRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1924780DFE;
	Tue, 21 Jul 2026 04:46:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5705109C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8061D80DF8
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woL6R6RWQ-CK for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 04:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEBC980D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEBC980D91
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEBC980D91
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:13 +0000 (UTC)
X-CSE-ConnectionGUID: rIGbK3FITqGZT4NdgNCdpg==
X-CSE-MsgGUID: o7ShWQErQBGfIcZpdKByNw==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Jul 2026 06:46:13 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 06:46:13 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Tue, 21 Jul 2026 06:46:12 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Jul 2026 06:46:11 +0200
X-CSE-ConnectionGUID: GxYpuowWQFyv4csEU3NNgg==
X-CSE-MsgGUID: pgJ6cTSLR16QIWOwrD03IA==
X-IronPort-AV: E=Sophos;i="6.25,176,1779141600"; d="scan'208";a="456296509"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 21 Jul 2026 06:46:09 +0200
Message-ID: <a7faeb61709b77701a7fe35fdb96f4107c43f38a.1784609165.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1784609165.git.yann.morin@orange.com>
References: <cover.1784609165.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1784609174; x=1816145174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlwUl0w8/eCZ4BjS+sMHwcJqjealMoiXMxB7D7YibDA=;
 b=SP4Gy8QWNTfggl7lV/OHH5tRW5Bmp5DRZ1vuRtV0z7MHTz2OrCzuh2ef
 /CuSYSgMkniJiX1w2ft3xbJp9pGK7775XehoMOZiR0Ry7Rw9RD5x8iXUj
 +xp4fCixWYSK4M0+mWPMxBUZKDp8h+/APZotvFbijuIG3Y7RXsI7oXQMx
 h8jkCeTc+gf54e1LL/T26nCGPhtWMAtNeTowaJQimwDV2eF65D34QWCyu
 VOiCiheJ+Vo8uUjmonuUeysCbVNrv2mN8n+BmloGySiBprgNPJ4JHkIov
 xMRPydntUQoQ+vZ0MDOz+gbye6dH2gEN/i5OPeWewq/ZQwXhL2CFvZtcN
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=SP4Gy8QW
Subject: [Buildroot] [PATCH 2/2] package/libqrtr-glib: bump to version 1.4.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>, yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...rtr-lib-meson.build-fix-static-build.patch | 36 -------------------
 package/libqrtr-glib/libqrtr-glib.hash        |  2 +-
 package/libqrtr-glib/libqrtr-glib.mk          |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch

diff --git a/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch b/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch
deleted file mode 100644
index 8c0db7bed5..0000000000
--- a/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From dd9d68259c1fb79bcf40fcdf6aa1e6026edec9b2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 9 Feb 2024 21:16:39 +0100
-Subject: [PATCH] src/libqrtr-lib/meson.build: fix static build
-
-Replace shared_library by library to avoid the following static build
-failure:
-
-[5/5] Linking target src/libqrtr-glib/libqrtr-glib.so.0.0.0
-FAILED: src/libqrtr-glib/libqrtr-glib.so.0.0.0
-
-Fixes:
- - http://autobuild.buildroot.org/results/e0442e97279a07f33a14ec52840f98b7ec0fe32d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/merge_requests/24
----
- src/libqrtr-glib/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libqrtr-glib/meson.build b/src/libqrtr-glib/meson.build
-index bbdd869..0cddcc7 100644
---- a/src/libqrtr-glib/meson.build
-+++ b/src/libqrtr-glib/meson.build
-@@ -39,7 +39,7 @@ c_flags = [
-   '-DLIBEXEC_PATH="@0@"'.format(qrtr_prefix / qrtr_libexecdir),
- ]
- 
--libqrtr_glib = shared_library(
-+libqrtr_glib = library(
-   libname,
-   version: qrtr_glib_version,
-   sources: sources + [version_header],
--- 
-2.43.0
-
diff --git a/package/libqrtr-glib/libqrtr-glib.hash b/package/libqrtr-glib/libqrtr-glib.hash
index 38543f7de9..da02b2c2f6 100644
--- a/package/libqrtr-glib/libqrtr-glib.hash
+++ b/package/libqrtr-glib/libqrtr-glib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5cdf5ea91cbd2cf2758b2896064c7b1dfe7156063267df905f957ac69b6b763  libqrtr-glib-1.2.2.tar.gz
+sha256  9e5f988c6005af347f6d0ac95c872e473c9c10c3ec3714ee0b73d896db7d5766  libqrtr-glib-1.4.0.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libqrtr-glib/libqrtr-glib.mk b/package/libqrtr-glib/libqrtr-glib.mk
index c3df76dc84..580a65cf52 100644
--- a/package/libqrtr-glib/libqrtr-glib.mk
+++ b/package/libqrtr-glib/libqrtr-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQRTR_GLIB_VERSION = 1.2.2
+LIBQRTR_GLIB_VERSION = 1.4.0
 LIBQRTR_GLIB_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/archive/$(LIBQRTR_GLIB_VERSION)
 LIBQRTR_GLIB_LICENSE = LGPL-2.1+
 LIBQRTR_GLIB_LICENSE_FILES = LICENSES/LGPL-2.1-or-later.txt
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
