Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB12C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 16:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DEB5418CB;
	Tue, 29 Mar 2022 16:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pE7Wfxmg5dNj; Tue, 29 Mar 2022 16:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA2B418CF;
	Tue, 29 Mar 2022 16:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6754F1BF30E
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 16:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55885842A4
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 16:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8T33TG1fU9PP for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 16:45:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64B0584296
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 16:45:38 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z7so21693348iom.1
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uwDS+bsvUBr/MQIQm14XdRV78g9B5b3iFqC5eIa6jg=;
 b=HaDxilCKJyYYCbDroagsgYP4g0XhPg0Gggfito0EE1+tHos4yyM2A7iToj2snBHo+K
 KVZY+clj4iiFf6JCVfoh+MyO9jXFk3iGoVhwgUXuFIlxHvCo1BrPI6iHf2DdFf9ocihO
 oEw6hsIraMQjJ/KQ0+h/WulgCHOcRMeESMj0qnmQHvcrfuDMjVsU2RF9ytnGcWFZCrQE
 XrHNvIwiCN/z0tQR5/0Gq1eO/xQJjaGYMYxqvIInFbYagH8NCqM8Cw7FFu3emEpzwoEG
 ZK864GWLdxg5Gp3gJ4Pqh9i3egkwNLZS3Rl+AraRKE3i4N+S8XqfDbKd0TwCuuctNwqC
 u/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uwDS+bsvUBr/MQIQm14XdRV78g9B5b3iFqC5eIa6jg=;
 b=J+/cYCwo5Sa5YNSoDx1QWEId1AM44GwMOfzGeGftz89WDsmZPeG6a6bHZsY8dH9lCH
 wDyWhucJzxHzEa+cZ7sKkIUIq5wDR+shZvcW5TcKE4KBaID6oZkpwlhtXBsIROaEjTtq
 WHz2jo6BYLtU/UgIdd3DT04OyvzL5v99CNl0FVK/TM13CppMg+BA4DzPbQtr7GCVO2BY
 x/W4rz9MZql1pghzf6CsFGndP/g20aMNyiVIwSXseIdh3HUqyuAQVEcW6Y0vlLPfTvgl
 j4ofelmlkKFmKdRw3lJpikPJ4HdWdyc+fivDROb6r8GHF0fWtm6csm7yesILCJhackfu
 RVEQ==
X-Gm-Message-State: AOAM533ahX8bEdrmn0+jMY1NwVmxNhlpMDG8qbCerzfv9X/ueko3g/aT
 h/ULP6HCbLAeIJ8OWKdP4vNyxp1kc2kI4w==
X-Google-Smtp-Source: ABdhPJwFnsjFS6QGSvFCnQRSZebeINxpqdQd79j9NMkpk9XwYt46K37Vvhx7PJuRlaQ7H6ccLELRvg==
X-Received: by 2002:a02:ac89:0:b0:323:7aae:c30b with SMTP id
 x9-20020a02ac89000000b003237aaec30bmr2762489jan.133.1648572337338; 
 Tue, 29 Mar 2022 09:45:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 v3-20020a5d9483000000b00640d3d4acabsm9357068ioj.44.2022.03.29.09.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 09:45:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 10:45:34 -0600
Message-Id: <20220329164534.4046877-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.12.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 839b12e619..839211ef72 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.12.1.tar.xz.sums
-md5  25a80a5a8a52b8873933a128151b8928  cog-0.12.1.tar.xz
-sha1  3b9f67bc23cd9e3db2221366d6cde4ca0b06b811  cog-0.12.1.tar.xz
-sha256  23caaafa2ef5c2f6a97d467fcce908ea71087ad03b72deb9280225c0dd561c91  cog-0.12.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.12.3.tar.xz.sums
+md5  320d01d8546144fba2e14bed3522c8c7  cog-0.12.3.tar.xz
+sha1  8e28b216bb2462325a1df1e8e03ac199487440b0  cog-0.12.3.tar.xz
+sha256  f464065057373c0430f6267205d1ab3367b54ac04d15b6b5531683b03212f45f  cog-0.12.3.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 2f6ef402fb..22c31f7944 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.12.1
+COG_VERSION = 0.12.3
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
