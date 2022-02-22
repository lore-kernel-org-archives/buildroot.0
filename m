Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101C0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 17:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96EE140224;
	Tue, 22 Feb 2022 17:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8R016nS-LBOI; Tue, 22 Feb 2022 17:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F31401CB;
	Tue, 22 Feb 2022 17:53:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 126831BF4E4
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 17:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F0BD607F9
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 17:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z88CUcduyZ4K for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 17:53:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D3536058A
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 17:53:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 az13-20020a05600c600d00b003808a3380faso2551878wmb.1
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 09:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDsAfKQfd10uW9kF18Jh+zm9mjw0puipRwM05mqtlyE=;
 b=DlJ2lo4lC64+w7eGnq8SaRBLV/o06e+NbrKWcZgFQk6d2b6mnemDI0Qo2IKw9fDOxU
 6ziYvDhqXeYr2kYJSXrUTshZ7xM0ZbaTlQG09l7tHHVikjkLeSTDYL8QXhehX0C12fZx
 wcKcWh6NFApOebJe/oLQFE5tiQMeGE2TgCk2XNmcBSZZ7wmsk9APWwdLrpUc9IPLGb7E
 XUm0KD/0zVqE1tpIuWQfxtE/lFiUbjonafeo0HAEPQl6HlLYjVtyqEq46TGnagKuSEwQ
 28V3WwVZgN+rdfgYs0eFSJ4OiJ8KeD3XpEi2o6eTbRyvnVwbDhAX5pytfvNEgy3u5FfL
 ELiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDsAfKQfd10uW9kF18Jh+zm9mjw0puipRwM05mqtlyE=;
 b=TiULXpDdQTnw2ckyd6xd5Qv2bJ7+2B0t94HCU90myxUpy63mVSBztNvZh/Jqtciz/H
 8SdDG+TBSACyX4ftbz4VksTqcBCCbfSzanA4Q/Rjnf9Kp19kJQu+2hVQYNMhM1hTDRih
 n3x2EeyCZUjskoVqEmuLAVkYidcxoCFouu8/zanL5enmN4onyC6UGd/59gb7Cgbsjt6C
 DYk+/cE25Y7AqEJWILqzZTBA19AQZXL2v5ocKnKlf0RxVGQjS4PQNHGniyLQAvX2uafv
 DECv5C4rTRA8tqGdsp9gp0Sw8HepFeLvDFVaLz8EIkFva6A2bCSlII+7+8t4eC3FNNma
 Ovww==
X-Gm-Message-State: AOAM530NnsWP57cm+JCpOwAHkufLHMGVJMQVOHZaUYGRzKwcTqQPbH3K
 lybSFV0QO/03XBdZs8SUYCw0RKhoTL0=
X-Google-Smtp-Source: ABdhPJws5EXHA1EJcoSgSmmwxYTnuAPpdj+6vb/T2hMNyT8IQyAHgvJss6hFVnzl82opFGaVLl7wnw==
X-Received: by 2002:a05:600c:364f:b0:37b:ba9e:2805 with SMTP id
 y15-20020a05600c364f00b0037bba9e2805mr4243210wmq.119.1645552386316; 
 Tue, 22 Feb 2022 09:53:06 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm3631382wmq.17.2022.02.22.09.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:53:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 18:52:26 +0100
Message-Id: <20220222175226.3086883-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: fix build with gcc 4.8
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since the addition
of -std=c++11 in commit b9eca021594470341bec2876edc0a27251f3f9b2:

sconex.cpp: In function 'scx::Date& scx::build_time()':
sconex.cpp:52:36: error: unable to find string literal operator 'operator"" __TIME__'
   static Date s_build_time(__DATE__" "__TIME__,true);
                                    ^

Fixes:
 - http://autobuild.buildroot.org/results/83ecf772965b4586eaea2682871a85732df7d62f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/0002-CMake-ify.patch | 173 +++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 package/sconeserver/0002-CMake-ify.patch

