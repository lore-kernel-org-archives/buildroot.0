Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D16E92FC4
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B32F8089D;
	Mon, 29 Dec 2025 18:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RhlOuKb_noZ; Mon, 29 Dec 2025 18:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7039481DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767034764;
	bh=nHZv12462cA7rsJrHiTMmdjMIHW0OoFvmUi3Xwpfc7o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=emKNxaohSx+338YbKtvTo51YahCMeElWeT0HOmKCVOYxBqEcNBI0eGWD0D3oyWJ5t
	 QK2e+3qmVyk2IUNRz1yJg46yrpnFbI6y3cuXPz1e184tXc84RC7+BLmb8Fbqd42A8M
	 87aYAEKuEY8Q1tXoips+odwEDLHfXkp1p0bnWmwx2wQwXj6cdHez5cVKnNb6gvHLfl
	 lpJi0A22k4+eQ4KIgV1V/LZbvMosxN9iK4X5YIZF1VbZb6KOVUFtJuL38oYddVwdkN
	 RSti5qTnHhc/+X2o1D3WrJ2rF7hYMusc0Httg51ANKZk/e/k/w88xVIjIcTWQKxyov
	 /jMw6z/uY8aZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7039481DE6;
	Mon, 29 Dec 2025 18:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE5B1B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D514D81DE6
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUNqf5SXPfRh for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:59:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC8B481470
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8B481470
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC8B481470
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:59:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C62FA4C06F6;
 Mon, 29 Dec 2025 19:59:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37952)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaISc-000000004Qa-3UAl;
 Mon, 29 Dec 2025 18:59:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Dec 2025 19:59:19 +0100
Message-ID: <20251229185919.4176115-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767034759;
 bh=blLqMg/a8KCaEJ2EMoOxgr258EHMziIMOmnjAjAKBPk=;
 h=From:To:Cc:Subject:Date:From;
 b=azUlyanTbjmh83PRqra9uGcV4ZJ7RWMB5OexsFk9oTIrfCghfM2c14LzW6HBSsqMF
 yr6v45xsmRtm34AsT9zYUGr04GuseQOolRK7/rGraR130GUxv4HHvyusD14drc082z
 PEC7l6r99GDiOnrJn0XWZZMOZiAfDR3xJfBDzdfuU8K0f6Y4uTQ6tMQe98zym96lKq
 zXlIRs0Iz0SkDOgHlFv9CZ4FBNEP1w9nVfWA/L6v6Y7D67suBHM2JdRUj1JC5qNXek
 pmmGmBkPN9wPJayxkbU2auvmccRnvs0ATLv3hfuRn3utMR6Gw8dN9HgY2ARCVD/AY6
 wAnxGJAa5gkQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=azUlyanT
Subject: [Buildroot] [PATCH 1/1] package/libupnp: disable blocking-tcp
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

Suggested by Gerbera:
https://github.com/gerbera/gerbera/commit/fcf31472239705e7d28af81cbe326f8f416f7f7d

CMake Warning at CMakeLists.txt:583 (message):
  !! It is strongly recommended to build libupnp with --disable-blocking-tcp-connections !!
  Without this option non-responsive control points can cause libupnp to hang.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libupnp/libupnp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index f29275d2b5..cfa1136db3 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -17,6 +17,7 @@ LIBUPNP_DEPENDENCIES = host-pkgconf
 
 # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
 LIBUPNP_CONF_OPTS += \
+	--disable-blocking-tcp-connections \
 	--disable-samples \
 	--enable-reuseaddr
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
