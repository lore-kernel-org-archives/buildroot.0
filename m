Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B69EC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 21:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6595D60680;
	Sat, 18 Jan 2025 21:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ue1ha25FN8E; Sat, 18 Jan 2025 21:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FFF607F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77FFF607F5;
	Sat, 18 Jan 2025 21:10:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 023262F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E04984043C
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dOCJ1W4kOeG for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 21:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADC0340352
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADC0340352
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADC0340352
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:10:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c706.dip0.t-ipconnect.de [79.214.199.6])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECF62A4C462C;
 Sat, 18 Jan 2025 22:10:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46804)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tZG5V-000000000Rw-0fF9;
 Sat, 18 Jan 2025 21:10:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sat, 18 Jan 2025 22:10:37 +0100
Message-Id: <20250118211037.3251797-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250118211037.3251797-1-bernd@kuhls.net>
References: <20250118211037.3251797-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737234637;
 bh=oM4XT9hVZyz8p0ZvzVlvtafMChaaGJF8NHjmj5vywQs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ixte5Pc2Kl3qGHkM30ey7IYu0hHJ6esBpoeeG/cZLkkXpv1UFEyoRcRtq9DOX6tH9
 UtM36N6uNIi7Bc52sWa7NHzxUmle+GB1ygpdYEUyl/H3/DntVgC1cQW3iFApzZ0hui
 xxn92DVR1Y31RdBBg3LUp6jojHnPNwzjkee9xqyFXDuagCMbFeV9u5fcT8qC99srqW
 uRaFmTQcmyTyBfh80xirADBzN8heKIH4L+NYTIfpxUrn9hGpYEbNjdUCT/KGh6uUJD
 e0LpyeG4ru3/6ypEVDW3qtnkeo7JyvyaL6KKOsmNJ0K4OONXzP2M8EyzeyhiHSqerW
 zU0BVkx0UOaLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Ixte5Pc2
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: add optional dependency to
 libfribidi
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index dd98756c2a..1b6b9e7693 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -407,6 +407,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libharfbuzz
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+FFMPEG_CONF_OPTS += --enable-libfribidi
+FFMPEG_DEPENDENCIES += libfribidi
+else
+FFMPEG_CONF_OPTS += --disable-libfribidi
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
