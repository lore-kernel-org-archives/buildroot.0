Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0873C3ABDD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 10:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A505361143;
	Thu, 15 May 2025 10:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqzluG-HeHpT; Thu, 15 May 2025 10:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C531161154
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C531161154;
	Thu, 15 May 2025 10:37:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99C10153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 864A26114B
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbtMV4IJdTz8 for <buildroot@buildroot.org>;
 Thu, 15 May 2025 10:36:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F5DC61144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F5DC61144
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F5DC61144
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:58 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54998f865b8so698358e87.3
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747305416; x=1747910216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gui8iotB/afq8FqXk2gP4RexSrbnbJ3n2WM8r64Forc=;
 b=LlsP3N44kW613jYWa0n7LVp8kV3XhVFJlXl+WE3jcCOQyGLwUHjQlw6rE+2TOIYZm0
 hZ0FptFLl+BPPAPwSy+CaU87vMpRkkV9COEoWsnuwaKFV1WeR5eFGcyyoMNyYzsyrHYY
 skBUiRC7gD82tCxkJC6bq1Nimh19Uf8ge4wokR2A+U3oEN9eS6DtJdZs5TVvlv9WB+9o
 3Qo2D3tE9lUfOR99SLyOgp5HGXcPs3ufJfsJaKg4CjQCdZ2+auXvaYCfZ1drW/WwllgO
 PN2z8uj32yqLTttWwUU4CAtQVJNsLyKvWkV/Es6idK32NrUSLbYWdnzMG1zR88RlGdaW
 N8Og==
X-Gm-Message-State: AOJu0YxMaBJAVYxXFSsVWkpe24ibFadvD0OEJSgwEaEmETjFf439Ff96
 8fKDbFRDumgXmLe5fNMrEPqzOLLtQjFh2wMKWESGx3W/WBHo78IqvpIEpg==
X-Gm-Gg: ASbGncuA490qVycAIY8fbnOzhiN3ahN/mi9ikZNYvC4XjA8qB3Fe389aY5bYZhlile3
 ygu6yZzav3zQPBlix6cFdn6gjYhHFtMZBhmCtPTaXSL5uZQVAU0UKfX4BPL7ecr/cFbXwOdzwKN
 VoDad5Kd5XxgnYNG0CXNeCx0qpeyQqykwzVYF+VZQicG6rxCz5xJrB4C7ghv8Yrn7NUORXXbTqZ
 1eH5YIi633ok3n6NaN5WeeGViSlfQz+I9IfSB9Dnh+SxS64VM834oXhluRzs53GnlKOs+a+UA/u
 9F3T2KaScHb38y2m73pcIjId70dirC7fgqPQe+hXhRfAe50ZcC29M6lGu5gIpUUML7hiHk4N3vb
 JbFkVdA==
X-Google-Smtp-Source: AGHT+IE9IXmFLXvOAbAgUDNiW3uo/CcYztBIxlJYsHOT6igUzNh/ta8eRTtvtUSKaVIXBl0ih3yjWA==
X-Received: by 2002:a05:6512:4605:b0:54f:c2c1:d4b3 with SMTP id
 2adb3069b0e04-550d5fc9252mr2190578e87.33.1747305415645; 
 Thu, 15 May 2025 03:36:55 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64cbf3fsm2571603e87.211.2025.05.15.03.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:36:55 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 12:36:23 +0200
Message-ID: <20250515103632.2631227-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747305416; x=1747910216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gui8iotB/afq8FqXk2gP4RexSrbnbJ3n2WM8r64Forc=;
 b=g0N80L1Q/bOAgocWyLdZM9GprkqH8jj5tRwSXQshuLA97zn2eJMa7BUYXTymZuEjLn
 UesDoxtmVYoqlHt1iW1K2zHctl3GKM+8AFA+3PqXLz8B6ScbX0e18TFPHO8FRZ7/M7U8
 Ctw3hiVKW+kzR/6h+FhQmfan54KyYrgcZMlwHUDAB/6cE5xVxyUF/CHhHaMzOBtUggqS
 /CIdP1N7PSs21wGkRj/7kWSBgMEoqn17n3Gyw2qZOCTDlJKDCbvHB121NoxyHTQ3vAcf
 tHBp6/307XzNCzJ8TUygGn6lh5GTfQku+XYGLreMP3tQZirVvDYfoQI7IL9d0D7t1KL1
 qeIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g0N80L1Q
Subject: [Buildroot] [PATCH 07/10] package/qt6/qt6base: fix build when xcb
 support is enabled
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
ERROR: Feature "xcb": Forcing to "ON" breaks its condition:
QT_FEATURE_thread AND TARGET XCB::XCB AND TEST_xcb_syslibs AND QT_FEATURE_xkbcommon_x11
Condition values dump:
QT_FEATURE_thread = "ON"
TARGET XCB::XCB found
TEST_xcb_syslibs = "FALSE"
QT_FEATURE_xkbcommon_x11 not evaluated

The xcb feature is defined in [2].

According to [1] XCB::CURSOR is needed for xcb support.

[1] https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/configure.cmake?h=6.9.0#n522
[2] https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/configure.cmake?h=6.9.0#n1016

This bug was introduced in e634be8906bd64d6a9de1768204d0f03d8d8357a.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a4c56da601..39fb440be7 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -211,6 +211,7 @@ QT6BASE_CONF_OPTS += \
 QT6BASE_DEPENDENCIES += \
 	libxcb \
 	libxkbcommon \
+	xcb-util-cursor \
 	xcb-util-wm \
 	xcb-util-image \
 	xcb-util-keysyms \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
