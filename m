Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DD5E9DE68
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1755E40795;
	Thu,  9 Apr 2026 08:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOTJEqnvRODR; Thu,  9 Apr 2026 08:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C0B840797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724304;
	bh=z6dwpQauICpTFblJJy28Fd7JBGH+ndwOIInZlucQwCA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BH+ppT9NSxDPYIQzdh0aPoUCnHG3eRz159KO/oelrDrnAkZTox3Av67/eOEAy8B43
	 W0XAMLnX66M67wPMVXrn51j4LabW+kIZBsTBxaJzwWiWgFl9d2ZukQh0YNPiLBmdmK
	 L0m0Dv0lKOcmmxPImCLa0RPASvquuXVb0/vOk4bBB2HT7avhBozn5oTXxIZYXhpR41
	 mFjnRnA3vAydwpvuGHBxz1KFviU1fV3o985Ojbdd6lYwRSeEJCFjdc4ajFUUIW/kUz
	 qtibTSZHrAr05YFmmwD2tT7yqp8j73YoJHd/0e6+rNoq2xhdcZ2o9B0/GKgglYgUYv
	 3Qx/pf0ENiDAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C0B840797;
	Thu,  9 Apr 2026 08:45:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0454B237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE3364039B
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6z2y-VYUNpo for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD2D840246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD2D840246
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD2D840246
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F091BA4C0984;
 Thu,  9 Apr 2026 10:43:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyi-000000004SH-2WEF;
 Thu, 09 Apr 2026 08:43:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:43:00 +0200
Message-ID: <20260409084305.3960494-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724200;
 bh=ngd6jbm4qXU9KIfYvpG7ybXo8Qme3QsK1lGK0ZD2soQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DeUEuTf3lToEMI27imkl+t5LSFOzjdGwTBq7Kxo/hBL/bFzsKgDsM+j384Z7S8EAN
 kqGLFllGjhaGOUqNR6PJfXF8OsZoDBI5+lpT/nqQ9lezk6VL6vKpAY7x3qMv9cMhxm
 +1qaZy6juW2gYwUetrqjtBCHgTqjP0c0uxwD/CeMtFOwFxH82zKS3GVFJqv1o7GjDG
 r4GzF3UoFsUHlZZro0t8B0o1X1PYokO6uWr7/ToU4EJB67Xns2frTi00YItxKr2wNS
 Ns2nMZubOea8gZrtcy6XFYcDGbCrlBjFozcw/jTbWVDRDZel5zrA9ysP/oiWeRs4qm
 B/AiSEhRtjvhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DeUEuTf3
Subject: [Buildroot] [PATCH 16/20] package/kodi: switch to pcre2
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
 .../0003-RegExp-remove-unused-methods.patch   | 127 +++++
 .../0004-Introduce-PCRE2-dependency.patch     | 192 +++++++
 ...igrate-PCRE-to-PCRE2-and-remove-PCRE.patch | 486 ++++++++++++++++++
 package/kodi/Config.in                        |   3 +-
 package/kodi/kodi.mk                          |   2 +-
 5 files changed, 807 insertions(+), 3 deletions(-)
 create mode 100644 package/kodi/0003-RegExp-remove-unused-methods.patch
 create mode 100644 package/kodi/0004-Introduce-PCRE2-dependency.patch
 create mode 100644 package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch

diff --git a/package/kodi/0003-RegExp-remove-unused-methods.patch b/package/kodi/0003-RegExp-remove-unused-methods.patch
new file mode 100644
index 0000000000..5f8e1af411
--- /dev/null
+++ b/package/kodi/0003-RegExp-remove-unused-methods.patch
@@ -0,0 +1,127 @@
+From 4dd017b2eae39356cda0d96a2f5743dbb8ccf299 Mon Sep 17 00:00:00 2001
+From: fuzzard <fuzzard@kodi.tv>
+Date: Sun, 2 Jun 2024 12:13:01 +1000
+Subject: [PATCH] RegExp remove unused methods
+
+Upstream: https://github.com/xbmc/xbmc/commit/5df2e57368cf5867f588d00a503eb624e5121460
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/utils/RegExp.cpp          | 30 ------------------------------
+ xbmc/utils/RegExp.h            |  5 -----
+ xbmc/utils/test/TestRegExp.cpp | 17 -----------------
+ 3 files changed, 52 deletions(-)
+
+diff --git a/xbmc/utils/RegExp.cpp b/xbmc/utils/RegExp.cpp
+index 9667b646a9..40263a28eb 100644
+--- a/xbmc/utils/RegExp.cpp
++++ b/xbmc/utils/RegExp.cpp
+@@ -485,11 +485,6 @@ int CRegExp::GetSubStart(int iSub) const
+   return m_iOvector[iSub*2] + m_offset;
+ }
+ 
+-int CRegExp::GetSubStart(const std::string& subName) const
+-{
+-  return GetSubStart(GetNamedSubPatternNumber(subName.c_str()));
+-}
+-
+ int CRegExp::GetSubLength(int iSub) const
+ {
+   if (!IsValidSubNumber(iSub))
+@@ -498,11 +493,6 @@ int CRegExp::GetSubLength(int iSub) const
+   return m_iOvector[(iSub*2)+1] - m_iOvector[(iSub*2)];
+ }
+ 
+-int CRegExp::GetSubLength(const std::string& subName) const
+-{
+-  return GetSubLength(GetNamedSubPatternNumber(subName.c_str()));
+-}
+-
+ std::string CRegExp::GetMatch(int iSub /* = 0 */) const
+ {
+   if (!IsValidSubNumber(iSub))
+@@ -516,26 +506,6 @@ std::string CRegExp::GetMatch(int iSub /* = 0 */) const
+   return m_subject.substr(pos, len);
+ }
+ 
+-std::string CRegExp::GetMatch(const std::string& subName) const
+-{
+-  return GetMatch(GetNamedSubPatternNumber(subName.c_str()));
+-}
+-
+-bool CRegExp::GetNamedSubPattern(const char* strName, std::string& strMatch) const
+-{
+-  strMatch.clear();
+-  int iSub = pcre_get_stringnumber(m_re, strName);
+-  if (!IsValidSubNumber(iSub))
+-    return false;
+-  strMatch = GetMatch(iSub);
+-  return true;
+-}
+-
+-int CRegExp::GetNamedSubPatternNumber(const char* strName) const
+-{
+-  return pcre_get_stringnumber(m_re, strName);
+-}
+-
+ void CRegExp::DumpOvector(int iLog /* = LOGDEBUG */)
+ {
+   if (iLog < LOGDEBUG || iLog > LOGNONE)
+diff --git a/xbmc/utils/RegExp.h b/xbmc/utils/RegExp.h
+index 53f6019a8f..feea89cd0d 100644
+--- a/xbmc/utils/RegExp.h
++++ b/xbmc/utils/RegExp.h
+@@ -111,15 +111,10 @@ public:
+   };
+   int GetSubCount() const { return m_iMatchCount - 1; } // PCRE returns the number of sub-patterns + 1
+   int GetSubStart(int iSub) const;
+-  int GetSubStart(const std::string& subName) const;
+   int GetSubLength(int iSub) const;
+-  int GetSubLength(const std::string& subName) const;
+   int GetCaptureTotal() const;
+   std::string GetMatch(int iSub = 0) const;
+-  std::string GetMatch(const std::string& subName) const;
+   const std::string& GetPattern() const { return m_pattern; }
+-  bool GetNamedSubPattern(const char* strName, std::string& strMatch) const;
+-  int GetNamedSubPatternNumber(const char* strName) const;
+   void DumpOvector(int iLog);
+   /**
+    * Check is RegExp object is ready for matching
+diff --git a/xbmc/utils/test/TestRegExp.cpp b/xbmc/utils/test/TestRegExp.cpp
+index d757127417..9435a46aa4 100644
+--- a/xbmc/utils/test/TestRegExp.cpp
++++ b/xbmc/utils/test/TestRegExp.cpp
+@@ -96,19 +96,6 @@ TEST(TestRegExp, GetPattern)
+   EXPECT_STREQ("^(Test)\\s*(.*)\\.", regex.GetPattern().c_str());
+ }
+ 
+-TEST(TestRegExp, GetNamedSubPattern)
+-{
+-  CRegExp regex;
+-  std::string match;
+-
+-  EXPECT_TRUE(regex.RegComp("^(?<first>Test)\\s*(?<second>.*)\\."));
+-  EXPECT_EQ(0, regex.RegFind("Test string."));
+-  EXPECT_TRUE(regex.GetNamedSubPattern("first", match));
+-  EXPECT_STREQ("Test", match.c_str());
+-  EXPECT_TRUE(regex.GetNamedSubPattern("second", match));
+-  EXPECT_STREQ("string", match.c_str());
+-}
+-
+ TEST(TestRegExp, operatorEqual)
+ {
+   CRegExp regex, regexcopy;
+@@ -117,10 +104,6 @@ TEST(TestRegExp, operatorEqual)
+   EXPECT_TRUE(regex.RegComp("^(?<first>Test)\\s*(?<second>.*)\\."));
+   regexcopy = regex;
+   EXPECT_EQ(0, regexcopy.RegFind("Test string."));
+-  EXPECT_TRUE(regexcopy.GetNamedSubPattern("first", match));
+-  EXPECT_STREQ("Test", match.c_str());
+-  EXPECT_TRUE(regexcopy.GetNamedSubPattern("second", match));
+-  EXPECT_STREQ("string", match.c_str());
+ }
+ 
+ class TestRegExpLog : public testing::Test
+-- 
+2.47.3
+
diff --git a/package/kodi/0004-Introduce-PCRE2-dependency.patch b/package/kodi/0004-Introduce-PCRE2-dependency.patch
new file mode 100644
index 0000000000..d72c9805b6
--- /dev/null
+++ b/package/kodi/0004-Introduce-PCRE2-dependency.patch
@@ -0,0 +1,192 @@
+From 4a4642b1d7562b553f80da279255a9755a9e20f7 Mon Sep 17 00:00:00 2001
+From: fuzzard <fuzzard@kodi.tv>
+Date: Sun, 2 Jun 2024 13:24:57 +1000
+Subject: [PATCH] Introduce PCRE2 dependency
+
+create PCRE2 in tools/depends/target
+Create Find module for PCRE2
+
+Upstream: https://github.com/xbmc/xbmc/commit/5c24bf262e5cd75b413fcb4c2c5c144d6971d7cc
+
+[Bernd: backported relevant parts to 21.3-Omega]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cmake/modules/FindPCRE2.cmake            | 151 +++++++++++++++++++++++
+ tools/depends/target/pcre2/PCRE2-VERSION |   7 ++
+ 2 files changed, 158 insertions(+)
+ create mode 100644 cmake/modules/FindPCRE2.cmake
+ create mode 100644 tools/depends/target/pcre2/PCRE2-VERSION
+
+diff --git a/cmake/modules/FindPCRE2.cmake b/cmake/modules/FindPCRE2.cmake
+new file mode 100644
+index 0000000000..7e50d5f2c1
+--- /dev/null
++++ b/cmake/modules/FindPCRE2.cmake
+@@ -0,0 +1,151 @@
++#.rst:
++# FindPCRE2
++# --------
++# Finds the PCRE2 library
++#
++# This will define the following imported target::
++#
++#   ${APP_NAME_LC}::PCRE2    - The PCRE2 library
++
++if(NOT TARGET ${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME})
++
++  macro(buildPCRE2)
++    set(PCRE2_VERSION ${${MODULE}_VER})
++    if(WIN32)
++      set(PCRE_DEBUG_POSTFIX d)
++    endif()
++
++    set(patches "${CORE_SOURCE_DIR}/tools/depends/target/${MODULE_LC}/001-all-enable_docs_pc.patch"
++                "${CORE_SOURCE_DIR}/tools/depends/target/${MODULE_LC}/002-all-cmake-config-installdir.patch")
++
++    generate_patchcommand("${patches}")
++
++    set(CMAKE_ARGS -DBUILD_STATIC_LIBS=ON
++                   -DPCRE2_BUILD_PCRE2_8=ON
++                   -DPCRE2_BUILD_PCRE2_16=OFF
++                   -DPCRE2_BUILD_PCRE2_32=OFF
++                   -DPCRE2_SUPPORT_JIT=ON
++                   -DPCRE2_SUPPORT_UNICODE=ON
++                   -DPCRE2_BUILD_PCRE2GREP=OFF
++                   -DPCRE2_BUILD_TESTS=OFF
++                   -DENABLE_DOCS=OFF)
++
++    if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
++      list(APPEND CMAKE_ARGS -DPCRE2_SUPPORT_JIT=OFF)
++    endif()
++
++    set(${CMAKE_FIND_PACKAGE_NAME}_COMPILEDEFINITIONS PCRE2_STATIC)
++
++    BUILD_DEP_TARGET()
++  endmacro()
++
++  include(cmake/scripts/common/ModuleHelpers.cmake)
++
++  set(MODULE_LC pcre2)
++
++  SETUP_BUILD_VARS()
++
++  if(KODI_DEPENDSBUILD OR (WIN32 OR WINDOWS_STORE))
++    set(PCRE2_USE_STATIC_LIBS ON)
++  endif()
++
++  # Check for existing PCRE2. If version >= PCRE2-VERSION file version, dont build
++  find_package(PCRE2 CONFIG COMPONENTS 8BIT QUIET)
++
++  if((PCRE2_VERSION VERSION_LESS ${${MODULE}_VER} AND ENABLE_INTERNAL_PCRE2) OR
++     ((CORE_SYSTEM_NAME STREQUAL linux OR CORE_SYSTEM_NAME STREQUAL freebsd) AND ENABLE_INTERNAL_PCRE2))
++    buildPCRE2()
++  else()
++      # if PCRE2::8BIT target exists, it meets version requirements
++      # we only do a pkgconfig search when a suitable cmake config returns nothing
++      if(TARGET PCRE2::8BIT)
++        get_target_property(_PCRE2_CONFIGURATIONS PCRE2::8BIT IMPORTED_CONFIGURATIONS)
++        if(_PCRE2_CONFIGURATIONS)
++        foreach(_pcre2_config IN LISTS _PCRE2_CONFIGURATIONS)
++          # Just set to RELEASE var so select_library_configurations can continue to work its magic
++          string(TOUPPER ${_pcre2_config} _pcre2_config_UPPER)
++          if((NOT ${_pcre2_config_UPPER} STREQUAL "RELEASE") AND
++             (NOT ${_pcre2_config_UPPER} STREQUAL "DEBUG"))
++            get_target_property(PCRE2_LIBRARY_RELEASE PCRE2::8BIT IMPORTED_LOCATION_${_pcre2_config_UPPER})
++          else()
++            get_target_property(PCRE2_LIBRARY_${_pcre2_config_UPPER} PCRE2::8BIT IMPORTED_LOCATION_${_pcre2_config_UPPER})
++          endif()
++        endforeach()
++      else()
++        get_target_property(PCRE2_LIBRARY_RELEASE PCRE2::8BIT IMPORTED_LOCATION)
++      endif()
++      get_target_property(PCRE2_INCLUDE_DIR PCRE2::8BIT INTERFACE_INCLUDE_DIRECTORIES)
++    else()
++      # ToDo: use pkgconfig data imported and drop manual find_path/find_library
++      find_package(PkgConfig)
++      if(PKG_CONFIG_FOUND)
++        pkg_check_modules(PC_PCRE2 libpcre2-8 QUIET)
++      endif()
++  
++      find_path(PCRE2_INCLUDE_DIR pcre2.h
++                                  HINTS ${PC_PCRE2_INCLUDEDIR})
++      find_library(PCRE2_LIBRARY_RELEASE NAMES pcre2-8
++                                         HINTS ${PC_PCRE2_LIBDIR})
++      set(PCRE2_VERSION ${PC_PCRE2_VERSION})
++    endif()
++  endif()
++
++  include(SelectLibraryConfigurations)
++  select_library_configurations(PCRE2)
++
++  include(FindPackageHandleStandardArgs)
++  find_package_handle_standard_args(PCRE2
++                                    REQUIRED_VARS PCRE2_LIBRARY PCRE2_INCLUDE_DIR
++                                    VERSION_VAR PCRE2_VERSION)
++
++  if(PCRE2_FOUND)
++    if(TARGET PCRE2::8BIT AND NOT TARGET pcre2)
++      add_library(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} ALIAS PCRE2::8BIT)
++    else()
++      add_library(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} UNKNOWN IMPORTED)
++      if(PCRE2_LIBRARY_RELEASE)
++        set_target_properties(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} PROPERTIES
++                                                                         IMPORTED_CONFIGURATIONS RELEASE
++                                                                         IMPORTED_LOCATION_RELEASE "${PCRE2_LIBRARY_RELEASE}")
++      endif()
++      if(PCRE2_LIBRARY_DEBUG)
++        set_target_properties(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} PROPERTIES
++                                                                         IMPORTED_LOCATION_DEBUG "${PCRE2_LIBRARY_DEBUG}")
++        set_property(TARGET ${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} APPEND PROPERTY
++                                                                              IMPORTED_CONFIGURATIONS DEBUG)
++      endif()
++      set_target_properties(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} PROPERTIES
++                                                                       INTERFACE_INCLUDE_DIRECTORIES "${PCRE2_INCLUDE_DIR}")
++
++      # Add interface compile definitions. This will usually come from an INTERNAL build being required.
++      if(${CMAKE_FIND_PACKAGE_NAME}_COMPILEDEFINITIONS)
++        set_property(TARGET ${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} APPEND PROPERTY
++                                                                              INTERFACE_COMPILE_DEFINITIONS ${${CMAKE_FIND_PACKAGE_NAME}_COMPILEDEFINITIONS})
++      endif()
++    endif()
++    if(TARGET pcre2)
++      add_dependencies(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} pcre2)
++    endif()
++
++    # Add internal build target when a Multi Config Generator is used
++    # We cant add a dependency based off a generator expression for targeted build types,
++    # https://gitlab.kitware.com/cmake/cmake/-/issues/19467
++    # therefore if the find heuristics only find the library, we add the internal build
++    # target to the project to allow user to manually trigger for any build type they need
++    # in case only a specific build type is actually available (eg Release found, Debug Required)
++    # This is mainly targeted for windows who required different runtime libs for different
++    # types, and they arent compatible
++    if(_multiconfig_generator)
++      if(NOT TARGET pcre2)
++        buildPCRE2()
++        set_target_properties(pcre2 PROPERTIES EXCLUDE_FROM_ALL TRUE)
++      endif()
++      add_dependencies(build_internal_depends pcre2)
++    endif()
++
++  else()
++    if(PCRE2_FIND_REQUIRED)
++      message(FATAL_ERROR "PCRE2 not found. Possibly use -DENABLE_INTERNAL_PCRE2=ON to build PCRE2")
++    endif()
++  endif()
++endif()
+diff --git a/tools/depends/target/pcre2/PCRE2-VERSION b/tools/depends/target/pcre2/PCRE2-VERSION
+new file mode 100644
+index 0000000000..800eebf0b9
+--- /dev/null
++++ b/tools/depends/target/pcre2/PCRE2-VERSION
+@@ -0,0 +1,7 @@
++LIBNAME=pcre2
++VERSION=10.42
++ARCHIVE=$(LIBNAME)-$(VERSION).tar.bz2
++SHA512=72fbde87fecec3aa4b47225dd919ea1d55e97f2cbcf02aba26e5a0d3b1ffb58c25a80a9ef069eb99f9cf4e41ba9604ad06a7ec159870e1e875d86820e12256d3
++BYPRODUCT=libpcre2-8.a
++BYPRODUCT_WIN=pcre2-8-static.lib
++
+-- 
+2.47.3
+
diff --git a/package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch b/package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch
new file mode 100644
index 0000000000..8a71a3a0a8
--- /dev/null
+++ b/package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch
@@ -0,0 +1,486 @@
+From 250d14b8e3f614147c9465ca6c1b86a3b5a5f7a2 Mon Sep 17 00:00:00 2001
+From: fuzzard <fuzzard@kodi.tv>
+Date: Sun, 2 Jun 2024 13:56:07 +1000
+Subject: [PATCH] Migrate PCRE to PCRE2 and remove PCRE
+
+Upstream: https://github.com/xbmc/xbmc/commit/8e0c4fd22a0b1f9c54b0536960752263f0d5a04f
+
+[Bernd: backported to 21.3-Omega]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt             |   4 +-
+ xbmc/utils/RegExp.cpp      | 202 ++++++++++++++++++-------------------
+ xbmc/utils/RegExp.h        |  22 ++--
+ xbmc/utils/StringUtils.cpp |   6 +-
+ 4 files changed, 111 insertions(+), 123 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index eb648e9a27..319b95044f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -92,7 +92,7 @@ dependent_option(ENABLE_INTERNAL_CEC "Enable internal libcec?")
+ dependent_option(ENABLE_INTERNAL_FLATBUFFERS "Enable internal flatbuffers?")
+ dependent_option(ENABLE_INTERNAL_FMT "Enable internal fmt?")
+ dependent_option(ENABLE_INTERNAL_NFS "Enable internal libnfs?")
+-dependent_option(ENABLE_INTERNAL_PCRE "Enable internal pcre?")
++dependent_option(ENABLE_INTERNAL_PCRE2 "Enable internal pcre2?")
+ dependent_option(ENABLE_INTERNAL_RapidJSON "Enable internal rapidjson?")
+ 
+ # If ENABLE_INTERNAL_FMT is ON, we force ENABLE_INTERNAL_SPDLOG ON as it has a hard
+@@ -215,7 +215,7 @@ set(required_deps ASS>=0.15.0
+                   LibDvd
+                   Lzo2
+                   OpenSSL>=1.1.0
+-                  PCRE
++                  PCRE2
+                   RapidJSON>=1.0.2
+                   Spdlog
+                   Sqlite3
+diff --git a/xbmc/utils/RegExp.cpp b/xbmc/utils/RegExp.cpp
+index 40263a28eb..cb620208dc 100644
+--- a/xbmc/utils/RegExp.cpp
++++ b/xbmc/utils/RegExp.cpp
+@@ -16,27 +16,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-using namespace PCRE;
+-
+-#ifndef PCRE_UCP
+-#define PCRE_UCP 0
+-#endif // PCRE_UCP
+-
+-#ifdef PCRE_CONFIG_JIT
+-#define PCRE_HAS_JIT_CODE 1
+-#endif
+-
+-#ifndef PCRE_STUDY_JIT_COMPILE
+-#define PCRE_STUDY_JIT_COMPILE 0
+-#endif
+-#ifndef PCRE_INFO_JIT
+-// some unused number
+-#define PCRE_INFO_JIT 2048
+-#endif
+-#ifndef PCRE_HAS_JIT_CODE
+-#define pcre_free_study(x) pcre_free((x))
+-#endif
+-
+ int CRegExp::m_Utf8Supported = -1;
+ int CRegExp::m_UcpSupported  = -1;
+ int CRegExp::m_JitSupported  = -1;
+@@ -51,25 +30,24 @@ void CRegExp::InitValues(bool caseless /*= false*/, CRegExp::utf8Mode utf8 /*= a
+ {
+   m_utf8Mode    = utf8;
+   m_re          = NULL;
+-  m_sd          = NULL;
+-  m_iOptions    = PCRE_DOTALL | PCRE_NEWLINE_ANY;
++  m_ctxt = nullptr;
++  m_iOptions = PCRE2_DOTALL;
+   if(caseless)
+-    m_iOptions |= PCRE_CASELESS;
++    m_iOptions |= PCRE2_CASELESS;
+   if (m_utf8Mode == forceUtf8)
+   {
+     if (IsUtf8Supported())
+-      m_iOptions |= PCRE_UTF8;
++      m_iOptions |= PCRE2_UTF;
+     if (AreUnicodePropertiesSupported())
+-      m_iOptions |= PCRE_UCP;
++      m_iOptions |= PCRE2_UCP;
+   }
+ 
+   m_offset      = 0;
+   m_jitCompiled = false;
+   m_bMatched    = false;
+   m_iMatchCount = 0;
+-  m_jitStack    = NULL;
+-
+-  memset(m_iOvector, 0, sizeof(m_iOvector));
++  m_iOvector = nullptr;
++  m_jitStack = NULL;
+ }
+ 
+ CRegExp::CRegExp(bool caseless, CRegExp::utf8Mode utf8, const char *re, studyMode study /*= NoStudy*/)
+@@ -225,7 +203,8 @@ bool CRegExp::isCharClassWithUnicode(const std::string& regexp, size_t& pos)
+ CRegExp::CRegExp(const CRegExp& re)
+ {
+   m_re = NULL;
+-  m_sd = NULL;
++  m_ctxt = nullptr;
++  m_iOvector = nullptr;
+   m_jitStack = NULL;
+   m_utf8Mode = re.m_utf8Mode;
+   m_iOptions = re.m_iOptions;
+@@ -240,12 +219,13 @@ CRegExp& CRegExp::operator=(const CRegExp& re)
+   m_pattern = re.m_pattern;
+   if (re.m_re)
+   {
+-    if (pcre_fullinfo(re.m_re, NULL, PCRE_INFO_SIZE, &size) >= 0)
++    if (pcre2_pattern_info(re.m_re, PCRE2_INFO_SIZE, &size) >= 0)
+     {
+-      if ((m_re = (pcre*)malloc(size)))
++      if ((m_re = pcre2_code_copy(re.m_re)))
+       {
+-        memcpy(m_re, re.m_re, size);
+-        memcpy(m_iOvector, re.m_iOvector, OVECCOUNT*sizeof(int));
++        if (re.m_ctxt)
++          m_ctxt = pcre2_match_context_copy(re.m_ctxt);
++        m_iOvector = re.m_iOvector;
+         m_offset = re.m_offset;
+         m_iMatchCount = re.m_iMatchCount;
+         m_bMatched = re.m_bMatched;
+@@ -273,18 +253,27 @@ bool CRegExp::RegComp(const char *re, studyMode study /*= NoStudy*/)
+   m_jitCompiled      = false;
+   m_bMatched         = false;
+   m_iMatchCount      = 0;
+-  const char *errMsg = NULL;
+-  int errOffset      = 0;
+-  int options        = m_iOptions;
++  pcre2_compile_context* ctxt;
++  int errCode;
++  char errMsg[120];
++  PCRE2_SIZE errOffset;
++  uint32_t options = m_iOptions;
+   if (m_utf8Mode == autoUtf8 && requireUtf8(re))
+-    options |= (IsUtf8Supported() ? PCRE_UTF8 : 0) | (AreUnicodePropertiesSupported() ? PCRE_UCP : 0);
++    options |=
++        (IsUtf8Supported() ? PCRE2_UTF : 0) | (AreUnicodePropertiesSupported() ? PCRE2_UCP : 0);
+ 
+   Cleanup();
+ 
+-  m_re = pcre_compile(re, options, &errMsg, &errOffset, NULL);
++  ctxt = pcre2_compile_context_create(NULL);
++  pcre2_set_newline(ctxt, PCRE2_NEWLINE_ANY);
++  m_re = pcre2_compile(reinterpret_cast<PCRE2_SPTR>(re), PCRE2_ZERO_TERMINATED, options, &errCode,
++                       &errOffset, ctxt);
++  pcre2_compile_context_free(ctxt);
++
+   if (!m_re)
+   {
+     m_pattern.clear();
++    pcre2_get_error_message(errCode, reinterpret_cast<PCRE2_UCHAR*>(errMsg), sizeof(errMsg));
+     CLog::Log(LOGERROR, "PCRE: {}. Compilation failed at offset {} in expression '{}'", errMsg,
+               errOffset, re);
+     return false;
+@@ -295,23 +284,12 @@ bool CRegExp::RegComp(const char *re, studyMode study /*= NoStudy*/)
+   if (study)
+   {
+     const bool jitCompile = (study == StudyWithJitComp) && IsJitSupported();
+-    const int studyOptions = jitCompile ? PCRE_STUDY_JIT_COMPILE : 0;
+-
+-    m_sd = pcre_study(m_re, studyOptions, &errMsg);
+-    if (errMsg != NULL)
+-    {
+-      CLog::Log(LOGWARNING, "{}: PCRE error \"{}\" while studying expression", __FUNCTION__,
+-                errMsg);
+-      if (m_sd != NULL)
+-      {
+-        pcre_free_study(m_sd);
+-        m_sd = NULL;
+-      }
+-    }
+-    else if (jitCompile)
++    if (jitCompile)
+     {
+-      int jitPresent = 0;
+-      m_jitCompiled = (pcre_fullinfo(m_re, m_sd, PCRE_INFO_JIT, &jitPresent) == 0 && jitPresent == 1);
++      pcre2_jit_compile(m_re, PCRE2_JIT_COMPLETE);
++      size_t jitPresent = 0;
++      m_jitCompiled =
++          (pcre2_pattern_info(m_re, PCRE2_INFO_JITSIZE, &jitPresent) == 0 && jitPresent > 0);
+     }
+   }
+ 
+@@ -325,6 +303,9 @@ int CRegExp::RegFind(const char *str, unsigned int startoffset /*= 0*/, int maxN
+ 
+ int CRegExp::PrivateRegFind(size_t bufferLen, const char *str, unsigned int startoffset /* = 0*/, int maxNumberOfCharsToTest /*= -1*/)
+ {
++  pcre2_match_data* md;
++  PCRE2_SIZE offset;
++
+   m_offset      = 0;
+   m_bMatched    = false;
+   m_iMatchCount = 0;
+@@ -347,37 +328,46 @@ int CRegExp::PrivateRegFind(size_t bufferLen, const char *str, unsigned int star
+     return -1;
+   }
+ 
+-#ifdef PCRE_HAS_JIT_CODE
++  if (!m_ctxt)
++    m_ctxt = pcre2_match_context_create(NULL);
++
+   if (m_jitCompiled && !m_jitStack)
+   {
+-    m_jitStack = pcre_jit_stack_alloc(32*1024, 512*1024);
++    m_jitStack = pcre2_jit_stack_create(32 * 1024, 512 * 1024, NULL);
+     if (m_jitStack == NULL)
+       CLog::Log(LOGWARNING, "{}: can't allocate address space for JIT stack", __FUNCTION__);
+ 
+-    pcre_assign_jit_stack(m_sd, NULL, m_jitStack);
++    pcre2_jit_stack_assign(m_ctxt, NULL, m_jitStack);
+   }
+-#endif
+ 
+   if (maxNumberOfCharsToTest >= 0)
+     bufferLen = std::min<size_t>(bufferLen, startoffset + maxNumberOfCharsToTest);
+ 
+   m_subject.assign(str + startoffset, bufferLen - startoffset);
+-  int rc = pcre_exec(m_re, NULL, m_subject.c_str(), m_subject.length(), 0, 0, m_iOvector, OVECCOUNT);
++  md = pcre2_match_data_create(OVECCOUNT, nullptr);
++  int rc = pcre2_match(m_re, reinterpret_cast<PCRE2_SPTR>(m_subject.c_str()), m_subject.length(), 0,
++                       0, md, m_ctxt);
++  m_iOvector = pcre2_get_ovector_pointer(md);
++  offset = pcre2_get_startchar(md);
++  pcre2_match_data_free(md);
+ 
+   if (rc<1)
+   {
+     static const int fragmentLen = 80; // length of excerpt before erroneous char for log
+     switch(rc)
+     {
+-    case PCRE_ERROR_NOMATCH:
+-      return -1;
++      case PCRE2_ERROR_NOMATCH:
++        return -1;
+ 
+-    case PCRE_ERROR_MATCHLIMIT:
+-      CLog::Log(LOGERROR, "PCRE: Match limit reached");
+-      return -1;
++      case PCRE2_ERROR_MATCHLIMIT:
++        CLog::Log(LOGERROR, "PCRE: Match limit reached");
++        return -1;
+ 
+-#ifdef PCRE_ERROR_SHORTUTF8
+-    case PCRE_ERROR_SHORTUTF8:
++      case PCRE2_ERROR_UTF8_ERR1:
++      case PCRE2_ERROR_UTF8_ERR2:
++      case PCRE2_ERROR_UTF8_ERR3:
++      case PCRE2_ERROR_UTF8_ERR4:
++      case PCRE2_ERROR_UTF8_ERR5:
+       {
+         const size_t startPos = (m_subject.length() > fragmentLen) ? CUtf8Utils::RFindValidUtf8Char(m_subject, m_subject.length() - fragmentLen) : 0;
+         if (startPos != std::string::npos)
+@@ -389,28 +379,44 @@ int CRegExp::PrivateRegFind(size_t bufferLen, const char *str, unsigned int star
+           CLog::Log(LOGERROR, "PCRE: Bad UTF-8 character at the end of string");
+         return -1;
+       }
+-#endif
+-    case PCRE_ERROR_BADUTF8:
++      case PCRE2_ERROR_UTF8_ERR6:
++      case PCRE2_ERROR_UTF8_ERR7:
++      case PCRE2_ERROR_UTF8_ERR8:
++      case PCRE2_ERROR_UTF8_ERR9:
++      case PCRE2_ERROR_UTF8_ERR10:
++      case PCRE2_ERROR_UTF8_ERR11:
++      case PCRE2_ERROR_UTF8_ERR12:
++      case PCRE2_ERROR_UTF8_ERR13:
++      case PCRE2_ERROR_UTF8_ERR14:
++      case PCRE2_ERROR_UTF8_ERR15:
++      case PCRE2_ERROR_UTF8_ERR16:
++      case PCRE2_ERROR_UTF8_ERR17:
++      case PCRE2_ERROR_UTF8_ERR18:
++      case PCRE2_ERROR_UTF8_ERR19:
++      case PCRE2_ERROR_UTF8_ERR20:
++      case PCRE2_ERROR_UTF8_ERR21:
+       {
++        char errbuf[120];
++
++        pcre2_get_error_message(rc, reinterpret_cast<PCRE2_UCHAR*>(errbuf), sizeof(errbuf));
+         const size_t startPos = (m_iOvector[0] > fragmentLen) ? CUtf8Utils::RFindValidUtf8Char(m_subject, m_iOvector[0] - fragmentLen) : 0;
+-        if (m_iOvector[0] >= 0 && startPos != std::string::npos)
++        if ((int)m_iOvector[0] >= 0 && startPos != std::string::npos)
+           CLog::Log(LOGERROR,
+                     "PCRE: Bad UTF-8 character, error code: {}, position: {}. Text before bad "
+                     "char: \"{}\"",
+-                    m_iOvector[1], m_iOvector[0],
+-                    m_subject.substr(startPos, m_iOvector[0] - startPos + 1));
++                    errbuf, offset, m_subject.substr(startPos, m_iOvector[0] - startPos + 1));
+         else
+-          CLog::Log(LOGERROR, "PCRE: Bad UTF-8 character, error code: {}, position: {}",
+-                    m_iOvector[1], m_iOvector[0]);
++          CLog::Log(LOGERROR, "PCRE: Bad UTF-8 character, error code: {}, position: {}", errbuf,
++                    offset);
+         return -1;
+       }
+-    case PCRE_ERROR_BADUTF8_OFFSET:
+-      CLog::Log(LOGERROR, "PCRE: Offset is pointing to the middle of UTF-8 character");
+-      return -1;
++      case PCRE2_ERROR_BADUTFOFFSET:
++        CLog::Log(LOGERROR, "PCRE: Offset is pointing to the middle of UTF-8 character");
++        return -1;
+ 
+-    default:
+-      CLog::Log(LOGERROR, "PCRE: Unknown error: {}", rc);
+-      return -1;
++      default:
++        CLog::Log(LOGERROR, "PCRE: Unknown error: {}", rc);
++        return -1;
+     }
+   }
+   m_offset = startoffset;
+@@ -423,7 +429,7 @@ int CRegExp::GetCaptureTotal() const
+ {
+   int c = -1;
+   if (m_re)
+-    pcre_fullinfo(m_re, NULL, PCRE_INFO_CAPTURECOUNT, &c);
++    pcre2_pattern_info(m_re, PCRE2_INFO_CAPTURECOUNT, &c);
+   return c;
+ }
+ 
+@@ -528,23 +534,21 @@ void CRegExp::Cleanup()
+ {
+   if (m_re)
+   {
+-    pcre_free(m_re);
+-    m_re = NULL;
++    pcre2_code_free(m_re);
++    m_re = nullptr;
+   }
+ 
+-  if (m_sd)
++  if (m_ctxt)
+   {
+-    pcre_free_study(m_sd);
+-    m_sd = NULL;
++    pcre2_match_context_free(m_ctxt);
++    m_ctxt = nullptr;
+   }
+ 
+-#ifdef PCRE_HAS_JIT_CODE
+   if (m_jitStack)
+   {
+-    pcre_jit_stack_free(m_jitStack);
++    pcre2_jit_stack_free(m_jitStack);
+     m_jitStack = NULL;
+   }
+-#endif
+ }
+ 
+ inline bool CRegExp::IsValidSubNumber(int iSub) const
+@@ -557,7 +561,7 @@ bool CRegExp::IsUtf8Supported(void)
+ {
+   if (m_Utf8Supported == -1)
+   {
+-    if (pcre_config(PCRE_CONFIG_UTF8, &m_Utf8Supported) != 0)
++    if (pcre2_config(PCRE2_CONFIG_UNICODE, &m_Utf8Supported) < 0)
+       m_Utf8Supported = 0;
+   }
+ 
+@@ -566,13 +570,11 @@ bool CRegExp::IsUtf8Supported(void)
+ 
+ bool CRegExp::AreUnicodePropertiesSupported(void)
+ {
+-#if defined(PCRE_CONFIG_UNICODE_PROPERTIES) && PCRE_UCP != 0
+   if (m_UcpSupported == -1)
+   {
+-    if (pcre_config(PCRE_CONFIG_UNICODE_PROPERTIES, &m_UcpSupported) != 0)
++    if (pcre2_config(PCRE2_CONFIG_UNICODE, &m_UcpSupported) < 0)
+       m_UcpSupported = 0;
+   }
+-#endif
+ 
+   return m_UcpSupported == 1;
+ }
+@@ -595,13 +597,13 @@ bool CRegExp::LogCheckUtf8Support(void)
+ 
+   if (!utf8FullSupport)
+   {
++    char ver[24];
++
++    pcre2_config(PCRE2_CONFIG_VERSION, ver);
+     CLog::Log(LOGINFO,
+-              "Consider installing PCRE lib version 8.10 or later with enabled Unicode properties "
++              "Consider installing PCRE lib version 10.10 or later with enabled Unicode properties "
+               "and UTF-8 support. Your PCRE lib version: {}",
+-              PCRE::pcre_version());
+-#if PCRE_UCP == 0
+-    CLog::Log(LOGINFO, "You will need to rebuild XBMC after PCRE lib update.");
+-#endif
++              ver);
+   }
+ 
+   return utf8FullSupport;
+@@ -611,9 +613,7 @@ bool CRegExp::IsJitSupported(void)
+ {
+   if (m_JitSupported == -1)
+   {
+-#ifdef PCRE_HAS_JIT_CODE
+-    if (pcre_config(PCRE_CONFIG_JIT, &m_JitSupported) != 0)
+-#endif
++    if (pcre2_config(PCRE2_CONFIG_JIT, &m_JitSupported) < 0)
+       m_JitSupported = 0;
+   }
+ 
+diff --git a/xbmc/utils/RegExp.h b/xbmc/utils/RegExp.h
+index feea89cd0d..90d3db541e 100644
+--- a/xbmc/utils/RegExp.h
++++ b/xbmc/utils/RegExp.h
+@@ -13,16 +13,8 @@
+ #include <string>
+ #include <vector>
+ 
+-/* make sure stdlib.h is included before including pcre.h inside the
+-   namespace; this works around stdlib.h definitions also living in
+-   the PCRE namespace */
+-#include <stdlib.h>
+-
+-namespace PCRE {
+-struct real_pcre_jit_stack; // forward declaration for PCRE without JIT
+-typedef struct real_pcre_jit_stack pcre_jit_stack;
+-#include <pcre.h>
+-}
++#define PCRE2_CODE_UNIT_WIDTH 8
++#include <pcre2.h>
+ 
+ class CRegExp
+ {
+@@ -138,17 +130,17 @@ private:
+   void Cleanup();
+   inline bool IsValidSubNumber(int iSub) const;
+ 
+-  PCRE::pcre* m_re;
+-  PCRE::pcre_extra* m_sd;
++  pcre2_code* m_re;
++  pcre2_match_context* m_ctxt;
+   static const int OVECCOUNT=(m_MaxNumOfBackrefrences + 1) * 3;
+   unsigned int m_offset;
+-  int         m_iOvector[OVECCOUNT];
++  PCRE2_SIZE* m_iOvector;
+   utf8Mode    m_utf8Mode;
+   int         m_iMatchCount;
+-  int         m_iOptions;
++  uint32_t m_iOptions;
+   bool        m_jitCompiled;
+   bool        m_bMatched;
+-  PCRE::pcre_jit_stack* m_jitStack;
++  pcre2_jit_stack* m_jitStack;
+   std::string m_subject;
+   std::string m_pattern;
+   static int  m_Utf8Supported;
+diff --git a/xbmc/utils/StringUtils.cpp b/xbmc/utils/StringUtils.cpp
+index 2c77e58ebd..d390113dd7 100644
+--- a/xbmc/utils/StringUtils.cpp
++++ b/xbmc/utils/StringUtils.cpp
+@@ -30,6 +30,7 @@
+ #include "LangInfo.h"
+ #include "StringUtils.h"
+ #include "XBDateTime.h"
++#include "utils/RegExp.h"
+ 
+ #include <algorithm>
+ #include <array>
+@@ -46,11 +47,6 @@
+ #include <fstrcmp.h>
+ #include <memory.h>
+ 
+-// don't move or std functions end up in PCRE namespace
+-// clang-format off
+-#include "utils/RegExp.h"
+-// clang-format on
+-
+ #define FORMAT_BLOCK_SIZE 512 // # of bytes for initial allocation for printf
+ 
+ namespace
+-- 
+2.47.3
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9661ab47bc..a05a180eb3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -91,8 +91,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_PYTHON3_2TO3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_PYTHON3_SQLITE
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index c31e789503..0c177a94dd 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -47,7 +47,7 @@ KODI_DEPENDENCIES = \
 	libpng \
 	lzo \
 	openssl \
-	pcre \
+	pcre2 \
 	python3 \
 	rapidjson \
 	spdlog \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