diff --git a/package/sconeserver/0002-CMake-ify.patch b/package/sconeserver/0002-CMake-ify.patch
new file mode 100644
index 0000000000..810c803469
--- /dev/null
+++ b/package/sconeserver/0002-CMake-ify.patch
@@ -0,0 +1,173 @@
+From 0cb655721d7f8aa5d6d14fc1dfce18c518ce2419 Mon Sep 17 00:00:00 2001
+From: Andrew Wedgbury <wedge@sconemad.com>
+Date: Mon, 19 Aug 2019 21:12:59 +0000
+Subject: [PATCH] CMake-ify
+
+[Retrieve (and updated to only keep fix on sconex.cpp) from:
+https://github.com/sconemad/sconeserver/commit/0cb655721d7f8aa5d6d14fc1dfce18c518ce2419]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .gitignore                          |   5 +
+ CMakeLists.txt                      |  52 ++++
+ Makefile.am                         |  58 ----
+ autogen.sh                          |   8 -
+ bluetooth/CMakeLists.txt            |  16 +
+ bluetooth/Makefile.am               |  22 --
+ config.h.in                         | 335 +--------------------
+ configure.in                        | 451 ----------------------------
+ debian/rules                        |  10 +-
+ debian/sconeserver-base.install     |   2 +-
+ debian/sconeserver-dev.install      |   4 +-
+ examples/Makefile.am                |   4 -
+ examples/rot13/CMakeLists.txt       |   9 +
+ examples/rot13/Makefile.am          |  24 --
+ examples/tuesdayonly/CMakeLists.txt |   7 +
+ examples/tuesdayonly/Makefile.am    |  18 --
+ exec/CMakeLists.txt                 |   9 +
+ exec/Makefile.am                    |  24 --
+ forward/CMakeLists.txt              |   8 +
+ forward/Makefile.am                 |  19 --
+ http/CMakeLists.txt                 |  51 ++++
+ http/Makefile.am                    |  58 ----
+ image/CMakeLists.txt                |  12 +
+ image/Makefile.am                   |  20 --
+ ip/CMakeLists.txt                   |   9 +
+ ip/Makefile.am                      |  21 --
+ ip6/CMakeLists.txt                  |   9 +
+ ip6/Makefile.am                     |  21 --
+ local/CMakeLists.txt                |   9 +
+ local/Makefile.am                   |  21 --
+ location/CMakeLists.txt             |  11 +
+ location/Makefile.am                |  18 --
+ main.cpp                            |   4 +-
+ markdown/CMakeLists.txt             |  20 ++
+ markdown/Makefile.am                |  21 --
+ maths/CMakeLists.txt                |  32 ++
+ maths/Makefile.am                   |  33 --
+ mime/CMakeLists.txt                 |   8 +
+ mime/Makefile.am                    |  19 --
+ mysql/CMakeLists.txt                |  16 +
+ mysql/Makefile.am                   |  25 --
+ rss/CMakeLists.txt                  |  15 +
+ rss/Makefile.am                     |  23 --
+ sconeserver.cmake                   |  31 ++
+ sconesite/CMakeLists.txt            |  42 +++
+ sconesite/Makefile.am               |  79 -----
+ sconex/Base64.cpp                   |   2 +-
+ sconex/CMakeLists.txt               |  97 ++++++
+ sconex/Database.cpp                 |   2 +-
+ sconex/FileDir.h                    |   4 +-
+ sconex/Makefile.am                  | 156 ----------
+ sconex/ModuleLoader.cpp             |   2 +-
+ sconex/Process.cpp                  |   8 -
+ sconex/RegExp.cpp                   |   4 -
+ sconex/RegExp.h                     |   4 +-
+ sconex/ScriptContext.cpp            |   7 +-
+ sconex/ScriptTypes.cpp              |   2 +-
+ sconex/TermBuffer.cpp               |   7 +-
+ sconex/sconex.cpp                   |   4 +-
+ sconex/sconex.h                     | 176 +++--------
+ sconex/utils.cpp                    |   4 -
+ server/CMakeLists.txt               |  19 ++
+ server/Makefile.am                  |  26 --
+ simple/CMakeLists.txt               |  15 +
+ simple/Makefile.am                  |  21 --
+ smtp/CMakeLists.txt                 |  15 +
+ smtp/Makefile.am                    |  21 --
+ sqlite/CMakeLists.txt               |  23 ++
+ sqlite/Makefile.am                  |  25 --
+ ssl/CMakeLists.txt                  |  23 ++
+ ssl/Makefile.am                     |  30 --
+ stat/CMakeLists.txt                 |  17 ++
+ stat/Makefile.am                    |  23 --
+ test/CMakeLists.txt                 |  13 +
+ test/Makefile.am                    |  53 ----
+ testbuilder/CMakeLists.txt          |  23 ++
+ testbuilder/Makefile.am             |  36 ---
+ tftp/CMakeLists.txt                 |  17 ++
+ tftp/Makefile.am                    |  23 --
+ upstart                             |  13 -
+ 80 files changed, 695 insertions(+), 1933 deletions(-)
+ create mode 100644 CMakeLists.txt
+ delete mode 100644 Makefile.am
+ delete mode 100755 autogen.sh
+ create mode 100644 bluetooth/CMakeLists.txt
+ delete mode 100644 bluetooth/Makefile.am
+ delete mode 100644 configure.in
+ delete mode 100644 examples/Makefile.am
+ create mode 100644 examples/rot13/CMakeLists.txt
+ delete mode 100644 examples/rot13/Makefile.am
+ create mode 100644 examples/tuesdayonly/CMakeLists.txt
+ delete mode 100644 examples/tuesdayonly/Makefile.am
+ create mode 100644 exec/CMakeLists.txt
+ delete mode 100644 exec/Makefile.am
+ create mode 100644 forward/CMakeLists.txt
+ delete mode 100644 forward/Makefile.am
+ create mode 100644 http/CMakeLists.txt
+ delete mode 100644 http/Makefile.am
+ create mode 100644 image/CMakeLists.txt
+ delete mode 100644 image/Makefile.am
+ create mode 100644 ip/CMakeLists.txt
+ delete mode 100644 ip/Makefile.am
+ create mode 100644 ip6/CMakeLists.txt
+ delete mode 100644 ip6/Makefile.am
+ create mode 100644 local/CMakeLists.txt
+ delete mode 100644 local/Makefile.am
+ create mode 100644 location/CMakeLists.txt
+ delete mode 100644 location/Makefile.am
+ create mode 100644 markdown/CMakeLists.txt
+ delete mode 100644 markdown/Makefile.am
+ create mode 100644 maths/CMakeLists.txt
+ delete mode 100644 maths/Makefile.am
+ create mode 100644 mime/CMakeLists.txt
+ delete mode 100644 mime/Makefile.am
+ create mode 100644 mysql/CMakeLists.txt
+ delete mode 100644 mysql/Makefile.am
+ create mode 100644 rss/CMakeLists.txt
+ delete mode 100644 rss/Makefile.am
+ create mode 100644 sconeserver.cmake
+ create mode 100644 sconesite/CMakeLists.txt
+ delete mode 100644 sconesite/Makefile.am
+ create mode 100644 sconex/CMakeLists.txt
+ delete mode 100644 sconex/Makefile.am
+ create mode 100644 server/CMakeLists.txt
+ delete mode 100644 server/Makefile.am
+ create mode 100644 simple/CMakeLists.txt
+ delete mode 100644 simple/Makefile.am
+ create mode 100644 smtp/CMakeLists.txt
+ delete mode 100644 smtp/Makefile.am
+ create mode 100644 sqlite/CMakeLists.txt
+ delete mode 100644 sqlite/Makefile.am
+ create mode 100644 ssl/CMakeLists.txt
+ delete mode 100644 ssl/Makefile.am
+ create mode 100644 stat/CMakeLists.txt
+ delete mode 100644 stat/Makefile.am
+ create mode 100644 test/CMakeLists.txt
+ delete mode 100644 test/Makefile.am
+ create mode 100644 testbuilder/CMakeLists.txt
+ delete mode 100644 testbuilder/Makefile.am
+ create mode 100644 tftp/CMakeLists.txt
+ delete mode 100644 tftp/Makefile.am
+ delete mode 100644 upstart
+ 
+diff --git a/sconex/sconex.cpp b/sconex/sconex.cpp
+index 1b9fc97..a0ba8c1 100644
+--- a/sconex/sconex.cpp
++++ b/sconex/sconex.cpp
+@@ -35,7 +35,7 @@ VersionTag& version()
+ const std::string& sconex_copyright()
+ {
+   static std::string s_copyright = 
+-    "Copyright (c) 2000-2017 Andrew Wedgbury <wedge@sconemad.com>";
++    "Copyright (c) 2000-2018 Andrew Wedgbury <wedge@sconemad.com>";
+   return s_copyright;
+ }
+ 
+@@ -49,7 +49,7 @@ const std::string& build_type()
+ //=========================================================================
+ Date& build_time()
+ {
+-  static Date s_build_time(__DATE__" "__TIME__,true);
++  static Date s_build_time( __DATE__ " " __TIME__ ,true);
+   return s_build_time;
+ }
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
