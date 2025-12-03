Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C779D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7357361B13;
	Wed,  3 Dec 2025 22:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiDZdzTr1V3X; Wed,  3 Dec 2025 22:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CC9861B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799294;
	bh=K6AbZdQnd71yi03mxCljSIqS1MMkN+Db6W5kxBpf5ic=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J6K7bnCypXBxC8WjQxW4Z7ptuZ0oF5mVkZ39nXEQM/PHvhzr1HX7GJaQzghnTeOvX
	 4rH+WerDYUVuEsxOfT10m0032+AG0bzt2GDd6QoLkrOosBDec3SWaJ/ATGT7VkVNHJ
	 z/TPJU1XtdndNOfcmkiv5PbKE9NNnC7PXg5iuJ1Og0yz/OR0P9tas67i59iAWyK3S4
	 R9FnToKtP3aFziCEs81SVIu0AlCJZf6L56WnGp7p7cMATvf2dpXemQG/fLmcfde1tP
	 imZnAOaXOUVFyJXahRyDlWWBk5LfVh8x26frV5zl3FB2McCX32uFakYq+e1LvRNwSy
	 OtjUscRZeP9cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC9861B14;
	Wed,  3 Dec 2025 22:01:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 819D3D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 684E981442
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLBu8wHFQ87A for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:01:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B02181423
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B02181423
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B02181423
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EDF1A4C798F;
 Wed,  3 Dec 2025 22:59:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-2G7q;
 Wed, 03 Dec 2025 21:47:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>, Davide Viti <zinosat@gmail.com>,
 Eero Aaltonen <eero.aaltonen@vaisala.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  3 Dec 2025 22:47:03 +0100
Message-ID: <20251203214709.2321976-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799143;
 bh=h5vpM+7WX2DXLFbTbhb7rDDABUfjf9+DuNghlKgE5qw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZewQlWg4sKJsoCp5WgzndQ8jf6Eyn/nc4xhC2DxTE2mTyIIERCcojOcr+CWqk/mHm
 e9xZzpufR6DQnWKNeve9UgbX24M38KEUsfVyJEYdGhd3bPb32nh4NWdu4TOailHuld
 i0P6pobMpqaMpoYwnYymMZHQ34anzWw96WdeNXU6bTz9zBx5sW0uhQX0tcW2luRfbN
 EHRSBB0zszEoryq/3kMVSTbJmkPAGPEij1Gw76tDjSamuqypa0vy34ReXAm5FuB4SI
 HSDOZf5iAztmaEaEYdUAd4wqhU5tUkivXvxNZsena+GDIjXao5zImi3N/Lw97c8bDY
 7qU79gyVmY0oQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZewQlWg4
Subject: [Buildroot] [PATCH/next 15/21] package/libuecc: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../libuecc/0001-Fix-build-with-CMake-4.patch | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 package/libuecc/0001-Fix-build-with-CMake-4.patch

