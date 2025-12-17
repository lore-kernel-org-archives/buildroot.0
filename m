Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD65D66B9D
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 123AA61110;
	Wed, 17 Dec 2025 19:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l03sgRKVlA4Z; Wed, 17 Dec 2025 19:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36155610F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765999982;
	bh=Rk/hEdX70nCjLTg0cnxkkOKSMqRd4MVngScfDPUCP7I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q/inHq71Y0Xb/Z1YXS+SzsFyok38pd6IoIyllT2VB71FiggBipAR6hfNFQ22L9olo
	 y36SzxyI4p/cNHikx4FAHDwum7dUNnYekWgKtbR1JInIQQfA9UIIuF9VctXwFbHeFG
	 tgMZFXUDERoV6idLwlOiFx6zvbDqiyH2XJQlILBvC+rSC3fWU/T7FLTwhOO6brc5I1
	 oL+ERVn0fwna22P5zpAHZC4+pBgWuL0Pq/fypT/UeyROQCjxfU2mtHdaRBBGQ7Qu7c
	 cI/gkct/2UN06zfa+cQA3cK/qTa6cwCZHCPQ/vqafP0e3p9pvSem1djqGlDMXYTBk9
	 0yNxZG7CffrYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36155610F5;
	Wed, 17 Dec 2025 19:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BE8A361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5383F40DE8
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UU8Q1e_jFYCm for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:32:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49A3B40DE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49A3B40DE2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49A3B40DE2
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:32:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 785ACA4C4320;
 Wed, 17 Dec 2025 20:32:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39338)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVxGO-000000002R2-3aal;
 Wed, 17 Dec 2025 19:32:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 20:32:44 +0100
Message-ID: <20251217193244.3770538-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217193244.3770538-1-bernd@kuhls.net>
References: <20251217193244.3770538-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765999965;
 bh=9wew37I3EqvH6X/VugF2vjkSHEjEvu/A4D1JX1JXE1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=R4lapzG2lT5d3dLAiOY5bUO5Hniun4pcDXatRic1bQ0Q6T8Ip3hXvuTNqCw/bwUrS
 Xv7+C90kxf80EpbHoLs2UkNt/lO1kNuRBGJU5FyA0UcdRSqmxgDbIFw7EjrKmFkr2w
 9IgcavXOqW1wgiTtCZBGni+K/Sf6u9DCfM+Wdhhkimq/cNQ9YW6why+2UFSQSCiteK
 srf01tv9rI7YMRtBZOp1aWOLbjQbMrqh5uoXuSgq8ob8UeZcpfUXHfN8coXujKzggi
 Z1h+qwOeOxdDsFvhNqCZTwlFHj6WfNZfkK2Oqvrzh5pW/vqTTDj0mpoavCjUAK3K2r
 sbsB4uDxAoSbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=R4lapzG2
Subject: [Buildroot] [PATCH 2/2] package/swig: bump version to 4.4.1
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
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://sourceforge.net/p/swig/news/

Needed for python 3.14.

Added upstream sha1 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/swig/swig.hash | 4 +++-
 package/swig/swig.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 21590c422a..af13a78664 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,7 @@
+# From https://sourceforge.net/projects/swig/files/swig/swig-4.4.1
+sha1  da62a4e797d09bc1a1febb0618c98249d69d3557  swig-4.4.1.tar.gz
 # Locally computed:
-sha256  2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b  swig-4.1.1.tar.gz
+sha256  40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306a0a554c6281fcf  swig-4.4.1.tar.gz
 sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
 sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index ad585c3f97..9d696e6f60 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 4.1
+SWIG_VERSION_MAJOR = 4.4
 SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison host-pcre2
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
