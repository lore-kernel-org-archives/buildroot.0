Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D463D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94026155E;
	Mon, 12 Jan 2026 08:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThkqUpd9-Ook; Mon, 12 Jan 2026 08:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED0BD614FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206920;
	bh=1bCAtHpG4MUY+UmXfGK9dYeSnLQa3BaW6+QozZzY14M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+nD9L6i8HHge2gMyDxM3WzkKv+jjh8OkLpWyU1bkCZXHGCgEkuR6+gRscTz1VcKk
	 6MqC5ZEqSZ1MDuP9WVOk1kzfB0o1OzUpMeCoQ+wBxfxfLM0rIl/Du7XgFzyWleBGeT
	 WfyliumKGIBlOvDij4o4xQdBe5/tC6EbN69/m8EjRpxKC7dPCa1dGrjLWWiOn7Jdiz
	 NSc9cEYgwrwQkfJroSbSSiNwTgZSZV7PBWpPrAE68etkXM4mHBzQlVuQWBZQ3k2qyI
	 pT0GqGjnOp/7xsgSTklSjZdTR1d6MjJnBfCfsBe4KuvTEkz3gOau71W43q7/y1LQKZ
	 x1zKFgjM5Rsig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED0BD614FC;
	Mon, 12 Jan 2026 08:35:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0674E1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECEE64013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDKnh5E6Mp91 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E124B40052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E124B40052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E124B40052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81106A4C3C03
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-3b0T
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:24 +0100
Message-ID: <20260112082950.2528445-76-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206622;
 bh=7OQKN0rGki8BgBQzFuXbAALIxHUudM85S1qwhXjcbdw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=E3BftV7Rkc0DY7oNp4In8slF0zExPcwhz2b+HyLbKr/sUUw/0dpTR0NVroQLEZlDZ
 DGa7Mu7/yyD4sNB+i5e2PfP4QNgjPnaEZ8e81hi3A8DI2xeiwjZS5jU6qJPP8m0/IQ
 1w601QTycff6AZkEw+skRiQJbJzEhCWU6rYfOU9h9u8TmXsMsSPqlrai5IUy4+hqwt
 /yNVcIpSMzD1kw6mu+dzejZg5p+J0TJJkOEgLQZWkShIl0Z73ZruF6K6xpLDlT102x
 BeMmnr6Vxjy1WI1ag4ScBfEqXuboTFBbK57Mm11Kckn2uG0tzPDkhs+cWbgfADWGpf
 O2WheHb/ZmBNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=E3BftV7R
Subject: [Buildroot] [PATCH 076/102] package/x11r7/xapp_xrefresh: bump
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
