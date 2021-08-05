Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BDFC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:59:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658F160F38
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 658F160F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 329F781A5F;
	Thu,  5 Aug 2021 08:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BftKHzpofBKf; Thu,  5 Aug 2021 08:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A5BC818A1;
	Thu,  5 Aug 2021 08:59:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5F21BF20B
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47FE283947
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EADR2l4uIN_S for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:59:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55679838C9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:59:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so3149471wmg.4
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMUpNiFWrYlKcmxqbVvG9zxzwwZXP1QmoZrTZ1v+tDk=;
 b=Qhz1wWSS6GTm+Ni+tMWPhVX8xUib6kJ3Ply/h+sD3tyw2uoXsXVgIHU9uA9wNtA8o6
 EqVGiRDEMPgOQeYc0TQrivqLHZN9PP8l9TUrfdPfNswuE/rnGXti/Dbh22a0ryZHhyBl
 aRVswQV/gxawZLCrqJ0aHSDgp9YSArXNf6cQ70/lMDTMRJj9C98ToHaWiW6u5CQ+gzE3
 ncUdbHz1hMgLOhFOM1t0de0iyv4jl5pOlUgsz5Ep4hV+IFfsK1IJSshnL+mi6DiPLVOr
 NUD4ydAzz5IaVyNQVpLruxoBq5ELJJbAHGZd7n0c4lL3j+khveodc6BqU9QRr1PCuvfG
 JNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMUpNiFWrYlKcmxqbVvG9zxzwwZXP1QmoZrTZ1v+tDk=;
 b=L2gqEO0abHi0ylpN1KuONVj0IQfqF941DjnID1nbXJF6P/5mnbXPyqoGHOZDmRClny
 ECBP9N0PWoK68ax4GlMIh76BsybHP8krwglXvgEQay4opoITfg5kojiZBczMo6PpTZkt
 FWfGb8MUt9DHURTNO6u/dIGRGNj2uGwZc0HgGp9e7MxT82TN4X2xD9HWh+vgNoNjuSBg
 Xk669xarUfgJKdPjG/JMl7uhkyLK85k1lc4BuSmL6o1zGKnJfN01SWv2KZ03q9n0Jya8
 4l/gI+u+L5zTl88f5K9d38leDVjvjSSZL5j5APf0CJTJB4s1AJ6j7FfRJn9o/4aSapwP
 u9nA==
X-Gm-Message-State: AOAM53070IPsV8E/zfai0Ds9gfF0lUTLJE9PKkaCQ0NRL2VHU59RcZsY
 7Fbi8WIcqAcMmD6ZrfTgeRu77pm/Sy7Orw==
X-Google-Smtp-Source: ABdhPJzgjS0NdbpX3J7TmsKcIKzQtc/IdZ/yEYq8OB00BpENAt5Pv1rRLtYCX93vlejial8L+SHNmg==
X-Received: by 2002:a1c:7709:: with SMTP id t9mr14013093wmi.161.1628153949300; 
 Thu, 05 Aug 2021 01:59:09 -0700 (PDT)
Received: from kali.home (pop.92-184-97-192.mobile.abo.orange.fr.
 [92.184.97.192])
 by smtp.gmail.com with ESMTPSA id r133sm10272199wma.18.2021.08.05.01.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:59:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 10:58:54 +0200
Message-Id: <20210805085854.2105405-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/libebml: fix build with gcc 11
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
Changes v1 -> v2:
 - Remove ChangeLog update from patch

 ...-header-files-for-std-numeric_limits.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch

diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
new file mode 100644
index 0000000000..c7e789c02e
--- /dev/null
+++ b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
@@ -0,0 +1,40 @@
+From f0bfd53647961e799a43d918c46cf3b6bff89806 Mon Sep 17 00:00:00 2001
+From: Moritz Bunkus <mo@bunkus.online>
+Date: Sat, 27 Feb 2021 20:36:52 +0100
+Subject: [PATCH] include appropriate header files for std::numeric_limits
+
+Fixes #80.
+
+[Retrieved (and updated to remove ChangeLog update) from:
+https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog                 | 4 ++++
+ src/EbmlString.cpp        | 1 +
+ src/EbmlUnicodeString.cpp | 1 +
+ 3 files changed, 6 insertions(+)
+
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
