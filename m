Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B750CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6629940603;
	Sun,  1 Jan 2023 23:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6629940603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_xNLLB6cAL5; Sun,  1 Jan 2023 23:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FACD405D8;
	Sun,  1 Jan 2023 23:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FACD405D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0884A1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D85BE60C11
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D85BE60C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UB7fvZoti1D4 for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC6EC60BFC
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC6EC60BFC
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:22 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s187so23797137oie.10
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMRDLaDkbzahd/uiRVPjuZUsTkJ2JtwhqPMjjH8wbXw=;
 b=6o6WouE3xP7uBho3voIEKsVqDyLEWuANVSruUupxu4+8Y+P54Jg5f8+guKqYOlk+kg
 0eLt9i09fzKZDfgc+Thr85EZPdXAUE12QoZFjuLVy+TXLLoGVaWo1Ds58wWihK0aI/wv
 Itxf7X4p9h/vFbDzIkmIF9wbOHrURhfpS6h8WK+d3/NG+lGWSC5yIq1QIe2ZF4XJ7ChL
 ay8AZJko/M0MDm5xQIVo1v4tBlrcMlpPgHW3BDs+oTsP9CFtsJ6eJGs72FeBDm5qNUkh
 hZOjjNBqwmCBIYrKEN7RuoSJ4RCImcpcKgfSlsBbE/f3HhUd1IbXlGumk6by94BDLMYo
 mlIQ==
X-Gm-Message-State: AFqh2kp+ItwPZOT/WFP5KuT5tcdaKDKonH5PRpPC2befHCrUDVHz55o0
 Zbx/vGUzkotjPNpJqoY71p8ZA53AQDk=
X-Google-Smtp-Source: AMrXdXvuuxjz2h1BZqgGBoiKAX3BzPgSQ4lcwkPdhkS0JsVqMJq0UpLcy3rRHAKPLJfitPb1EGwW7g==
X-Received: by 2002:a05:6808:2c9:b0:35e:b231:1a27 with SMTP id
 a9-20020a05680802c900b0035eb2311a27mr16014160oid.33.1672616362572; 
 Sun, 01 Jan 2023 15:39:22 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:21 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:32 -0300
Message-Id: <20230101233653.487175-9-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMRDLaDkbzahd/uiRVPjuZUsTkJ2JtwhqPMjjH8wbXw=;
 b=FhxipUHoZ3P3CUioOtc845+0DhbYgt9LGX+d23IDSsgl9dRctCaFT1xRKoKln2eNDD
 nQr/gIqw766JB5Fp27NKaR6q5Hr19h2DPbe9C1M1+vXfG89jRZgOmbZi+P99qyLPzW28
 Ad8eWZPSejs7sFobRguhqTZas4I5cghTgv6n6NUAsUvV57l/4CmuRjyScNxXr+RrWSmn
 INVE1jisJ5zSwl5Y8SALwB7XWDsAaxJ76LzR4ZpLEnxWj8DarBJmDxRQms2E9+324F/a
 pGLRtENroJ9b1U9FK4fHo37zRYuGiAr+l3fS6okAira0hPgWxz/Lh+7A5A2duBbk0gRr
 VXmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FhxipUHo
Subject: [Buildroot] [PATCH 08/29] package/qt5/qt5virtualkeyboard: really
 configure language layouts
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "170777f342 package/qt5/qt5virtualkeyboard: convert to qmake
infrastructure" changed most but not all <pkg>_QMAKEFLAGS to
<pkg>_CONF_OPTS.

As a consequence, BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS is
ignored and all layouts are compiled in.
Some layouts have different licenses (e.g. pinying), so the license
information for a build that is configured to not include such layouts
is wrong.

Change the remaining _QMAKEFLAGS entry, fixing the config for which
language layouts are compiled and installed.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Tested using this minimal config:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5VIRTUALKEYBOARD=y
that is expected to compile/install only en_GB layout.

|--- output.before/build/packages-file-list.txt.sorted
|+++ output.after/build/packages-file-list.txt.sorted
|@@ -3647,5 +3646,0 @@
|-qt5virtualkeyboard,./usr/lib/cmake/Qt5VirtualKeyboard/Qt5VirtualKeyboard_QtVirtualKeyboardHangulPlugin.cmake
|-qt5virtualkeyboard,./usr/lib/cmake/Qt5VirtualKeyboard/Qt5VirtualKeyboard_QtVirtualKeyboardOpenWnnPlugin.cmake
|-qt5virtualkeyboard,./usr/lib/cmake/Qt5VirtualKeyboard/Qt5VirtualKeyboard_QtVirtualKeyboardPinyinPlugin.cmake
|-qt5virtualkeyboard,./usr/lib/cmake/Qt5VirtualKeyboard/Qt5VirtualKeyboard_QtVirtualKeyboardTCImePlugin.cmake
|-qt5virtualkeyboard,./usr/lib/cmake/Qt5VirtualKeyboard/Qt5VirtualKeyboard_QtVirtualKeyboardThaiPlugin.cmake
|@@ -3660,5 +3654,0 @@
|-qt5virtualkeyboard,./usr/lib/qt/plugins/virtualkeyboard/libqtvirtualkeyboard_hangul.so
|-qt5virtualkeyboard,./usr/lib/qt/plugins/virtualkeyboard/libqtvirtualkeyboard_openwnn.so
|-qt5virtualkeyboard,./usr/lib/qt/plugins/virtualkeyboard/libqtvirtualkeyboard_pinyin.so
|-qt5virtualkeyboard,./usr/lib/qt/plugins/virtualkeyboard/libqtvirtualkeyboard_tcime.so
|-qt5virtualkeyboard,./usr/lib/qt/plugins/virtualkeyboard/libqtvirtualkeyboard_thai.so

build test:
44 builds, 29 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/731801232

test-pkg config:
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5VIRTUALKEYBOARD=y
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index c31d455c4e..3fefdc874d 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -16,7 +16,7 @@ QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
 
 QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
 ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
 
 ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (openwnn)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
