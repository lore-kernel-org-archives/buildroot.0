Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88A4C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 10:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B317740E19;
	Thu, 15 Aug 2024 10:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RKoNtc6viSa; Thu, 15 Aug 2024 10:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8909040350
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8909040350;
	Thu, 15 Aug 2024 10:45:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 844A01BF30C
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 10:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 723F960655
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 10:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3iqMBgcnxJ5 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 10:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C224605C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C224605C2
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C224605C2
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 10:45:48 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D41A93535C0D; Thu, 15 Aug 2024 12:45:45 +0200 (CEST)
Date: Thu, 15 Aug 2024 12:45:45 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zr3cWSzM+spo0TNf@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723718745; bh=czO8Rw94h57cbAlAWjpXnc75Yvd+e9X/fcWOrB2v8m0=;
 h=Date:From:To:Subject:From;
 b=a2XlpkiFWLNd5ekRb5lkyvnRsI29brW0Ze7CrIIZv+7GuSNJRMSuLgEvzHjDv8O/+
 KBY9Mg/RKBHvPva4YllXzh8E5rPPC/98W7mP35yPURKtUdYUaTVEnUqAVrIbHV1vA1
 0Foc8fu9+KLOWhLvkF2e1Nl9JaBnvBW/ACehOFRI+ZK7bhW+nAt5LKxRwERt6XOh1M
 Vikr/DgJlMT4sP3QxmgNHhlPnZ9b66O7ncBp3igF3EizdR/s71rE933eiU1Nu65yQ2
 gDs9meovXPx+Ngq2Y8XGvh/xO1uKKKyCGwCfV9DytYdJy49M2hxukl/6PljIe6Q466
 g+liyjLGlXjcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=a2XlpkiF
Subject: [Buildroot] [PATCH] package/ffmpeg: fix microblaze compile issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the update of ffmpeg to 6.1.1 in commit
fa36a6375dbeae131c596070570cec66c7bd2456 there are
a lot of microblaze build failures.

The compilation failure is triggered by GCC Bug 68485.

Fixes:
 - http://autobuild.buildroot.net/results/524/524cef193aec30471e55eb0eecfa39f0d6011a91

And many more.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 19c270a14b..a010c0168c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -557,6 +557,11 @@ FFMPEG_CONF_OPTS += --disable-optimizations
 FFMPEG_CFLAGS += -O0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+FFMPEG_CONF_OPTS += --disable-optimizations
+FFMPEG_CFLAGS += -O0
+endif
+
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 FFMPEG_CFLAGS += -marm
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
