Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD18C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2964960462
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2964960462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B3B40398;
	Thu,  5 Aug 2021 08:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nc8e17VukQua; Thu,  5 Aug 2021 08:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2115640390;
	Thu,  5 Aug 2021 08:01:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15EFA1BF578
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10DFE4027D
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYkpwMOJIBTl for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:01:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB1FC40259
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:01:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id x17so2717465wmc.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 01:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDBq5nstKVqgPUJclcvoigiU/ndEJNdEuQtoL7eToec=;
 b=ejWSRxRJiqS66A5Dc8maAREflH6PtaEuV+u6fbceurHJ3iiqelBmI1ZyuUNOA2m/87
 cXODxWE545m82USu1Y+Z3yZpF/qrvVUWcAun1rWqPi2wNNx6tAYxhcdv98Nkwyu4+Ei8
 7lXv2Jwknk37/nc0f+5YOLAJtSkSmUzwMEQeiDHmEWcngqgpjkUwkqiycphjx8CzdCIH
 8hRgVVkx2FXoEAHlgseymrWutbqzoKX0qmYwHW52SauzP9ZDztsJ5h9WJUCf5QtB0aWo
 QCKYNMuIixCdBSl0DjIYsUwztkfSu2xOPqD+KNcZZH3bUAL2yHx8/vDsHxvbEAVyK5Y+
 ICrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDBq5nstKVqgPUJclcvoigiU/ndEJNdEuQtoL7eToec=;
 b=n0qfXsek+slhapjAIJExFq54nWc4B+Xg0exvno7UpdNFQcbmZO4IRGEmct9U9Oy2ls
 xZ41OHGbuQkWwaez0UYV2sJhsyedX6oZWQOagRkR5f50jNpccrw3UI94lWIHoJc+B89W
 xAMsp0WFOvo0QBeyyiCEvd1c80GTSKS1/0MxaQLE7EZuktAfjhWvHNXzOOYh2QCuVdAu
 yRcZPij2K9J2lr9IwCAdzOShB36G0NKeDjFUm7NWUbhInwB3Nrns4z02u3NUM9UcQiJe
 Ev/Vn4Y04cI5o7xQtF7DoJDc0f8HmgN0DRP/1zMBxLx3l/dT/zyFIKGCqnvtUw86f5EZ
 3xCA==
X-Gm-Message-State: AOAM533wdyar0vniiZzh0Hr86gHWwlcgrog1CrCxM4WhBJKqqNCCntSE
 qJFMe3W+sEz50pAp8v5YsTsEmtsCfNmVwQ==
X-Google-Smtp-Source: ABdhPJxKIcbRqc/SCoo+p5HoUZmtt48AC6pTEApfWZN1/jw5Wi+suC/wWdLbTTZWEMwnYuYmuJM2pg==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr13415687wmi.90.1628150478527; 
 Thu, 05 Aug 2021 01:01:18 -0700 (PDT)
Received: from kali.home (pop.92-184-97-131.mobile.abo.orange.fr.
 [92.184.97.131])
 by smtp.gmail.com with ESMTPSA id y197sm8620887wmc.7.2021.08.05.01.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:01:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 10:01:07 +0200
Message-Id: <20210805080107.1560639-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libebml: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

/tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp: In member function 'virtual filepos_t libebml::EbmlString::ReadData(libebml::IOCallback&, libebml::ScopeMode)':
/tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:41: error: 'numeric_limits' is not a member of 'std'
  147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
      |                                         ^~~~~~~~~~~~~~
/tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:67: error: expected primary-expression before '>' token
  147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
      |                                                                   ^
/tmp/instance-0/output-1/build/libebml-1.4.2/src/EbmlString.cpp:147:70: error: '::max' has not been declared; did you mean 'std::max'?
  147 |     auto Buffer = (GetSize() + 1 < std::numeric_limits<std::size_t>::max()) ? new (std::nothrow) char[GetSize() + 1] : nullptr;
      |                                                                      ^~~
      |                                                                      std::max

Fixes:
 - http://autobuild.buildroot.org/results/3a28507127eae47994ca62e2b656da32bd2fb1f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-header-files-for-std-numeric_limits.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch

diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
new file mode 100644
index 0000000000..83d1b92051
--- /dev/null
+++ b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
@@ -0,0 +1,52 @@
+From f0bfd53647961e799a43d918c46cf3b6bff89806 Mon Sep 17 00:00:00 2001
+From: Moritz Bunkus <mo@bunkus.online>
+Date: Sat, 27 Feb 2021 20:36:52 +0100
+Subject: [PATCH] include appropriate header files for std::numeric_limits
+
+Fixes #80.
+
+[Retrieved from:
+https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog                 | 4 ++++
+ src/EbmlString.cpp        | 1 +
+ src/EbmlUnicodeString.cpp | 1 +
+ 3 files changed, 6 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 034cf86..e4b13a9 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,7 @@
++2021-02-27  Moritz Bunkus  <mo@bunkus.online>
++
++        * Fix compilation with g++ 11. Fixes #80.
++
+ 2021-02-21 Steve Lhomme <slhomme@matroska.org>
+ 
+         * Remove Coremake project files
+diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
+index 27e55fd..4c05fcf 100644
+--- a/src/EbmlString.cpp
++++ b/src/EbmlString.cpp
+@@ -34,6 +34,7 @@
+   \author Steve Lhomme     <robux4 @ users.sf.net>
+ */
+ #include <cassert>
++#include <limits>
+ 
+ #include "ebml/EbmlString.h"
+ 
+diff --git a/src/EbmlUnicodeString.cpp b/src/EbmlUnicodeString.cpp
+index 496a16a..99fc073 100644
+--- a/src/EbmlUnicodeString.cpp
++++ b/src/EbmlUnicodeString.cpp
+@@ -36,6 +36,7 @@
+ */
+ 
+ #include <cassert>
++#include <limits>
+ 
+ #include "ebml/EbmlUnicodeString.h"
+ 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
