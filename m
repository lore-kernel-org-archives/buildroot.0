Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37332C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 04:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 818C3402AD;
	Sun, 16 Jan 2022 04:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iE9W6HtL4_qc; Sun, 16 Jan 2022 04:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A2374029D;
	Sun, 16 Jan 2022 04:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8673A1BF30B
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 04:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F965401AD
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 04:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63QHWYiKSyy4 for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 04:05:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D2F0400F8
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 04:05:30 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id x10so5292091ilq.7
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P41Vhh0u1lZ6ZFiixWI5ZuexwYAWrEk4i7m9vN8qkN0=;
 b=dT6Vs5vgmdzAu3j9ncdKh2S6NgGs/DQpJE2uY4dJbxL6EXSDBTITzPif054eGLid21
 OSS0g2v00/sR29taNLHOIi35FIUWnSktNFTynyukN53ApYfvY7UBUcsXiz3QU0HOQl1M
 1+tkqs2ZSSDIzp+/VGw9ptoJN7xshm78C7/4v6sUMu8CLSqzu27Uhh7W3vTyO7PFobeW
 5WeHbwV5ubjfA4Vjfv0w0oyQ8zzL9SOubexYpTkZ9sAVEcq9Mw6YCmxUbk2XVqNLEv9I
 Ss9EDXNAbHVVELlcAcHD5AgSmnitqrvO9UMZBSbNAqLMsizq/AInrcqe37xXHxZfoV7B
 1h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P41Vhh0u1lZ6ZFiixWI5ZuexwYAWrEk4i7m9vN8qkN0=;
 b=vBlOxeyMHP75MXShCrTH+RQaRhzP93PHcnJalXcEblCp8fVHL6uS9FSWwwSvAVKpOq
 6uUWhexH8pf+v7+wZ6yhBPbbBqs6GQCchY2d8KLFERnlKjjWTdjiI2vQWchNWee/Z3i3
 yyNswY8DQyIpQBVtpkbqlWgKQg45Fa26nQ+T7WKCy4VJXC1gsGwi7iroo8iAf/UHSu7v
 pw4pAa95Yu4Xag0jOXUWeDc+QMFf2pbc5xDZAMOvIC0ZVVZSuQn8WaU2drvKdFXyTnxf
 rLBd32iKujLMUuiB4xJOT8KBJ7oHSGUUyQxq2H2k9nD82hBgFWqGFrJIDWen2UpVkIh/
 DEKA==
X-Gm-Message-State: AOAM531heyAkiJLJCVH32268mOOfN0eCuCq5m22WjbOBf2H96x42OuTg
 M83KBVHPpVoEhNg0t1EJK3ISv4v6dSg=
X-Google-Smtp-Source: ABdhPJykKDz1hO3GUbf7bZFhdeAc/fQgam4fL1ppp1/tcIbF82UVw0DG84RQgDhc8BkY7/3qPHrl4Q==
X-Received: by 2002:a05:6e02:1946:: with SMTP id
 x6mr8091766ilu.10.1642305928932; 
 Sat, 15 Jan 2022 20:05:28 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id x5sm2878807ilc.74.2022.01.15.20.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 20:05:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 21:05:25 -0700
Message-Id: <20220116040525.3007767-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webengine: fix build with
 glibc 2.34
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...m-breakpad-fix-build-with-glibc-2.34.patch | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch

