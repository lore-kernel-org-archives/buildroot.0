Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDB8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6CD5404EE;
	Wed,  9 Feb 2022 19:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkWNuyOOwD-S; Wed,  9 Feb 2022 19:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AB3F403A7;
	Wed,  9 Feb 2022 19:13:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 907171BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EE0482FF9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlIlSc0HQcWF for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:13:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BEA782F84
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:13:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id i19so669149wmq.5
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WHmaPITligZK6O20s8zA7/8/1XiDQZBr15ftebXf0Qo=;
 b=MWfmQWUfP+6xBpoTMjcAu0RTt4/fb62qJdgZSLi/YxcExz9OI+O9HJi5QkLawdxrd3
 qTU6lNfYTbVV+J+hh5PFz1QWk7ws+tLzh9/CaXW8b6Hus5ME+f+2vbof83TDVbASotiZ
 CYuqCgjEn3eJs0MbcUDGG0sKVaWQrLe89wshrJT6eVg8Mq8Zq7j/whyh2o61nK4CjD8E
 H51hsY+JVu0k6yDjAGKTXjHz/yehaMrvnmxiR3cY8RzQVeW7gOUohS+aT3BCOYCmKmZ0
 /Lqf062QYpXk3DtAxYgBHA6Jjv8JQhA4t6Cv4+LNtNVVLP8bvAuWCiyoi4KdHQ6rUgJz
 C6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WHmaPITligZK6O20s8zA7/8/1XiDQZBr15ftebXf0Qo=;
 b=7phmV5+64jxpg/xX7iuvKX6WoQD9Vdv7/jLQYP7MmfZ80gDGj4ZW8tCIoDRM9WaQhe
 PlRcaUX087pCUJ1+/vfJm/mx0jkToQGhhUX8eEJELMDlmK4ZBkNdyiIAD1A/RWPQb84G
 QcoYw6pK7nSGTz1fqZnAphHgdAZ2WMImxpCqWVQUy569va/Nc+pveZn7Mps8hJnQj8yu
 QhK/Tb6dSVgPuKoKsJONHog33DbB6xLqLi2wisYLe2gvptlw1RgO/twnMYoJuPM7iIwA
 VVFNEhowcRoyuNKs3UUBHtv9i/RU4jH/Oh8mAufbotAT9kkmC2C8hRXB99YhnExZHbmR
 o+VQ==
X-Gm-Message-State: AOAM5325AKLBj9NsqoGWhNxThqBs/lt08R3tU/ZVZ3BLU87OloK2qdXG
 YxUtnimn0tleWznEgs+k/+ioF6IP24I=
X-Google-Smtp-Source: ABdhPJwKjVwlAP7uf9VkbeBMrImjhShq2diZwsCgRMmJPxlxMB6fdG/LuRCHkz3tKvkxWcURNCfL4g==
X-Received: by 2002:a05:600c:3846:: with SMTP id
 s6mr3933829wmr.26.1644433987016; 
 Wed, 09 Feb 2022 11:13:07 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p2sm10629698wrt.101.2022.02.09.11.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:13:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:13:27 +0100
Message-Id: <20220209191329.201362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/sdl2_ttf: drop FREETYPE_CONFIG
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FREETYPE_CONFIG is not used since version 2.0.15 and
https://github.com/libsdl-org/SDL_ttf/commit/50d72e55315e25d34f4209824275e3b1cbe6c6f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 1fe7c0a075..3b2b35e157 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -12,9 +12,6 @@ SDL2_TTF_LICENSE_FILES = COPYING.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
 
-SDL2_TTF_CONF_ENV = \
-	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
-
 # x-includes and x-libraries must be set for cross-compiling
 # By default x_includes and x_libraries contains unsafe paths.
 # (/usr/include and /usr/lib)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
