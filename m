Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687D4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 17:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEF183F9B;
	Fri, 14 Jan 2022 17:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzMzFYcnRJ3x; Fri, 14 Jan 2022 17:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7B383F85;
	Fri, 14 Jan 2022 17:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95D041BF28E
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 17:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 921BA4157B
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 17:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtW3Ikhd4JFX for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 17:20:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B50641499
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 17:20:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so6866097wme.4
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0JLe7795ddUzTkEwq2wL7nx56Ow0QcUN65U3HkL1PY=;
 b=qcIaLGQ5ib0MJGd/H4031pXRhwSWT5tx69+0hqCcg8c3D3YpY6UcAlBFHnmk3iecDg
 2n1k7fIBTb2aUI5lTmfh7znzUyaEatFH9myyn7Os+suPnXYz3e7CmorQ+xOFa6/bTE47
 Ful+fXl4MJIN6x0BX0eRqewCuHrq1/IfY0Oe92npTGUaZpqtISo4F8VVR20pXzC2961w
 aWsg//qbvs54PTVDSZPVpIP8rqnSYr5aAhfP15Z1g01mFXR1JK0QY0qACvwjlLfVcWu5
 gEDhfzRW4Nb4LStKpvhW8Nggd3wjh1WaNJbLmkzfNzsu/fSe+bdLUcFqAdGwWJWP5Tvb
 VjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0JLe7795ddUzTkEwq2wL7nx56Ow0QcUN65U3HkL1PY=;
 b=CguMpSDLq+7HrpwXejFZwrfOKqZBg9HvNVncIx8hINVTl1ACUzNCYSixcb0yD5mkUi
 ZryKsoprMbIvoq16oLZQs58endph4G5ouZoVNSyHnyO2MXRL9FKB7MTXs4IQcb5jsvFZ
 UzIgl1av+bIsVIY9SuX/T8eCO5rynAX4iMGkMNNojVrJeZgRV9W32GsUeepGXzyFzYSx
 T6Xb9qZ+P2ybsVOKcYPndqHo1IcmeornU+OHPWKheNTtrvG0BNEq2WVFOBZJ2B/5unSU
 kZBxD7uWp4Tb6KCLMnKpa/lY4/uqOXrpYUM+azWsKX17rbJCGyJ6uWJdMW6289pOpWcI
 hI9Q==
X-Gm-Message-State: AOAM533xJ4cEQ1qAwLnrJyLLapvtEAJvS01wparI0Y+omEyjl+kIGlg6
 7ku+aP51zH6joTaeEvgUlYHAYKOsZiE=
X-Google-Smtp-Source: ABdhPJwceulcRQKNMiciPSaDt490HfMKDzCpn71f22/j5ixDu4MHqtHupBwrbj/MXzzeZSP4ZDNe9A==
X-Received: by 2002:a05:6000:1106:: with SMTP id
 z6mr2556362wrw.703.1642180839391; 
 Fri, 14 Jan 2022 09:20:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id 11sm9010894wrz.63.2022.01.14.09.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 09:20:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 18:18:47 +0100
Message-Id: <20220114171847.634174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: enable system on host
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

boost system (which provides boost asio) is needed by host-riscv-isa-sim
since its addition in commit ea033cecf990ed3f86619647523a9ad2ccb09adb:

configure: error: Could not find a version of the Boost::Asio library!

Fixes:
 - http://autobuild.buildroot.org/results/6c33a66386ab2171454d8ea8c1bd17a5582e21dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 6d1046e9a2..2d2a8fb311 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -17,7 +17,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
 	contract container coroutine date_time exception fiber filesystem graph \
 	graph_parallel iostreams json locale log math mpi nowide program_options \
-	python random serialization stacktrace system test thread timer \
+	python random serialization stacktrace test thread timer \
 	type_erasure wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
