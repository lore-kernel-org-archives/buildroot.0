Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239DFC0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 20:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1A7E41433;
	Tue, 11 Feb 2025 20:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv3xlfsQ1j8d; Tue, 11 Feb 2025 20:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1889414EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1889414EF;
	Tue, 11 Feb 2025 20:35:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DDF76C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 20:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CA09414E4
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 20:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nc2zdfwlDIdr for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 20:35:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDB1941430
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB1941430
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB1941430
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 20:35:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb7.dip0.t-ipconnect.de [91.58.12.183])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACE4BA4C49A5;
 Tue, 11 Feb 2025 21:35:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50958)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1thwyk-000000005QR-1Enl;
 Tue, 11 Feb 2025 20:35:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Tue, 11 Feb 2025 21:35:34 +0100
Message-Id: <20250211203534.2053975-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739306134;
 bh=YNToxRojUiJcQa3EVq6jD+jvqt1By6IGYzHM9j+F1EM=;
 h=From:To:Cc:Subject:Date:From;
 b=BzS4CapeY64Kv7s4K9peErp4g+zoj5wxQCkoghMdTQrBX8798EJEiKzxy1rblwSjl
 7/cc1LdSKqK1gNQ/B3KMN/a9Jn/izFYhhXr5PvUWHADvIADXYz1QFOeqn81SqAjy7e
 tPuMoDDDqE23ls32GQt8xUNwcZFa8g1hT8WTaUuEJJWmMj0+//n90j172RoY9wVTnU
 O5On/gmUDQoDL+HBhHwA1ePyu+5e37Mw+U17RLIDahn2QMvFVB0QTMagQ6N4Ygs4EC
 ytt1JbO0xJwff6UjHSM8UOmTliMItpmZ1Z2rJ6tOFX3XK9nU6VlX4+8HZwsrjP22+/
 bm92IrMv/Aqjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=BzS4Cape
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add optional support for
 libxml2
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

Support for libxml2 was added 2017 in ffmpeg version 3.4:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=96d70694aea64616c68db8be306c159c73fb3980

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1b6b9e7693..93870b0470 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -383,6 +383,13 @@ else
 FFMPEG_CONF_OPTS += --disable-iconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+FFMPEG_CONF_OPTS += --enable-libxml2
+FFMPEG_DEPENDENCIES += libxml2
+else
+FFMPEG_CONF_OPTS += --disable-libxml2
+endif
+
 # ffmpeg freetype support require fenv.h which is only
 # available/working on glibc.
 # The microblaze variant doesn't provide the needed exceptions
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
