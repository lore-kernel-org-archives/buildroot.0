Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BCDC5DF9D
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 376384065D;
	Mon, 24 Aug 2026 06:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laYI3VKMquy6; Mon, 24 Aug 2026 06:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787553539;
	bh=Fov7BEQ1J8aD6vbgfoEMINiBH5vvb4iqfF5+hDltAIE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlG/vEJgmKPffK8UOHqMHQTq51vMqqKURbsy5mvRj8zoZW1f/s0u0MJAhXbMyADAO
	 Uu3aVgi30pIQQkXNuw6lOhvzn+G1A6Me9Awu8c79PIYGZSS8f3fPE881d7S6Npe7FB
	 FFoNvuA816kmJ7a49DlSfvLAkZKc00UdgmO8DFGAZ8UWVBlSniKblYm6n9RexbhcjD
	 O9aFrzH7p49Yd7NtEuQyRx+EyQy85fKBMOtiUPGIgIcRDjMcmMUTvFXvHacVK/OS0c
	 C/CZegMclD2QIfkjhB/19YPKgtaIM91P4rFu3iYMOCNBTAyT/JzH4Wus1JGIKr84KS
	 POatM1GZAKpTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F75F4067A;
	Mon, 24 Aug 2026 06:38:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F99C42B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 264C0400AE
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68ZJ_Y0PfjTb for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:38:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=P16SHbh8
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D62F8400E5
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c15e2dab83eso581752666b.1
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1787553533; x=1788158333;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z0fo/RNfK2oKhqirw3tPOLb2wLDai/xzgIGNqjv1/hA=;
 b=P16SHbh8kgg/uSUA+vdK+Sm8IFHXMEnPJ2ilkHbUOaemaCziEne7hIsR8Kwx4/5DOn
 FOjaa03mENjQok44lEqFVA0IgmL9hy+8QOP6lLPaD2u7t3jV/mTpHuiA9g0yEZzRNeJu
 b3C4d9UxvuP1tVFpQFIHVDK45ibGqqbVrT2lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787553533; x=1788158333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z0fo/RNfK2oKhqirw3tPOLb2wLDai/xzgIGNqjv1/hA=;
 b=X4j/nOcvfy1rMXokH9oxP0nPGr0mmNJCipOPBlt8jsO1f3Jhe9HSNwautSGru/aHin
 P81hDc6TLRSYBE6pTobD9NeBUGuc1v6q/xYMRtNFPL9xRm+4sTjFAvIYxJnO0ltj3Dd5
 TPUZ2TqBcFYc+OdiMAo2piKnfqkOsFk5+VVWuGkaLUmd9TGlF6IR1k81i+7i36NjYo5+
 9U6Dc8BpLJOU/zKQ5tGns+74+XvTQgiKIA0CRjW54+mBeznwqzJmd4gnvFIDYt7i4y1u
 6LGAvEuLzCTnM7eZcaBrPERm6S6T3bmmRSlOGhkjYY2T1gUNNzVPBHsaHftg6WydMxkP
 qK1Q==
X-Gm-Message-State: AFuF++kxajNUpNT2rHWsv2jzMmgFg/eR3wbUum7RoI/U20XRAMkzR4vm
 uus3NzQaxG8NpDy0CZXwMqSyFSgm83jQd1ndFTk9YEfUVCpQqK/tQgOahRMSaINAO9D3/j5sNBn
 OpLTEE7M=
X-Gm-Gg: AR+sD11QWIpFws0pMMCyO37+fL+XS1Efe0h010o74DnfagYDe8D0w6Tn0y0ldI40Su7
 k/UgD3tFqtOR27AiRWPYBsVVSoqiHBXc88T5C50xNBYyjIOyjWaEps6QHS8lMoKwl259O9VGGsg
 w4GjkM2bBfUltTLTLPERRWV/Gf0H9FvC979X9l8qEzt+pzZNeaa2hDAjS3e70LkScG5PFy6VRcm
 K+NHQSnewS0vNrQjheGNbVyBCrUBThLjVdMI3YdSuiiFRRPzHMke5YlBC9K5GvawOmacmKCnM+R
 PeuPsS35RH7/IPp6h6ohXJWakd37ClHBBif4u2WvgJ86r4/IJ9KDa/Fb/J8IgUV8Pfv21yJeoW0
 1q6ZcHHIohqHi+OiLrvxiUksneNt+U8J1gGhcTBW8U3FNWsIfx/zSk9cOTxf3Lr9KTv7AZJjCwH
 Riq9VGDjB4u547E2YDDeJVJeySrjgj0bIH2PJYuyslN0ERvoBwt3eV4p6lJ9MNTb2rwsDCm/3E0
 sM4LYR3JP/dS0a57bd2rqkHUBs3eDVoaKotqoPD6ukX4gaJ22G3Gi4SPgy2AGOqoXTm5yEMkrKr
 WfPR3rZNtnBlF3uPI/PnGfz3ylML3IPoloFbcQ/7oPZjF672q38GuYoFDkfFdA==
X-Received: by 2002:a17:906:fe03:b0:c16:242a:472f with SMTP id
 a640c23a62f3a-c246b4af7e1mr3089206066b.23.1787553532594; 
 Sun, 23 Aug 2026 23:38:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249685ef7bsm1226186766b.52.2026.08.23.23.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 23:38:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Fischer <mf@go-sys.de>
