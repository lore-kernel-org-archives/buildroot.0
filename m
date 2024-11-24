Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49224E668BC
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 17:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E37842DD7;
	Sun, 24 Nov 2024 17:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHUvranfH0fT; Sun, 24 Nov 2024 17:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E9542DC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E9542DC1;
	Sun, 24 Nov 2024 17:43:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F4A44961
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 17:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 562AC405F7
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 17:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnpOmVHikjGF for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 17:43:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19C2C40329
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19C2C40329
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19C2C40329
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 17:43:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8E34DB0059A;
 Sun, 24 Nov 2024 18:43:40 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 24 Nov 2024 18:43:35 +0100
Message-ID: <20241124174335.1715104-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732470221;
 bh=dcKcBc2axaMtjMspYP665RXCdfmR35mXN6ur3XbUP2A=;
 h=From:To:Cc:Subject:Date:From;
 b=NRCGX5Yw24vcjHyYm1NnOP4iJGZ2M8HHEJPkNuS5D8OKy7u09tTZfx9D4al9CoZSV
 AqfCxnWh27iP9GHRx/IW7f7V6SvbCoTmO/OuXJiskAewfvU1Xqfpb7CukkjBlMJy3W
 aKXGBCs9H19iMkVqdENjeSd7nGoZttHwTEb2TA6/oe4rqGEzOOf/j29gAdPtOu33kg
 P6q5YQmyJF/1ye9qam2LmRbmU1KcGEXafaNjH6+meOcnRx/IdlhbS7+8UxY9pdnjbc
 3h+ZIFXiUWhcGI+JSlRouIpbAXJ5BiU5uMKSyzf9vuVA5XfjhiWDSD5v3GMPTd68Po
 fUAMVjHXIUpaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NRCGX5Yw
Subject: [Buildroot] [PATCH 1/1] package/doxygen: fix _SITE download URL
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

Doxygen source archive download fails with a HTTP 404 Not Found
error.

The doxygen download page [1] mention that older versions can be
downloaded on SourceForge at [2].

This commit fixes the issue by changing _SITE to this new URL.

Fixes:
https://autobuild.buildroot.org/results/253450bf374ce858fe12712059c435fc773d52f8

[1] https://www.doxygen.nl/download.html
[2] https://sourceforge.net/projects/doxygen/files/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/doxygen/doxygen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index b24c527a20..b3bcb34097 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -6,7 +6,7 @@
 
 DOXYGEN_VERSION = 1.8.18
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
-DOXYGEN_SITE = http://doxygen.nl/files
+DOXYGEN_SITE = https://sourceforge.net/projects/doxygen/files/rel-$(DOXYGEN_VERSION)
 DOXYGEN_LICENSE = GPL-2.0
 DOXYGEN_LICENSE_FILES = LICENSE
 DOXYGEN_CPE_ID_VENDOR = doxygen
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
