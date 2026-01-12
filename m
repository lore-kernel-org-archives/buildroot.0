Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C992BD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A34BA8194C;
	Mon, 12 Jan 2026 08:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsRC2C31_USA; Mon, 12 Jan 2026 08:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC6BA8454E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206895;
	bh=tZ6Jr2j+wB6bY6qjPvKXW8WKMWBXk6HghhE93J3HWPc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6JPF9sAXLIIxHYn27TuTKpYvSMwaoWw624JVq5LhMcIp9pisA8sXUudlV42QBHYO
	 GGdqkEuNDtFRfJdQySFGDBeD9ft1bZ0mAIDnr6UwiQiat7oo0x2Pq1C84ET8vw7ywt
	 odS65LI9ckX8MUrZ/a1ElleUi1ZbFi0ydV78uzNGD7xIHlQ0IyDOtpBC7R45JVoxAS
	 ptS0pu+XWqJ3WgDSIPGowxBcUbbBP50xY4MZSsCDeHRp6xY58UloGv1/d7jfb5Pvrp
	 VNa7f8DQ+45l7yudds+Ge+yEs8g0WECVmLu6nFxgsKuDkKipiHTlD4/XRGnd+KaQag
	 1Cky4km6LL8Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC6BA8454E;
	Mon, 12 Jan 2026 08:34:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AF2618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31BDD4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Wn1zJHJTAAv for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:34:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16E1840052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16E1840052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16E1840052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 683A3A4C3BF2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-3435
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:22 +0100
Message-ID: <20260112082950.2528445-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206622;
 bh=vRat8F/Tn2ClRXopBRjHvdMW2E/dJ2IOvr6cgCftJfc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rh+JfQ8gcARgx/hKemfZBdX5F+bj8ZIrg1aeSrkoE8XmuvYprWp+Nden88JTFzLDN
 pNHWGVBPoxBPit1C8RAEGaGTfDga9YVxA2/irtllXFpvtmRHKXBcA69ssxUu9AZ+7b
 j7tUK6Km6Hz9YCb999UK0/8Gi/N7RRn/LF/jscb/nZbh23thrurbSOLlLejmJJ3w+9
 je5MH1dWwt0NZaouqzPI6eXY7I9QFq/RocWuRh4dfkk+D+MglAZYHG4eLslmIP2fdh
 lhJDhEAkXNps5dZ8PLTuE4laje8Ab7XOGQYCK4jbB+vPZXkx3L66Ko+zWcZZPSnoIA
 nFS/BU0I0vBog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rh+JfQ8g
Subject: [Buildroot] [PATCH 074/102] package/x11r7/xlib_libXaw: bump version
 to 1.0.16
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

https://lists.x.org/archives/xorg-announce/2024-March/003481.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.hash | 6 +++---
 package/x11r7/xlib_libXaw/xlib_libXaw.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.hash b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
index ce2ec4a3e1..d3061132f3 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.hash
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-March/003372.html
-sha256  ab35f70fde9fb02cc71b342f654846a74328b74cb3a0703c02d20eddb212754a  libXaw-1.0.15.tar.xz
-sha512  8edbf280b7b24b9040c291545053c1251d6af7e7f56da43a6065a1848245863eb52bdfc28c2f18dbb6597a4064394a44f4df5d8596a1a467549ccc9ce50a7821  libXaw-1.0.15.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003481.html
+sha256  731d572b54c708f81e197a6afa8016918e2e06dfd3025e066ca642a5b8c39c8f  libXaw-1.0.16.tar.xz
+sha512  1cabad1a9b06dec7de601b977e844536823ee1a0045244acc42ca6b6107da9b4953736d94898a96cab40845eab77dae21e20e1fa66a3dfc4dedf575dfbca04aa  libXaw-1.0.16.tar.xz
 # Locally calculated
 sha256  9f5adb26952f93b3e4650285b94ec6c61a27aab5a21088bfb6694001be1b360d  COPYING
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index f81a7b4a88..b7d6918dd6 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXAW_VERSION = 1.0.15
+XLIB_LIBXAW_VERSION = 1.0.16
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.xz
 XLIB_LIBXAW_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXAW_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
