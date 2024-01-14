Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439DCC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 19:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90BED40522;
	Sun, 14 Jan 2024 19:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90BED40522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6c7_ktknkf1R; Sun, 14 Jan 2024 19:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DEE440199;
	Sun, 14 Jan 2024 19:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DEE440199
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96E7B1BF574
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 19:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75E1740939
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 19:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75E1740939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsMNL_B6R6Pr for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 19:18:03 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2714340921
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 19:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2714340921
Received: from fli4l.lan.fli4l (p5b3a01c2.dip0.t-ipconnect.de [91.58.1.194])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 28A01A4C018D;
 Sun, 14 Jan 2024 20:18:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44590)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rP5zb-0000000026g-3xGj;
 Sun, 14 Jan 2024 20:17:59 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 20:17:59 +0100
Message-Id: <20240114191759.3236753-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1705259880;
 bh=DmyKhf/rSILwJFlvcUixbrzkq7xkR/txlk26AkyEQNA=;
 h=From:To:Cc:Subject:Date:From;
 b=NS4wSpp4BPCXu9M1eCUmUkNYk4ec+5AxAbToPCsg6+2XLwcnnzUl5+DeTTEET7bT5
 mQDXNmnfLjAetB5yDiGS9gmc7OQh+RvhsTTIYTMT0qncY8Ms+OvvZTS1XnfobT4H/T
 F3RAq/hv+KXDd5GERlVqO9JjC+S6EIz9kmi7qlgpchgA1By1G2EydD+ZrFAbidyjY7
 ioqQV/McWtzFGfWjFIOObD/8H/A3p3akTDfufs0YwXJi6PqVE95B/rF3CpAzWbDujk
 Uhmg2Q32Vez86swEq5IFEzfeOpY6ajwNsJ1PE3myzXfGCk5fQQxew+TFid+h1bbQTj
 eMqo4MmwjxeeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=NS4wSpp4
Subject: [Buildroot] [PATCH 1/1] package/libvpl: fix libdrm dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit c50e9c21f0444b064bc257fcc0d3073fee945623 initially
added the package onevpl (meanwhile renamed to libvpl) and forgot to
add all dependencies of BR2_PACKAGE_LIBDRM_INTEL.

Fixes:
http://autobuild.buildroot.org/results/8fa/8fa0f2cd7a027d3d8fae56125621b0b814e132da/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpl/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
index 012f31b3be..b9e9a20fd7 100644
--- a/package/libvpl/Config.in
+++ b/package/libvpl/Config.in
@@ -12,7 +12,9 @@ config BR2_PACKAGE_LIBVPL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# libva support needs a libdrm with intel driver
-	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA && \
+		(BR2_i386 || BR2_x86_64) && \
+		BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
