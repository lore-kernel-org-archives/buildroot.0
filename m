Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126E6C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 09:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F28F4012B;
	Sun,  4 Aug 2024 09:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCIxBiHP1ut4; Sun,  4 Aug 2024 09:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31168402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31168402E4;
	Sun,  4 Aug 2024 09:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B5801BF59E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 09:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68D8D605A2
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 09:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqQXqXg6dEMk for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 09:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F063360594
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F063360594
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F063360594
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 09:46:54 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-530ae4ef29dso9115707e87.3
 for <buildroot@buildroot.org>; Sun, 04 Aug 2024 02:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722764812; x=1723369612;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ealQQ/W+5UQL320nbMOCTOpLyh+OkbBVPsXRn+NJg/4=;
 b=hDJEwVuVEiIj837ws6FY+pHouxkX7A23h8Hh4hPTjKCuhw3pWigZWkHFU2lNhdvImA
 N6AuB6XWMHqxvbgwnfNN/0V+WLUmlP2XLQSAypmtNFRokSeycNSviEPbmrh8xFBcS3ww
 q+tpyKRlIVI3kvqQOL2v09JICb9qaeO6f+ppDfjznQ4y+hzmkQkWzBh4YaXN6ASPUr54
 LZu/vY32qTROOITHA+OKgcaCXBBQFnNHy8yO4zoBDtjqipbwBYG7FTX2P0nCpdvZoB9D
 gF11h7tM5Qr2xoAFC/jVTcMfy8Nae9eoRB5jzf31bBpTtUbYCBp6LWG4VQLLX1+Y5Lf4
 lKnA==
X-Gm-Message-State: AOJu0Yy3f7vb4wffOyTJ2kht54z55wwIYCwfRpKbPIDSn3NYtFNIaaH+
 aL4Tkl/1quqN+3iKe2PpNf3NF+nhXwYn0NivZJkU5B4ei3i8/g7DJE7kZvPT
X-Google-Smtp-Source: AGHT+IFH/itcc7Jkk39Bgo95KI4YJ2GUuB5lmNMCapJDegZw/zBVhzKM3S+Z+r2xIo8LdfyElCEyCw==
X-Received: by 2002:a05:6512:6d6:b0:52c:e17c:cd7b with SMTP id
 2adb3069b0e04-530bb3814a0mr7283701e87.22.1722764811630; 
 Sun, 04 Aug 2024 02:46:51 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba1102bsm742902e87.97.2024.08.04.02.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Aug 2024 02:46:51 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Aug 2024 11:46:47 +0200
Message-ID: <20240804094647.876936-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240804060003.735172-1-troglobit@gmail.com>
References: 
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722764812; x=1723369612; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ealQQ/W+5UQL320nbMOCTOpLyh+OkbBVPsXRn+NJg/4=;
 b=TB945cGAUiOlyx6U9bfgp7qy84oPrrmSHojYzaOQ0ojxhTeJgcq9IiGZMpfZpZhw8U
 GJMBbvmW+py8xiLcZRep/ub/UfkT76xOwIP+ERcy6PBb42jGnNjnQpTMF4uyjrVgq4kL
 j/guRnOfVkKUjz+hE4Rxuc2kqg4l1dbrGMrn8Mg/A6Gnzj7qIQy3D8OgU2/lnCVLfcTS
 MxqaIK7F9u4ZNUFCnHrdFzedS0moSS1/dBTu2MLYWVRqkN/Q2439cmHXkeW5xjp6PNm3
 bO+ujixwfbQlra9cMBaY1IC2Dt4rvb7BkKQsLTZ0PSP3es63V0WF3vy6U9W3VHjIFybJ
 OTLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TB945cGA
Subject: [Buildroot] [PATCH v2 1/1] package/spdlog: add menuconfig option to
 select formatter
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an option menu to select the spdlog formatter: external fmt library,
external using headers-only, C++20 std:format, or the bundled (version
matched) fmt library, which each release of spdlog is tested against.

The formatters are mutually exclusive (see the CMakeLists.txt[1] file),
selecting the 'internal' option disables all the other options in the
.mk file, thus "enabling" the bundled formatter.

For backwards compatibility, the Buildroot default remains using the
external fmt library.

[1]: https://github.com/gabime/spdlog/blob/5ebfc92/CMakeLists.txt#L95-L105

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/spdlog/Config.in | 31 ++++++++++++++++++++++++++++++-
 package/spdlog/spdlog.mk | 24 +++++++++++++++++++++---
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
index 877c1b6ab7..ee31fa7e7c 100644
--- a/package/spdlog/Config.in
+++ b/package/spdlog/Config.in
@@ -3,12 +3,41 @@ config BR2_PACKAGE_SPDLOG
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # fmt
-	select BR2_PACKAGE_FMT
 	help
 	  Very fast, header-only/compiled, C++ logging library.
 
 	  https://github.com/gabime/spdlog
 
+if BR2_PACKAGE_SPDLOG
+
+choice
+        prompt "Select text formatting library"
+        default BR2_PACKAGE_SPDLOG_FMT_EXTERNAL
+        help
+	  Select one of:
+	    - The external fmt library (default)
+	    - External fmt library in header-only mode
+	    - Bundled (version matched) fmt library
+	    - C++20 std::format
+
+config BR2_PACKAGE_SPDLOG_FMT_EXTERNAL
+        bool "external"
+	select BR2_PACKAGE_FMT
+
+config BR2_PACKAGE_SPDLOG_FMT_EXTERNAL_HO
+        bool "external (header-only)"
+	select BR2_PACKAGE_FMT
+
+config BR2_PACKAGE_SPDLOG_FMT_INTERNAL
+        bool "internal"
+
+config BR2_PACKAGE_SPDLOG_FMT_STD
+        bool "std:format"
+
+endchoice
+
+endif
+
 comment "spdlog needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 6b24357697..71ad64c923 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -9,12 +9,30 @@ SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
 SPDLOG_INSTALL_STAGING = YES
-SPDLOG_DEPENDENCIES = fmt
 SPDLOG_CONF_OPTS += \
 	-DSPDLOG_BUILD_TESTS=OFF \
 	-DSPDLOG_BUILD_EXAMPLE=OFF \
-	-DSPDLOG_BUILD_BENCH=OFF \
-	-DSPDLOG_FMT_EXTERNAL=ON
+	-DSPDLOG_BUILD_BENCH=OFF
+
+ifeq ($(BR2_PACKAGE_SPDLOG_FMT_EXTERNAL),y)
+SPDLOG_CONF_OPTS += -DSPDLOG_FMT_EXTERNAL=ON
+SPDLOG_DEPENDENCIES = fmt
+else
+SPDLOG_CONF_OPTS += -DSPDLOG_FMT_EXTERNAL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SPDLOG_FMT_EXTERNAL_HO),y)
+SPDLOG_CONF_OPTS += -DSPDLOG_FMT_EXTERNAL_HO=ON
+SPDLOG_DEPENDENCIES = fmt
+else
+SPDLOG_CONF_OPTS += -DSPDLOG_FMT_EXTERNAL_HO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SPDLOG_FMT_STD),y)
+SPDLOG_CONF_OPTS += -DSPDLOG_USE_STD_FORMAT=ON
+else
+SPDLOG_CONF_OPTS += -DSPDLOG_USE_STD_FORMAT=OFF
+endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=OFF
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
