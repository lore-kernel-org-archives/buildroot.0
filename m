Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A09EC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2803404C3;
	Wed, 27 Jul 2022 09:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2803404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJ07H_uxvWIM; Wed, 27 Jul 2022 09:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25F034049A;
	Wed, 27 Jul 2022 09:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25F034049A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEF31BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15AA340330
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15AA340330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jxviytegl8Oj for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:44:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E07BB40320
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E07BB40320
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:44:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so716788wmj.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guEJdMsIi++bvsU40p1/ElrUxifn8uxtvWooLgTBcXY=;
 b=ooUJV0jRYFxQTmCBHeeg7H12ZYuYJKCS68ZnZoO4bQVuohsVaIQbYBE83kd5Ck+oMp
 Z9WWY2SZgYu+lI5t673LPHqLpuxorCmRksc+aTpyjqQP2ESJ+MV67PTMa8AsgP4g43Yt
 ngEs9Q53VVJ16ZmcK7n3Cuq1ulAQEsZwK56O0fHnPcy7YNj5FUGwASj1JTcg6MoY5GG6
 60XAPfSHCov1/BHwMNMlJ78kIkYDPgzWPsPfugXtiuJPKZa5ctuEGsa4bc5zUKwwwz5o
 L8BMHH5dOynVcHgvZsnYKxkLE/ku5mlOMqQ66z4TEQwwuuNVe2eHl+xwW0s77PphXFAV
 Zyjg==
X-Gm-Message-State: AJIora//8wE/tzghKDnPJ9Hs5uo2C+xpGulgKuUYh0MjHRpmHOgquTHw
 AeI7nvBeYvBAhIez/gt3fsWyhiATAyk=
X-Google-Smtp-Source: AGRyM1tRoeSW9Hew5D/z3RWxg26Z7h0I4nQA+fV+JtTWgjm0KaiG5imH1Ov6hlM9N9T/7/cneSbipw==
X-Received: by 2002:a05:600c:4e86:b0:3a3:2edc:bcb4 with SMTP id
 f6-20020a05600c4e8600b003a32edcbcb4mr2474925wmq.85.1658915040692; 
 Wed, 27 Jul 2022 02:44:00 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a05600c0a4e00b003a37b7e0780sm1419525wmq.8.2022.07.27.02.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:44:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:43:52 +0200
Message-Id: <20220727094352.1051200-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727094352.1051200-1-fontaine.fabrice@gmail.com>
References: <20220727094352.1051200-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=guEJdMsIi++bvsU40p1/ElrUxifn8uxtvWooLgTBcXY=;
 b=LwpYmfzRNVSL1YXOhBBbSKZtHoEr5eMphXCKDXsgzQcAjM6meIHhAKkvyN8J6mTuAp
 6lq20rowserXvk1nhYEY23hHuJ/zIYkiRQ+ULhn4HlOJjWbut5n9zU8BCbhfXSo7PcGH
 OIWf+q7AOotH2RK1ZgNA14mSkJnt7WlB64YzjfcTCdV/mox0DJE4x0bMz/4iO0YHyRWy
 5V/q4EGGDGptdto0KFUIMh6UKxPfuIQ5SwZvKtXZBUbbmHTh9W5Ry2SCBiBtiEuFMw0n
 AfJvw5dj9floivAbFquYsYEuVLrgwClJLlVUwBPTpaMN7SMmuipSKHu0azLFEzBz2ISt
 5iHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LwpYmfzR
Subject: [Buildroot] [PATCH 3/3] package/sconeserver: bump to
 8d1935919a2013358993a8e9dfa992cbde56e503
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
Cc: Simon Dawson <spdawson@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- autotools has been dropped since
  https://github.com/sconemad/sconeserver/commit/0cb655721d7f8aa5d6d14fc1dfce18c518ce2419
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Descriptor.cpp-fix-build-with-gcc-11.patch |  54 ------
 package/sconeserver/0002-CMake-ify.patch      | 173 ------------------
 package/sconeserver/sconeserver.hash          |   4 +-
 package/sconeserver/sconeserver.mk            |  61 +++---
 4 files changed, 27 insertions(+), 265 deletions(-)
 delete mode 100644 package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch
 delete mode 100644 package/sconeserver/0002-CMake-ify.patch

