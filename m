Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08917FF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 07:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADBD1616A9;
	Sun, 26 Apr 2026 07:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qa3vNlKPCy6K; Sun, 26 Apr 2026 07:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C08E7616AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777187952;
	bh=syWmvcl73k51/ww4YGLANdcs9Zh/jwLTvEyEjV3Kj7M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gP4TEHRXqw81IW5uvWwxLajqbQICOPiPknPq9F6AnMWxXLr3YWpQ7dKaUzaFTuwR+
	 HognroDa3FU7GqDwu2zjyl+bBMhqNws//E+STgQT9vg79emsvHk7f1qSzj2iAjSzsF
	 0iStZwxQ1CX8rkTcKnebaarXlezUjHv8zEvIjs+AXdALIjws2FymCBwaa3GqUBIkI4
	 54b7XNoXGJemWEogLZ5XJO76OgE0YFQRrU828YBjKut2NCX7IPL7+8T0zrb42bSEZ3
	 TrOytW10zh8tqACAEjWbpB+Q4HbrZ2QeH7rjpfAjNBETmvu2IgiVFZFqQScFYWLkdi
	 Zr3o3siZHFirA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08E7616AC;
	Sun, 26 Apr 2026 07:19:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9D872DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEDD0616AC
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yt8uCewgx5v9 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 07:19:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9793C616A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9793C616A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9793C616A9
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79B3FA4C0CF4;
 Sun, 26 Apr 2026 09:19:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGtlj-0000000046C-3Ee6;
 Sun, 26 Apr 2026 07:19:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 26 Apr 2026 09:19:08 +0200
Message-ID: <20260426071908.372315-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777187948;
 bh=tdy0bS05jbysYzbBMVN3m3cV8yTXH2bhZQdKRFz+1U8=;
 h=From:To:Cc:Subject:Date:From;
 b=WcQEtTOXLMJfXvaTigjkVgZkgG1TfWzOyQW/CsPPDkCxRNNkAe01P0Tqo/h7d/K+J
 knjRFrb4801iiA7RAMwI+jJvCtjqcUnyfY4KjoraWTCq7XHqkowmiPbJ8ifauQ5Szc
 KR+9yOlw9aydZrTUH8ux1AWWRToYcMfG6TrJS2Ou8+gJwTgzTc0LOwOyuLlEikkfEJ
 O7Hbf+hu8GmNkjfMTnAOFyr9rZdfIEHqncQ3BGqlr7id3sGJawA1UG3+qHwgvqjGip
 RKyRn0BWPg5T1/sdDHv1tDbpwi0g1eORniwRzmBj9JT4aCcSMnT4g21veYBNM9uVf4
 MmFdww4zooRAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WcQEtTOX
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.4
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

https://ccache.dev/releasenotes.html#_ccache_4_13_4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index e69897473d..f4c81bbe4c 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.3
-sha256  1aefc18ba43c237723d224eeecfe47fd0fc7d3c93ccdda31a619b8eb90c3e470  ccache-4.13.3.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.4
+sha256  4a7ef278b39d031b9ec524c0778d24bdb3e761940ed368060b54594f15559537  ccache-4.13.4.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index e4156feb55..744d962abc 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.3
+CCACHE_VERSION = 4.13.4
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
