Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA454C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A61040338;
	Wed, 26 Oct 2022 19:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A61040338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YibyUfAUZM0v; Wed, 26 Oct 2022 19:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6BF401C1;
	Wed, 26 Oct 2022 19:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E6BF401C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52D971BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AB08401C1
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB08401C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bq2L8aOeKuUt for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:44:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FC0401A1
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4FC0401A1
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:44:05 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id s27so4947363ioa.10
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 12:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RfQ8othkLHkfHSN64ARtt9rBFpKcqfcx2fmt8Bmn6XA=;
 b=t2D32lP0+dSPx6VDlo0SZKPTVFTqcYK/HUA45QMG0OuT2sZUzU61XWZ/ewR/tlxPCx
 tgQPrrjkXPdXAOmIRg6voAMUUm2yuVYWdCopuimhXwdLmWGD5xKfminhFs+zEj7O3Y7R
 RX4gRQn31qLn0N6vKIsqEcYKTVO9CquSQ+YUu6TdE2Y9tZp3BzmS4UmuwK66rMkGD1db
 vWsAoeAvwRywKcaBqNWA8XS8ABSz2FnPBkS3cSoacyn3P2rOOmhNMaGqkcYOGkBIxDdS
 g+x+xUjic5rANvYSFEm6cuPKtkveiEQ3wduSQT+2od59PNftAP6pX6CaAuCM3QO7CSyL
 H5OA==
X-Gm-Message-State: ACrzQf08CTOEwj3+1BVZgk3kaTkVymb5iaZuLxT9FkzS11Rbd7WyWD7v
 93fW2X/z7wXRZ1hVlho0YIZ1VIPnbvRGQQ==
X-Google-Smtp-Source: AMsMyM4QV+wOjPP2ddyEbesAI5eE+ZrwOvagO8AJEaa/g05Rj/PwiV6kvdrer0vTs3ePkg2jbGDU0g==
X-Received: by 2002:a05:6638:d03:b0:363:efb2:41de with SMTP id
 q3-20020a0566380d0300b00363efb241demr30451448jaj.36.1666813444563; 
 Wed, 26 Oct 2022 12:44:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x7-20020a026f07000000b0036378825c31sm2257794jab.70.2022.10.26.12.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:44:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 13:44:01 -0600
Message-Id: <20221026194401.997459-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RfQ8othkLHkfHSN64ARtt9rBFpKcqfcx2fmt8Bmn6XA=;
 b=KyrMQhmsLi5h9jD8eB4prTG/NNxASj54PR3GDzxLYrhmwqN+k1L4s7TX9RiJMRsFJX
 tjKRkYNUoiMpZn7PwVx8igC0pIwXswja7gtWDJu4UC0wtPgYcn7jSPe81tLTAkREfj4w
 TxbJhdO3eg5U7HKxTQcoNmolr6K0zReKA/EgMGmPi03v8VCTMriEJ9HwDLq/kLVajInr
 AN7ol5+paIRz2d9HSpQ0Uei+istYjTRBVPd3fE9dh+XxOKOHVZItbD3+3klfcotxTiIG
 OMnEmoJIvpqbZSKcDq168K4avXaOl4lFEdz+BhYdfau8nc/jNcfK/OplOzB4usSJah2i
 uurA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KyrMQhms
Subject: [Buildroot] [PATCH 1/1] package/{glibc, localedef}: bump to version
 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index f5c0f1b175..16290461ac 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  596bee874d76bc6c5f62af142c9dd40bcb3625ea26975bbc52e552d40e864e54  glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3.tar.gz
+sha256  51b946f6c8dddd2b0c9902f7792ecf594497da6b0cc8fb9246fa30f108cbb422  glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 84122db91f..bb7c9e9a05 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
+GLIBC_VERSION = 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 987f7e8c65..05db7fa423 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
+LOCALEDEF_VERSION = 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
