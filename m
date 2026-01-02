Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A305EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A9F80DDE;
	Fri,  2 Jan 2026 17:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_dncdAYVvEH; Fri,  2 Jan 2026 17:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E86E680D06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374805;
	bh=BnTz+1cpsUaTI9uftWjYP3Xua1jNUaL9xRDU+hlnG5M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TulXzzWBLkjpRGBX0w7xHZatfKVip269RP0WELo062VR8kS4PiOICDDv1iMyCARpy
	 cHX7peV9veSPsV6RoTfsKmwNTcMGAv0gd3k742TLM3WgUJQxxeWcFZPbXRB70aTnCc
	 96I2eZURWSTwoBOYE/Oug+a6ikfbNqOQN5gcVJCsLgzX+MGutqSqVP7PrHkk5I1X03
	 x4Z6U73AZCgqmQp87+xEocGI7F+Q1OKuCfdyNhsmcx6n1lilFJO/n9a3Y0R/Zkx67b
	 t72W4VUt1BbIWbnzeQUkojnDDaAiK1iG0vF1rSMRD670jIvLer836+8sng109FA+KX
	 DbCDYwBPoymXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E86E680D06;
	Fri,  2 Jan 2026 17:26:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1216019D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC5CA60AD4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id no6vB8XxBalM for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DD7160661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD7160661
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DD7160661
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:26:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16D38A4C2EBF
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 18:26:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58056)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbiv9-000000000r0-33le
 for buildroot@buildroot.org; Fri, 02 Jan 2026 17:26:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:26:39 +0100
Message-ID: <20260102172639.1908616-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767374800;
 bh=rAlePCbm8qbyp+8Gz/ccPn/9qy7J2yqgQodx3P7tB50=;
 h=From:To:Subject:Date:From;
 b=P/17cquJJP1tc9XX8ipRXd79VeuokHz3LxBBX6PChwRWhR4CpGjyebS18MWyaOwiS
 n95ytDMKjdk2LSdru9v5GIjm4ejBOnNfZq9T+SOtkUBe+aFe0Gsl7eEqExIMernovk
 rrxVGTVZAiVLBff1E2rCJRQFibTu73M82MGR9inyq/jhTLuIzzrkwCUZPWVfh0ZvOF
 mFBJbOcMNHcVhYyn4rYFZ5RdEVqbx6Zt6R52+TapCJkGGg7kJAqL4EKcnDkIU4r9TK
 UaTPo26JeHjypFTVrtEMlVEoTTVweiJD+CkeuqCaq8kLQoukmB81vpseJ2zwuUwJtq
 A4QKK5wLykCxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=P/17cquJ
Subject: [Buildroot] [PATCH 1/1] package/xerces: fix build with recent
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
 ...-C++17-C++14-or-C++11-when-available.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch

diff --git a/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch b/package/xerces/0001-XERCESC-2141-Enable-C++17-C++14-or-C++11-when-available.patch
new file mode 100644
index 0000000000..96dc5b2326
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
