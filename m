Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795F2C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1597140135;
	Sun,  5 Feb 2023 14:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1597140135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zepzMEty5065; Sun,  5 Feb 2023 14:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5019640124;
	Sun,  5 Feb 2023 14:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5019640124
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32CA91BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C4BD410D6
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4BD410D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PhpPopa8_COd for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86102410CA
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86102410CA
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:55:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a2so8046257wrd.6
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 06:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2oKioQFRxz4OXPs43pwJF5ORQxlcttKDfxg6q4fdgf8=;
 b=gfOqb6PHvs2bjRjJGCXgVvyhIoSY/okIJeBKAvumMCHy/foblz0A8O8Or0VN7zuhDk
 Zmqi7OCU2kb5djR0vECK73CUUlMl/cBTCjEyNwvYKrFTaMj7v6LTAlDzqPQb8EdhfNMP
 CBafgyr5ss5fFC4UDLcdtSWa2GvxHBEX6UnZSTi15EJ3ckZBrPSI/UBFc0lJdWllpnKV
 22V6TF+GNgD4hr56XVOrCILQIJGROAOXGxzvm12cCMr0qpfCUyknv83R1TB8xW/cvgV4
 l0U14+vk8/8LPTXYgTStyXTu/MJ+qYRtRw5M43LAnBsXhqkKuI/GWNgquFUszHArrh6h
 ddrw==
X-Gm-Message-State: AO0yUKWSsslTrs1FhlJVFtd2mCtzFZ71mrx+j2YakXTTdaDdNbo0PVAZ
 H7bKD7mtY9Y4HzaivF4Xk6szUboc4JE=
X-Google-Smtp-Source: AK7set+5IT/bjXd64bQL/EppQncj1JSYJvE+tdhoc0Ib46JQSqMwwd39PNWHBHdHWVCbv7WOXdA3dQ==
X-Received: by 2002:a5d:4bca:0:b0:242:800:9a7f with SMTP id
 l10-20020a5d4bca000000b0024208009a7fmr13985526wrt.65.1675608934488; 
 Sun, 05 Feb 2023 06:55:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d3-20020adfef83000000b002c3daf229b1sm5200358wro.55.2023.02.05.06.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 06:55:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 15:55:32 +0100
Message-Id: <20230205145532.659422-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2oKioQFRxz4OXPs43pwJF5ORQxlcttKDfxg6q4fdgf8=;
 b=OPDzAVSMkSj6ZtZRs4YgaDsSALvVf3/z+v9LYGAiXqDoaAOH8Br/pULZkP1Y9CSzBM
 Oa0wqQ/b2O4MMzDqqTDi+BlfF6E7iCaOZITGp+HSOkEgsr/BEqDJcSy8w15tFYKeU7gM
 jukwdiPYqRs+Bv31WQs0KnNNG+O7VkF7UAeDU7t4L0wGdn/EUOYwCczXriMPHlx1Tkcl
 JGkI2/qIrToPuknY5Ss02IA1yndhoCBUxj/uYsHXhhQJQ2NVu3QYNALFISdDR7mFffoI
 /BG4O8shdA5/B0nUwHP+MynJTHDiULCIVRqXj2EgkhQCgWIXZXcblxr/JIv5uNKf6GUh
 FWJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OPDzAVSM
Subject: [Buildroot] [PATCH 1/1] package/tmux: bump to version 3.3a
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

systemd is an optional dependency since
https://github.com/tmux/tmux/commit/fc7f1e7acb3539a43df46136e971f770515e0b0d

https://github.com/tmux/tmux/blob/3.3a/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tmux/tmux.hash | 2 +-
 package/tmux/tmux.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 75538e09ae..b5c0fe58d0 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  918f7220447bef33a1902d4faff05317afd9db4ae1c9971bef5c787ac6c88386  tmux-3.1c.tar.gz
+sha256  e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f  tmux-3.3a.tar.gz
 sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index b1c0af1a83..47ee9b16ca 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,13 +4,20 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.1c
+TMUX_VERSION = 3.3a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
 TMUX_CPE_ID_VENDOR = tmux_project
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+TMUX_DEPENDENCIES += systemd
+TMUX_CONF_OPTS += --enable-systemd
+else
+TMUX_CONF_OPTS += --disable-systemd
+endif
+
 ifeq ($(BR2_PACKAGE_UTF8PROC),y)
 TMUX_DEPENDENCIES += utf8proc
 TMUX_CONF_OPTS += --enable-utf8proc
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
