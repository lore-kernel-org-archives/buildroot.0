Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F385C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 15:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD4260FD8
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 15:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CD4260FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9D9837C0;
	Sat,  7 Aug 2021 15:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRB7SxFQfE-X; Sat,  7 Aug 2021 15:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A82835C4;
	Sat,  7 Aug 2021 15:59:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E9C71BF28E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 15:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2620F40373
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 15:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8FpGIiYK9Co for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 15:59:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 180DA4028B
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 15:59:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id x17so7536903wmc.5
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=caVzZ5i9izQmw0nTtvYBiirJdKvPTLx/FNxijnfQmMo=;
 b=dgqOz9HqWMW7DgYIIe8ME7Oq4SPAtPFV0hJD/WU+z+HNCfPM98mHEvbr4IJGSZw0qQ
 GLs5hHI1eN4IcYYQwTgTANZnfSTfEjm9tiBD43V0ErAgDs2q7DHVbv2nc1Ak7QTJ3c7k
 OkPxC/Ya+6HIi5G/7pRJWFOTatdbSXqrAbAewpMFBQFm3PQ3g/iGiCpiFDpdBkNmMjTJ
 T8VDvhkLHIQlhApmb3zjWxt1IFO/71p4t/OAmNuXvR0vtHhraMp6sXzkk9TPVCifSKJx
 mcUyUyl1WamLGhJ3VlHMcyIzXPV8lsr9UtJdczJVMMaxvbPvx0Rrj96a7oUdy10Uxz4D
 DBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=caVzZ5i9izQmw0nTtvYBiirJdKvPTLx/FNxijnfQmMo=;
 b=B/rBUEeXeBnIxl7GN3R0om4z+IG9i4iOpTc1yQmkezEsEG5OAn+zl18/oLgwLtbfdZ
 +z5kgAjBcHSCUgRKM+wD9pfok5QkHNLYKnEWvcVuyi7jp9lMrlvojwGmH2BcOUMJoBHD
 iw+2jMf6puBRT/E7EJ7e56rxx9ujmWxpBiaRdO4VQBYs4UUt0TpwTKfC8Jo5dYTkUQxQ
 aNKJfYBCgKxD+gY+tB7Vf0mgMaGOKgtoZshJF9NNLj59pSR67z05WEnZDGaZIB95ngUP
 /wXLrMM+NH077NyNze5Y2ju+s2aM5OMUmvIW7hQBSti89ghYbyXbp3jrx5BAWAcSXM9B
 GksA==
X-Gm-Message-State: AOAM5300VbBJ80hDBIdHLrZPQZ5jONF0okhkyWklkaqw8FJty4davYQ3
 QS5U/hk778uJ/lwCO3Oba7/CGPgSwyU2yQ==
X-Google-Smtp-Source: ABdhPJykwLhecMUu76SC5cZZUgQ6TOkduD7Gh5eB1RK64AtG5m/zN7/GQ8VZX3KsDbYxyYZ2CO1ZaQ==
X-Received: by 2002:a1c:20ce:: with SMTP id g197mr25851713wmg.46.1628351948913; 
 Sat, 07 Aug 2021 08:59:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id h16sm13340023wre.52.2021.08.07.08.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 08:59:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 17:57:04 +0200
Message-Id: <20210807155704.488812-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ogre: fix build on musl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure on musl raised since the addition of the
package in commit eb91fa730c5d92202c38514345e86315e138944c:

/tmp/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp: In static member function 'static bool Ogre::StringConverter::parse(const String&, Ogre::int32&)':
/tmp/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp:253:22: error: 'strtol_l' was not declared in this scope; did you mean 'strtold_l'?
  253 |         ret = (int32)strtol_l(val.c_str(), &end, 0, _numLocale);
      |                      ^~~~~~~~
      |                      strtold_l

Fixes:
 - http://autobuild.buildroot.org/results/491f89e45610a7752c0700ac02b80a92b7876ec3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-Checks-for-strtol_l-function.patch   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/ogre/0002-Checks-for-strtol_l-function.patch

