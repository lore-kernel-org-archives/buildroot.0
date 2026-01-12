Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB88D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 906FE84457;
	Mon, 12 Jan 2026 08:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWw9UONSlaE7; Mon, 12 Jan 2026 08:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DF1884434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205419;
	bh=1bCAtHpG4MUY+UmXfGK9dYeSnLQa3BaW6+QozZzY14M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3r2ThMh/RKQKs0M4aj1gpeT4N5kEYleBz3UhXRj9M4AEw/O3ERQ/r5KFwAmXbQWW
	 hd+i8B7esbmhQFWInpknjLJDMoftm1HucSjPvijk2KfYRL9Od/Ip4b4Wg5zTq87MC1
	 3z2QgNgDsVaKaEjVGj0MRNJivwwBIuvsjFuBTzrtxe9FTKO31AzxtrcvmZ7MQHbyOI
	 eiMIlRI7XjdDOW/75nGI6MJw1jp8fLB59u3/aemDsX61KJ7xZBOUztD5jATF90dXaH
	 w6lDKistdFFgo6w7IAS5CLJsTet2+6+ki6bA+LsTxKDmZAzFiwoEb2UjUH4ttbmaFf
	 ucUY8A+ELtHRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF1884434;
	Mon, 12 Jan 2026 08:10:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 689DD12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F458415C9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwB-QCl_AdrO for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 466AE415C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 466AE415C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 466AE415C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01F63A4C3B9F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-3ppb
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:52 +0100
Message-ID: <20260112080419.2516889-77-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205113;
 bh=7OQKN0rGki8BgBQzFuXbAALIxHUudM85S1qwhXjcbdw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=LUJHLhAEREmQ3hzi0Kcbxg7tn45chehBVW6lKIn36WshK1kM8SDWaAK6FvKE02uKS
 VQ2BmplR3/17EKbOodpWyrVHsZMyMwv2FQP0XasHXDKrekH3tR+MvuYb28H/kVcVpF
 n+vGYRRc+52uzkdL4IvHfsWpx5d136qHXGP10ggMmx5wRI9vh1q33owj0TgPtjcqWj
 hl9iodqh6gEQw+Zrd91X8XBcoShLYlYqHP8j4Iyp08+qkWO1F4u+4yqzx61E9qmFjD
 8nk7G6smvGueHv0Oo023q6GSaChRj6Pe+cgeMsowSKg2ueOnnx5a9HvKWEAEFUDFHw
 pbWAI0ETKQ1dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LUJHLhAE
Subject: [Buildroot] [PATCH 077/104] package/x11r7/xapp_xrefresh: bump
 version to 1.1.0
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

https://lists.x.org/archives/xorg-announce/2024-March/003478.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xrefresh/xapp_xrefresh.hash | 6 +++---
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
index a83bc84940..65337d1ff0 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003188.html
-sha256  a9f1d635f2f42283d0174e94d09ab69190c227faa5ab542bfe15ed9607771b1e  xrefresh-1.0.7.tar.xz
-sha512  8fcbb01aa368944ca536f050ab194b21bbd6b2a56265a7ed5807882e5c2f9660105283cdba0ea35b3e4a17a015586aeb82906e081da030332dfc49169a191c31  xrefresh-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003478.html
+sha256  29ed592d5ece35a3029004d8c46f3002f92970870a96c11e38baf7f1122b8b5f  xrefresh-1.1.0.tar.xz
+sha512  d46988c0423c3c6efb21a2eec0df427934d041afa6dcbbfd33f2dff19bf5e077baf10bd96780d98326d3a3e34cbf5824da822b6cb0091873cc1baade0aa05c26  xrefresh-1.1.0.tar.xz
 # Locally computed
 sha256  4f51c9a91cd277697cbea6604bf4cb240c1ed14cdba82550cb9cac8f1286f663  COPYING
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 9affbd468e..3424af96fa 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XREFRESH_VERSION = 1.0.7
+XAPP_XREFRESH_VERSION = 1.1.0
 XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.xz
-XAPP_XREFRESH_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XREFRESH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XREFRESH_LICENSE = MIT
 XAPP_XREFRESH_LICENSE_FILES = COPYING
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
