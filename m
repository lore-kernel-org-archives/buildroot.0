Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB13C4332F
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 00:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1642741477;
	Mon,  2 Jan 2023 00:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1642741477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rIAFE_4uYXm; Mon,  2 Jan 2023 00:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F74A41296;
	Mon,  2 Jan 2023 00:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F74A41296
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 278771BF407
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 00:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0156441296
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 00:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0156441296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAa7NvY9hu8N for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 00:46:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45C4410E0
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B45C4410E0
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 00:46:12 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-14fb7fdb977so25250142fac.12
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 16:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K04czCoRZX2SNyVHIghTwZKQn8AAuT9KiWOiy6jsyD8=;
 b=vYXyV/xcqNE9AFSmY0SuNrBPyfCaaEgBfFPusGFzlndFPz3H3LlsZRZ1369cw1NAhn
 Cz5o4cNhqYoqoSm11BBtZcfk5jAdiRTwo0XFEnut+zt1LN+f24ntzHX1CYVez8BvDWtm
 H2uSq7V8y1p+w+kCQXO6ZzoIgBi9ISWP8h8G1NhIGRBI2YLyyv3Ijn8G/T5fQG/63sJ2
 VaDg0pSYcuOO8VP7xX1kDvpv53umyxPGBmhBi1nQ//blz3KcbIhsqrGnO1fZjqDhI7hj
 GSXK4h9JeN8U1yb/7ZD0MoZ7zMFJ2jW1puDwRvdQwjkB6ImOC620nNghEOH3JipCO4kP
 xWKQ==
X-Gm-Message-State: AFqh2kq7MAmH0PaVPreVz4x6LZfhY5rd2DyVANiEHkZwrWsffUQtgEoS
 WRKm+hgFq8VJYSXc1ls+EMiXeuYyVRc=
X-Google-Smtp-Source: AMrXdXs4JjCUcAqmLEHwL0s2leq5b4sYse6OE0p8ldHkSVQFdJbsohtm2rrBL3Pm5bKF8dpyMKrTuA==
X-Received: by 2002:a05:6870:289b:b0:14d:ed74:76d6 with SMTP id
 gy27-20020a056870289b00b0014ded7476d6mr19006796oab.35.1672620371649; 
 Sun, 01 Jan 2023 16:46:11 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a056870f14e00b0014b8347e1e3sm12451835oac.12.2023.01.01.16.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 16:46:10 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 21:45:08 -0300
Message-Id: <20230102004508.848462-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K04czCoRZX2SNyVHIghTwZKQn8AAuT9KiWOiy6jsyD8=;
 b=D75PZQN+WwJSxF9ue41Tcm4BUQcfd4ujnAIMY7HFpXp6DnSeD+HmgCdDEKhXnWSRTK
 o8SmYM9Lu+OLPFBerDAjoxYpr10nMuU04nT0aXNq1c02Ag7rqs5Wnw6AihHCUJF568my
 Yc+u7wwhNABpEh2RCIR2xYYdeJ000uItMIVIGVxbAsFuFD/24kdCI9XJGRPY17dacJ+i
 6u3E82vOTAkDBeVxmba1uYvi8KoljPpShBgRZY/GoQYL4Wf6NOJBS0/+J5qEtPEgNZof
 kChGmuRblwXGX8cjjJVgwQfzrwjBj6+fyeeoA80c0II++Bm4lhQsDe3KnSeXvbWe3PWi
 5Ncw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D75PZQN+
Subject: [Buildroot] [PATCH] package/atop: bump to version 2.8.0
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
check-*:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/735835248

runtime test:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/735834290

build tests:
44 builds, 7 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/735834290
test-pkg config:
BR2_PACKAGE_ATOP=y
---
 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 18ba42340c..e42354739a 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  ca48d2f17e071deead5e6e9cc9e388bf6a3270d695e61976b3794d4d927b5c4e  atop-2.7.1.tar.gz
+sha256  3b002cb9774a7d6b3e820451773ae5e909b5e725738c6f375f14d1c1976d9fba  atop-2.8.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 8a0fcda33b..04a554b474 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.7.1
+ATOP_VERSION = 2.8.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
