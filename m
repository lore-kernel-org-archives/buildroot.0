Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFA9C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 13:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A948681E90;
	Mon,  7 Aug 2023 13:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A948681E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05XeaEwA8Zz2; Mon,  7 Aug 2023 13:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB1BE81DF4;
	Mon,  7 Aug 2023 13:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB1BE81DF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26EEF1BF909
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2A82409AA
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 13:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2A82409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5qxPyRRbRvm for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 13:42:26 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD743400E3
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 13:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD743400E3
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe45481edfso35617945e9.1
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 06:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691415744; x=1692020544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGF1MgLi+1VTd3q2dFzhaABeNJOYabXutnDoNpmuvU4=;
 b=BN8zF8+dPbV0G1R4GyDz9zJ34w790wCNP1xSTZ0Pz/8l1G5dCyhNgwhCq4eYpx1QUL
 uZhS2iSAA6NjC6kG/tEV+O7OxM8zUkCSvHv53GzuqIGqinsR+egF0bg2+l2zbNrkV9td
 F33G7pGjBT2VBY3ApJr5HTH1komw0+C4hnu0yrF2MrAonQvGeuGCcLpfs5B4WMIhR55I
 kBJdl4gNEdrkMkhN6hTmwge8EE526bIXmfHtYvyBVEebXHYI3TTqjkWsnyeThOZKobpu
 22+YB6xSZkGXcXYKZy0ITU6QkpohraGthpXSOdyV+gpmZMflu+7u5VudjCzePCpSYUSW
 JhvQ==
X-Gm-Message-State: AOJu0YyUhub1tqaFO8RKdnjT8Py6BjQNY3FhVPqO1eCkv6qO4TvlfV5Z
 64N8LEE6V714tZaYUzIF7Xyw5CHAbFEhtQ==
X-Google-Smtp-Source: AGHT+IESeJIwjxbgWoasixwf9xlQnu06ysBRu3ZMHn9Sg7CsIkTAYic5f8gaw/L5fT7G0lYtrkZ9aw==
X-Received: by 2002:a05:600c:ad8:b0:3fb:a0fc:1ba1 with SMTP id
 c24-20020a05600c0ad800b003fba0fc1ba1mr6966753wmr.35.1691415744236; 
 Mon, 07 Aug 2023 06:42:24 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 z25-20020a7bc7d9000000b003fbaade0735sm15114562wmk.19.2023.08.07.06.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 06:42:23 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 15:42:19 +0200
Message-ID: <20230807134219.1598626-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691415744; x=1692020544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=JGF1MgLi+1VTd3q2dFzhaABeNJOYabXutnDoNpmuvU4=;
 b=n7eS7SS+93PBUcqWpVGTyemhNHNB1xdVFlspZHOLJlYQrmJafNsnHkXIN0VpBARZGQ
 qdPk8/M7VtzS+hLCgPsPAe7omhm03F33cWk5WIyEcvdIuEdVTDHKSp7TlJ2GqkBv7VjS
 hDZ6YrbDz1udAzHM2K4Fy6cpx2nkGhbiTFh1GSxjLbi9mY9BA0wnyPz3WP9QP7DD1r18
 6/tDBy2xooFuU0Ey7RENc9u7LjInuMq7IIHJD6T4qVeNbZvgKpsgJIzsPVyRTSEskWuW
 32F300FJap2lijw7qlyA/W6SpPKDXjE39IpdBM0yXRRYS8QjYuf4uO73juAtAte8VR0v
 duow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n7eS7SS+
Subject: [Buildroot] [PATCH v1,
 next] pkg-cmake: fix typo for the make backend
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A small typo in commit 4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606
causes the wrong path to be selected.

Cmake breaks on the first compiler check because it isn't
able to call the make program with the -jxx added.

$(firstword $$(MAKE)) --> -DCMAKE_MAKE_PROGRAM="/usr/bin/make -j13"
$(firstword $(MAKE)) --> -DCMAKE_MAKE_PROGRAM="/usr/bin/make"

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index e085fb2b5d..3483b50d46 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -65,7 +65,7 @@ endif
 ifeq ($$($(3)_CMAKE_BACKEND),make)
 $(2)_GENERATOR = "Unix Makefiles"
 # $$(MAKE) can be 'make -jN', we just want 'make'  (possibly with a full path)
-$(2)_GENERATOR_PROGRAM = $(firstword $$(MAKE))
+$(2)_GENERATOR_PROGRAM = $(firstword $(MAKE))
 # Generator specific code (make) should be avoided,
 # but for now, copy them to the new variables.
 $(2)_BUILD_ENV ?= $$($(2)_MAKE_ENV)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
