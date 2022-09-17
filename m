Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E72ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 16:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 807BB400C6;
	Sat, 17 Sep 2022 16:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 807BB400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmQdfyxqD2PQ; Sat, 17 Sep 2022 16:17:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B978414E5;
	Sat, 17 Sep 2022 16:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B978414E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B36061BF48D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AD5060ACA
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD5060ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFJ7F2YQ21wt for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 16:16:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B7E460A6F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B7E460A6F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 16:16:57 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 h130-20020a1c2188000000b003b4cadadce7so421663wmh.3
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=HTp9rZTzjlqdg6BrufOgqWjLFzsL0hUXFp5YtnkNyQ4=;
 b=5oqLx2IQzUyGvrluVnGOISMEcG/Lf/ff6JGiN5LtBKIBlntrhQw02wsP8poxkQazu+
 rW7giGMIMnz+E5T2265Tvp73k5H+a9RRNhrrWSxCGOjuc9XUHf61mjnaaOoeG6WSPSLx
 T9IatX6eFQUL7xvHfGUXPoZOqc4Ln1bLxUWqMcbnUqkNGwuixxyQ6cFCVTlI+XZjvU1o
 kqt3M5/6DcKShNbmT+Pv5Df0b9rSzw2L2NPIw1T7tl4faD4532ZYf6whsQjAU/h1nRxy
 IJzqBvhJBn78opI8R3I/Q3k5b8lWKMRzhhTt6xDo8C4iYBdcL490Fe8egLEyvhycIPHu
 h50w==
X-Gm-Message-State: ACgBeo2Kegjrow8de9/92/yZAo3627hoDsOrywLsixp8Qguu5s2z6B8w
 PLWBKNtvnIYGbPbmW5PhHSfE0GvSwVE=
X-Google-Smtp-Source: AA6agR4yV6obmLUZjqhZ5RnhAnZdhnnV0jptD+fUzJoTD4C4C51xhvSj10UxO6oFtryBMFYYoIvrDQ==
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id
 a9-20020a1cf009000000b003b4939849c9mr13983287wmb.174.1663431414918; 
 Sat, 17 Sep 2022 09:16:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b003a3170a7af9sm7143943wms.4.2022.09.17.09.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 09:16:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 18:16:50 +0200
Message-Id: <20220917161650.15857-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=HTp9rZTzjlqdg6BrufOgqWjLFzsL0hUXFp5YtnkNyQ4=;
 b=LiO2dcpK4Cx1naxZfSP+UkJa1E1ajMYVXjLEKMymUrqmsqNuq4AagHfPwnfk5Up0uH
 z0smIZ1FLWtnuIVXiEM3iyqfv/tqNuKvo1BWR0YZL4iZ440k+JKDDkmZSYWFgUCfiqXJ
 mNEg/JTNvTgyYbGPYlaMjf1adXjw2b4YYhEM329E4i7pksmuGzr5jOdITW/VcCl0eDe0
 RK7kl3YLiw4Wz+dGqLn++2eiIuRlR/Stc4QUbS4+J8j4fIs/0Y4O/zOB3E/0N+I+qlDG
 /knR4bFh0E1Z9yaR2Y5B/61H7RMDGLp3X3TtQlG6/5hY8J66Q08CFxwibceo506EFwuK
 qUmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LiO2dcpK
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build with sh4{a, eb,
 aeb}
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with sh4{a,eb,aeb} probably raised since
the addition of the package in commit
e43da7bb32285bbd41b38a379aef77132d149df7:

  ERROR: Unknown or unidentifiable processor "sh4a"

Fixes:
 - http://autobuild.buildroot.org/results/fb6885a8a299f20ed77e4c10b330d2a2a7853931

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Add-superh-alias-needed-by-Debian.patch | 22 ++++++++++++++
 ...-data-arch-superh.txt-add-sh4-eb-aeb.patch | 30 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 package/botan/0001-Add-superh-alias-needed-by-Debian.patch
 create mode 100644 package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch

diff --git a/package/botan/0001-Add-superh-alias-needed-by-Debian.patch b/package/botan/0001-Add-superh-alias-needed-by-Debian.patch
new file mode 100644
index 0000000000..c6236849e9
--- /dev/null
+++ b/package/botan/0001-Add-superh-alias-needed-by-Debian.patch
@@ -0,0 +1,22 @@
+From 454c7c04385a47d511cf8999ccff2746afbab06b Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sat, 21 Nov 2020 12:37:06 -0500
+Subject: [PATCH] Add superh alias needed by Debian
+
+[Retrieved from:
+https://github.com/randombit/botan/commit/454c7c04385a47d511cf8999ccff2746afbab06b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/build-data/arch/superh.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/build-data/arch/superh.txt b/src/build-data/arch/superh.txt
+index 6af6dbe682..8e2833a914 100644
+--- a/src/build-data/arch/superh.txt
++++ b/src/build-data/arch/superh.txt
+@@ -1,4 +1,5 @@
+ 
+ <aliases>
+ sh4
++sh4a
+ </aliases>
diff --git a/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch b/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch
new file mode 100644
index 0000000000..aa9f3ad5ba
--- /dev/null
+++ b/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch
@@ -0,0 +1,30 @@
+From c88897ebaf173b97068811b520a4741039f09dcd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 20 Aug 2022 15:16:22 +0200
+Subject: [PATCH] src/build-data/arch/superh.txt: add sh4{eb,aeb}
+
+Fix the following build failure with sh4{eb,aeb}:
+
+  ERROR: Unknown or unidentifiable processor "sh4aeb"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d7750b734736a66e10bc5a8ee06708041b36443a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/randombit/botan/commit/c88897ebaf173b97068811b520a4741039f09dcd]
+---
+ src/build-data/arch/superh.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/build-data/arch/superh.txt b/src/build-data/arch/superh.txt
+index 8e2833a914..e17edb097a 100644
+--- a/src/build-data/arch/superh.txt
++++ b/src/build-data/arch/superh.txt
+@@ -2,4 +2,6 @@
+ <aliases>
+ sh4
+ sh4a
++sh4eb
++sh4aeb
+ </aliases>
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
