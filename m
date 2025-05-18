Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8560DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5562280E70;
	Sun, 18 May 2025 17:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1k6zcs_9vnf; Sun, 18 May 2025 17:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 974A580ED9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 974A580ED9;
	Sun, 18 May 2025 17:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97ED8E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DB0B4079C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9Yo2lm2bMRO for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A07B8404EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A07B8404EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A07B8404EF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D419BA4C13B8
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:41:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36790)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi0j-000000002yx-0TcR
 for buildroot@buildroot.org; Sun, 18 May 2025 17:41:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 19:41:17 +0200
Message-Id: <20250518174117.2148341-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590077;
 bh=M5BIUiEIRFxjsVqeYiaeyORFJsY6INTggdwfS2PqjWw=;
 h=From:To:Subject:Date:From;
 b=akLOZfetKb76CBzPvRhYjYNuLRFPoLAJ8kf80QUp5YJzBllOuXN/ZxUM/KIFUtUw3
 bnBB5FrxRi/yg26Yu6dhhkKKaWvqv1jHamxRGyGPtDjsdF8IkQbl0mG1jIWKelY+7L
 ncIzBn/2AGPMoGD+jtMPHbQgeAUQ/zCOSccFzBujzUG51B57jcrTNEWnOztBWPZ6WG
 nfx4qkIJn68jN40CWjuPLGeowluOtLl8pOnmmD3Vc8XSOrxTYAUvFLm/28+t2tIhci
 kBekejd1+Eh7hY6FfZ5GugZQ/tiJMzKQLpOUMJy41kntSU+0JwAPDR9gENuEH70uWV
 Sps/F8JRTfE2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=akLOZfet
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.48
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
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.47/ANNOUNCE
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.48/ANNOUNCE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 3fae82b5e7..7e5b33149c 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.46/
-sha1  11423f5ea270e7bb42dd2d519696adcd016d5df3  libpng-1.6.46.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.48/
+sha1  132bfa1a68e3d8f741d0b3fe03809e181fe57b7d  libpng-1.6.48.tar.xz
 # Locally computed:
-sha256  f3aa8b7003998ab92a4e9906c18d19853e999f9d3bca9bd1668f54fa81707cb1  libpng-1.6.46.tar.xz
+sha256  46fd06ff37db1db64c0dc288d78a3f5efd23ad9ac41561193f983e20937ece03  libpng-1.6.48.tar.xz
 sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e73e0bb686..e215d70f7f 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.46
+LIBPNG_VERSION = 1.6.48
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
