Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09674C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 14:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4F9E4022F;
	Sat,  6 Jul 2024 14:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XBMx3cEhYHs; Sat,  6 Jul 2024 14:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5728B40391
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5728B40391;
	Sat,  6 Jul 2024 14:20:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C55F1BF83E
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 14:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46FDD60608
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 14:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PmT26w-G-vt for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 14:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36B31605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B31605D9
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36B31605D9
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 14:20:56 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso3472778a12.3
 for <buildroot@buildroot.org>; Sat, 06 Jul 2024 07:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720275654; x=1720880454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2oNgUK/ZTAT76H7fus36xf9CGIg34W3g05h0YsHvOhs=;
 b=JnXl+rgR78vj4tRmxUajTM5XvKIdDmsvLmaMzAaQV03RbqK9U7vfzSQ0waDwB6tim+
 Uwq0IRjWArkPXKm+UTmuEaFVbTXle7OnVojX3HvuUt7RXX/vFHfWMPJru0rqkmFQSi3a
 f72Xi3BRRkHM8voA0P1sN8RvoaodfClEO/OGGq2ehz2QaK1Vk95D80CnUGYgjJWpuZ5l
 MTEZC74pCla8/Ip7Z33rM6fL4ZPu58M+acEGe/zZP1txNaXjT4/BWcszm2G/1o5PbU6k
 Es+sT+/4YI18qF0UAPD5nX/OWNK15lHQWU9paRMj+9dZ9P5EYqGCb4OjZf7C9LRX9cX5
 0QjA==
X-Gm-Message-State: AOJu0Yxd16HngyYG77DB2pm/7AE9216jGGim93oH5a3AlkQ+CzqLmHs8
 9wbSpwF9w94OnH0pyuJhKJ/rtCGqcaCUS04NIF2xJ4jcyezB89rR+IkvbWdI5cdhgHTGXvYcqaF
 7QqM=
X-Google-Smtp-Source: AGHT+IHRMBYY3YaZeC3pYTE2PRocss5sHZGeu41Irc63Tn9XvpAe4SPQOvhLVeFszUUE8HD1GpU2gA==
X-Received: by 2002:a17:907:3342:b0:a75:1069:5b94 with SMTP id
 a640c23a62f3a-a77ba47879amr447451666b.21.1720275653955; 
 Sat, 06 Jul 2024 07:20:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7400456582sm667042466b.153.2024.07.06.07.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 07:20:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 16:20:50 +0200
Message-ID: <20240706142050.3693937-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720275654; x=1720880454;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2oNgUK/ZTAT76H7fus36xf9CGIg34W3g05h0YsHvOhs=;
 b=kMhuCM5sJuYSnGXTJ5UIwf+0tiNytZrWziEZefOlojDDR2lO9pr/IZbfm6w3WCaFVc
 Gf6x9loeI0ddUhTb1JfvL+HoN9cWgNJMcwyqkcVlw60dqgqAb7Ld+qgpMrXNmDfl9iEd
 bpkBN8pBFwiXoEBx+MQMl8yn15TadbUKk3kDU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kMhuCM5s
Subject: [Buildroot] [PATCH 1/1] package/yajl: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, yajl fails to build with output:

    Applying 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch using patch:
    patching file src/CMakeLists.txt
    Hunk #1 FAILED at 37.
    Hunk #2 succeeded at 52 (offset 1 line).
    Hunk #3 succeeded at 79 (offset 1 line).
    1 out of 3 hunks FAILED -- saving rejects to file src/CMakeLists.txt.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...isable-shared-library-build-when-BUILD_SHARED.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
index 53decca64989..e9170772d43d 100644
--- a/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
+++ b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -7,6 +7,8 @@ When BUILD_SHARED_LIBS is off, you don't want to build the shared
 library.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/CMakeLists.txt | 4 ++++
  1 file changed, 4 insertions(+)
@@ -15,15 +17,15 @@ diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
 index 99cf9e9..9e9c77d 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -37,6 +37,7 @@ SET(LIBRARY_OUTPUT_PATH ${libDir})
- 
+@@ -38,6 +38,7 @@ SET(LIBRARY_OUTPUT_PATH ${libDir})
  ADD_LIBRARY(yajl_s STATIC ${SRCS} ${HDRS} ${PUB_HDRS})
+ SET_TARGET_PROPERTIES(yajl_s PROPERTIES OUTPUT_NAME yajl)
  
 +IF(BUILD_SHARED_LIBS)
  ADD_LIBRARY(yajl SHARED ${SRCS} ${HDRS} ${PUB_HDRS})
  
  #### setup shared library version number
-@@ -51,6 +52,7 @@ IF(APPLE)
+@@ -52,6 +53,7 @@ IF(APPLE)
    SET_TARGET_PROPERTIES(yajl PROPERTIES
                          INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib")
  ENDIF(APPLE)
@@ -31,7 +33,7 @@ index 99cf9e9..9e9c77d 100644
  
  #### build up an sdk as a post build step
  
-@@ -77,10 +79,12 @@ INCLUDE_DIRECTORIES(${incDir}/..)
+@@ -78,10 +80,12 @@ INCLUDE_DIRECTORIES(${incDir}/..)
  
  # at build time you may specify the cmake variable LIB_SUFFIX to handle
  # 64-bit systems which use 'lib64'
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
