Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B59C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 21:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D43F605C3;
	Sat, 18 Jan 2025 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aseNi-sXG5fF; Sat, 18 Jan 2025 21:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 423526062F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 423526062F;
	Sat, 18 Jan 2025 21:10:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDAC02F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E7D86062F
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2CNXXOrkoiC for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 21:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41974605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41974605C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41974605C3
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:10:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c706.dip0.t-ipconnect.de [79.214.199.6])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A89EDA4C452B;
 Sat, 18 Jan 2025 22:10:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46804)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tZG5V-000000000Rw-0IZP;
 Sat, 18 Jan 2025 21:10:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sat, 18 Jan 2025 22:10:36 +0100
Message-Id: <20250118211037.3251797-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737234637;
 bh=2b2OJlrAdnLPfR6JTFqAudw3+N1LOjiPaVIhPWZZin4=;
 h=From:To:Cc:Subject:Date:From;
 b=bTnmQ21UoHFLszjfzupLxcpkRFUWspjl4Ty6V6iJjQHpgXRUttDBibjeC66c4D0+/
 5xc7qGdnm5DMStnq1WgnNbvwUbHuqCPM6jGW3HwOafK1hESYy0T7KJDW0fo3g8sM8/
 41QM4GQhkgLivn3PdA0gevh8JcWukSm7GS1dWG3hcTOEw4Ao+HEBUwLZ799dOi40bD
 LxEAmtVD0cyILBMu9MCajVaODGDooj7iI3jADUHo+2A1X0PQoCYq7gnqtUjQeP0Jsy
 e1uYnLPSgSvqmzknIZkJisW6DO6bdBhM/4vpET0fnmionk+hM1eTNwWMIFJ1RVBTNu
 FROeXwsPcVG7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=bTnmQ21U
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: add optional dependency to
 harfbuzz
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

Fixes https://bugs.busybox.net/show_bug.cgi?id=16279

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1e18b5e2da..dd98756c2a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -400,6 +400,13 @@ else
 FFMPEG_CONF_OPTS += --disable-fontconfig
 endif
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+FFMPEG_CONF_OPTS += --enable-libharfbuzz
+FFMPEG_DEPENDENCIES += harfbuzz
+else
+FFMPEG_CONF_OPTS += --disable-libharfbuzz
+endif
+
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 FFMPEG_CONF_OPTS += --enable-libopenjpeg
 FFMPEG_DEPENDENCIES += openjpeg
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
