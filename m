Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3015410AB822
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD7DE80B1B;
	Thu, 26 Mar 2026 21:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsw44s_TTefZ; Thu, 26 Mar 2026 21:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D8C80B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559707;
	bh=jPSPewZhub6RbT/LQ5K9YAfRnq3ZBUQo4J4e5BpHZQM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZhDqpCRY48xgO3MDEYZXE2kGKAVsnIFOdJN2HY2DJaaiQvZZjpweMl+6CnGfRs7dO
	 9pynzdyOkRhrww91FDnXb6AkSkgStWRdfFbIt8vo3+V5O0Tn0uLsw91GNnuMr75l6q
	 HluvGNLKytUaiQKzOHQa92XJ7uhtC5Kyf1MARBuwBrcsmWd4qbMjrqk4hQ9wJ1O1Y3
	 Nn4ZJRR0xXb6YR7btDEkz4kM5duY3FwsYJTe9/3deqZbOj57r110zv/ZF8EtxFng3v
	 wbOpqRzlLHIpAFWpqOkb9opgj4nAxh47Krq6P8tJ6yXPz2b5u1A2+sXiE7l4Zk9FVN
	 P2FM2XjowvZtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09D8C80B2C;
	Thu, 26 Mar 2026 21:15:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C51CE249
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6DA6401E7
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w07XuWARvuO4 for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:15:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DFDE4018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DFDE4018F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DFDE4018F
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:15:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B756A4C0DCF
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 22:15:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49090)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s2f-000000006wH-3tED
 for buildroot@buildroot.org; Thu, 26 Mar 2026 21:15:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 22:15:01 +0100
Message-ID: <20260326211501.3598657-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559702;
 bh=MMXzT4Qmh4fcnxFFvY14tSxDJX+4kcYG+MuivKAFS+E=;
 h=From:To:Subject:Date:From;
 b=Jkx2mLGTFH1FrJcxqmQtibxykXHDHQXxs7wAXZFHCNbeWzMN4ZYzZSasJr02ZBHXa
 2a9Vp/1pWLUbpX/nuDppy2jeYJzLEkBWRjj4l83xTSmwmZcLZ0jLiagQZv3C9Jaik2
 4oGVleajb5QnXY6AzlXAVldf0owL7rIOE8j8tOBBshPdlWBFtXeO2mi7plQ/TZxzz+
 uKNlvhpOxDaKEYY3NR+THGjocZ5gbpCzbgmiqyeMh5Ua5VP/N/R/RGnJ7A2HCj2lEm
 5wQQytyM6hvUcyQHzB+uYIe+QpSwX+KgwyrUoZUFO22XjRplO6MwRD/QgAArUbdWYd
 8zsrQ6eS9Mwmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Jkx2mLGT
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.2
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

https://ccache.dev/releasenotes.html#_ccache_4_13_2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index d408836c4e..a0c53a8a11 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.1
-sha256  85638df95c4d3907d9dd686583f2e0b2bd4c232d36e025a5c48e91524b491c4b  ccache-4.13.1.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.2
+sha256  4a0d835f1b3fd7e2ac58a511718bbc902532941f377f7990a3d33b5cf8733ba6  ccache-4.13.2.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 1f12123164..8f9d0005fa 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.1
+CCACHE_VERSION = 4.13.2
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
