Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8473BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 00:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1E2C404F5;
	Sat, 15 Oct 2022 00:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1E2C404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIz3wnxUAcVj; Sat, 15 Oct 2022 00:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D0534019B;
	Sat, 15 Oct 2022 00:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D0534019B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC741C2744
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 00:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F73824A4
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 00:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F73824A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nOHfIxyKPrP for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 00:56:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C1182470
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97C1182470
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 00:56:18 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id l127so5179514iof.12
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 17:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qpB/+WZPsK8K17LU27VlII4Gc9ZTjhPhcjZz1VOg11I=;
 b=pGitI+Z+Jsct1RYT3PVKz4pLCig9i7eWvbZRd/IecPB1XqFf7JjIsncMrRMJe6N6xC
 +tg8Qy7OQOJlJRtfCetz2LoO5C6TaX9AHi2wok7HpOE2T9XZl5kujzWHOdfyV3lzdcng
 j/PfeVCJDaijWuy8Tq3NTZwQUtOLQrkFBgl6qYeEz+iRbJ+uyxy+11LeSiY9X8TuQSYB
 k+9tPvMnlv1lW4Ko2jVGg8xdHDJDy95LwizgQ+E35Jtax7muXh+4lMVXRjSIU26SX8sU
 1r7cgrfwI1Oix5KsKr9nbtWeMUK2IUffOIInwLsn2vBZDy+E5fVFht8m4giAOhK7WQv8
 D9lw==
X-Gm-Message-State: ACrzQf2locM/ubVQf+Yh0zxeQ8mkBbxjCm9qkE/9NrO/auM98E9gtj+T
 jsM9Jqg6BMl8Rp1H+5voXl6faBGOBOwJxA==
X-Google-Smtp-Source: AMsMyM6qfmcarG0EVtBvyxpfyb4vgJtazClnrjR4Z3Qu4NBz51tVCiQwpx5wTQWMiQqw4KJsD+F+aw==
X-Received: by 2002:a05:6638:1a8:b0:363:cee0:84c with SMTP id
 b8-20020a05663801a800b00363cee0084cmr254641jaq.52.1665795377272; 
 Fri, 14 Oct 2022 17:56:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z28-20020a056638215c00b0036358581b14sm1648623jaj.97.2022.10.14.17.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 17:56:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 18:56:11 -0600
Message-Id: <20221015005611.4054933-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qpB/+WZPsK8K17LU27VlII4Gc9ZTjhPhcjZz1VOg11I=;
 b=daYFrB2s5eRRaxV+L3q+bMdiFm8zu3RS5xNGDyY593hnj0vhPVyiE5LQB7ndyM5GiU
 PRHhTwj9lqs0iE8iU020aRmbeZI1sEEh7V6LY7sHcEo2AQdGDeTYcyBHPodWzATOwnxm
 F7xakY8Vg8Zc6IpGqOT7C6JuyT7VXYQWVx58LZI7RQYgdaeaN/7X3cl1NHnNQD6XdxuD
 fN2iQNpZE9me2xl2/+PUjovba3lM04uYAQIN9lHM5o0MML0xeAhdlFQLzLDwDc8rDbvd
 qSk97Dvk88KovL8kFF9Djz7FLrDnx+LWG/+BvJ59zyTbfSGHy46gvV+HygEWNKHZTslG
 +WnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=daYFrB2s
Subject: [Buildroot] [PATCH 1/1] package/Makefile.in: set .NOTPARALLEL for
 MAKE1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make 4.4 introduces a shuffle mode which randomizes prerequisites
in order to better flush out issues with parallel builds, as this
mode randomizes prerequisites even when using -j1 builds we must
instead explicitely mark parallel incompatible builds using the
.NOTPARALLEL special target which disables prerequisites
randomization when running in shuffle mode.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 43d214bcbe..2327849a1f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -17,7 +17,7 @@ else
 PARALLEL_JOBS := $(BR2_JLEVEL)
 endif
 
-MAKE1 := $(HOSTMAKE) -j1
+MAKE1 := $(HOSTMAKE) --eval .NOTPARALLEL:
 override MAKE = $(HOSTMAKE) \
 	$(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
