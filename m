Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF52C47258
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 20:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01644400A6;
	Tue, 16 Jan 2024 20:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01644400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euuGjgHdiV13; Tue, 16 Jan 2024 20:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03933400C8;
	Tue, 16 Jan 2024 20:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03933400C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235F71BF846
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 20:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F071C80E7F
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 20:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F071C80E7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMKPWPOBBBME for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 20:02:48 +0000 (UTC)
X-Greylist: delayed 2498 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 16 Jan 2024 20:02:47 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39AA80E47
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B39AA80E47
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 20:02:47 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rPozf-0076wp-U3; Tue, 16 Jan 2024 20:21:04 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id bb34d478;
 Tue, 16 Jan 2024 19:21:02 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 21:21:01 +0200
Message-ID: <20240116192102.4148440-1-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KK59KHYQnJUEkzmaVpue6CHjzD8XOt35c5R/e+RfXCw=; b=PPyMpv+Q4CJ8ZL8Q9g61qAuUWm
 X9El6U3cp4FOZrkDrZaAbAh2JuRwM+/7YPi90La7ecYkvqyIGnGbcS5bljaICDt9vPzZ3Hd0a05KX
 iJi6q3OKOTZ410srlufZoqClGT15BB019wXpaDLWu8zWStl9DVKnPVY3wYfb2IOzUuSjOR3TU1wTB
 lscittN1ulLU3zLgDpvTwq8Paz/7EBChD0T4cpND33IsEpv0+Whv1rpt5G9c5BndBMKgTKA9Zmrrr
 PWsFnE5Y0kovrrIpp1yboRgTdzJDGWmj8Is/Js5ZQu4JxR15co71uhTBfgVCux1v6I+v+LZcE9JvE
 7rshl2oQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=PPyMpv+Q
Subject: [Buildroot] [PATCH] package/cog: bump to version 0.18.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a small bugfix release, with a fix for a crash in the DRM/KMS
module that affects i.MX6 boards and probably others. Release notes:

  https://wpewebkit.org/release/cog-0.18.2.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 177113bb42..387666969a 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.1.tar.xz.sums
-md5  204ae9353ed828e4ac39b1dd4c5c35dd  cog-0.18.1.tar.xz
-sha1  f0f0ebcd279170f427be0ad57fd356faff1a2732  cog-0.18.1.tar.xz
-sha256  72e3a84052b459e2d53d0e8b947f20e27bf5d8049766c4c1594eb9c6b6cf7ab3  cog-0.18.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.2.tar.xz.sums
+md5  7fbfc2e19304132be0d73f5e5512151c  cog-0.18.2.tar.xz
+sha1  045294f7fa878db86e4b8a617ee4ac056a71cb75  cog-0.18.2.tar.xz
+sha256  3c4237cff6323b8c3eaf52c6f3f6415b898a22c0127c6c396c1eaa6eef46c279  cog-0.18.2.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index bd34f124c5..e96909f779 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.1
+COG_VERSION = 0.18.2
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