diff --git a/package/libuecc/0001-Fix-build-with-CMake-4.patch b/package/libuecc/0001-Fix-build-with-CMake-4.patch
new file mode 100644
index 0000000000..ecd54b4836
--- /dev/null
+++ b/package/libuecc/0001-Fix-build-with-CMake-4.patch
@@ -0,0 +1,158 @@
+From b3812bf5ab1777193c4b85863311c33997d141f9 Mon Sep 17 00:00:00 2001
+From: Sven Eckelmann <sven@narfation.org>
+Date: Mon, 1 Sep 2025 10:21:38 +0200
+Subject: [PATCH] Fix build with CMake 4
+
+CMake 4 dropped support for policies which were introduced before version
+3.5. Trying to build uisng cmake 4 results in:
+
+    Compatibility with CMake < 3.5 has been removed from CMake.
+
+    Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+    to tell CMake that the project requires at least <min> but has been updated
+    to work with policies introduced by <max> or earlier.
+
+    Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Just increasing minimum version to 3.18 (from 2020-07-15) fixes this
+problem. This version is low enough to still support Debian bullseye or
+Ubuntu 22.04.
+
+With this version increase, following policies are enabled
+
+* 3.18
+  - CMP0108: A target cannot link to itself through an alias.
+  - CMP0107: An ALIAS target cannot overwrite another target.
+  - CMP0106: The Documentation module is removed.
+  - CMP0105: Device link step uses the link options.
+  - CMP0104: CMAKE_CUDA_ARCHITECTURES now detected for NVCC, empty CUDA_ARCHITECTURES not allowed.
+  - CMP0103: Multiple export() with same FILE without APPEND is not allowed.
+* 3.17
+  - CMP0102: mark_as_advanced() does nothing if a cache entry does not exist.
+  - CMP0101: target_compile_options honors BEFORE keyword in all scopes.
+  - CMP0100: Let AUTOMOC and AUTOUIC process .hh header files.
+  - CMP0099: Link properties are transitive over private dependencies of static libraries.
+  - CMP0098: FindFLEX runs flex in CMAKE_CURRENT_BINARY_DIR when executing.
+* 3.16
+  - CMP0097: ExternalProject_Add with GIT_SUBMODULES "" initializes no submodules.
+  - CMP0096: project() preserves leading zeros in version components.
+  - CMP0095: RPATH entries are properly escaped in the intermediary CMake install script.
+* 3.15
+  - CMP0094: FindPython3, FindPython2 and FindPython use LOCATION for lookup strategy.
+  - CMP0093: FindBoost reports Boost_VERSION in x.y.z format.
+  - CMP0092: MSVC warning flags are not in CMAKE_{C,CXX}_FLAGS by default.
+  - CMP0091: MSVC runtime library flags are selected by an abstraction.
+  - CMP0090: export(PACKAGE) does not populate package registry by default.
+  - CMP0089: Compiler id for IBM Clang-based XL compilers is now XLClang.
+* 3.14
+  - CMP0088: FindBISON runs bison in CMAKE_CURRENT_BINARY_DIR when executing.
+  - CMP0087: install(SCRIPT | CODE) supports generator expressions.
+  - CMP0086: UseSWIG honors SWIG_MODULE_NAME via -module flag.
+  - CMP0085: IN_LIST generator expression handles empty list items.
+  - CMP0084: The FindQt module does not exist for find_package().
+  - CMP0083: Add PIE options when linking executable.
+  - CMP0082: Install rules from add_subdirectory() are interleaved with those in caller.
+* 3.13
+  - CMP0081: Relative paths not allowed in LINK_DIRECTORIES target property.
+  - CMP0080: BundleUtilities cannot be included at configure time.
+  - CMP0079: target_link_libraries allows use with targets in other directories.
+  - CMP0078: UseSWIG generates standard target names.
+  - CMP0077: option() honors normal variables.
+  - CMP0076: target_sources() command converts relative paths to absolute.
+* 3.12
+  - CMP0075: Include file check macros honor CMAKE_REQUIRED_LIBRARIES.
+  - CMP0074: find_package uses PackageName_ROOT variables.
+  - CMP0073: Do not produce legacy _LIB_DEPENDS cache entries.
+* 3.11
+  - CMP0072: FindOpenGL prefers GLVND by default when available.
+* 3.10
+  - CMP0071: Let AUTOMOC and AUTOUIC process GENERATED files.
+  - CMP0070: Define file(GENERATE) behavior for relative paths.
+* 3.9
+  - CMP0069: INTERPROCEDURAL_OPTIMIZATION is enforced when enabled.
+  - CMP0068: RPATH settings on macOS do not affect install_name.
+* 3.8
+  - CMP0067: Honor language standard in try_compile() source-file signature.
+* 3.7
+  - CMP0066: Honor per-config flags in try_compile() source-file signature.
+* 3.4
+  - CMP0065: Do not add flags to export symbols from executables without the ENABLE_EXPORTS target property.
+  - CMP0064: Support new TEST if() operator.
+* 3.3
+  - CMP0063: Honor visibility properties for all target types.
+  - CMP0062: Disallow install() of export() result.
+  - CMP0061: CTest does not by default tell make to ignore errors (-i).
+  - CMP0060: Link libraries by full path even in implicit directories.
+  - CMP0059: Do not treat DEFINITIONS as a built-in directory property.
+  - CMP0058: Ninja requires custom command byproducts to be explicit.
+  - CMP0057: Support new IN_LIST if() operator.
+* 3.2
+  - CMP0056: Honor link flags in try_compile() source-file signature.
+  - CMP0055: Strict checking for break() command.
+* 3.1
+  - CMP0054: Only interpret if() arguments as variables or keywords when unquoted.
+  - CMP0053: Simplify variable reference and escape sequence evaluation.
+  - CMP0052: Reject source and build dirs in installed INTERFACE_INCLUDE_DIRECTORIES.
+  - CMP0051: List TARGET_OBJECTS in SOURCES target property.
+* 3.0
+  - CMP0050: Disallow add_custom_command SOURCE signatures.
+  - CMP0049: Do not expand variables in target source entries.
+  - CMP0048: project() command manages VERSION variables.
+  - CMP0047: Use QCC compiler id for the qcc drivers on QNX.
+  - CMP0046: Error on non-existent dependency in add_dependencies.
+  - CMP0045: Error on non-existent target in get_target_property.
+  - CMP0044: Case sensitive Lang_COMPILER_ID generator expressions.
+  - CMP0043: Ignore COMPILE_DEFINITIONS_Config properties.
+  - CMP0042: MACOSX_RPATH is enabled by default.
+  - CMP0041: Error on relative include with generator expression.
+  - CMP0040: The target in the TARGET signature of add_custom_command() must exist.
+  - CMP0039: Utility targets may not have link dependencies.
+  - CMP0038: Targets may not link directly to themselves.
+  - CMP0037: Target names should not be reserved and should match a validity pattern.
+  - CMP0036: The build_name command should not be called.
+  - CMP0035: The variable_requires command should not be called.
+  - CMP0034: The utility_source command should not be called.
+  - CMP0033: The export_library_dependencies command should not be called.
+  - CMP0032: The output_required_files command should not be called.
+  - CMP0031: The load_command command should not be called.
+  - CMP0030: The use_mangled_mesa command should not be called.
+  - CMP0029: The subdir_depends command should not be called.
+  - CMP0028: Double colon in target name means ALIAS or IMPORTED target.
+  - CMP0027: Conditionally linked imported targets with missing include directories.
+  - CMP0026: Disallow use of the LOCATION target property.
+  - CMP0025: Compiler id for Apple Clang is now AppleClang.
+  - CMP0024: Disallow include export result.
+* 2.8
+  - CMP0023: Plain and keyword target_link_libraries signatures cannot be mixed.
+  - CMP0022: INTERFACE_LINK_LIBRARIES defines the link interface.
+  - CMP0021: Fatal error on relative paths in INCLUDE_DIRECTORIES target property.
+  - CMP0020: Automatically link Qt executables to qtmain target on Windows.
+  - CMP0019: Do not re-expand variables in include and link information.
+  - CMP0018: Ignore CMAKE_SHARED_LIBRARY_Lang_FLAGS variable.
+  - CMP0017: Prefer files from the CMake module directory when including from there.
+  - CMP0016: target_link_libraries() reports error if its only argument is not a target.
+  - CMP0015: link_directories() treats paths relative to the source dir.
+  - CMP0014: Input directories must have CMakeLists.txt.
+  - CMP0013: Duplicate binary directories are not allowed.
+  - CMP0012: if() recognizes numbers and boolean constants.
+
+Fixes: #1
+Signed-off-by: Sven Eckelmann <sven@narfation.org>
+
+Upstream: https://github.com/neocturne/libuecc/commit/b3812bf5ab1777193c4b85863311c33997d141f9
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 779ac41..24bded3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.18)
+ project(LIBUECC C)
+ set(PROJECT_VERSION 7)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