diff --git a/package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch b/package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch
new file mode 100644
index 0000000000..44a6424c7d
--- /dev/null
+++ b/package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch
@@ -0,0 +1,76 @@
+From a3bc792bdc116806a50e022d9102914c8daf6210 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 4 Aug 2021 19:11:06 +0200
+Subject: [PATCH] chromium: breakpad: fix build with glibc-2.34
+
+* fixes:
+[218/24061] CXX obj/third_party/breakpad/client/exception_handler.o
+FAILED: obj/third_party/breakpad/client/exception_handler.o
+/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/qtwebengine/5.15.4+gitAUTOINC+dd7f7a9166_555f348ae8-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/x86_64-webos-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wdate-time --sysroot=/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/qtwebengine/5.15.4+gitAUTOINC+dd7f7a9166_555f348ae8-r0/recipe-sysroot -MMD -MF obj/third_party/breakpad/client/exception_handler.o.d -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -DCR_SYSROOT_HASH=5f64b417e1018dcf8fcc81dc2714e0f264b9b911 -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -I../../../../git/src/3rdparty/chromium/third_party/breakpad -I../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src -I../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client -I../../../../git/
 src/3rdparty/chromium/third_party/breakpad/breakpad/src/third_party/linux/include -Igen -I../../../../git/src/3rdparty/chromium -I../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe -pthread -m64 -O2 -fno-ident -fdata-sections -ffunction-sections -fno-omit-frame-pointer -g1 -fvisibility=hidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments -Wno-packed-not-aligned -Wno-dangling-else -Wno-missing-field-initializers -Wno-unused-parameter -std=gnu++14 -fno-exceptions -fno-rtti --sysroot=../../../../recipe-sysroot -fvisibility-inlines-hidden -Wno-narrowing -Wno-class-memaccess -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -Wno-invalid-offsetof -Wno-return-type -Wno-deprecated-copy -c ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad
 /src/client/linux/handler/exception_handler.cc -o obj/third_party/breakpad/client/exception_handler.o
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc: In function 'void google_breakpad::{anonymous}::InstallAlternateStackLocked()':
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: error: no matching function for call to 'max(int, long int)'
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+In file included from ../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/char_traits.h:39,
+                 from ../../../../recipe-sysroot/usr/include/c++/11.2.0/string:40,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.h:38,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:66:
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algobase.h:254:5: note: candidate: 'template<class _Tp> constexpr const _Tp& std::max(const _Tp&, const _Tp&)'
+  254 |     max(const _Tp& __a, const _Tp& __b)
+      |     ^~~
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algobase.h:254:5: note:   template argument deduction/substitution failed:
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: note:   deduced conflicting types for parameter 'const _Tp' ('int' and 'long int')
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+In file included from ../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/char_traits.h:39,
+                 from ../../../../recipe-sysroot/usr/include/c++/11.2.0/string:40,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.h:38,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:66:
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algobase.h:300:5: note: candidate: 'template<class _Tp, class _Compare> constexpr const _Tp& std::max(const _Tp&, const _Tp&, _Compare)'
+  300 |     max(const _Tp& __a, const _Tp& __b, _Compare __comp)
+      |     ^~~
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algobase.h:300:5: note:   template argument deduction/substitution failed:
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: note:   deduced conflicting types for parameter 'const _Tp' ('int' and 'long int')
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+In file included from ../../../../recipe-sysroot/usr/include/c++/11.2.0/algorithm:62,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:85:
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algo.h:3461:5: note: candidate: 'template<class _Tp> constexpr _Tp std::max(std::initializer_list<_Tp>)'
+ 3461 |     max(initializer_list<_Tp> __l)
+      |     ^~~
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algo.h:3461:5: note:   template argument deduction/substitution failed:
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: note:   mismatched types 'std::initializer_list<_Tp>' and 'int'
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+In file included from ../../../../recipe-sysroot/usr/include/c++/11.2.0/algorithm:62,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:85:
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algo.h:3467:5: note: candidate: 'template<class _Tp, class _Compare> constexpr _Tp std::max(std::initializer_list<_Tp>, _Compare)'
+ 3467 |     max(initializer_list<_Tp> __l, _Compare __comp)
+      |     ^~~
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algo.h:3467:5: note:   template argument deduction/substitution failed:
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: note:   mismatched types 'std::initializer_list<_Tp>' and 'int'
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+
+Adapted from:
+https://github.com/meta-qt5/meta-qt5/blob/2a38fca150f065f869ed530fffe1a07beec80692/recipes-qt/qt5/qtwebengine/chromium/0013-chromium-breakpad-fix-build-with-glibc-2.34.patch
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ .../breakpad/src/client/linux/handler/exception_handler.cc      | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc b/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc
+index ca353c40997..2e43ba6fc04 100644
+--- a/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc
++++ b/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc
+@@ -138,7 +138,7 @@ void InstallAlternateStackLocked() {
+   // SIGSTKSZ may be too small to prevent the signal handlers from overrunning
+   // the alternative stack. Ensure that the size of the alternative stack is
+   // large enough.
+-  static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
++  static const unsigned kSigStackSize = std::max<size_t>(16384, SIGSTKSZ);
+ 
+   // Only set an alternative stack if there isn't already one, or if the current
+   // one is too small.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
