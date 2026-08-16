Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69505C5DF7A
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0822B80E05;
	Sun, 16 Aug 2026 19:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtKnghCZZ07L; Sun, 16 Aug 2026 19:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 064EC80DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907883;
	bh=XY5KGZsVUWisffC2F3oRW79LJQB0lHVkDFmfGX2v47E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fkHFNzYJx6bwLUA1PdGt6cCxTuSjbjq1q2oRWhieAjDFobjqRHxnvSsPxLNl4hfbN
	 SaqKOreIRnLeefvCJ6nOVtm1fCoDNV+8p30Bo6j3ZJeHPzid22PEdt1zXJ8G/Mqe81
	 u5ZOwDOZANLXw68CA467OC5doc7RV7Dvui6ojn46yBV71z88LXfvBABfz4h/Xb04n2
	 YZ2gGO94R6YjjsK/I8jC5LuzkQSfLYZlzpy3QW6X/KtBLycsnr4GtHeqfcyIuYbBjR
	 pi/hdG1o5gsFKFG+1bR79AbgcS7OzOcsDIoHgFigABahYGun4nI9MXchrz8x05qhkl
	 QQJb6HRFi9yCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064EC80DF8;
	Sun, 16 Aug 2026 19:18:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77808194
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6791280DB3
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvXQ9MSHvc5C for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 935AB80DA2
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 935AB80DA2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SNK106bJ
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 935AB80DA2
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:59 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-934956bee57so278913185a.2
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907878; x=1787512678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=syAAjNLWmbR+BudNQozsFryFzqZb03HaQDKtpVfimew=;
 b=SNK106bJnUItyZzJHXzdOV2gbnTyopQJJetawpEXKRBmlBBS2RCRg84rCvVwmlNwMQ
 Ew0WhZ2anLvjWrt3RLip0HY76wA/LSZ2jpdiGCQtNyeUKxm4OqU7as3hYGzp3FG6mA/h
 rKahVOQrTgmP7+pyYWzzllZW8DWdkQullCraaZXB6DcvRSsnajbYEEr3bcsY5RUC7LrC
 q7vyGcsbv10TzmGFITeufwHqQy+hUYd6/q/4H7gfuinka0TnENqGeUlwR0Qo2cbfBmop
 yDlzv9nUg+wItzL4bBUfXSvieD7oV5zUou/ka3kMEh3J+RRM136YfCW2crGIcdH0dQYn
 foxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907878; x=1787512678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=syAAjNLWmbR+BudNQozsFryFzqZb03HaQDKtpVfimew=;
 b=iSLRpvRKmbAhIpjxt2d82UtOeFnaqzuuUNzVtUkwx38FVy1eBu40Vj2JIn4meJoXqE
 2B8ULsz7/+PVbJHNc8vWrFkOjYBa2rcr9yVLZZlQ8ICYMuN9Cql8yYowJwdAuWMbG5JX
 hvO39l/f3ZDl15Q2XeU3mUzyj6+1yyUs0LIMErbCweqNNMo1lX1Jj+RwpHtObn0KA+0p
 mxFm65puBXPHikehqP35M13ick+JIaWdJ1q8AUxLEqbfM1gLnyXx4vLtE+mAvaWBrErD
 jYlNm91MzFeMtE3ihfzuuWiXWIGPNWn3rtgO2NFWRBqTwMdeMuQqZhonD91hFbiPM9Ld
 3udQ==
X-Gm-Message-State: AOJu0YyBEy5DMIbELUH9DrCp6qS5WFc1LbeYXgwD/q9543cI9ofUkYz+
 aR+J0nC1vbYW0zHS89SABTGt91L+PDaWZ5HeeeHJJL3f0g/MwlKAs8B5ZjjIhw==
X-Gm-Gg: AR+sD11J8OlfOTWeFrcJYTxrxdSp1d4QtGzSjMv/zI4BLAdAg+cqbjgri4gu2W7xBT/
 5czgCjK917MAPG0ho4QeNTFwuVw89u+feQTT5EZMLuypP3Ae1XuAdekrz6vx2POljqkKOn5Qq49
 UIPEtlDsy+fNgVj10ZniNJxL/1GEO/Ze9k0v6YMyhy1SQEfYKEweD8aJCLd8bQYW4xYra3x2VIF
 Rzc4yDyJQxwtdTSjxOGvvJrcYzIEtS5m5DtIAIpOlmOuVfjObHCjcsua3k3ORj+tPiFn6EO5P+N
 izAe1woUq+NInQvAewTfrB3OKSfZBymeC0DFNiveItHL0vDmVz7orONvG+jJ4qFrNT5qam4n6sp
 25LTu8w8Z00g9mel3vcQAZPcJp5i/Lh3SsEfL/sdv73SHX7fZPx0oAFj4pNLj4ssNlGbBPMv53W
 5ZdRLOGoZmAkpM2tFxUvBfFolXpM0LQ87oWV8TAMsufPqed5Qm4ij425fEDQQDLB67QpBue4Ye7
 DOAUpJSCZFdJbM=
X-Received: by 2002:a05:620a:72ac:b0:930:fa5b:6ee8 with SMTP id
 af79cd13be357-936d23ae0b9mr1629559085a.45.1786907878105; 
 Sun, 16 Aug 2026 12:17:58 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:17:57 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:25 -0400
