Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67254CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740FB851B4;
	Sat, 30 May 2026 12:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ukrn_hGZY3f; Sat, 30 May 2026 12:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431DA85118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780143054;
	bh=sWdYV41dv2ugBp425UP8gIxMks5zOjGnMLSbIVLLn0c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b3Jqq5/ZZOq11HJr0vtCl5DnJE13rwqhrBReG3+kzuW2KfdIIzHCJdSk+xUW5bF98
	 974Oq1KP7uK9yvS27IqBX5u9PbjpQs85OM3l5CgUWIJcu8XB6Tlcq+Cp58lTOsMgPX
	 0I+2iLsvrbC2n76zmFe9H5tNnp4laJyrF3AEduDeQhFZoHMyDQXdjHlvCZ1tX4yyZ5
	 CZmcdmOFLVzFGmNPSwitMhMDE3xKLZuCyHwxOel6cvTxIxMW74jQesqZ0OBCUpR0tp
	 kWes3/XEiCNovKVwrqCHR+9yxdAMQFFOX3bebhABJsQ0GeE+ZByQLENPTgpvKxO3Cb
	 WY4mF1gRW6U2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431DA85118;
	Sat, 30 May 2026 12:10:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9BA1D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C70BC42D48
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nS4gr8Z-gqLR for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7144842D4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7144842D4D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7144842D4D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:10:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4B7EAA4C2FD9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:10:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44364)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTIWe-0000000043h-1Rur
 for buildroot@buildroot.org; Sat, 30 May 2026 12:10:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 14:10:47 +0200
Message-ID: <20260530121047.637834-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780143048;
 bh=aHRECem//f86X0PUydGGPY0/LEYqWSF0epIVTmWNw6k=;
 h=From:To:Subject:Date:From;
 b=Io2MppxASdo3Q794ekm6Jwdc5i7LR+RAmnmzBG01LqK6WU++Ih+qpab/48D10xeIM
 eh0g6YU5HPtCrqW8C/5z40I0ULRnQaW8Kr94qRVdPXBQYa5N4Q8KHjeDCKvUXJLXDv
 wDMiP5C7v7htsRtJ8yql3Mc8Ep8Fi18mmOFHf1ovRMVloSjs3UM9u8sAnPq/C/iqXe
 UplHwxVU4Qx09Y8gMJyJQDjNXs6eB9dh6mV3cxGHcEzhOKG/9fJlObYL0PgnM5zNYi
 R5gyNwozSHbCJgfx8ghmmhgQDXO6bGZUBg7iyA3/rPDfGwT1JYwobKjuvwD2ETJk38
 l+Ygp7Nk4cCEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Io2MppxA
Subject: [Buildroot] [PATCH v2 1/1] package/xerces: fix build with recent
 versions of ICU
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

Since Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 that
bumped package/icu to version 77-1, the build of xerces with ICU
support enabled fails:

In file included from /home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/uset.h:38,
                 from /home/bernd/buildroot/output/build/xerces-3.3.0/src/xercesc/util/regx/RangeToken.cpp:40:
/home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/char16ptr.h:271:55:
 error: 'is_same_v' is not a member of 'std'; did you mean 'is_same'?

Indeed, ICU now requires C++17. Instead of using a patch from Gentoo[1]
we use a backported upstream commit, limited to CMakeLists.txt, to raise
the c++ version.

The build error was not recorded yet by the autobuilders but can be
reproduced with this defconfig:

BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XERCES=y
BR2_PACKAGE_ICU=y

[1] https://bugs.gentoo.org/931105

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/986777fa7aba97eca6c0be1b669efdefaf7ea7de

 ...-C++17-C++14-or-C++11-when-available.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch

diff --git a/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
new file mode 100644
index 0000000000..24f7aef6ef
--- /dev/null
+++ b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
@@ -0,0 +1,32 @@
+From 6883e346fa88f48022edf84328a09a4653b8c2fe Mon Sep 17 00:00:00 2001
+From: Roger Leigh <rleigh@codelibre.net>
+Date: Sat, 10 Mar 2018 21:27:27 +0000
+Subject: [PATCH] XERCESC-2141: Enable C++17, C++14 or C++11 when available
+
+Upstream: https://github.com/apache/xerces-c/commit/6883e346fa88f48022edf84328a09a4653b8c2fe
+
+[Bernd: rebased for version 3.3.0, limited to CMakeLists.txt]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt              |   4 +-
+ configure.ac                |   9 +
+ m4/ax_cxx_compile_stdcxx.m4 | 982 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 993 insertions(+), 2 deletions(-)
+ create mode 100644 m4/ax_cxx_compile_stdcxx.m4
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4254f89bb..f5cdb55cc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -32,9 +32,9 @@ if (POLICY CMP0067)
+ 
+ cmake_minimum_required(VERSION 3.12.0)
+ 
+-# Try C++14, then fall back to C++11 and C++98.  Used for feature tests
++# Try C++17, then fall back to C++14, C++11 then C++98.  Used for feature tests
+ # for optional features.
+-set(CMAKE_CXX_STANDARD 14)
++set(CMAKE_CXX_STANDARD 17)
+ 
+ # Use folders (for IDE project grouping)
+ set_property(GLOBAL PROPERTY USE_FOLDERS ON)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
