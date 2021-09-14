Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C06C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 16:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2868E60F70
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 16:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2868E60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C689E80F43;
	Tue, 14 Sep 2021 16:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rXDhK_A0Zm7; Tue, 14 Sep 2021 16:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 885C180B15;
	Tue, 14 Sep 2021 16:16:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4CF1BF42E
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 16:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A1A36061A
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 16:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4_rcD8x8dtu for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 16:16:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A051A605F6
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 16:16:00 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m9so21179394wrb.1
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DKdD3Leunkjxn9Oxp4s+Q1+Oju2vW/u4Yt95oEo6Ybs=;
 b=JrjdwoO/Ux41ESHjxvmG2HfunnqPkcs0+ueqZM/8+V+qXOZKThtauyPwzv7LxmBcCS
 Cv8mcyUi7gATbiwACSg+OYw9SkyICJ571bSK6wSPN4w4JmbQ0gensPDFSsF+Vm5nbK7o
 +knCKWjwSYhO6lv6f9RRnnHrDA4aZMcIaRUeQ14dxkHkCD/P8Pqy65AGeY2yyW1H4h8J
 y+0hwAAk6jlBT01FLNzNRoFt3jdHK9GzJ/VqV06FJrjB4kNmynwLP+A+WTgh7qKF80VD
 00T4f7Yk4Y6F78ManG/7KE7OLAcSbnLBPqj5lkxYMnZe4rPRZx5cEMi+pXMe5R5Ue+2S
 JExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DKdD3Leunkjxn9Oxp4s+Q1+Oju2vW/u4Yt95oEo6Ybs=;
 b=PTQ0mqyFzt2gc0SHV15Lxr0YdK71A8LEdFBBb3cTbrFppgPtE0fe3EE7ybP6H/R6Lv
 UhJFciT+XhJWhM8wNPjIQlsiX3iry2wbmzyY9ea052n2eS8VSdzHIO38uEvoihyI4rSu
 V5AG8PtM/vaadpCOXuWiRlxlKBj6PVygk4PJ3Z0ZxOvyJXSAjRmfCymrQ1ynsvMABUSW
 3qahrcdx0X3EpO6ZngFCN/IwRn/38eKcnhg8M36X3igWFSbgbzYmyKbHgtxIJ4iyy5Wr
 DhiwytW2K3tAl6vry1QXG09H+JIvX4k48siLWn+murZIpZ9wYhNzNXDkkSusKuOqImK3
 NR8g==
X-Gm-Message-State: AOAM530VrYL6Hyje245Xaon2L2x3i2dNDqTSkQwrJKLI7i9mHqHCsx6z
 885dXbLWX7qDyq4q/DwEcT00qgCFL9g=
X-Google-Smtp-Source: ABdhPJwv1kBxNrGEnAZm06lwZLJ7KRaB0+A5tIn97FxK2FYgTj4atZ3zobV8xm1dWhcAbsBWSTJkYw==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr19303870wrr.376.1631636158638; 
 Tue, 14 Sep 2021 09:15:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o2sm11659713wrh.13.2021.09.14.09.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 09:15:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 18:15:11 +0200
Message-Id: <20210914161511.44400-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpv: disable vaapi with DRI driver
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Build of vaapi with BR2_PACKAGE_MESA3D_DRI_DRIVER is broken since commit
17a7abbafee9bf4a971e00da7870ae439910e47e because vaapi can only be
enabled with x11, wayland or egl-drm
(https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L632):

'deps': 'libdl && (x11 || wayland || egl-drm)',

As a result, despite what is being displayed in the autobuilder log
message, the build failure is not related to X11 but to the fact that
we try to enable vaapi through a DRI driver but without egl.

Fixes:
 - http://autobuild.buildroot.org/results/5ae706e94eb6e5a3aa69368f81c5d12e608b1a5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/Config.in | 2 +-
 package/mpv/mpv.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 51c9799de8..81b1e24b5f 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
 	bool
-	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_GBM
+	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_OPENGL_EGL
 	default y if BR2_PACKAGE_WAYLAND
 	default y if BR2_PACKAGE_XORG7
 
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index a71a4b3114..ff77f248e5 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -184,7 +184,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
-ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_GBM),yy)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
 MPV_CONF_OPTS += --enable-vaapi-drm
 else
 MPV_CONF_OPTS += --disable-vaapi-drm
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
