Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79481E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D36381EF6;
	Sun,  1 Oct 2023 16:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D36381EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-ewug0WNT_J; Sun,  1 Oct 2023 16:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8496A81E1E;
	Sun,  1 Oct 2023 16:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8496A81E1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E73F21BF4D7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0AF381EF4
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0AF381EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0yoOVBuzUGsG for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:52:28 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B79B68169B
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B79B68169B
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-504a7f9204eso6003474e87.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696179145; x=1696783945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHOFTt5Vb6KhTSkXOScnWSynTaRTD1uXGv+m/2ttoRk=;
 b=gAUZj34q2zJq/D1u6jp0vDnvpkIxxEkp8JhwUM6sYVnnbU3pS2JqP2AdLxDRG+F4fa
 7rzeVyBakcRkxA0Zht+bwHOcKZr6IlhBrcYrg0/peXlQAW3yWNXxKRulZLmt3asEruYF
 3mXx9s2m+rEWpDZ0q1OFnQqXTW9DdaN23mcohHpc0mlhps6jUuaLMndPQfBK7g5hcTM3
 OJQvYyPIwLrAOUVVWxWWiyDTz9sVheO1mJsLnAN3USYeYKxw/gYvLw7cvobCAQv6WuBm
 PbQ1Nh3i9VEASlBZ/DUQWC42NOc6nzpd5OCqBl4do9omPxA9gXsW2HiBa5EG2yK7TLRt
 8Hzw==
X-Gm-Message-State: AOJu0YzHLAyTy0KPidFFOIuKlC5Dv+UKzhhsMlk0UR6pnfylRmtMxD/i
 u7dBWg+/b9a6ml1RGSpsocmCzjp2FDE+iYY6
X-Google-Smtp-Source: AGHT+IGE+tW0sGbTTOWr4CoReu16L4/cPdAm2TYwJH3Fpx7Hev3yWLo9b+qDfwwISF32sMIPpbMMmA==
X-Received: by 2002:a05:6512:3a90:b0:4fe:19ef:8791 with SMTP id
 q16-20020a0565123a9000b004fe19ef8791mr9239949lfu.38.1696179144964; 
 Sun, 01 Oct 2023 09:52:24 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 n20-20020a1c7214000000b003fee567235bsm5599068wmc.1.2023.10.01.09.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 09:52:24 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 18:52:10 +0200
Message-ID: <20231001165218.1960930-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696179145; x=1696783945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=PHOFTt5Vb6KhTSkXOScnWSynTaRTD1uXGv+m/2ttoRk=;
 b=f4rn29SqZTaNsTCepPqcBnKXjN/bDjBoiaYhZDxF5jhtapeTN49sLoXHtqm3qNg3zR
 PVgFg/sKgzGNG8bSbkynAfbPzIrOHLk+ZGUk3yEm0vRoIuKA+lQbBfAe5Ab1/leZ3Z9r
 T3Ze2K+5TDkl7/xYqc/IVU97zr1IoGs2yYQkedh5OVmvayH47FriNVXgAaPkiv+xCmYL
 9PF5CHQmBSeneSQPT65NPl1283D7PZGGqUZiAtupBXcoQ0KVrZk0bJ5PpFFMk1QSSFyv
 9Ou7BD1Gg5CehJ4sZ9nHHQxcDewDAlLV58gueN4FM0UIVVgNwE6mNdh3uzMy+bSfPFA5
 Z8cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f4rn29Sq
Subject: [Buildroot] [PATCH v4 1/3] package/webkitgtk: make gbm support
 optional
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas@devoogdt.com>

This was added upstream in commit:

https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498

The 'USE_OPENGL_OR_ES' flag is default ON, which will enable 'USE_GBM',
so ensure that we unset 'USE_GBM' if we don't have libgbm.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2,3,4: no change
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index bb6df3d592..88bdfae27b 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -88,6 +88,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=ON
+WEBKITGTK_DEPENDENCIES += libgbm
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
