Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E82C19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF06C608F3;
	Sun,  2 Mar 2025 21:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USd02wKPyX99; Sun,  2 Mar 2025 21:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C3A460A6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C3A460A6B;
	Sun,  2 Mar 2025 21:53:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FCF2958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C3783F89
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HepXJb7NBsvG for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:53:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4EA884007
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4EA884007
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4EA884007
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4394944f161so4366065e9.3
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952379; x=1741557179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nj4lsNJ2BKkKKTO4n0LU0retC4+DDWkCvAmq3BlEEyE=;
 b=Vzt+EA6ACwJpjiInXGvUz5wXUX5K6PsphWCZKoGBehcCuv70FzKe01Oqu331CQhq4Q
 56hWPvJ0nNoN+k+9RCCV/Gh13PkDyBMUhFf0cv8++NygNp60SNRe8yBb9J1w4BA8b8Nh
 r3KJCLi+p/Qb0OItWPhI+4uC9zg47VkXa5PPAFuqX5fzwdlPd4ciCdgZhb5q703d7Qv6
 azRFFPd0GPUOe7RME3Dy9CmvtJdzdHs8NbMbsIXZysnenucMq+pSL17L75mJSt5z9L9t
 hnA9PiQugtGApWoQo8zvIeiUy/wTX02wgw+ShRxOSKcHOM2DEvRleYajJvL1J03jW2uF
 lR7w==
X-Gm-Message-State: AOJu0Yys4lYqKWIx6ofDhtSqoFTus84dNit8GWZotUOP1WNqGmVxIFTQ
 eD1omn0ltHZPYuwdnYmBtVzrABjZ+bGGf0Lj8LVoitfdLQo0+CHni8XN28Ze
X-Gm-Gg: ASbGncvO5U+Qk00DjcdWpT31Znim2HClfXwFA3/cu2PHpAeddrWioj+K0uqx2kwP4gH
 OJHanhcaqbsCx6c3HSkXp/Xrsj0jDpT3OuUv5kEimz+f5gRwjkpCvJaLJc91PwbjaG3olI+56NY
 BH1sb/t9lbo69hcatY7KhlGXC1S7Vrqi0eX8xv7IrdHa4OR+i7YlReYAhKAgpqD5O8vvrqkBs2J
 0Bc8qs9/JXOpPQmiZmNjTO9pQJEjDibFmn84wEm0tUCo6m7odTAHsnEk7RkFDOHUGna1FlhOBOT
 lS6z6p7GdvL+eWJPWfy0GXQZCz5Lmoh8G8rYIQ==
X-Google-Smtp-Source: AGHT+IHoJ+auQaQCnVIEOABQgg4f1NlX7lrI1XquAQooq7VfLDCUVDpqTWjmNSLJH3MCtpM9YI12sg==
X-Received: by 2002:a05:600c:4f56:b0:439:a1ce:5669 with SMTP id
 5b1f17b1804b1-43ba7310bc1mr36631515e9.5.1740952378960; 
 Sun, 02 Mar 2025 13:52:58 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:58 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:16 +0200
Message-ID: <20250302215219.1276480-13-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952379; x=1741557179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nj4lsNJ2BKkKKTO4n0LU0retC4+DDWkCvAmq3BlEEyE=;
 b=jl7X4BkF5k0AsSQKY/kei5OvgD9to9HSXZksUxckwJVwamQzOIsBfWO/LzqboTFTN8
 I1s6kYNzhbKVJMiTzIAXZF5n/n0DTOVu3OFhbJ1y2Q+O2x5Qpmbeu7DePNBWODjyrg3f
 U6bg5vR31tsmkpxDMlr1QDSakCyPSRFMux9RJllbxQmzlxXl/wyUnz868mnaDZFqz7IF
 RF1KgQohnWDNhD07vBNzx7hkV6wVwMVmO+6tUusYEa7WFOEQNlqrBd1j31rLtTVygZqS
 0BhdZDq+jdPXmV2Wl1nM58ZPyTEfS+T4Lz8BAWz+kCqRnKvWOJp9tY8uFPpllC4wKdxp
 Ys9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jl7X4BkF