Date: Mon, 24 Aug 2026 08:38:41 +0200
Message-ID: <20260824063843.839745-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
References: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 4/6] package/isocline: new package
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

Isocline is a pure C library that can be used as an alternative to the
GNU readline library.

Project page: https://github.com/daanx/isocline

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...nly-require-CXX-compiler-when-needed.patch | 55 +++++++++++++++++++
 package/isocline/Config.in                    |  9 +++
 package/isocline/isocline.hash                |  3 +
 package/isocline/isocline.mk                  | 21 +++++++
 6 files changed, 90 insertions(+)
 create mode 100644 package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
 create mode 100644 package/isocline/Config.in
 create mode 100644 package/isocline/isocline.hash
 create mode 100644 package/isocline/isocline.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5eb438906f1b..2de3312fe9c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -826,6 +826,7 @@ F:	package/drogon/
 F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
+F:	package/isocline/
 F:	package/less/
 F:	package/libgphoto2/
 F:	package/pocketpy/
diff --git a/package/Config.in b/package/Config.in
index 6058800682b4..7ae097582e3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2331,6 +2331,7 @@ menu "Text and terminal handling"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
 	source "package/iniparser/Config.in"
+	source "package/isocline/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libecoli/Config.in"
 	source "package/libedit/Config.in"
diff --git a/package/isocline/0001-Only-require-CXX-compiler-when-needed.patch b/package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
new file mode 100644
index 000000000000..ddc150b42136
--- /dev/null
+++ b/package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
@@ -0,0 +1,55 @@
+From a811b3dc38d296b5e4dc76ab2b932cf196795d47 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 22 Aug 2026 16:58:05 +0200
+Subject: [PATCH] Only require CXX compiler when needed
+
+isocline is a pure C library and only requires a C++ compiler when
+IC_USE_CXX=ON.
+
+Unconditionally enabling CXX in project() makes the configure step fail
+for C-only toolchains. This was exposed while integrating isocline into
+Buildroot by running:
+
+  $ utils/test-pkg -p isocline -T br-arm-basic
+
+which fails during the CMake configure step with:
+
+  -- Check for working CXX compiler: /bin/false - broken
+  CMake Error at CMakeTestCXXCompiler.cmake:60 (message):
+    The C++ compiler "/bin/false" is not able to compile a simple test
+    program.
+  Call Stack (most recent call first):
+    CMakeLists.txt:5 (project)
+
+Do not enable CXX in project() unless IC_USE_CXX=ON.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/daanx/isocline/pull/54
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 11aff09bba58..a679098c97f7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ # Copyright (c) 2021, Daan Leijen
+ # -----------------------------------------------------------------------------
+ cmake_minimum_required(VERSION 3.10)
+-project(libisocline C CXX ASM)
++project(libisocline C ASM)
+ 
+ set(CMAKE_C_STANDARD   99)
+ set(CMAKE_CXX_STANDARD 11)
+@@ -44,6 +44,7 @@ if(IC_SEPARATE_OBJS)
+ endif()
+ 
+ if(IC_USE_CXX)
++  enable_language(CXX)
+   set(IC_COMPILER_ID "${CMAKE_CXX_COMPILER_ID}")
+   set_source_files_properties(${ic_sources}         PROPERTIES LANGUAGE CXX )
+   set_source_files_properties(${ic_example_sources} PROPERTIES LANGUAGE CXX )
+-- 
+2.43.0
+
diff --git a/package/isocline/Config.in b/package/isocline/Config.in
new file mode 100644
index 000000000000..b58c2b22a866
--- /dev/null
+++ b/package/isocline/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ISOCLINE
+	bool "isocline"
+	help
+	  Isocline is a pure C library that can be used as an
+	  alternative to the GNU readline library. It provides
+	  multi-line editing, history, completion and syntax
+	  highlighting.
+
+	  https://github.com/daanx/isocline
diff --git a/package/isocline/isocline.hash b/package/isocline/isocline.hash
new file mode 100644
index 000000000000..3eeb187cc3a5
--- /dev/null
+++ b/package/isocline/isocline.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cd9e32618267c282599ff409015e22cfc6654f6e27e229d75f3e212029666d39  isocline-1.0.9.tar.gz
+sha256  60c6b0415a2e0afa8e65630a980b64b4df09cde910e44481a1b0946ebfc840e4  LICENSE
diff --git a/package/isocline/isocline.mk b/package/isocline/isocline.mk
new file mode 100644
index 000000000000..96b8e916b3f2
--- /dev/null
+++ b/package/isocline/isocline.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# isocline
+#
+################################################################################
+
+ISOCLINE_VERSION = 1.0.9
+ISOCLINE_SITE = $(call github,daanx,isocline,v$(ISOCLINE_VERSION))
+ISOCLINE_LICENSE = MIT
+ISOCLINE_LICENSE_FILES = LICENSE
+ISOCLINE_INSTALL_STAGING = YES
+ISOCLINE_INSTALL_TARGET = NO
+
+define ISOCLINE_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/libisocline.a \
+		$(STAGING_DIR)/usr/lib/libisocline.a
+	$(INSTALL) -D -m 0644 $(@D)/include/isocline.h \
+		$(STAGING_DIR)/usr/include/isocline.h
+endef
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
