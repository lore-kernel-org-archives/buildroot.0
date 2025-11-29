Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B4ED116F3
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 07:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF78240B7C;
	Sat, 29 Nov 2025 07:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFQD_sXd4Qty; Sat, 29 Nov 2025 07:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C6D240A30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C6D240A30;
	Sat, 29 Nov 2025 07:56:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DFFC1A9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8436C40232
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKC2HTAIhycf for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 07:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4456C40215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4456C40215
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4456C40215
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 07:56:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33F09A4C76D9
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 08:56:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45108)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPFoQ-000000001hR-3gvE
 for buildroot@buildroot.org; Sat, 29 Nov 2025 07:56:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 08:56:10 +0100
Message-ID: <20251129075610.1319512-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764402971;
 bh=kBXn9JQ5737IkOhvYL8LLmIobQWnewwh1rT2cLHga2c=;
 h=From:To:Subject:Date:From;
 b=xg5Zm/GMjiBOM8zFHcHSLhf0VuC6cMPXl8/U0zXnUhNEZyDqYOaQDxRd0Wn41bI6F
 goh4Xuf4VjcoGHY3mwE5ZwRsRRj1P63jHgWmSWgfTb+/LZbPtuK+bitzd8JRIcV+US
 CXOtfS8NxbPFmwKchjR/4PRK3AkCLz3RoBdfSPTj1Y1FuIXgFTh98z8tEW4GR5DpVu
 ujFFYGyDQYu2UoLSgzVOHn1sCoPj5Iw9+BSj5pVXdKXFC838b9ZkXL+ElJ9tOzg0HR
 TxMbWPPHrq9Bgw1yx4h24zXu9AhqY9VLUhNazBPcZb1cIDNHJ9iK0NkTy8/ecaLHmK
 T/7C9AGy1nX+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=xg5Zm/GM
Subject: [Buildroot] [PATCH 1/1] package/nushell: bump version to 0.108.0
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

Release notes: https://www.nushell.sh/blog/

Updated license hash due to copyright year bump:
https://github.com/nushell/nushell/commit/192ee59c754ec5c9b66e28cca94a75d643501be7

Fixes:
https://autobuild.buildroot.net/results/d27/d27004dd62cd0c87fbfbe0eca8057b17d84c799d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nushell/nushell.hash | 4 ++--
 package/nushell/nushell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 074bb694a6..45047a82ed 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  3f4f31e1c4832c34dc4c6058a78e9a893595e165334bb9be6a241618ce2861ad  nushell-0.96.1-cargo4.tar.gz
-sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
+sha256  59b3af5d873d0ce21ddd10358bc4d54753c01c7245caae7a3d8a72782d3f626e  nushell-0.108.0-cargo4.tar.gz
+sha256  ff5dcaaba6140ec57cafdd4f707cd0d329e727477cf7d5b9ba7a244ec2678b79  LICENSE
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index a05eaa9829..c982a1ab14 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUSHELL_VERSION = 0.96.1
+NUSHELL_VERSION = 0.108.0
 NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
 NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
