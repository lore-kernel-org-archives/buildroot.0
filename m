Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687BC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF11400AC;
	Mon, 22 Jul 2024 13:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Du26qNvOxfrm; Mon, 22 Jul 2024 13:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80BA84022B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80BA84022B;
	Mon, 22 Jul 2024 13:18:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 781001BF2A3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 657CD810E4
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0k4PrPBgUIEC for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 512F5810E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 512F5810E3
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 512F5810E3
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:18:04 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so64759981fa.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 06:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721654281; x=1722259081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mSQp2I6ceuvGMWrrOVS9pftFFCkb3EoXUKqryiZG8bU=;
 b=sbXfTiuVLvTU8bo1ph/+CdCuIxeIGwHVQfYZT5Ayr9bDfY7gnO2K2+HxZl93yG7UYz
 jCKNz2VnKo0FuBTyxw1iNjDPnkzMFbHDwqO9D21H5nQ+EEYEA3lSRatZGiOo7YcnRXgB
 u8GgNSMxY0S9Q4SPbpL9Mcn5/c3AB7PaYnYKMngtdRNi4tNwGHqQFHpJpbpeJsTnqphU
 /zn308o9bTlvHZcTIzp06qgzJaFA13tWWBWyWhWpcExkhGO8sT7sagEvjN7m3Yjwhh5Q
 23efE1SY8VoSqnctUIX6eAnd/Cp0ZCDzvb4XrnLes+2IsNdqoGhMDL74YOP4K/fAJHQi
 ke6w==
X-Gm-Message-State: AOJu0YwAkZtraHq2PqqaA03dSlFrogN8S+J3Di2SNiRUCPepg+kO1K9u
 vOkWtSTw1rE0WWe+buzOydRbclzHOPWZSDRE+NqhiJ1dKZRmYCOlQIZjuA==
X-Google-Smtp-Source: AGHT+IGMcC42W3tOc1Ol0dV4uloeQoVCpP/vO7so4Esn7pedyQy9xv/SAly5mDjWwrTbt9rZhgqnvw==
X-Received: by 2002:a2e:9d96:0:b0:2f0:1a19:f3f1 with SMTP id
 38308e7fff4ca-2f01a1a00a9mr10970331fa.7.1721654281270; 
 Mon, 22 Jul 2024 06:18:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d69297dcsm127168115e9.35.2024.07.22.06.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 06:18:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 15:17:50 +0200
Message-ID: <20240722131750.519333-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721654281; x=1722259081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mSQp2I6ceuvGMWrrOVS9pftFFCkb3EoXUKqryiZG8bU=;
 b=Akjz2DeAMYME3jIcP44jgoqMl5jd6DEjKYu3p3bVSRWOYyu/p+2I0QhKrWCIBnfOU8
 lgpiaEb3NoNeVTxxG35UyAF255EXBd7XB1scgn2gY0Qs7IfdIydp/PrCaS/xWC4bkHZs
 4LfMohQalKd1byl3zYnHRPDZ65lZLccz0FQXo0LOyCtNWzWw2X8yiIsA2f5qLQiBD3dZ
 +u23tg0XESEYpUOHxX4IMlxK8pjdvLBbdLA79VAXoK6DVONOITts3WFnaHblK4qiDuGQ
 5P4Qv+h96dqFP3JMkHDYzE0HIdcn5Mq4Ls0PPx1Sp55nmjd8yiasU6qD80ZX+zaHb8Y0
 XR7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Akjz2DeA
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: support building both
 libraries
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

meson supports building both libraries (i.e. static and shared).
This will avoid the following build failure with flashrom and
BR2_SHARED_STATIC_LIBS raised since bump to version 1.4.0-rc2 in commit
8637884057ddc3c1aeb9f0dd285fc6fcf378c26b:

../output-1/build/flashrom-1.4.0-rc2/meson.build:18:2: ERROR: Problem encountered:
    Cannot build cli_classic with shared libflashrom. Use \'-Dclassic_cli=disabled\' to disable the cli,
    or use \'--default-library=both\' to also build the classic_cli

Fixes: 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b
 - http://autobuild.buildroot.org/results/6d484857ff1674bf81986505827e54f3f1b9aaec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkg-meson.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 65cabf23ba..bc805b799c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -82,6 +82,14 @@ else
 PKG_MESON_TARGET_FC = /bin/false
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+PKG_MESON_DEFAULT_LIBRARY=static
+else ifeq ($(BR2_SHARED_LIBS),y)
+PKG_MESON_DEFAULT_LIBRARY=shared
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+PKG_MESON_DEFAULT_LIBRARY=both
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
@@ -152,7 +160,7 @@ define $(2)_CONFIGURE_CMDS
 	$$(MESON) setup \
 		--prefix=/usr \
 		--libdir=lib \
-		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
+		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 		-Db_pie=false \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
