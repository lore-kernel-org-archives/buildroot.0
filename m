Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AF3D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0FB961B54;
	Wed,  3 Dec 2025 22:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA5e-bNjoZQ2; Wed,  3 Dec 2025 22:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7030D61ADD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799463;
	bh=MwfgwXFWgvMHBm4Z12Uim1mu96IT5pU8JiJlaqyXZ98=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eVECcYD9Dyama5hmwH2ko9/Em6CL/emevq20Qew/xeHLKWBI7khOSudDJR5mNl0SM
	 B0KMFQO9sSTFAtHM5ddzePJwRExXMfVcE6qIJW5qN3dnlNbrIRiW/c45vzAbwhfn/5
	 wgBKykZ9ZFyx4sVwBt8ynwa8nJ8as9/EHGNOk8IrIdXZlrPWq4cyAxlgW/RUEIj+yj
	 TE0LRxiU72pzOS5BZNWkDtUXcNoomPeaLIBXJQ5u46E0T27VdlE6zllrd9t+aO5c0H
	 IhkWfIn06zxlZm7ch19l62AVrJPogWaO/3n+ZYOP+/0UfWmE0ov1xKGrolXLlE8yJq
	 zNaFPvnzAaN6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7030D61ADD;
	Wed,  3 Dec 2025 22:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EF16E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35C9F401D4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVJCklH15YBN for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:04:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B88D4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B88D4004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B88D4004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98598A4C79D2;
 Wed,  3 Dec 2025 22:59:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-3HGo;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:16 +0100
Message-ID: <20251203215723.2323032-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799146;
 bh=I6+A754daCPdHReLWVlUi9lAzTaTj3Dc7q9VdqyTpzM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FCaEVDlu2+OTqusXuLSatlSFFF9EVnaPCUbaEr3C02Ul63cFV89yJL3V0X1hZ0e5V
 OVNgWZLnSbfhybmLCZ6pOgoul6+kdGGA+lFtyD4JKpFgqPoK/jTfeZz/YOGXScGNUM
 Q7aewY7OBfQWYJ3Emtk6gTM78XlugbFPOkc1uAZTSL6xLGZF94BVhNcUCEJ2/wpsNe
 wfgglZ/UlT0ZDhblji//zsaPHAMtR6TJylqv9jZkD52NOlH/vkunoZbV5AOgr5y7KP
 hVkWDj0CS1tXNeTigCavx3I5f1y+1WrNbS5Cc5yt4aGYisdc7QFdDJQkG5tGvqGzCG
 errkIAGO4ausg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FCaEVDlu
Subject: [Buildroot] [PATCH/next 09/16] package/hackrf: bump version
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump includes patches which add cmake4 compatibility.

Instead of adding patches for
https://github.com/greatscottgadgets/hackrf/commits/main/host/CMakeLists.txt
to the latest release from Februar 2024 we bump the package to the latest
commit from November 2025.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hackrf/hackrf.hash | 2 +-
 package/hackrf/hackrf.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
index 0426009dd3..2e4e5cee2f 100644
--- a/package/hackrf/hackrf.hash
+++ b/package/hackrf/hackrf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32a03f943a30be4ba478e94bf69f14a5b7d55be6761007f4a4f5453418206a11  hackrf-2023.01.1.tar.xz
+sha256  5aed35668876b661662c56575af982af8d5c7cb8e30b6ba220eacc7e00f0894f  hackrf-390837715b3741902b1b13c899bfd04a0bb6b0da.tar.gz
 sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index 0d7533815d..e00e75e167 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-HACKRF_VERSION = 2023.01.1
-HACKRF_SITE = https://github.com/greatscottgadgets/hackrf/releases/download/v$(HACKRF_VERSION)
-HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
+HACKRF_VERSION = 390837715b3741902b1b13c899bfd04a0bb6b0da
+HACKRF_SITE = $(call github,greatscottgadgets,hackrf,$(HACKRF_VERSION))
 HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
 HACKRF_LICENSE_FILES = COPYING
 HACKRF_DEPENDENCIES = fftw-single libusb
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
