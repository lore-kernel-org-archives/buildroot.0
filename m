Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A23C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 08:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE8E3407F0;
	Wed, 17 Apr 2024 08:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwttDOsmIdJE; Wed, 17 Apr 2024 08:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B334062D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69B334062D;
	Wed, 17 Apr 2024 08:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE9E1BF341
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17E2440AF7
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nwo9dtJtj8MY for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 08:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98E0E4015A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E0E4015A
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98E0E4015A
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 08:06:21 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d858501412so68029331fa.0
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 01:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341179; x=1713945979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qYKypuCZ2c1uszEBnEIvhfXD6Jk4ZOr12oBvuA8bJs=;
 b=lNiAeOSHhG4xNUSuLgttCy1cRmpO4c6shlhZcLsp8W3GibAdrKE34ToaN52POpU9a8
 9aCOvYEyQugJfpbqS6GviqteUKs7jgxAhF8rvQnAQ0CtD6hxNu6091S53d/NcZWgVSuu
 6cJ5As5Y9LSxcbAUJ1uH+ECzIuLe47OteUmOmzdqBB6BVS1Uy9if64010sp/WOb8/uH4
 oOJ/K+OXGmGTof82eSrNR5H9T7lMX0SodMcN87DV4OuSvWg8DQv4H5HvVPDUBlMAVCde
 LGD3ZjTnLTU5IkquaxHlHhV1MOey0fg19Rw48hD79zJsKUnP7S8RSWI/tuqtNfNAJfJ+
 qEdA==
X-Gm-Message-State: AOJu0YzAQ0K6udpnQcHcr2rYzkN+DlCWKI1hDJPKhfCQV5BWyaeX+lCV
 Q/Bxm0c+m7LZ9GNIVDn2Q1tj9XKv30rFXe9HuPN1tctJrIwrWYQYICXGXXrY
X-Google-Smtp-Source: AGHT+IEvXk3DuEUkDy5fZrsNqK1eBdHKq8+sMe56Y8rxAukXbazPm+anMfMFhnf/S2EIu9UUd+Q70Q==
X-Received: by 2002:a2e:88cd:0:b0:2db:196a:a8d2 with SMTP id
 a13-20020a2e88cd000000b002db196aa8d2mr868035ljk.17.1713341179375; 
 Wed, 17 Apr 2024 01:06:19 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e8912000000b002d2191e20e1sm1830254lji.92.2024.04.17.01.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 01:06:18 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 10:05:23 +0200
Message-ID: <20240417080538.3451923-2-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341179; x=1713945979; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qYKypuCZ2c1uszEBnEIvhfXD6Jk4ZOr12oBvuA8bJs=;
 b=mqec/rO74LkOWjZ8d65o2T+nWK1aZCfedUj3zxjlqGxC1jE96uFC8inIiDSqh7szKO
 w6hWyuRhwpeqJ2BO0fRr5/dxSMITQR55Iktz3X4P6j67WLhSYnHIrl4yZBu21+KosJhX
 OIluksQT0ENGa9WuxJsSTN5esIxdlMzZG3ZF5gP19C9KHVtrmGe5qYj5ZCxMsMffRu3R
 fY+wLA9SEx0zgk6kKYbzvoZXMb4fYywUpfrOD7iT9FtifchtrbosUX6XHEHpbc6+fEbX
 k/cNcYyb+2rmoiqb/xw8/2rc4HkTZRHv7qwY8EEtk41N5OWzQzp7kZuN9q7kOtLpeCPB
 zyvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mqec/rO7
Subject: [Buildroot] [PATCH v2 02/11] package/qt6base: avoid enabling both
 desktop and es2 opengl
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error:

ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
    NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND GLESv2_FOUND
Condition values dump:
    WIN32 = ""
    WATCHOS = "0"
    QT_FEATURE_opengl_desktop = "ON"
    GLESv2_FOUND = "TRUE"

CMake Error at cmake/QtBuildInformation.cmake:209 (message):
  Check the configuration messages for an error that has occurred.
Call Stack (most recent call first):
  cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
  cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
  CMakeLists.txt:208 (qt_build_repo_end)

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/qt6base/qt6base.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6857725ef5..211808d2af 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -259,10 +259,15 @@ QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
-QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_opengl=ON \
+	-DFEATURE_opengl_desktop=ON
 QT6BASE_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
-QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_opengl=ON \
+	-DFEATURE_opengles2=ON \
+	-DFEATURE_opengl_desktop=OFF
 QT6BASE_DEPENDENCIES += libgles
 else
 QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
