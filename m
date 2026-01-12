Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65AAD25046
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEED8610CB;
	Mon, 12 Jan 2026 08:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tFiIYLkzbhi; Mon, 12 Jan 2026 08:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D764361499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205696;
	bh=X4fF0qeceTMZuzD8kI/tpHq2ILXKsJR+WHy5g1WV5oc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWhtJY6gj0idhEpp7NN90yWdrbEwjp8Qwvw+qJAM85TOQdL//sTtFQbepBA7qSEDf
	 Xk7d6+nhzdkaQeevH/HJkSetxa9/hHQ0L+xvesktlmOpEsnHtl72SPvXuwHCtmB82B
	 H/D6hRn/lhl5WTHg0/yiA1k2dnJxoXqY4DV7bxhXN9p7SZRd5BjBw2tvIVy+FLColY
	 q+RYK7M4yAL4VBx12VGvk8WADoXjcNcb0Ghq0WwuGObErXpz5T+/JshxaybtpMQO3X
	 1GUrsKs98IVFkoZ+JRHJU72j9co5LfL95b/h6JKzIuviVWaUOMvKD6VtVETsyZVYpa
	 1aMoYP1WVcBQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D764361499;
	Mon, 12 Jan 2026 08:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6037E12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52DED80E77
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efeb-VP-eAlV for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:14:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DA7D84464
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA7D84464
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DA7D84464
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04F76A4C3CAB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-2u1e
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:16 +0100
Message-ID: <20260112080419.2516889-101-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205134;
 bh=Vjaibw6nvNb+E4QqClj8ZIyTpca8sPnAwbmtmIhrV4I=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=QoMl4Cjq2jlwQdANJBSCXDfpKZIrDavk4CsirEWnAEKAlm8Hu1oznWHgFhYdHKEI4
 tIoWrGr5bdUpXIYR7o2R+zFhXpcgWMIslPlPD/JuQzIz63q3GHQWMchUNvFphad4CV
 9ObKNGCojJSvl9ekGqHX0yh8XfSo4sGReku5eCQila+RbVQphmJu2U2mckcSK4KdIq
 SXHID2qLe2mbknUtuZTGhRYU0scBYijv9y1x2TfEYjLgHrf96ZrN2qomDqw15jX1Mn
 W0i994kj8ooQKAWnm+jXH4lxGaiIfo14E6oMkUaTlG/i0LyZI9LAURd8wva5DUeqK8
 73UinXbtJ4p3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QoMl4Cjq
Subject: [Buildroot] [PATCH 101/104] package/x11r7/xlib_libXvMC: bump
 version to 1.0.14
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

https://lists.x.org/archives/xorg-announce/2024-February/003456.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash | 6 +++---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
index 15221969e3..12099ffaae 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-March/003132.html
-sha256  0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c  libXvMC-1.0.13.tar.xz
-sha512  c9d0f73884a586efb9ea4f77fc8555f60d940077d7dff8eaa765b86345c8b4e3d80b860f68191d2830c272b9e464c08450fbb51bb64819753a6f4228c71861ac  libXvMC-1.0.13.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003456.html
+sha256  e4be9eb6b6bafdbbf81f47f7163047215376e45e2dc786d0ea6181c930725ed9  libXvMC-1.0.14.tar.xz
+sha512  fc76c6d591780f3481f5032d1f956f2043f3dc7655a4b776dfda4bae55d4424a36d1a3c63dafe2a851908f33159297c0b038a41329d7a137ca7ea73d3db3eedf  libXvMC-1.0.14.tar.xz
 # Locally computed
 sha256  b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index c1fe31277e..1accda1254 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXVMC_VERSION = 1.0.13
+XLIB_LIBXVMC_VERSION = 1.0.14
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.xz
-XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXVMC_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
 XLIB_LIBXVMC_CPE_ID_VENDOR = x.org
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