Subject: [Buildroot] [PATCH 12/15] package/tclap: update to tag 1.4.0-rc2
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was the only version which got rid of this error (nothing specific,
just moved from autotools to cmake):

 ## ----------- ##
 ## Core tests. ##
 ## ----------- ##

 configure:2095: checking for a BSD-compatible install
 configure:2163: result: /usr/bin/install -c
 configure:2174: checking whether build environment is sane
 configure:2229: result: yes
 configure:2267: WARNING: 'missing' script is too old or missing
 configure:2288: checking for aarch64-buildroot-linux-gnu-strip
 configure:2315: result: /opt/buildroot/output-ls1046afrwy/host/bin/aarch64-buildroot-linux-gnu-strip
 configure:2380: checking for a thread-safe mkdir -p
 configure:2419: result: /usr/bin/mkdir -p
 configure:2426: checking for gawk
 configure:2442: found /opt/buildroot/output-ls1046afrwy/host/bin/gawk
 configure:2453: result: gawk
 configure:2464: checking whether make sets $(MAKE)
 configure:2486: result: yes
 configure:2515: checking whether make supports nested variables
 configure:2532: result: yes
 configure:2770: checking for C++ compiler version
 configure:2779: no --version >&5
 ./configure: line 2781: no: command not found
 configure:2790: $? = 127
 configure:2779: no -v >&5
 ./configure: line 2781: no: command not found
 configure:2790: $? = 127
 configure:2779: no -V >&5
 ./configure: line 2781: no: command not found
 configure:2790: $? = 127
 configure:2779: no -qversion >&5
 ./configure: line 2781: no: command not found
 configure:2790: $? = 127
 configure:2810: checking whether the C++ compiler works
 configure:2832: no -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.cpp  >&5
 ./configure: line 2834: no: command not found
 configure:2836: $? = 127
 configure:2874: result: no
 configure: failed program was:
 | /* confdefs.h */
 | #define PACKAGE_NAME "tclap"
 | #define PACKAGE_TARNAME "tclap"
 | #define PACKAGE_VERSION "1.2.4"
 | #define PACKAGE_STRING "tclap 1.2.4"
 | #define PACKAGE_BUGREPORT ""
 | #define PACKAGE_URL ""
 | #define PACKAGE "tclap"
 | #define VERSION "1.2.4"
 | /* end confdefs.h.  */
 |
 | int
 | main ()
 | {
 |
 |   ;
 |   return 0;
 | }
 configure:2879: error: in `/opt/buildroot/output-ls1046afrwy/build/tclap-1.2.4':
 configure:2881: error: C++ compiler cannot create executables
 See `config.log' for more details

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
Patch is new.

 package/tclap/tclap.hash | 2 +-
 package/tclap/tclap.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tclap/tclap.hash b/package/tclap/tclap.hash
index fdfd46a2e46d..6627d32aa062 100644
--- a/package/tclap/tclap.hash
+++ b/package/tclap/tclap.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  634c5b59dbb1ccbc9d6a5f6de494a257e29a3f59dcb6fc30445ff39b45188574  tclap-1.2.4.tar.gz
+sha256  ca52ce5badc477aeda59866601aad85c55e014c5400c15ed13e21fe7d0c1c5f7  tclap-1.4.0-rc2.tar.bz2
 sha256  cd81a61d47aeb1ed63036ca260baee37719923bbd7ebd988ec4edae128f3b6eb  COPYING
diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
index 665bec2d6769..3dad42019fa7 100644
--- a/package/tclap/tclap.mk
+++ b/package/tclap/tclap.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-TCLAP_VERSION = 1.2.4
+TCLAP_VERSION = 1.4.0-rc2
 TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
+TCLAP_SOURCE = tclap-$(TCLAP_VERSION).tar.bz2
 TCLAP_LICENSE = MIT
 TCLAP_LICENSE_FILES = COPYING
 TCLAP_INSTALL_STAGING = YES
@@ -14,4 +15,4 @@ TCLAP_CPE_ID_VALID = YES
 # This package is a pure C++ template library, only made of headers.
 TCLAP_INSTALL_TARGET = NO
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