diff --git a/package/ogre/0002-Checks-for-strtol_l-function.patch b/package/ogre/0002-Checks-for-strtol_l-function.patch
new file mode 100644
index 0000000000..540530ee9e
--- /dev/null
+++ b/package/ogre/0002-Checks-for-strtol_l-function.patch
@@ -0,0 +1,71 @@
+From 3f182b7e743662ec3fa63e1c7f213171d99485ba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Feb 2020 21:45:58 +0100
+Subject: [PATCH] Checks for strtol_l function
+
+strtol_l (and strtoul_l, strtoll_l, strtoull_l) are not always available
+(for example on musl) so check for strtol_l and reuse android fallback if
+needed to avoid the following build failure:
+
+/home/buildroot/autobuild/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp: In static member function 'static bool Ogre::StringConverter::parse(const String&, Ogre::int32&)':
+/home/buildroot/autobuild/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp:253:22: error: 'strtol_l' was not declared in this scope
+         ret = (int32)strtol_l(val.c_str(), &end, 0, _numLocale);
+                      ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/107cffe41081ce46441dec8699d6ad0f152bc152
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/OGRECave/ogre/commit/3f182b7e743662ec3fa63e1c7f213171d99485ba]
+---
+ CMake/ConfigureBuild.cmake             | 7 +++++++
+ CMake/Templates/OgreBuildSettings.h.in | 2 ++
+ OgreMain/include/OgreString.h          | 3 +++
+ 3 files changed, 12 insertions(+)
+
+diff --git a/CMake/ConfigureBuild.cmake b/CMake/ConfigureBuild.cmake
+index ab049a525ae..73606c997c1 100644
+--- a/CMake/ConfigureBuild.cmake
++++ b/CMake/ConfigureBuild.cmake
+@@ -133,6 +133,13 @@ if(SDL2_FOUND OR EMSCRIPTEN)
+     set(OGRE_BITES_HAVE_SDL 1)
+ endif()
+ 
++# determine if strtol_l is supported
++include(CheckFunctionExists)
++CHECK_FUNCTION_EXISTS(strtol_l HAVE_STRTOL_L)
++if (NOT HAVE_STRTOL_L)
++  set(OGRE_NO_LOCALE_STRCONVERT 1)
++endif ()
++
+ # generate OgreBuildSettings.h
+ configure_file(${OGRE_TEMPLATES_DIR}/OgreComponents.h.in ${PROJECT_BINARY_DIR}/include/OgreComponents.h @ONLY)
+ configure_file(${OGRE_TEMPLATES_DIR}/OgreBuildSettings.h.in ${PROJECT_BINARY_DIR}/include/OgreBuildSettings.h @ONLY)
+diff --git a/CMake/Templates/OgreBuildSettings.h.in b/CMake/Templates/OgreBuildSettings.h.in
+index a491d09624c..95eb1b71d64 100644
+--- a/CMake/Templates/OgreBuildSettings.h.in
++++ b/CMake/Templates/OgreBuildSettings.h.in
+@@ -107,4 +107,6 @@ WARNING: Disabling this will make the samples unusable.
+ 
+ #cmakedefine01 OGRE_NO_QUAD_BUFFER_STEREO
+ 
++#cmakedefine01 OGRE_NO_LOCALE_STRCONVERT
++
+ #endif
+diff --git a/OgreMain/include/OgreString.h b/OgreMain/include/OgreString.h
+index a81c220012e..1f544195dee 100644
+--- a/OgreMain/include/OgreString.h
++++ b/OgreMain/include/OgreString.h
+@@ -46,8 +46,11 @@ THE SOFTWARE.
+ #   define strnicmp strncasecmp
+ #endif
+ 
++#if OGRE_PLATFORM == OGRE_PLATFORM_ANDROID || OGRE_PLATFORM == OGRE_PLATFORM_EMSCRIPTEN || \
++	(OGRE_PLATFORM == OGRE_PLATFORM_LINUX && OGRE_NO_LOCALE_STRCONVERT == 1)
+ #if OGRE_PLATFORM == OGRE_PLATFORM_ANDROID || OGRE_PLATFORM == OGRE_PLATFORM_EMSCRIPTEN
+ #   define locale_t int
++#endif
+ #   define strtod_l(ptr, end, l) strtod(ptr, end)
+ #   define strtoul_l(ptr, end, base, l) strtoul(ptr, end, base)
+ #   define strtol_l(ptr, end, base, l) strtol(ptr, end, base)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
