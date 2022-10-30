Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F2C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 09:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E839340347;
	Sun, 30 Oct 2022 09:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E839340347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkunmhdrvAUQ; Sun, 30 Oct 2022 09:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2EA7401A3;
	Sun, 30 Oct 2022 09:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2EA7401A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B299B1BF336
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BA84600CB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA84600CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ehhgubcku8j for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 09:28:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AABE360017
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AABE360017
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 09:28:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v1so12045851wrt.11
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 02:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7hZHqbQdbQ8e94scGm9TtsnIJc36ljNeNLfh35sqrBc=;
 b=vv1IdwyCKhXnXrUvr2Z0D+dQZrwYCHAVDtllz85bKMLF7I5eIob+G4SgcLejkcJKXG
 6O4T9lQ5zQt1qA9cFFxcgsMVBnjoNTeSaK2Jl7ISO/FMsdyHk4oB/o4zmZBXi3QQ7t0K
 dsxbNaCt+mjMz7IyieIwCgR6JL9rEsMSKg5E6msDHCu8rIb93/1nmgJ33Kc0X9VP0wrO
 ZwySRVIqxGe8mnIVI2Cps8b3NPGFkvAkrxAOgTsQnfku1pZAls7MUrcdFkDMUuXAtwb/
 xoHq24dqAHKq2eL7bdt5Nvbs7kQt61HjLwBfseyyUpdnmwxfNyiXtAiej3HOFCMhxReQ
 XKUw==
X-Gm-Message-State: ACrzQf10e58RSi3PHuPBNnFesjIcUxFCZSOBh8tZn+QtNu9ODpCdGBcG
 VTZNJagtqLKdvfkE/kr7NCG+MZ9Ixsc=
X-Google-Smtp-Source: AMsMyM7KqoX3Wgg+HBur8yX7y4cQgaYshw1Ia9w5s69RUtIgL2VP/w5mmL3GZ19yJo519o1khQyu7g==
X-Received: by 2002:a5d:644b:0:b0:236:862b:9ef1 with SMTP id
 d11-20020a5d644b000000b00236862b9ef1mr4446016wrw.691.1667122124425; 
 Sun, 30 Oct 2022 02:28:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a5d6f13000000b00236b2804d79sm3706596wrb.2.2022.10.30.02.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 02:28:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 10:28:32 +0100
Message-Id: <20221030092832.43581-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7hZHqbQdbQ8e94scGm9TtsnIJc36ljNeNLfh35sqrBc=;
 b=eDcp/txU9gV1luotDPaqs6AjMlFq3OQk2tIwhkWzF2EEJ2qsYLycUS9kJWY6y3MSwC
 gdXWBAPvy/8UXlzrfymQVUzrN5aKnJSlLDKDvR9+kj2PLRRZoRDAc/Kt1CtgR/zNwVoo
 wbC1GjWvvweqN2ZeAi5iUO/YpHyZAEgv6RRHNjmZc11k35Bn8+SfNVAJXNPUfE6Copt9
 SajXEmB8nw5D4LW11bVbm25U3BGfRbYTlYSIasPB1UsIY2QYnoCjcunKYTVjITT7PXT7
 Rf+IR6dsUrSRhwohObI1OYRd24r/dZq9L4qE1lrXtFtMDdwlHRnGfJJmPsRtuhrvw3/Q
 i2Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eDcp/txU
Subject: [Buildroot] [PATCH 1/1] package/libpagekite: bump to version
 0.91.201110
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

https://github.com/pagekite/libpagekite/compare/v0.91.190530...v0.91.201110

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpagekite/libpagekite.hash | 2 +-
 package/libpagekite/libpagekite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpagekite/libpagekite.hash b/package/libpagekite/libpagekite.hash
index 8716b991ca..2c2e5c9b59 100644
--- a/package/libpagekite/libpagekite.hash
+++ b/package/libpagekite/libpagekite.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c812815aae6f100212b7d6f662370a0634151fabb59f028126a59c4083a6d26d  libpagekite-0.91.190530.tar.gz
+sha256  db835d49becebc00d462f2f47aefc1f1d3a4e0e096487cb3b4248134185df715  libpagekite-0.91.201110.tar.gz
 
 # License files, locally calculated
 sha256  ba443b9c9d4273d06aae3e147e9ad1ec199cc9c23455f486a039536d47f57eed  doc/COPYING.md
diff --git a/package/libpagekite/libpagekite.mk b/package/libpagekite/libpagekite.mk
index 60b62f5cfd..bb235ba1f3 100644
--- a/package/libpagekite/libpagekite.mk
+++ b/package/libpagekite/libpagekite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAGEKITE_VERSION = 0.91.190530
+LIBPAGEKITE_VERSION = 0.91.201110
 LIBPAGEKITE_SITE = $(call github,pagekite,libpagekite,v$(LIBPAGEKITE_VERSION))
 
 # pkrelay is AGPL-3.0+ but is not built
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