Message-ID: <20260816191830.533747-4-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816191830.533747-1-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/8] package/sdl3: add ALSA and test program
 options, follow dbus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SDL_ALSA had no option at all, so whether the ALSA audio driver was
built depended on what SDL's own detection found in the sysroot when it
happened to configure. Add BR2_PACKAGE_SDL3_ALSA and pass
SDL_ALSA_SHARED=OFF with it, so libasound is linked rather than
dlopen()ed - a dlopen leaves nothing in the ELF, and the library is then
absent from the target unless something else pulls it in.

SDL_DBUS was off unconditionally, which loses screensaver inhibition and
the D-Bus parts of the Wayland backend; make it follow BR2_PACKAGE_DBUS.

Add BR2_PACKAGE_SDL3_TESTS for the test programs, which are useful for
checking the video and audio drivers on the target.

Finally, name the backends that were left unset - OSS, JACK, sndio,
PipeWire, RPI - and turn the examples off. SDL probes for each of these
and builds against whatever it finds, so leaving them out makes the
result depend on which unrelated packages are enabled.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/sdl3/Config.in | 15 +++++++++++++++
 package/sdl3/sdl3.mk   | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/package/sdl3/Config.in b/package/sdl3/Config.in
index 7bce4ceaba..ed43879862 100644
--- a/package/sdl3/Config.in
+++ b/package/sdl3/Config.in
@@ -75,6 +75,21 @@ config BR2_PACKAGE_SDL3_OPENGLES
 comment "OpenGL ES support needs an OpenGL ES provider"
 	depends on !BR2_PACKAGE_HAS_LIBGLES
 
+config BR2_PACKAGE_SDL3_ALSA
+	bool "ALSA audio"
+	depends on BR2_PACKAGE_ALSA_LIB
+	help
+	  Enable the ALSA audio driver.
+
+comment "ALSA audio needs alsa-lib"
+	depends on !BR2_PACKAGE_ALSA_LIB
+
+config BR2_PACKAGE_SDL3_TESTS
+	bool "build test programs"
+	help
+	  Build and install the SDL3 test programs, which are useful
+	  for checking the video and audio drivers on the target.
+
 endif
 
 comment "sdl3 needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
index ecbcbf4bc2..7c92ee9bc8 100644
--- a/package/sdl3/sdl3.mk
+++ b/package/sdl3/sdl3.mk
@@ -13,23 +13,59 @@ SDL3_CPE_ID_VENDOR = libsdl
 SDL3_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL3_INSTALL_STAGING = YES
 
+SDL3_DEPENDENCIES = host-pkgconf
+
+# The audio and video backends this does not have a Buildroot option for are
+# named explicitly rather than left out: SDL probes for each of them and
+# builds against whatever it happens to find in the sysroot, so an unlisted
+# backend makes the result depend on which other packages are enabled.
 SDL3_CONF_OPTS = \
-	-DSDL_DBUS=OFF \
 	-DSDL_DUMMYVIDEO=OFF \
+	-DSDL_EXAMPLES=OFF \
 	-DSDL_HIDAPI=OFF \
 	-DSDL_IBUS=OFF \
 	-DSDL_INSTALL_DOCS=OFF \
+	-DSDL_JACK=OFF \
 	-DSDL_JOYSTICK_MFI=OFF \
 	-DSDL_JOYSTICK_VIRTUAL=OFF \
 	-DSDL_OFFSCREEN=OFF \
+	-DSDL_OSS=OFF \
+	-DSDL_PIPEWIRE=OFF \
 	-DSDL_PULSEAUDIO=OFF \
 	-DSDL_RENDER_D3D=OFF \
 	-DSDL_RPATH=OFF \
+	-DSDL_RPI=OFF \
+	-DSDL_SNDIO=OFF \
 	-DSDL_STATIC=ON \
 	-DSDL_UNIX_CONSOLE_BUILD=ON \
 	-DSDL_VIVANTE=OFF \
 	-DSDL_VULKAN=OFF
 
+ifeq ($(BR2_PACKAGE_SDL3_ALSA),y)
+SDL3_DEPENDENCIES += alsa-lib
+# SDL_ALSA_SHARED makes SDL dlopen() libasound at runtime rather than link it,
+# which leaves nothing in the ELF for Buildroot to see and the library absent
+# from the target unless something else pulls it in.
+SDL3_CONF_OPTS += -DSDL_ALSA=ON -DSDL_ALSA_SHARED=OFF
+else
+SDL3_CONF_OPTS += -DSDL_ALSA=OFF
+endif
+
+# SDL uses D-Bus for screensaver inhibition and for parts of the Wayland
+# backend, so it follows dbus rather than being off unconditionally.
+ifeq ($(BR2_PACKAGE_DBUS),y)
+SDL3_DEPENDENCIES += dbus
+SDL3_CONF_OPTS += -DSDL_DBUS=ON
+else
+SDL3_CONF_OPTS += -DSDL_DBUS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SDL3_TESTS),y)
+SDL3_CONF_OPTS += -DSDL_TESTS=ON
+else
+SDL3_CONF_OPTS += -DSDL_TESTS=OFF
+endif
+
 # SDL3 fails to build in Thumb mode on some ARM architectures
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 SDL3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
