Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2133C54E71
	for <buildroot@archiver.kernel.org>; Sat, 24 May 2025 08:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3383409FE;
	Sat, 24 May 2025 08:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jL-DsaFefTur; Sat, 24 May 2025 08:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4E0540969
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E0540969;
	Sat, 24 May 2025 08:05:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1EADCA
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C308760B67
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dz25amBLkEs for <buildroot@buildroot.org>;
 Sat, 24 May 2025 08:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1831060B92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1831060B92
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1831060B92
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:05:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a367ec7840so412314f8f.2
 for <buildroot@buildroot.org>; Sat, 24 May 2025 01:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748073907; x=1748678707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PPxrI8CH2rrr/8ehTmaX9FRrb85FBzMrfaKOvdWHFbI=;
 b=esyjoCMUORCBPb4dygYQKHzxerQbq1VJzaePW61sQRtDY9AIHKKdJpGL+bVsLX2+Lh
 LU8k6mL/WAF/osqck4+Hy3g26eShaAUcGW7eczsa15mdkA7whGsAFmlBZbpOlx8KdBdh
 srKLva6xXdzqkBk/Xad9IO8d8TYkC94/HGjl2mxKaYLYRQZkQUMc8yEJK77OIo5dDAzm
 2zJgAYwtA8Ptp9h9C0t6K/WIiywlGqm8q7cq0hD7HETIqD2IaFeHN7vKAE34S3NvI9v4
 oVXog/aGXoXKQYKd4eQ2E9Ay4x8CYCQ0poeurGJ1joA9IGnXnF5/X/2j5wbOau7GQtEV
 iqnQ==
X-Gm-Message-State: AOJu0YzGUMntotbHDD3s+bZGwwstSvHGlofzJzFAxpR8WvlS0sJMEZBb
 O4hgZKROwUFinvf99w1Nv28MIgePJSqaWl+kM1rXgOoy3d8xF6w5QcE/WI3AAJ27pcn9/lvFxwv
 vUqlP
X-Gm-Gg: ASbGncsJ3fMAZHLjFpf6KuwbQ1ZwhDXqL2oTbHOdeRLcx4d29kKxoYIHTH/vsIIETTJ
 kWnKtyouN38T4ERSPCZVgslpufUo0pO1tTG7gGQJi8PqwZBfsRbrZeubBQUHjVQjqemzOCwzg8l
 f4sX0PyzkwXZ74p8jmw96ksQML3v59YeHfLyxwGQMEGFFqVyPAZ6Qpnd+ps1KV+iAxk+zGqxkS9
 2zSgLidSbsrrH0ArsqcwaSaBEtwIyq7tWnjs8j6xy3mZk81ysDmqv83Fa7nCpofS6Ou29D3yKkN
 1Z339zjUU+BjmntLZSoaH3BTEL8ySTA+pr956asQYx2TuCDJeYVYml3/gwDo8kF4ZA==
X-Google-Smtp-Source: AGHT+IGONzhYkLzt8fUmLCewjxZmKwZ8KEfJVDzzimIUukVbvkB0xOkeXT4q9SpmR1yYL2qcApseRA==
X-Received: by 2002:a05:6000:144f:b0:3a3:7255:dfd0 with SMTP id
 ffacd0b85a97d-3a4cb46cec0mr1710587f8f.17.1748073907405; 
 Sat, 24 May 2025 01:05:07 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8ce9asm28868650f8f.86.2025.05.24.01.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 01:05:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 24 May 2025 10:04:46 +0200
Message-ID: <20250524080446.1185955-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1748073907; x=1748678707; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PPxrI8CH2rrr/8ehTmaX9FRrb85FBzMrfaKOvdWHFbI=;
 b=gAUmX1heVo4iwf1gEv7Trh+44hFySSjIpvC/zoxLUJTpnyMBmdUQngEZOgOeKHODz8
 TOUjR8iWvAXh5levFIo84eolAYI8oxHPnn93sKwCr8fmkxlz5Z2Bplitl/IooU1XMtVK
 I7fexxH6kHubUmPqVjQMkaSauTlchTif4LTSrxPcJQpwgKOBwsvPrhcpm7kJsR7QlEPD
 R3uLesd2D3kwjhdLwtgfdQev21AlNJAzwH+dcAL2LdrpOmcgiQ4wBZuz+EPiSruRnAgJ
 lmsYmNpkyfbxBW7E6zNiH2kQNZb3DY61XHNOC/g806mQEUDqU6Xexv7bIMo8rvgBU0Zw
 qJyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gAUmX1he
Subject: [Buildroot] [PATCH 2025.02.x] package/libical: fix deprecated CMake
 4 policy
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit [1] updated the version of libical to version 3.0.20 which
included a number of build fixes for newer CMake version.
This patch is not included in the 2025.02.x branch and libical remained
subject to a number of build error with CMake 4.

This patch backport the fix to remove the usage of the now deprecated
CMP0005 policy with CMake version 4 (see [2]).

[1] 8cdeeb536c package/libical: bump to version 3.0.20
[2] https://cmake.org/cmake/help/latest/policy/CMP0005.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ger-support-old-cmake-policy-cmp0005.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch

diff --git a/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch b/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch
new file mode 100644
index 0000000000..6e21c6d6df
--- /dev/null
+++ b/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch
@@ -0,0 +1,42 @@
+From 7f07ace91faa8b1d578bf5bac2987660f91f31ca Mon Sep 17 00:00:00 2001
+From: Allen Winter <allen.winter@kdab.com>
+Date: Sat, 14 Oct 2017 15:49:54 -0400
+Subject: [PATCH] CMakeLists.txt, src/test/CMakeLists.txt - no longer support
+ old CMake Policy CMP0005 ISSUE#315
+
+Upstream: https://github.com/libical/libical/commit/7f07ace91faa8b1d578bf5bac2987660f91f31ca
+[thomas: backported to v1.0.1]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+---
+ CMakeLists.txt          | 1 -
+ src/test/CMakeLists.txt | 2 +-
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d5aad80c..e2d5de72 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -50,7 +50,6 @@ project(libical C CXX)
+ 
+ if(COMMAND cmake_policy)
+   cmake_policy(SET CMP0003 NEW)
+-  cmake_policy(SET CMP0005 OLD)
+ endif()
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules)
+diff --git a/src/test/CMakeLists.txt b/src/test/CMakeLists.txt
+index 322b5e40..31ab6199 100644
+--- a/src/test/CMakeLists.txt
++++ b/src/test/CMakeLists.txt
+@@ -6,7 +6,7 @@ include_directories(
+ 
+ set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR})
+ 
+-set(TEST_DATADIR "\\\"${CMAKE_SOURCE_DIR}/test-data\\\"")
++set(TEST_DATADIR "\"${CMAKE_SOURCE_DIR}/test-data\"")
+ add_definitions(-DTEST_DATADIR=${TEST_DATADIR})
+ 
+ macro(setprops _name)
+-- 
+2.49.0
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
