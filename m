Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B9FC54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 09:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4F1860705;
	Sun, 17 Mar 2024 09:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IoX5D2OeYDHA; Sun, 17 Mar 2024 09:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B08D060731
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B08D060731;
	Sun, 17 Mar 2024 09:41:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57FE71BF5DA
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 09:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 444FF60731
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 09:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sv_ttB3eJeFC for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 09:40:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAD4160705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD4160705
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAD4160705
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 09:40:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41409fd8b6eso7084225e9.2
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 02:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710668455; x=1711273255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQi8nvf3RaAxhorOv/5DU5UmvFmx+VHSMIyFpgg+93E=;
 b=M6ktku9dMrkMJcYKSK0Ukm8EuIYrNSfFpiwOB/a5Xi460OwS3oS2ZUYHisF6ZJxqjI
 cUJZQizRKaVYejmQxs/dfvcHo5y0WiTKyNtGDLlpxY89xt9NdGMq8Jb0HERlcPVW9T/e
 dmcwSQRcw+95sjxgygYDhvsy0HZ7FosmCa42oDpgafCOiUuF+G5pRIWhR84a3Xf5FOku
 neKjpau7HwJKqi1X7/yXS2If5Mrrk+wJaVAkWsmXq5B5SDnXCyPEb6HwMMWn/CWJ69xv
 fwK3kZKOMju2YaJoJ8mifVXV21ZIXsb8bk3wDRmYkVMbk2taxaoKSkeGcHfVwtVKvg1f
 4p1w==
X-Gm-Message-State: AOJu0YxQE2XnrBDvcwNYvXTVMmFctU2Or3qIkacEGFNWJS7TI2I/9mrH
 y3etlorNzTX6vBUDkB07Mv0n6rptdmasm1BSYYiepMsEzG5dWLeB2imPhOsB
X-Google-Smtp-Source: AGHT+IH/JeJnKePuALNt/VB+n1CCL40i2pFWTbjkoXoFOuml0Eu0hOQNZ/2wWsKvGbghi3cq3Ohqkg==
X-Received: by 2002:a05:600c:4e8e:b0:414:286:fd21 with SMTP id
 f14-20020a05600c4e8e00b004140286fd21mr3194902wmq.28.1710668454664; 
 Sun, 17 Mar 2024 02:40:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b004140e701884sm691588wmq.22.2024.03.17.02.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 02:40:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 10:40:37 +0100
Message-ID: <20240317094037.41936-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710668455; x=1711273255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OQi8nvf3RaAxhorOv/5DU5UmvFmx+VHSMIyFpgg+93E=;
 b=E5vYmmGy0LVtFVsxXbJXW1famxH3kEJGYf8kc66dieyYx7PfvP0BtVoe/QyNvmE4E8
 HH9RXeV8s/7dTxy+dK4F+ZpLmxgBXeEM7//C7a8QMCihHo2B/WjTvtbFyCUAIID7zGIr
 SjPuwrryRTeFoiAsuhWMyKtTk+8iY5DH0dXAzewTLRQI6/LGlIpeX0zADIjMrv4iRBSa
 Kc8xkfogrxny38m0mjvQjyp07T0Wjs1SvesxLJqz2jJ3lrD+/RCDBVhd08vHa8J4CXTb
 g70R4y56df3egNNTms35kGWVAJyqMp27UE3GHfmJvQJOQw+3JfVeyHar3eNoYtpl3AVB
 Wcow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E5vYmmGy
Subject: [Buildroot] [PATCH 1/1] package/poco: needs C++17
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

poco needs C++17 and gcc >=8 since bump to version 1.13.2 in commit
433c4fd38b15efcf74b410e5068e2e51eeba6e46 and
https://github.com/pocoproject/poco/commit/78234857bf416b718455496800d1b7be3a0d0a53
https://github.com/pocoproject/poco/commit/10f41c06d9416a6ae0884c4827ea2a91bf5d2cf8
resulting in the following build failure with gcc 7:

In file included from src/Thread.cpp:28:0:
src/Thread_POSIX.cpp: In member function 'void Poco::ThreadImpl::setNameImpl(const string&)':
src/Thread_POSIX.cpp:162:56: error: no matching function for call to 'std::__cxx11::basic_string<char>::append(const string&, std::__cxx11::basic_string<char>::size_type)'
   truncName.append(threadName, threadName.size() - half);
                                                        ^

Fixes: 433c4fd38b15efcf74b410e5068e2e51eeba6e46
 - http://autobuild.buildroot.org/results/7b1c144f39a8be4ce8f964aa13a52d0bf62dd0aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poco/Config.in | 6 +++---
 package/poco/poco.mk   | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 7cb9987ec7..9bdef125ad 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
@@ -116,8 +116,8 @@ config BR2_PACKAGE_POCO_ZIP
 
 endif # BR2_PACKAGE_POCO
 
-comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 5 w/ C++14"
+comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 8"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index cc8a22fc2a..233252c67b 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -68,7 +68,6 @@ define POCO_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
 		--config=Linux \
 		--prefix=/usr \
-		--cflags=-std=c++14 \
 		--ldflags="$(POCO_LDFLAGS)" \
 		--omit="$(POCO_OMIT)" \
 		$(POCO_CONF_OPTS) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
