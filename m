Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5B4CCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 07:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB484811F1;
	Sat,  8 Nov 2025 07:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXI9bk0e-wgj; Sat,  8 Nov 2025 07:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC99811F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDC99811F2;
	Sat,  8 Nov 2025 07:48:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D58CA25D
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 07:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7A3F811F2
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 07:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5ahxduJSloC for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 07:48:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A42C811F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A42C811F1
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A42C811F1
 for <buildroot@busybox.net>; Sat,  8 Nov 2025 07:48:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47773cd29a4so944665e9.2
 for <buildroot@busybox.net>; Fri, 07 Nov 2025 23:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762588084; x=1763192884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wh922rRPOqU3M0XTawcMRsO46bNbukQOxhJovFTKTpQ=;
 b=Lw0P0JAvhumT8/RCx0Lkwc4y0xvbQX/nt+aqZ0OIfWdIAJOIMRjmqCIZomyYyFjgmZ
 qXk4e9c6mbkmqrWUAPo3OvGevzORAy9DHM0J6IzB5NnAqmkQYi24kv2vsNCMnx0iP2L9
 xDME0nvKA+yInJYVdA7LBHLg1AE8YQfY1EOmxUHjFewMVPEpDSlGSJJqYtf/dgNByXU9
 LkAnlYlXLkueJZ8M7r2BvA+sodt3E4jD+k286XcpCOProU5okejro6OkG5Nsj8giK2dC
 G/18+XplNjUnkipTXsV11OifuEh9jGKIH45xUVdcadTgWT2RIdkO0KOcyhJXO7PnxqsH
 6wsg==
X-Gm-Message-State: AOJu0YyTWcVuThcasBLSUizeD8+fFsGWSvYRUxhIPESx6nOld8to3+eB
 B/61cdjC1k7LG0Ja+v+3ZlQ/AadhkD+iiR73sSkQbYBU2IaAHSzXoTGiWvyimukpFrOoShzWcOT
 iuJrokw==
X-Gm-Gg: ASbGnct52yaqLJy88WbGMC1atl/0T8OCrzqA+eK9I0JzEcc8OdUZKYgHRsFYEs6DCr+
 n7On5MqhAKrFQxcBdRFzHBWv53XhPyVxqPDx3j553yzt62k5EQ1FfP7J+QBeUzzP5YWgDA8KaO8
 h6WwNnNVWNZWH2gah2Oy/NXsXqZbjoP57ptXJlwoDOgFtVlZHYmSN2F0WtE9yLhFa9iJhBiSm3C
 GNUj5g+u+Bp74bIu1HoxO6+40tKf+p5l+tDRlH0wAIjuYAGWPx4vckHXEcicmoejCVtasSDYRPI
 s8zMnfiQPQegwKAzS3TRjq9fUai9e0lU/mDCFy7mFaaBfDtLat2yXUxHpyhWKQxRlO56x2cQcMa
 Rfaj5nYd8x3aqvibKZIlmQBwhE+xjs0S6YSbqBzD4SftLJm/Cg2xsQTrfyzPJurRAsS+qErZSiZ
 6QBhZH4Nd94jigcYJn3pFac+e5JBAmGcw3iNpmKJDEJ1KY
X-Google-Smtp-Source: AGHT+IGOzXKO1x57ekE+s6KVQvWqIgmak0rRJZThpqIZNvLD/75YjeDBtF1eC9+6hVk7MtkCiS33lg==
X-Received: by 2002:a05:6000:1a8a:b0:429:8b01:c08d with SMTP id
 ffacd0b85a97d-42b2dc858f1mr1217127f8f.41.1762588083808; 
 Fri, 07 Nov 2025 23:48:03 -0800 (PST)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe63e091sm9887598f8f.15.2025.11.07.23.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 23:48:03 -0800 (PST)
To: buildroot@busybox.net
Date: Sat,  8 Nov 2025 08:47:58 +0100
Message-ID: <20251108074758.391634-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1762588084; x=1763192884; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wh922rRPOqU3M0XTawcMRsO46bNbukQOxhJovFTKTpQ=;
 b=IWAGG1X6FOCVr/MQLKtCW0rQEfTnYTWnrus9XlbqD2h4C3bpwzWAurht/dadRKYNj2
 3OdkPU3A5zEwJA/9/NCaHT1paRwpWS2cIE3ltflJB84hKO+fMpZRyfynBMRns1g3dnV9
 Io8Cl2KNc+zGu6Saj6UUVv257tl6pQkBl7HHq4VG7d6HPVwHRsRAWMn9W+eTVvwgS327
 3BQqKqi0Dk97HSVyQYQQwg4OiwTEWRkfebCVEK9tKzuQa0T0KrSUWGOU3efZVK84ne07
 k4ksG3+z120k399Dd5sMB9MBbXXER2fF3d4KTiY0COOTdeHB6z8lW1swSitrjqhyFtFH
 E5yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=IWAGG1X6
Subject: [Buildroot] [PATCH] package/janet: don't use
 posix_spawn_file_actions_addchdir
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fix build, see https://autobuild.buildroot.org/results/c3378c138980b77ad5202223e7e1dbd8443bcf93/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 1387b31ce..4e904e7b0 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -11,6 +11,9 @@ JANET_LICENSE_FILES = LICENSE
 
 JANET_INSTALL_STAGING = YES
 
+# don't use posix_spawn_file_actions_addchdir[_np] (in src/core/os.c since 1.39.0)
+JANET_CFLAGS = "-DJANET_SPAWN_NO_CHDIR $(TARGET_CFLAGS)"
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JANET_CONF_OPTS += -Ddynamic_modules=false
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
