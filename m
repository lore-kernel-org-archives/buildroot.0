Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409B1C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 19:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA6E682129;
	Wed, 14 May 2025 19:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cxm3tXqvcwVV; Wed, 14 May 2025 19:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17ED481277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17ED481277;
	Wed, 14 May 2025 19:43:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45655150
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36C7640177
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zC1n_qB_5vRi for <buildroot@buildroot.org>;
 Wed, 14 May 2025 19:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 414FA40151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 414FA40151
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 414FA40151
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:43:27 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-85e15dc8035so4711839f.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747251806; x=1747856606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=drt0dEMik9n6zgabPTtBQ7hJnqm2ciavP4+KHSXbUYA=;
 b=ibtT9tsVJUIaLWPaEOnQbTeJ3UubZCVAdsfph5F8KE94XOV8ntAiDB345KkXoE3Woc
 RcoNyFKSSnPp0zvgFogEdxDDFxMbaHQvLD9aC1+9BeWlUoAjuFH0AzHv9vsCaERriCLe
 /m3r640SL1DBkEMXaftgM41a3swI6dNDRKIwe8HZS2xP6bKfoEYHbfv1Yn5tgUirwPRs
 SraCMdvjxEvNkCWE5FIt90Fw3cKj4W40FCZBFBY1oebeDsrp0RNivdOsIPS/0OiC9SYz
 U6ekAY4b91ZIl376NiaFxK67khENo/jK6n2ZmfYJLj+0Sd7K5kdTw3XGvYZ+H4dr8OVm
 /EOQ==
X-Gm-Message-State: AOJu0Yyn9jkjLkdMy2+b8G0cAzH2dK8ePhXE6+nfkkASLEUNh8Pbdf39
 qft+sVCJRH1GXVA2oQpmyVpUpDXVSKYqX8Zv1Rq2VRu2lNjZldisQ4adt406
X-Gm-Gg: ASbGncufasvxaS57SSPPl1miw/dKH/7J56l0fqgJninZ3BBOBVxZ3Yug8UQli8bxKsa
 XbCZTkqYA/PRWIOKvU1gcqBHLzI1ajGWn3NM3IaVHIEB9mTVjB825Tz3L5L3engJxUTRhcmq0vD
 u4uf59CdWigXvS0omWPx9VmU7gJnftwKvgSEaO5j52fXbFjyjKbZpQgWe9aAM5jQOKFtMqD94V6
 kwEVH+lNYOwhbNiDuODXFJo/k9IMn077PoxE3xzhEi0QDoPvC4EvT3BJ3QSr2F8ef6LQgXVSM+R
 idSSg2xmNpRwVwZ8CJo7YLjkisKkuGFzCrR/y3XWDOzlLZMRyRg5IEe8OQXag4YDXirGd73TRx/
 Hx30/MkYg6ubrw1ka4fELapl/vJaJGA==
X-Google-Smtp-Source: AGHT+IGZS+4PwZCnHc8AsqLU9/sozK7+syIFtIyVaGv+Ey0mF4+dvuSPyPLJmMhMWrnDfmyxQOJHYg==
X-Received: by 2002:a05:6e02:b46:b0:3d8:1d0e:5308 with SMTP id
 e9e14a558f8ab-3db6f7a270cmr51799345ab.6.1747251805902; 
 Wed, 14 May 2025 12:43:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa2253982fsm2759159173.70.2025.05.14.12.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:43:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 May 2025 13:43:24 -0600
Message-Id: <20250514194324.683472-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747251806; x=1747856606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=drt0dEMik9n6zgabPTtBQ7hJnqm2ciavP4+KHSXbUYA=;
 b=fNvGrdchoathJ/2wEAhgDfRl7g2RNAzYvZhZaHCUgVZOKaWccHwLapUrb8oTUuaR6Y
 l2ljjIep2JTgeyymd/eMu+Mer+0Fy0+D++78SAyM+6yJBx/xmeQUgGUXYZ55DaXFAGQO
 gtXdEWZ0rFNH3UaxpFO2IxQg8wjQhRTT+qODnCdMDNRRvG82kpEmhXrqnwo37FSZLede
 Dl2e4PQhDYSwdnIXUXf9CM4t0Y3XabfgdDqRncojsTROnHMYIsnB89/L+c4bplUs5E50
 bX2vJBtUkeAO8KaG0sdqjKWpKlAhuuCLrWouAk/AycD1JEwn80pxuF31PKbEWHfDH8gk
 7EVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fNvGrdch
Subject: [Buildroot] [PATCH 1/1] package/intel-gmmlib: fix cmake 4
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

Add a patch fixing cmake 4 compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...imum_required-to-3.5-consisently-acr.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch

diff --git a/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch b/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch
new file mode 100644
index 0000000000..400cdf667f
--- /dev/null
+++ b/package/intel-gmmlib/0002-Update-cmake_minimum_required-to-3.5-consisently-acr.patch
@@ -0,0 +1,43 @@
+From c9db6e993d4e440a276f2918f48de0868fe98093 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 04:45:44 +0000
+Subject: [PATCH] Update cmake_minimum_required to 3.5 consisently across
+ CMakeLists
+
+Source/GmmLib/CMakeLists.txt already is requiring CMake 3.5. Update
+remaining files to 3.5. This supports the compilation with cmake-4.0.0
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/intel/gmmlib/pull/130
+---
+ CMakeLists.txt                      | 2 +-
+ Source/GmmLib/os_release_info.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1a3ad36..ca42104 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 3.1 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ if (NOT DEFINED RUN_TEST_SUITE)
+ option (RUN_TEST_SUITE "run test suite after install" ON)
+diff --git a/Source/GmmLib/os_release_info.cmake b/Source/GmmLib/os_release_info.cmake
+index 70c8318..0951a4a 100755
+--- a/Source/GmmLib/os_release_info.cmake
++++ b/Source/GmmLib/os_release_info.cmake
+@@ -28,7 +28,7 @@ if(NOT DEFINED _os_release_info)
+ set(_os_release_info TRUE)
+ 
+ # Set cmake policies for at least this level:
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if(POLICY CMP0054)
+     cmake_policy(SET CMP0054 NEW)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
