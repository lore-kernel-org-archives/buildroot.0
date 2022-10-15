Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5805DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 21:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7150408BB;
	Sat, 15 Oct 2022 21:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7150408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPAJxXaoZ_61; Sat, 15 Oct 2022 21:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2A7740483;
	Sat, 15 Oct 2022 21:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2A7740483
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5E91BF368
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E790840483
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E790840483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qT8w_dOJiYl for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 21:58:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDC1C400D9
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDC1C400D9
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 21:58:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u10so12823823wrq.2
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Izl6MxftcEH+UHDLfEwTKBQH6HFUbveVYrhMm85XUW8=;
 b=HYXPr3miRa0G2nEY4jC9Pbwj5rCj0o2AdUqDPP4ZvY/UEWw+WxhgxLqH01du2gxSDC
 nz2+dKdGYTWm4kQnVm81Qvvewx3kfmwEwaHcnaS222hMfKtt5ZmsVrYT1ZWIWnycFsh3
 1eLl/thP5p+w460AbaUAA0QpwoVSq5jmCUvcPf9CmbjLKqmpumrWBJEdxduGEF/LjOWm
 Qa3LmDyg2Mrf0EOOs3A3mdISy8Ceoh19glBO9LJ2Or6JGODBzAOFoDI1IcvFtdlhV5lO
 bmzxcGlMZJ60z4cJurePcldjUr+VYZh+p1s5LhzJofOlS9qzVpxkTvZ2m9Ozb1chJtKR
 dihg==
X-Gm-Message-State: ACrzQf1g07jQubWDqp0CIwa+uhnsJpyx9MANR24AYp8Nz3W+CXasM61T
 5/ZcK44UxdDo8FtAb3U5NdaWFMuMAOY=
X-Google-Smtp-Source: AMsMyM690+ZaHp/iKdw0/5NPV7tb+oxb16wqEFuy5pH+0h1SKCApW9SbDTVHm8xQKzi4HxhgElSy3g==
X-Received: by 2002:adf:df8b:0:b0:230:5212:d364 with SMTP id
 z11-20020adfdf8b000000b002305212d364mr2250902wrl.124.1665871116507; 
 Sat, 15 Oct 2022 14:58:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5009000000b0022e3d7c9887sm4859133wrt.101.2022.10.15.14.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 14:58:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 23:58:29 +0200
Message-Id: <20221015215829.116064-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Izl6MxftcEH+UHDLfEwTKBQH6HFUbveVYrhMm85XUW8=;
 b=D6sZOVHv7xUz67DGxwGBc2TnLc4LYhRCstu6oZ8T4UJRz53zWUxLrZqReX5ebFrXLG
 4smhXvAwVp6oFy1yGt1ke9U1ZJlN2s6R/DYIRwrf6eF/nM7YM1OvTc335eqbsqr6XsKa
 yt0FWtPNys9OdRHHbnOUP03quwDW3a5iOkw4jc1xAVCjqw/xOvg+x8bCpmWqCI+ZpVLW
 Npscrm8fA004e/uuAJrQjbCVWVyiBZThdEzGi9RLeWZiWTUbaH2LzGXs5Z8TVD3xJql1
 v5HzdiGYhew1ZzXii5qbh4iXlOreaxU2Q/r/JuHRgBZGIjYrS3jYElYtoCRVR/uSjhGm
 VU8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D6sZOVHv
Subject: [Buildroot] [PATCH 1/1] package/igd2-for-linux: bump to version 2.2
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

This bump will fix the build with pupnp >= 1.14.13 raised since commit
a9ee25b01b741ad4f68575974c89c65146ab87f2 and
https://github.com/pupnp/pupnp/commit/2f99af26731ec7d5677e5576c006a35128b59d55:

In file included from src/threadutil/FreeList.h:43,
                 from src/threadutil/TimerThread.h:39,
                 from src/gatedevice.h:32,
                 from src/gatedevice.c:38:
src/threadutil/ithread.h:917:12: error: expected ';' before 'int'
  917 | EXPORT_SPEC int pthread_mutexattr_setkind_np(
      |            ^~~~
      |            ;

Fixes:
 - http://autobuild.buildroot.org/results/2eebf8264327bd492ee8cadc0c539d42c4f2e252

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/igd2-for-linux/igd2-for-linux.hash | 2 +-
 package/igd2-for-linux/igd2-for-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igd2-for-linux/igd2-for-linux.hash b/package/igd2-for-linux/igd2-for-linux.hash
index fe1272338a..3b4fd4f5c9 100644
--- a/package/igd2-for-linux/igd2-for-linux.hash
+++ b/package/igd2-for-linux/igd2-for-linux.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  843f2b0a7597e6cc7af85da099a7cce3401a334cbb4a6ae9d38ce252311db9b9  igd2-for-linux-2.1.tar.gz
+sha256  68ee10bf02b18890af8bf9e38be377f038627cd16fce54200fc1b26fd83e4375  igd2-for-linux-2.2.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  linuxigd2/doc/LICENSE
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  linuxigd2/src/threadutil/COPYING
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
index 8cc3c6ae18..c646c6bf92 100644
--- a/package/igd2-for-linux/igd2-for-linux.mk
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGD2_FOR_LINUX_VERSION = 2.1
+IGD2_FOR_LINUX_VERSION = 2.2
 IGD2_FOR_LINUX_SITE = \
 	$(call github,Orange-OpenSource,igd2-for-linux,v$(IGD2_FOR_LINUX_VERSION))
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
