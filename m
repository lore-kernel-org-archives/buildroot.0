Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29707C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 18:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA4D4037A;
	Mon, 13 Mar 2023 18:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA4D4037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hj2-_r7UfNyh; Mon, 13 Mar 2023 18:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9600640342;
	Mon, 13 Mar 2023 18:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9600640342
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D22341BF365
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB63402E7
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACB63402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yxny0mrevDwb for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 18:32:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A697A40181
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A697A40181
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 18:32:42 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x3so52437552edb.10
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 11:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678732360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8JU9v7jrYruRMDJfNhcq5X1N/iwX2sSSfH4GrViappI=;
 b=0GZADIsByP87fNh1dJcmbY8ZXzQkz1m/IVTLYxD1VRsgYwQxW1WfvPjsKpwn9iGREd
 zGKPPUScupXBgMRZcxbivDZXGMRRL/v/NgvA/PeRn6E4KVRXzuNCc352O3BEj4YGRc+F
 38a0bWmGYclRXw3EAAhlU0A0hGDKPf7Zw+EBaqGJ8YPFQeQZqUfHYdnQFpQ8TTqJdA3h
 VURMc0DDLS6hLkztSb93pHerYYybSIRwhXblbF6WsnxBDWoFZERRDrCdNAtlX0FbCpZg
 /xJw9IQMC9jz70UH6Gf50pqNbqV4J14ajAAEuA4BXUnEQnUtVbXqvl0UrR7+4JYwLvse
 ryyA==
X-Gm-Message-State: AO0yUKUjYo8Fdbabu1Zwp3OeekSJqyH0Fpp5KgxMQdDX49FXU27gU3U4
 nak6QFq0VmOR8cTzts29dO5Fo+NvQ0zbF//P
X-Google-Smtp-Source: AK7set8Cu1uYaTOLLMaelazjONxiTkDPJrWcdhoGekIm3UHZuDwdZk2kqaifiV+kFb2GilieUINMog==
X-Received: by 2002:a17:907:3f9d:b0:923:c55d:efd2 with SMTP id
 hr29-20020a1709073f9d00b00923c55defd2mr2015293ejc.68.1678732360562; 
 Mon, 13 Mar 2023 11:32:40 -0700 (PDT)
Received: from romans-MBP.lampertdns.at (194-208-157-122.lampert.tv.
 [194.208.157.122]) by smtp.gmail.com with ESMTPSA id
 z92-20020a509e65000000b004bf5981ef3dsm98970ede.94.2023.03.13.11.32.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Mar 2023 11:32:40 -0700 (PDT)
From: Roman Passler <roman.passler@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 19:32:35 +0100
Message-Id: <20230313183235.2665-1-roman.passler@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678732360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8JU9v7jrYruRMDJfNhcq5X1N/iwX2sSSfH4GrViappI=;
 b=afXUGL/ZWjykOfcFOJIPyvvsCe65W4VXvP8hq45mRBVqCsHdbIE8IiPBFB4on4S00h
 BmSTKorYEtq6Qgmwr3oVpX3Et79Vp/ZQsQcG67QFVgLeSkqri/9pqrV8QVEP1ma4eQdI
 36NfG0KCHo9m+KedZx7fmIAkWff0s6hB8KyfphmJU18oEvTBWB+m3pmDztLBqIKo8ZgH
 dzHcM1u2o0cTVvfPbMM82mGpj/Tes4HAhCDVEgoK3YSwkwFx+1mRvZhRM20zehreiSji
 j0QMeEp9uZtUxTVQkUn4bGTthsjPiOlydUMMuwvgYTw1Ydu+yHoqrzetfp8W3l4AeagC
 4gWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=afXUGL/Z
Subject: [Buildroot] [PATCH 1/1] package/openocd: bump to 0.12.0
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
Cc: Roman Passler <roman.passler@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change-Id: Ie76a4f365af3f59c80241fe4935129d1098b140d
Signed-off-by: Roman Passler <roman.passler@gmail.com>
---
 package/openocd/openocd.hash | 6 +++---
 package/openocd/openocd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index 91eb56d930..325f55bf04 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/openocd/files/openocd/0.11.0/
-sha256  43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b06b3d1e7d  openocd-0.11.0.tar.bz2
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+# From http://sourceforge.net/projects/openocd/files/openocd/0.12.0/
+sha256  af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa  openocd-0.12.0.tar.bz2
+sha256  1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  COPYING
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 37a06ca848..95a7fd3c2a 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.11.0
+OPENOCD_VERSION = 0.12.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
 OPENOCD_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
