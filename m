Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F216D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337168440F;
	Mon, 12 Jan 2026 08:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZXHrXtnFHIQ; Mon, 12 Jan 2026 08:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88E04843FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205853;
	bh=dBsAOg2zw5Mo+yMTJ/hPhKkUG68wFmay0oKUxWPr/qc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i56asKzY63WKt/JzXrfqzUJWnJkQ12zsGOMPEkWRT93qJ5CofZN4NNNxlZeV7D89I
	 iuCP0qeVfR+gZ4N+Tf50Ooa4co9OnPITWgnVpr/jeoB/u7XiUzL7fDqYjvU3EDj7h9
	 Wik6Ou8HZA3RYV4J7+gJoX4rrsmc8tsAOBWtDuZmEqJuq/fyd0nwTYPdXJqJ23z3ij
	 Sy8ljUTVfnE7GOhyQUpY7F0PGdBbZZZxDm00eFF+BQmj843IvtTVuLdNnqKtKeZEW2
	 VywW/XPLTl3mhGCETOZxOFXrozq8E7U6eSjtNePA7MrLi933AZow0Ro1fcEAFCxQ2c
	 C+J93C/WU6j7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E04843FB;
	Mon, 12 Jan 2026 08:17:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ACD412E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CE78414C0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-NEv7GZM-aY for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 451DB414BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 451DB414BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 451DB414BF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75F9CA4C3E5E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuT-000000003M6-44Jm
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:50 +0100
Message-ID: <20260112080419.2516889-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205139;
 bh=Iv6glxJj+NYJfTh9sndycER6E3vE3TseZRCukpF7kds=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dRd53VeQJbuVh5sZGDFzIfMN2SF10xGnj/pfA0b+OwTYrWWEuOlVk5ajLPiWmsp80
 RZZUT4IWfj6QMcw4FAQyActNPIFnucVY12spUhS4C24oiO0l5+hJBD2a2JUQ22Fpm+
 nwH/f2NoEjxzMm/KD5RrRmUYMjF1OHc7AXf7VYJwj8m8cxWKAaJp6JtnHKsPnYZeX0
 X2MiGoJAT0xRjniQPuo824EZX6N9qowumiNsQNNoLdqLjvnOC7REE14Td3DkQV+gZi
 V3ekcWTvMDuP28Ode4ae3aTY0JOZx5AMpzhnxML4dJDDh4UVzbQBVzHIZs7WsTjeWN
 7DvnFBNEmON7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dRd53VeQ
Subject: [Buildroot] [PATCH 015/104] package/x11r7/xdriver_xf86-video-ast:
 bump version to 1.2.1
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

https://lists.x.org/archives/xorg-announce/2025-August/003622.html
https://lists.x.org/archives/xorg-announce/2025-January/003579.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash      | 6 +++---
 .../x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
index 12ad79e4b4..d020ac692c 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003291.html
-sha256  75754fa9c7f9a94fcc706d32cc118942d16c71934d88110442443a143b930daf  xf86-video-ast-1.1.6.tar.xz
-sha512  8482fec8d6be577f293cb820e623544475163f713fd74ec415f899bf5e9cf9453ffe4f96e141da3671437ebf616b47395d30d4b10858053c5893f5f5b7575ef1  xf86-video-ast-1.1.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-August/003622.html
+sha256  df6b630e193c32972a20b02fa6db7fd38d026e835464e26d469de32e31c87cb6  xf86-video-ast-1.2.1.tar.xz
+sha512  50603333b3780aaf9a44132589e30ba8c9e1c938d769a38361ab3886231896227d2f526428cae36cc4e8f054f3bf8a75b1e4911d9c449298bf36c75c0f962745  xf86-video-ast-1.2.1.tar.xz
 # Locally calculated
 sha256  1cdd3d57e2fdcbd21b8a7b788ffbe6f809216a9bdd36b2225cff6c4b4404a170  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index f29dc29f0b..2bb852391b 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_AST_VERSION = 1.1.6
+XDRIVER_XF86_VIDEO_AST_VERSION = 1.2.1
 XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_AST_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_AST_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
