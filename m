Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA7FCD3423
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F91854BF;
	Fri,  1 May 2026 06:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFOIgivAxAEZ; Fri,  1 May 2026 06:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF6E854C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616626;
	bh=i+S+bw+8JipGH06x9BqRP7q/UcRUngQjiLFGQ4jyDAQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yywke3Htzh84FQl5SsGNrD6zgOdaDQYYi9SeNScw3CA6WoCKxhk5p8ARVG740Gyho
	 wc3tTTE6df0xhmDmgMTLH8C5wD0+m638yCM5QxZDdlMrCGac9aNO5KqMPgWPT57FGQ
	 gjxGNw/D/uv3W6MK8KeCSuao1Dvo0bHR4eEbZI8JjZwZqDaz6H9g+qAzDDhhI5mIOp
	 i4WaWSLgGuOxZT1I6BMPWJgbXJ6WW3WpAsk7JZmXsa4L+IJ0umnm0CKpO+9OOSoFsy
	 TmWnpa4KmPoNhpw/WuNMlv1A71D4Uw+K4xkmCVrle2skfutioOMdPvILJcYGvR4hZc
	 CRX2wK7TZ/cIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF6E854C5;
	Fri,  1 May 2026 06:23:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 899F8204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F11C4006A
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id II1Dgsjdnc6r for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D8A940064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D8A940064
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D8A940064
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA2CEA4C1709;
 Fri,  1 May 2026 08:23:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHQ-000000007tD-3J7m;
 Fri, 01 May 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:22:55 +0200
Message-ID: <20260501062316.1942112-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616596;
 bh=ATLedpUga1RrU6aadpDcGhLzOm6cF33gyvu9nH1oIZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hG/horHc9HQoari7kN1I39gMs9wyGDT000M4e6udMAfAlScS/5BpMG4xwcOxKqLfF
 Npat4MRoOYH+vTaByHWLKZw0rsDbEbcRWMlPU6Z6lhmiDUCH4cXfsz8sG7NLz4ODWl
 nV7ryrwqFg0VCKuzDAmZXaTP9uHgnF2NRhK8he7LqGvwQD6LdNUoumr0Vdg6gszmVx
 LzSf2vHt8SW2FKMMsmVxQncc9wROYoWTHvXYqJY8H+n1CQvMaFruR3Z42u8hsmYG6K
 hS9PCOWAc4QgFKa+JPL5JJMFCVa7nr+wURtzJVL3RZloYTqmYORmZb/0yIIxEZiKai
 P8l1WBqbOSTxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hG/horHc
Subject: [Buildroot] [PATCH v3 02/21] package/autoconf-archive: bump version
 to 2024.10.16
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://cgit.git.savannah.gnu.org/cgit/autoconf-archive.git/log/

Computed sha1 tarball hash locally due to upstream not providing
release notes this time:
https://lists.gnu.org/archive/html/autoconf-archive-announce/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/autoconf-archive/autoconf-archive.hash | 5 ++---
 package/autoconf-archive/autoconf-archive.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index c4658e6f91..0ca19aee1c 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,6 +1,5 @@
-# From https://lists.gnu.org/archive/html/autoconf-archive-announce/2023-02/msg00000.html
-sha1  e26d15db0f1ec60e9ea8ff024cf3ee895fa2eabd  autoconf-archive-2023.02.20.tar.xz
 # Computed locally
-sha256  71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33  autoconf-archive-2023.02.20.tar.xz
+sha1  74be8b0ae9b11535dc0dba3f559ac302061e3c7f  autoconf-archive-2024.10.16.tar.xz
+sha256  7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219c592d62502a57363  autoconf-archive-2024.10.16.tar.xz
 sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
 sha256  23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 07ac7e9743..2b01ba2bb9 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2023.02.20
+AUTOCONF_ARCHIVE_VERSION = 2024.10.16
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
