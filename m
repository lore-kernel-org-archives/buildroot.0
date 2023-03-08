Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB4C678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 18:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70EDA605A2;
	Wed,  8 Mar 2023 18:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70EDA605A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dc5sx7o0HY_E; Wed,  8 Mar 2023 18:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACC1660E4E;
	Wed,  8 Mar 2023 18:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC1660E4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 643541BF285
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 18:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DF8B60E4E
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 18:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF8B60E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkGEHLSiUUBL for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 18:07:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F95C605A2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F95C605A2
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 18:07:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j2so16219184wrh.9
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 10:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678298877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2/zva6ENnSVbGd1X7kKTC/GxTAgFNVXZ+9Zm4SwZJl0=;
 b=NwQLm7nUAT9uZVj7Q+O97ngHrY/IhSFHraCvMMv+GWeo8EHBj4DW+026Iwa8MfimaQ
 T3+6xQuQ/atk3OOIOmM9fpVO4mzGtOuutFqSD/ml1bEz9QBe/x2ugWLk/HW7MNBDQFUU
 qV69ym4awcg2NdzOkggkwltW9GzLFpU9FFt3soVlFxg4ryOuuyHgajYjigOt6GlHRcql
 D1JNSBchSWTHlUU3obzDFZfRQKcHxU4bHWRgFb/+S+eul3uRHDoHoa1u0rDhaqvmO6iM
 Pz5LCLBcCYm1D5fZMLsHK+Vo25sxv4pp3aurjxP4NgmzM427wrZOawofQrrWVKARntKQ
 BhiA==
X-Gm-Message-State: AO0yUKWOhfwSynakFtYfWmIKAYpqS7HbbClwmqpc6AaSN+kSIpBM2JrX
 q35lBcMNR8Fy+VnFFnRenBXaGm9e0ok=
X-Google-Smtp-Source: AK7set/onI8WsMY/IxAV42vZpYUjXfuvm4Ujvb9m8tcB2u6FmrCCU8j9dnBKV+xmLnAD1ElIMFqC9g==
X-Received: by 2002:adf:f3cd:0:b0:2c7:1d0d:7184 with SMTP id
 g13-20020adff3cd000000b002c71d0d7184mr13654372wrp.11.1678298876744; 
 Wed, 08 Mar 2023 10:07:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm16243219wrw.116.2023.03.08.10.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 10:07:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 19:07:51 +0100
Message-Id: <20230308180751.20525-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678298877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2/zva6ENnSVbGd1X7kKTC/GxTAgFNVXZ+9Zm4SwZJl0=;
 b=mBDNKfBnFyXyuJ/hUpDtxHvH7F8CoQ/TLrXeZgKOIr002L3mszLm192JCavyNz8s7V
 meqD1bC+hiuUaOwQkr6cJltfEyNOFkg+HVQiLC36oIcAMObEq0wbAgkIk6pUC/K5g0vG
 B58Gmb8mTGMMoZ248pszz8i983mev4soDXnyXQOt70qPgmMvQ87E5QuIdakX1QhzoPVt
 Nq2Eri8DDLN6Vj5ciJjGq3hjO1k/hl2oF5Pt91FhcpJ6hLgmsL+oo3rREXl7eI4eokMx
 Ur0ZYQ9j43dOvvrF0/N09jwNs9iucj3WcmXAAZd+sDJ6R+mJBfpT8Ltu40vbQ5rEV8Vn
 XPJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mBDNKfBn
Subject: [Buildroot] [PATCH 1/1] package/mpv: needs NPTL
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
Cc: Steve Kenton <skenton@ou.edu>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mpv unconditionally uses pthread_getcpuclockid since version 0.33.0 and
https://github.com/mpv-player/mpv/commit/fd3caa264ea0848e7e30db94390063c87e247003
resulting in the following build failure without NPTL since commit
e3cf26dda31e6c1720c53e0229d93fe2a5ea18aa:

../common/stats.c: In function 'get_thread_cpu_time_ns':
../common/stats.c:75:9: error: implicit declaration of function 'pthread_getcpuclockid'; did you mean 'pthread_getspecific'? [-Werror=implicit-function-declaration]
   75 |     if (pthread_getcpuclockid(thread, &id) == 0 &&
      |         ^~~~~~~~~~~~~~~~~~~~~
      |         pthread_getspecific

Fixes:
 - http://autobuild.buildroot.org/results/98cde5cbb0844c6ef483a75cf9a6f3fd3a46c693

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/Config.in   | 6 +++---
 package/tovid/Config.in | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 6811497d73..8efb353c33 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_MPV
 	bool "mpv"
 	depends on BR2_INSTALL_LIBSTDCPP # libass
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
@@ -34,10 +34,10 @@ config BR2_PACKAGE_MPV
 
 	  https://mpv.io/
 
-comment "mpv needs a toolchain w/ C++, threads, gcc >= 4.9"
+comment "mpv needs a toolchain w/ C++, NPTL, gcc >= 4.9"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index 3dbb0e229e..c263acdd62 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_TOVID
 	bool "tovid"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mpv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON3
@@ -29,12 +29,12 @@ config BR2_PACKAGE_TOVID
 
 	  http://tovid.wikia.com/wiki/Installing_tovid
 
-comment "tovid needs a toolchain w/ threads, C++, wchar, gcc >= 4.9"
+comment "tovid needs a toolchain w/ NPTL, C++, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR
@@ -45,6 +45,6 @@ comment "tovid depends on python3"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
