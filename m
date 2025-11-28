Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEAFD116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 18:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0999240797;
	Fri, 28 Nov 2025 18:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw74QigjrddI; Fri, 28 Nov 2025 18:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93175406D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93175406D7;
	Fri, 28 Nov 2025 18:31:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33E4A708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 262A3406A3
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvIXyUq1EYAd for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 18:31:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04E8A40686
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E8A40686
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04E8A40686
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 18:31:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DFD8A4C7795;
 Fri, 28 Nov 2025 19:31:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58620)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vP3FX-0000000033n-2sbB;
 Fri, 28 Nov 2025 18:31:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:31:19 +0100
Message-ID: <20251128183119.3254445-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251128183119.3254445-1-bernd@kuhls.net>
References: <20251128183119.3254445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764354680;
 bh=uixzkUhJBpXv1+hUMpaohJQF5eq2TYOePqsAErMwyag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pebKy3nBOlCRyET+vmPAcRY0hiW4SP9xqZnmzwPt67JHabSnvws1QizjGJ+T/XKw4
 RtkUe6IIssg5AtR2ykmUFjOBkriwOC9w6cmAekiYSNtZ2Q4xXXkbdWaHfWQDsnwI74
 WflRnQdPyQlr9dCX3MT6YA5hXXLrMRYCgGtZ5tah276lmsjzxemTJAUwnxmQQhMa4u
 01EGbsyMifAwJvCthE2CuAgu47NFZwrEe1lUXy44vldYa/N/ZHrkrzyJsrHD26HOyT
 rtuVZJ3gR85cJimUSuuKgSdpoO20yHeQE+2Z55+J1PWJbEvimr/iFlii3u1GlzA39i
 V0Yx5hCH48xLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=pebKy3nB
Subject: [Buildroot] [PATCH/next v2 2/2] package/icu: bump version to 78.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/unicode-org/icu/releases/tag/release-78.1

Updated license hash due to upstream commit:
https://github.com/unicode-org/icu/commit/4b444321f255076d6576e6d435ffe2589bde6f18

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/icu/icu.hash | 4 ++--
 package/icu/icu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index bf9451db8e..4f60681c54 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  588e431f77327c39031ffbb8843c0e3bc122c211374485fa87dc5f3faff24061  icu4c-77_1-src.tgz
-sha256  451167c55c0fa447cc2d5632714f5e3c567fe4f1e1badefab2c1333852198aca  LICENSE
+sha256  6217f58ca39b23127605cfc6c7e0d3475fe4b0d63157011383d716cb41617886  icu4c-78.1-sources.tgz
+sha256  e55522d81edc687a341a4411e0776e54ca654e90147f354a90458aaced4116af  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 4789edf0e2..a0b4388355 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,8 +7,8 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 77-1
-ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
+ICU_VERSION = 78.1
+ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
 ICU_LICENSE = ICU License
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