diff --git a/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch b/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch
deleted file mode 100644
index 335be82f7d..0000000000
--- a/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 5e4cb613d9bb287e9f54da86f99a51d0338b1faa Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 10 Aug 2021 10:36:53 +0200
-Subject: [PATCH] sconex/Descriptor.cpp: fix build with gcc 11
-
-Fix the following build failure with gcc 11:
-
-In file included from ../sconex/sconex.h:229,
-                 from ../sconex/Descriptor.h:63,
-                 from Descriptor.cpp:22:
-Descriptor.cpp: In member function 'void scx::Descriptor::add_stream(scx::Stream*)':
-Descriptor.cpp:150:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
-  150 |   DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
-      |                ~~~~~~^~~
-      |                                 ^~~~
-Descriptor.cpp: In member function 'bool scx::Descriptor::remove_stream(scx::Stream*)':
-Descriptor.cpp:204:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
-  204 |   DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
-      |                ~~~~~~^~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/ccc9562e83fd2bd312d21b3124be42dfe4b7e850
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/sconemad/sconeserver/pull/4]
----
- sconex/Descriptor.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/sconex/Descriptor.cpp b/sconex/Descriptor.cpp
-index 590adba..4adfd86 100644
---- a/sconex/Descriptor.cpp
-+++ b/sconex/Descriptor.cpp
-@@ -147,7 +147,7 @@ bool Descriptor::dup(int d)
- //=============================================================================
- void Descriptor::add_stream(Stream* stream)
- {
--  DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
-+  DEBUG_ASSERT(stream!=0,"add_stream() Invalid stream");
- 
-   m_streams.push_back(stream);
-   stream->set_endpoint(this);
-@@ -201,7 +201,7 @@ void Descriptor::add_stream_after(Stream* stream,const Stream* after)
- //=============================================================================
- bool Descriptor::remove_stream(Stream* stream)
- {
--  DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
-+  DEBUG_ASSERT(stream!=0,"remove_stream() Invalid stream");
- 
-   std::list<Stream*>::iterator it = m_streams.begin();
-   while (it != m_streams.end()) {
--- 
-2.30.2
-
diff --git a/package/sconeserver/0002-CMake-ify.patch b/package/sconeserver/0002-CMake-ify.patch
deleted file mode 100644
index 810c803469..0000000000
--- a/package/sconeserver/0002-CMake-ify.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From 0cb655721d7f8aa5d6d14fc1dfce18c518ce2419 Mon Sep 17 00:00:00 2001
-From: Andrew Wedgbury <wedge@sconemad.com>
-Date: Mon, 19 Aug 2019 21:12:59 +0000
-Subject: [PATCH] CMake-ify
-
-[Retrieve (and updated to only keep fix on sconex.cpp) from:
-https://github.com/sconemad/sconeserver/commit/0cb655721d7f8aa5d6d14fc1dfce18c518ce2419]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .gitignore                          |   5 +
- CMakeLists.txt                      |  52 ++++
- Makefile.am                         |  58 ----
- autogen.sh                          |   8 -
- bluetooth/CMakeLists.txt            |  16 +
- bluetooth/Makefile.am               |  22 --
- config.h.in                         | 335 +--------------------
- configure.in                        | 451 ----------------------------
- debian/rules                        |  10 +-
- debian/sconeserver-base.install     |   2 +-
- debian/sconeserver-dev.install      |   4 +-
- examples/Makefile.am                |   4 -
- examples/rot13/CMakeLists.txt       |   9 +
- examples/rot13/Makefile.am          |  24 --
- examples/tuesdayonly/CMakeLists.txt |   7 +
- examples/tuesdayonly/Makefile.am    |  18 --
- exec/CMakeLists.txt                 |   9 +
- exec/Makefile.am                    |  24 --
- forward/CMakeLists.txt              |   8 +
- forward/Makefile.am                 |  19 --
- http/CMakeLists.txt                 |  51 ++++
- http/Makefile.am                    |  58 ----
- image/CMakeLists.txt                |  12 +
- image/Makefile.am                   |  20 --
- ip/CMakeLists.txt                   |   9 +
- ip/Makefile.am                      |  21 --
- ip6/CMakeLists.txt                  |   9 +
- ip6/Makefile.am                     |  21 --
- local/CMakeLists.txt                |   9 +
- local/Makefile.am                   |  21 --
- location/CMakeLists.txt             |  11 +
- location/Makefile.am                |  18 --
- main.cpp                            |   4 +-
- markdown/CMakeLists.txt             |  20 ++
- markdown/Makefile.am                |  21 --
- maths/CMakeLists.txt                |  32 ++
- maths/Makefile.am                   |  33 --
- mime/CMakeLists.txt                 |   8 +
- mime/Makefile.am                    |  19 --
- mysql/CMakeLists.txt                |  16 +
- mysql/Makefile.am                   |  25 --
- rss/CMakeLists.txt                  |  15 +
- rss/Makefile.am                     |  23 --
- sconeserver.cmake                   |  31 ++
- sconesite/CMakeLists.txt            |  42 +++
- sconesite/Makefile.am               |  79 -----
- sconex/Base64.cpp                   |   2 +-
- sconex/CMakeLists.txt               |  97 ++++++
- sconex/Database.cpp                 |   2 +-
- sconex/FileDir.h                    |   4 +-
- sconex/Makefile.am                  | 156 ----------
- sconex/ModuleLoader.cpp             |   2 +-
- sconex/Process.cpp                  |   8 -
- sconex/RegExp.cpp                   |   4 -
- sconex/RegExp.h                     |   4 +-
- sconex/ScriptContext.cpp            |   7 +-
- sconex/ScriptTypes.cpp              |   2 +-
- sconex/TermBuffer.cpp               |   7 +-
- sconex/sconex.cpp                   |   4 +-
- sconex/sconex.h                     | 176 +++--------
- sconex/utils.cpp                    |   4 -
- server/CMakeLists.txt               |  19 ++
- server/Makefile.am                  |  26 --
- simple/CMakeLists.txt               |  15 +
- simple/Makefile.am                  |  21 --
- smtp/CMakeLists.txt                 |  15 +
- smtp/Makefile.am                    |  21 --
- sqlite/CMakeLists.txt               |  23 ++
- sqlite/Makefile.am                  |  25 --
- ssl/CMakeLists.txt                  |  23 ++
- ssl/Makefile.am                     |  30 --
- stat/CMakeLists.txt                 |  17 ++
- stat/Makefile.am                    |  23 --
- test/CMakeLists.txt                 |  13 +
- test/Makefile.am                    |  53 ----
- testbuilder/CMakeLists.txt          |  23 ++
- testbuilder/Makefile.am             |  36 ---
- tftp/CMakeLists.txt                 |  17 ++
- tftp/Makefile.am                    |  23 --
- upstart                             |  13 -
- 80 files changed, 695 insertions(+), 1933 deletions(-)
- create mode 100644 CMakeLists.txt
- delete mode 100644 Makefile.am
- delete mode 100755 autogen.sh
- create mode 100644 bluetooth/CMakeLists.txt
- delete mode 100644 bluetooth/Makefile.am
- delete mode 100644 configure.in
- delete mode 100644 examples/Makefile.am
- create mode 100644 examples/rot13/CMakeLists.txt
- delete mode 100644 examples/rot13/Makefile.am
- create mode 100644 examples/tuesdayonly/CMakeLists.txt
- delete mode 100644 examples/tuesdayonly/Makefile.am
- create mode 100644 exec/CMakeLists.txt
- delete mode 100644 exec/Makefile.am
- create mode 100644 forward/CMakeLists.txt
- delete mode 100644 forward/Makefile.am
- create mode 100644 http/CMakeLists.txt
- delete mode 100644 http/Makefile.am
- create mode 100644 image/CMakeLists.txt
- delete mode 100644 image/Makefile.am
- create mode 100644 ip/CMakeLists.txt
- delete mode 100644 ip/Makefile.am
- create mode 100644 ip6/CMakeLists.txt
- delete mode 100644 ip6/Makefile.am
- create mode 100644 local/CMakeLists.txt
- delete mode 100644 local/Makefile.am
- create mode 100644 location/CMakeLists.txt
- delete mode 100644 location/Makefile.am
- create mode 100644 markdown/CMakeLists.txt
- delete mode 100644 markdown/Makefile.am
- create mode 100644 maths/CMakeLists.txt
- delete mode 100644 maths/Makefile.am
- create mode 100644 mime/CMakeLists.txt
- delete mode 100644 mime/Makefile.am
- create mode 100644 mysql/CMakeLists.txt
- delete mode 100644 mysql/Makefile.am
- create mode 100644 rss/CMakeLists.txt
- delete mode 100644 rss/Makefile.am
- create mode 100644 sconeserver.cmake
- create mode 100644 sconesite/CMakeLists.txt
- delete mode 100644 sconesite/Makefile.am
- create mode 100644 sconex/CMakeLists.txt
- delete mode 100644 sconex/Makefile.am
- create mode 100644 server/CMakeLists.txt
- delete mode 100644 server/Makefile.am
- create mode 100644 simple/CMakeLists.txt
- delete mode 100644 simple/Makefile.am
- create mode 100644 smtp/CMakeLists.txt
- delete mode 100644 smtp/Makefile.am
- create mode 100644 sqlite/CMakeLists.txt
- delete mode 100644 sqlite/Makefile.am
- create mode 100644 ssl/CMakeLists.txt
- delete mode 100644 ssl/Makefile.am
- create mode 100644 stat/CMakeLists.txt
- delete mode 100644 stat/Makefile.am
- create mode 100644 test/CMakeLists.txt
- delete mode 100644 test/Makefile.am
- create mode 100644 testbuilder/CMakeLists.txt
- delete mode 100644 testbuilder/Makefile.am
- create mode 100644 tftp/CMakeLists.txt
- delete mode 100644 tftp/Makefile.am
- delete mode 100644 upstart
- 
-diff --git a/sconex/sconex.cpp b/sconex/sconex.cpp
-index 1b9fc97..a0ba8c1 100644
---- a/sconex/sconex.cpp
-+++ b/sconex/sconex.cpp
-@@ -35,7 +35,7 @@ VersionTag& version()
- const std::string& sconex_copyright()
- {
-   static std::string s_copyright = 
--    "Copyright (c) 2000-2017 Andrew Wedgbury <wedge@sconemad.com>";
-+    "Copyright (c) 2000-2018 Andrew Wedgbury <wedge@sconemad.com>";
-   return s_copyright;
- }
- 
-@@ -49,7 +49,7 @@ const std::string& build_type()
- //=========================================================================
- Date& build_time()
- {
--  static Date s_build_time(__DATE__" "__TIME__,true);
-+  static Date s_build_time( __DATE__ " " __TIME__ ,true);
-   return s_build_time;
- }
diff --git a/package/sconeserver/sconeserver.hash b/package/sconeserver/sconeserver.hash
index e1ff4486bc..ba86e44ae7 100644
--- a/package/sconeserver/sconeserver.hash
+++ b/package/sconeserver/sconeserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 dfdbbcd29c089eeb341dd3bbd434cca97fefaa97f94c91525e5953d3ab0a2d9a  sconeserver-6b932d7d8dbb700b830205e7111e469cefff490c.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  47552b20579678e49150abe071d9eb55cf23bd13f7f6e4fa085d0612bf6a3431  sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index fd7e6774eb..d15b112801 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-SCONESERVER_VERSION = 6b932d7d8dbb700b830205e7111e469cefff490c
+SCONESERVER_VERSION = 8d1935919a2013358993a8e9dfa992cbde56e503
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
-# fetching from Git, we need to generate the configure script
-SCONESERVER_AUTORECONF = YES
 SCONESERVER_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_PCRE),pcre) \
@@ -19,89 +17,80 @@ SCONESERVER_DEPENDENCIES = \
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
 SCONESERVER_CONF_OPTS += \
-	--with-ip \
-	--with-local \
-	--with-ip6 \
-	--without-image \
-	--without-markdown
+	-DWITH_IMAGE=OFF \
+	-DWITH_MARKDOWN=OFF
 
-# Sconeserver configure script fails to find the libxml2 headers.
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-SCONESERVER_CONF_OPTS += \
-	--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
 # Needed to fix build failure when icu is enabled in libxml2
-SCONESERVER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+SCONESERVER_CONF_OPTS += -DCMAKE_CXX_FLAGS="-std=c++11"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SCONESERVER_DEPENDENCIES += openssl
-SCONESERVER_CONF_OPTS += --with-ssl
+SCONESERVER_CONF_OPTS += -DWITH_SSL=ON
 else
-SCONESERVER_CONF_OPTS += --without-ssl
+SCONESERVER_CONF_OPTS += -DWITH_SSL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
 SCONESERVER_DEPENDENCIES += bluez5_utils
-SCONESERVER_CONF_OPTS += --with-bluetooth
+SCONESERVER_CONF_OPTS += -DWITH_BLUETOOTH=ON
 else
-SCONESERVER_CONF_OPTS += --without-bluetooth
+SCONESERVER_CONF_OPTS += -DWITH_BLUETOOTH=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_EXAMPLES),y)
-SCONESERVER_CONF_OPTS += --with-examples
+SCONESERVER_CONF_OPTS += -DWITH_EXAMPLES=ON
 else
