Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F045DC7EE23
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 15:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6998822E0;
	Sun,  4 Jun 2023 15:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6998822E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ih3O6Uifh8P0; Sun,  4 Jun 2023 15:48:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BAD82020;
	Sun,  4 Jun 2023 15:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8BAD82020
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7E51BF4E3
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 15:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E09408A4
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 15:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7E09408A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkQMlgb4u7Dq for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 15:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88D5E40874
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88D5E40874
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 15:48:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so2951285e87.2
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 08:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685893702; x=1688485702;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WD1Oy6i9hhZxd7aFbn2rNK4mJ3Afw4X/2ZpUxdaP/LM=;
 b=O1oMAFKMXAIDHnNIOyZQM5mstb2gctCQ0SqjFGWrhrCcsLklA/qIbJSbdq+vnj0nCR
 JFAZlXcQBYUVEspLt46c2UTOvBg12d2Y71DswcbhgayUJcJN8wq//jObUzzec2A0e/2X
 By4/hFVG8C3zYoP0HxFuW/vK3aLhEZRbMeG6ti+DfpFCE4ki2ehOU3F6DJtkZ3kj1aNB
 ANTma+6rYywt+MzktWfNT1EAKzLcvumZpWdsmRgDX1ud96tQ+laEqnZUGWvvoVVY+kMB
 WtZK0KL6oVB0GY9UXfPfwU7mIkNGEFYjMcuShUhc+tYFn2kWbZvceBpLlwVwqP4j1R67
 N9Nw==
X-Gm-Message-State: AC+VfDwcLzIpTsuXhLdDMFaCV++jqk6FJyO4TZaazrqZG2fVtzKy1w4i
 WC36MHMNqFl+CHEKqP9i8A7aXqXBSI0=
X-Google-Smtp-Source: ACHHUZ52unsfovCEZlP7mYaTSnIIhPOhNBg77TEwmvOJYXjZOBmgjImxI0ZvItT/t2mxNLn4zjDOBQ==
X-Received: by 2002:ac2:530b:0:b0:4f3:b6b8:dabb with SMTP id
 c11-20020ac2530b000000b004f3b6b8dabbmr3819912lfh.13.1685893701908; 
 Sun, 04 Jun 2023 08:48:21 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac24547000000b004f5a548820asm809636lfm.156.2023.06.04.08.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 08:48:21 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 17:48:17 +0200
Message-Id: <20230604154818.3681851-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604154818.3681851-1-troglobit@gmail.com>
References: <20230604154818.3681851-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685893702; x=1688485702;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WD1Oy6i9hhZxd7aFbn2rNK4mJ3Afw4X/2ZpUxdaP/LM=;
 b=nv23umCnAFlTqxI9iWmQTydhCnA5VzEtmtHWd2q+LFhaTOq8/T0CFLBhyf8Vc0HUb7
 YZfHtRcO8czBxpGGytzXBwSSkF9I4E9SyoFdudJhQ2Z6+fdTKhW0w60MwKlcDULlvE5e
 xiU/a91bXS6KApY8terD4kmvKVd72xhx+0FWZdkrN/d/MJ2ozHVcS2bjICjykpRfrBFh
 kCnS94CpOGSM6B03ZGwnccdXkID63TB0MCOYW6S9hC89CQ/xsrCQX2H7EQno6gZyaH1K
 rUi5hhQJRoy6Ra9ba+XdoSdZszcR/J4xiilgZDaGrbEz16daENW/Sg/5pZ5vt+D3ljo8
 EZoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nv23umCn
Subject: [Buildroot] [PATCH 1/2] package/mrouted: bump for v4.5 release
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream ChangeLog:

 - Ignore IGMP proxy querys (src ip: 0.0.0.0), they must never win a
   querier election
 - Fix compat read location and new location for mrouted.genid
 - Fix "non-decreasing" generation id, must increment on each restart
 - Add support for configurable IGMP query response interval
 - Add support for configurable IGMP querier timeout
 - New 'join-group <group>' phyint option for cases where an IGMP
   snooping switch blocks flooding of multicast to the port where
   mrouted is connected
 - On startup and reconf, log why we skip disabled interfaces
 - Change to always log when assuming the IGMP querier role

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/mrouted.hash | 4 ++--
 package/mrouted/mrouted.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index affb323b4b..7516a1329c 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.4/mrouted-4.4.tar.gz.sha256
-sha256  095439e544d69c91ed64fa87db7e35bc2155eef48b7f268281d80946d2c6b953  mrouted-4.4.tar.gz
+# From https://github.com/troglobit/mrouted/releases/
+sha256  99e1a1ca45e4e6c05b3cf379fd59a239aeabd9512656114528ad5e172d3c8ba8  mrouted-4.5.tar.gz
 
 # Locally calculated
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 4014b8f896..3e2f49dc10 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.4
+MROUTED_VERSION = 4.5
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
