Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83BAC8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B00361653;
	Fri,  4 Jul 2025 16:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_Rsg0ry7fev; Fri,  4 Jul 2025 16:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 895586164F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 895586164F;
	Fri,  4 Jul 2025 16:58:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1E8A12E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8B4F8113D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cccm70RgcBax for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92A03810E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A03810E3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92A03810E3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:58:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2C72A4C22FA
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:57:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46278)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjja-000000006Za-3F3r
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:57:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:57:58 +0200
Message-Id: <20250704165758.3784635-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751648278;
 bh=31TrEGohGeqKMOEFzGM76S89m80JASWyV3fh37K6KN4=;
 h=From:To:Subject:Date:From;
 b=I2dR4rjyCnsQ0vexdQps5ah0EtQfJRTBzin9GMOnmkmhTE/5aZx86A8eNn15f7vNh
 yhOXIldtoR/Ct4270u1rT9W0sk8GPzrARPIqv4vYkW7/sr8bC3Go5OwITjLGQ/gvUD
 TEBSlIpxEFqen1QlE7u9AU1g7GoL5essWchplIwmud911tPtyRcbBgTyqE0S+J34Rg
 FG82KckWReBr4V0+91NXh45tUrjjuOEOyvF9qaYF2Sw1bwhZM8xg0nfMKfsq6EReoz
 EjpvQybHlakz22+L32r069okYo7UJ7TjfbSG/ModpMkzRTZxyevXZVkdIPSX4g52d5
 Qxv4N4Np28qCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=I2dR4rjy
Subject: [Buildroot] [PATCH 1/1] package/opus: bump version to 1.5.2
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
https://opus-codec.org/release/stable/2024/03/04/libopus-1_5.html
https://opus-codec.org/release/stable/2024/03/04/libopus-1_5_1.html
https://opus-codec.org/release/stable/2024/04/12/libopus-1_5_2.html

Updated license hash due to copyright year bump:
https://gitlab.xiph.org/xiph/opus/-/commit/254b5ee7b2e7c89aaddbf7a994fea0563842873f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/opus/opus.hash | 4 ++--
 package/opus/opus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 7569ee08d1..ef0226281d 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  c9b32b4253be5ae63d1ff16eea06b94b5f0f2951b7a02aceef58e3a3ce49c51f  opus-1.4.tar.gz
+sha256  65c1d2f78b9f2fb20082c38cbe47c951ad5839345876e46941612ee87f9a7ce1  opus-1.5.2.tar.gz
 
 # Hash for license file
-sha256  8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
+sha256  01e1167d54a096d123cf6dfbbeb19587278845c6481d2d66d545669846079551  COPYING
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index cbc07a091b..1d3133bb58 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.4
+OPUS_VERSION = 1.5.2
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
