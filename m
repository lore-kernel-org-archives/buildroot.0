Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B390EC4706C
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 21:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC02846E5;
	Tue,  9 Jan 2024 21:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC02846E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iVpRXwIK7vK; Tue,  9 Jan 2024 21:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96BCF8464F;
	Tue,  9 Jan 2024 21:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96BCF8464F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F25081BF31D
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 21:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4BB742D38
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 21:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4BB742D38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnD2V84cJz3O for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 21:49:58 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAD7942D34
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 21:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD7942D34
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33677fb38a3so3534219f8f.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 13:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704836995; x=1705441795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PDnrJDbY+xJ3pT664Pk88rdjuPfJnibLDVIFnxdN0vM=;
 b=e5x48bWlAVv+U2KZRi9n/3+C+37uUrz0o3KD5bMrGPgZoE/evbGDpnvVeJ5mfKs57T
 gz2WPy5FUST96kI2zPlOEllZ53dS7E1bbV0xgZiTX1MuYHJF2v/iYkUCv8epxUosG2A1
 +LmL3Q10dv3rQKMPD+xysSDLSzrCIcQHpGn26tiY8AbbJuxt/0xK2ozLsqDJGo6fyfbN
 g9w6QzE1MVDAgCABI/XcCjaoRc8SZ0BIOm//yhwSqTfU2oaDTpOfM6VqpraPcxUxz9z1
 DvO1qH+c9atAu1kNZ9r1PF/ZtiPDgHQcxCbLIeRzdSrmCbWyRwcbCZ9SbS8Q0JSiSPhm
 wHRA==
X-Gm-Message-State: AOJu0YwpAmqGZqN3cR6xpPz1/hMnPLSRtCT52P9qIsClrME5RzglQWgb
 KurT/x0CFotY3jWLiFKnubgKgGq4ufg=
X-Google-Smtp-Source: AGHT+IHmAkG6S5r2MA3g7jOnIF7+nnwZZjz3B1DDC/cl86Wz1mgyFVNEqSpGuze93S0kMUCxHLKlAA==
X-Received: by 2002:adf:ef46:0:b0:336:ef13:301c with SMTP id
 c6-20020adfef46000000b00336ef13301cmr860311wrp.111.1704836995200; 
 Tue, 09 Jan 2024 13:49:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b0033762d4ad5asm3302778wrn.81.2024.01.09.13.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 13:49:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 22:49:53 +0100
Message-ID: <20240109214953.724112-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704836995; x=1705441795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PDnrJDbY+xJ3pT664Pk88rdjuPfJnibLDVIFnxdN0vM=;
 b=OgCOIchVbyt7RgHlOZkqIpBep+GSpIBc6E3ige9qotwhZYLSe3GzeVfarPXFPaWGOD
 ecwuJBFW22TJb9kZkFsTLBvxpr3Rn5ZgNeb5rDbr08bxlX0JJ5q1HZJgYRilIvrmEcEd
 VLJqOSRCFqctasRuGnsTf+wcfcumnNxunRWgV02xvIT0px9fukI8JLEQml9wYuBXqbLH
 rxYpeq3CossCGVtX2yEhBLFQewqYRtKTvbHkHg0KHXSUnptOi+Q6tHnP1X9fNDlFJoQN
 hQwr20yChlkNwN/ZP1IuA3tnuOyVnODlxdmu8/gg2/BdUpYltp0TgCSGS8JDPgSThSaM
 9zYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OgCOIchV
Subject: [Buildroot] [PATCH 1/1] package/sdl2_mixer: force arm mode instead
 of Thumb mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

/tmp/ccdnBdx6.s:2079: Error: selected processor does not support `clz r2,r3' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/039b71d2341a3742360ec6ce29f15fbd287b74d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_mixer/sdl2_mixer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
index 074e282205..f68e0cf1ee 100644
--- a/package/sdl2_mixer/sdl2_mixer.mk
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -14,6 +14,13 @@ SDL2_MIXER_DEPENDENCIES = sdl2 host-pkgconf
 
 SDL2_MIXER_CONF_OPTS = --disable-music-mp3
 
+# sdl2_mixer has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `clz r2,r3' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SDL2_MIXER_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 ifeq ($(BR2_PACKAGE_FLAC),y)
 SDL2_MIXER_CONF_OPTS += --enable-music-flac
 SDL2_MIXER_DEPENDENCIES += flac
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