-SCONESERVER_CONF_OPTS += --without-examples
+SCONESERVER_CONF_OPTS += -DWITH_EXAMPLES=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE),y)
 SCONESERVER_DEPENDENCIES += libxml2
-SCONESERVER_CONF_OPTS += --with-sconesite
+SCONESERVER_CONF_OPTS += -DWITH_SCONESITE=ON
 else
-SCONESERVER_CONF_OPTS += --without-sconesite
+SCONESERVER_CONF_OPTS += -DWITH_SCONESITE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
 SCONESERVER_DEPENDENCIES += gpsd
-SCONESERVER_CONF_OPTS += --with-location
+SCONESERVER_CONF_OPTS += -DWITH_LOCATION=ON
 else
-SCONESERVER_CONF_OPTS += --without-location
+SCONESERVER_CONF_OPTS += -DWITH_LOCATION=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
 SCONESERVER_DEPENDENCIES += mpfr
-SCONESERVER_CONF_OPTS += --with-maths
+SCONESERVER_CONF_OPTS += -DWITH_MATHS=ON
 else
-SCONESERVER_CONF_OPTS += --without-maths
+SCONESERVER_CONF_OPTS += -DWITH_MATHS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
 SCONESERVER_DEPENDENCIES += mysql
-SCONESERVER_CONF_OPTS += \
-	--with-mysql \
-	--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config" \
-	LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/mysql"
+SCONESERVER_CONF_OPTS += -DWITH_MYSQL=ON
 else
-SCONESERVER_CONF_OPTS += --without-mysql
+SCONESERVER_CONF_OPTS += -DWITH_MYSQL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_RSS),y)
 SCONESERVER_DEPENDENCIES += libxml2
-SCONESERVER_CONF_OPTS += --with-rss
+SCONESERVER_CONF_OPTS += -DWITH_RSS=ON
 else
-SCONESERVER_CONF_OPTS += --without-rss
+SCONESERVER_CONF_OPTS += -DWITH_RSS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_SQLITE),y)
 SCONESERVER_DEPENDENCIES += sqlite
-SCONESERVER_CONF_OPTS += --with-sqlite
+SCONESERVER_CONF_OPTS += -DWITH_SQLITE=ON
 else
-SCONESERVER_CONF_OPTS += --without-sqlite
+SCONESERVER_CONF_OPTS += -DWITH_SQLITE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
-SCONESERVER_CONF_OPTS += --with-testbuilder
+SCONESERVER_CONF_OPTS += -DWITH_TESTBUILDER=ON
 else
-SCONESERVER_CONF_OPTS += --without-testbuilder
+SCONESERVER_CONF_OPTS += -DWITH_TESTBUILDER=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
