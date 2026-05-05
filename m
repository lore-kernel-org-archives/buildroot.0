Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CE2FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033C081C19;
	Tue,  5 May 2026 19:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMPUc91FtPbU; Tue,  5 May 2026 19:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 721CF818C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778011123;
	bh=/jI9h2ialg00lwpKlVz9tZQxuqG/aSucVd18oeWI6r0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QA2nZ7EbAs5vjapXhat9FVnNVZy7HCis0xFSALFiUJ3vU9hXUxThdq0iwxdMiMBAP
	 bAAyxUvAi3Ou09fbjNHVnED625HZebMn/YNjPjdGDDsOvSsXOIylh2uB0TdomPkU4q
	 XrN6Nx2MFsav4Iy4YKGktO5T3u1A7HZHkSYanus9eQ2IcG8QA4FGt6SWFiE6iJbtQG
	 0TzVfGVO1gCC8mbGGmileHVHaNxliG2zrLfuD1bgA7e0LNUZmBQZzK6HbuBvwnaT2+
	 dDlA/yHtu8Dx4eotxebQtW45v4FAYnM0YsU4j/f1VCsrw7z1+WLOA8TFZslQT2W6Ou
	 DvU/uRCmjERgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 721CF818C9;
	Tue,  5 May 2026 19:58:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7BAA2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D936440400
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hm_jdBH0M_gN for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E700403F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E700403F1
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E700403F1
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:58:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id KLucwWzss0dL0KLucwAo6x; Tue, 05 May 2026 21:58:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  5 May 2026 21:58:34 +0200
Message-ID: <20260505195834.1390763-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIolEMjWTqrH5e/KNYj72qP1uy4QijKACLWYmYtmE8dP99G1lo6PFOwSZo21s70Nzs8OsufQS88iXafQDu8+IhwvcGUc678C5LyirI1xJeRt+AWB8e1F
 J2jZznQR/cxJgrpKfr52JK7nWqhRH7X9E11JftJ+u6JfKgpWYg6iWoahJ7xcT+y48V7YxMZ+PxOWRHN6XzPRZjG185Xfq4LCB+P8M56jvA3w0uUHMusa72AE
 UL3H0BQ98d2v8P8J0AkUIfNaJ9oNeGx6CEUW57H7HsbpUkTKPM5AI5/Uae6u+GGHBwKmbrvCqSMNuRbNfrh/8emM5BVejNrPADuqb0jJEfhlN2Z3MlxZwU+q
 lQPPYDpF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1778011115; bh=F0bWuGkYDG5V446gL+2hZT9gjdgHQ/XZxxTAPrD/eQA=;
 h=From:To:Subject:Date:MIME-Version;
 b=DSgK3DjdQeE2mBE4z50Q6kSwM0MzbINDHEWb5QwlxQ0Ks7RhKCdrQwOczvSIVDIqh
 rNnP3Za/RNbb06hIQCTVvJo9RkLwDXj+8gKQDD+nEKuOtzKcChyV3ayg5W9zSXPbz8
 aKsyHdCGgVfUlveGUjlEAI2faU550JKX2jCPQnniQV9dY+4Aq+Or0UxWV+eocprNUp
 +KeZH7Avswj1DJHLn8cn+yj7Yh75J9LoBW57S2NQpNKynoTzv0bDkYSTdZn1laIHTP
 Tc3NgDQ1/g9lkRhXzCw/5r9h66AwC3qbaCKEcfucjSneam1yhUmaZXpO0SPMzecAAA
 OBhn9llxcTA8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DSgK3Djd
Subject: [Buildroot] [PATCH] package/ffmpeg: bump version to 6.1.5
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

https://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=cae4a8c6ded2d2cddbfc4bb247564ebf3f997479;hb=a44ab44236a99ae26594fb3e14fe0c956210673d

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/ffmpeg/ffmpeg.hash | 4 ++--
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 1ffef61309..4c489f168c 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18  ffmpeg-6.1.4.tar.xz
+sha256  05fbe9db1f5452a3605bb1d9bf91da9d4bb08162891692e4f172b58c49109412  ffmpeg-6.1.5.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
-sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
+sha256  246041b6ecf9bc32d718a62c57877c78b5eb397b6467e74ed7ae2626ab189c30  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1efcbf87aa..1289cd5e72 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 6.1.4
+FFMPEG_VERSION = 6.1.5
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
