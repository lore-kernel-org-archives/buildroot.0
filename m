Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716E8C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 17:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D6660D4F;
	Wed,  8 Mar 2023 17:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D6660D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWVXHkT23hpT; Wed,  8 Mar 2023 17:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B65D60D4C;
	Wed,  8 Mar 2023 17:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B65D60D4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4581BF47D
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 17:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2899841861
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 17:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2899841861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0c5VyAdruBPy for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 17:44:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3BD5408AD
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3BD5408AD
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 17:44:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso1879026wmq.1
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 09:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678297449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iy9fH5atAIMDNLUuRgIAC4IUf51mH9rYSlcUbq5fGic=;
 b=rCpYIxK0Y2CwjMDCYy6l8wVzQVz3f6xooLHPGZbhpxtNYZjwD+mkWVgooPZFIU3RoW
 QB2WvUFbasqwSVhXMbiq9J0UEQrWzBiGUlEQw/dmP7PI/S2Fb0azDc8ipS20emzDRlJQ
 CNQzTUYxFo40jOc+NznUnpveO7pFlby7m/r0epCelyOI6Gm8s1GnwCxTEEADFCuNVnKY
 8Gsj3sViAWCdhAycgeDjj6vKvhwp5LnLuF+RJHYMUThbd5q3TUGyzqTjFyBxWn7U1KH/
 kfnMM/kdNqcXQa4SesPQY4I0EqMGH1QcsEjYgZByV3DAJryqQiEc7uVBT5SCsTpk/SQK
 Ywbw==
X-Gm-Message-State: AO0yUKV0Zf9Breq5hddCqFs6GEA/4ikAOzUfOrjC2llqS5uLfLzwiLEO
 Kh3ZoJyRQoi0BQLbU6FJV1hH9Q5YOWQ=
X-Google-Smtp-Source: AK7set9mXwXLflopDdWNk8+o1xGEwnsZxC8hA/WLdq/z0cFq8R03eHATSxToDADeOQ3nNO7MWZmJtw==
X-Received: by 2002:a05:600c:3b88:b0:3ea:e4bb:4e9a with SMTP id
 n8-20020a05600c3b8800b003eae4bb4e9amr16936069wms.2.1678297449214; 
 Wed, 08 Mar 2023 09:44:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y8-20020a1c4b08000000b003e6dcd562a6sm87117wma.28.2023.03.08.09.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 09:44:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 18:44:02 +0100
Message-Id: <20230308174402.7574-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678297449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iy9fH5atAIMDNLUuRgIAC4IUf51mH9rYSlcUbq5fGic=;
 b=MFYi3PpOQQcyAERczijz1DaaJZ4ltmju4V6/VoTqrxA/JnPu4/+0S06PK8H/vaCKhy
 VSNX8u2SNm5YI8bQc/B74NPPoU6KBDJ7Ng3NzXK7hp9XLHpOrUij51gntaJkhJ92mmt0
 +7oyIXCKkgkoyR8h4BRxppeUFd8ACERlW6xY8DDCnguaBnFRJw/8K5WxyeDhyS0Zv//i
 GEKymkrtGAVCQPUWbZRtp0itAcZD7nJV7KfKUlaxusl48qB37VhDAi5LiZ5WhcSnBiYF
 QwFhNOrAxbOAM4L6qL1iiw8FjtBa4ECwWOAyZxXGRYfcD9VMAqk57TfheK+Vx9WROyqA
 xpJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MFYi3PpO
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: fix build without
 avahi-client
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

Fix the following build failure without avahi-client raised since commit
7752afbe4bb9fa1def5ba89daf21564ea58af79a (before this commit, avahi was
silently disabled):

../output-1/build/pulseaudio-16.1/meson.build:754:2: ERROR: Dependency "avahi-client" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/0aea014eb4ed27870af908668d7b138d150f065a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 8c4b99b6ff..89191db541 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -25,7 +25,7 @@ PULSEAUDIO_DEPENDENCIES = \
 
 PULSEAUDIO_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 PULSEAUDIO_CONF_OPTS += -Davahi=enabled
 PULSEAUDIO_DEPENDENCIES += avahi
 else
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
