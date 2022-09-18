Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E30C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDC47409A6;
	Sun, 18 Sep 2022 12:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC47409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SU6ISbIFmHq6; Sun, 18 Sep 2022 12:52:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C4214097F;
	Sun, 18 Sep 2022 12:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4214097F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFF171BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 912A141C98
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 912A141C98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyPeFcaHUnS0 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:52:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49ABC41C91
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49ABC41C91
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:52:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so2516194wmr.1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=iktblK2sRfg1LK6JSp2QRecbfuODUXwalkqOHxgG0q8=;
 b=T96S75pbGUQBdQBu6V0HP9lTJYe3ougvC/lQcyltQLvV2o52JFPlTNC1oiYoTRSCvQ
 qUOwpCXNldi8SC3m0SN31/B4KkOGmdbUf2DGCckLdq6OJX/8lqpPk+TavXtZc3J1lD9o
 6i+9lc+KP5sOMQH/br8Zr/vcNcCa7jFD2xSwKEoKOIj8dE8xZC2tH3qLbl/DW5hepe4j
 zfthV+womG9geP3H3z81knqYbEJ5ooPp4i69GzHg/aWy26Pd8AmRXhkEQQlHjhbhMV+9
 VPlirGpSfwE2zrGuIP4E3wPZsO+fMuwYmTw4bUWwI5DRYvjWxvNtwK4ek0vlMTxWP8VT
 FAZw==
X-Gm-Message-State: ACrzQf1ODIZYc37y9Qrjcvt9RdT6Pec8NAxTDHtA0apgbWQrEusQkHSA
 OpwYkhBz06S8aE8KxFISeYDHCUgNSYs=
X-Google-Smtp-Source: AMsMyM49it2FE+R0fQiMlhKZifWH2p6SlwZ3CJRkLUgCeUlX5PIKd6zl9JBEjWBvwBh/8Jn7O1d2Jw==
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1e3 with SMTP id
 h17-20020a05600c351100b003b4bb85f1e3mr8354660wmq.0.1663505554985; 
 Sun, 18 Sep 2022 05:52:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a2f2bb72d5sm11347602wmb.45.2022.09.18.05.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 05:52:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 14:52:21 +0200
Message-Id: <20220918125221.152222-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=iktblK2sRfg1LK6JSp2QRecbfuODUXwalkqOHxgG0q8=;
 b=pxbOX+WW9oKGw3ggkhBrj1jfJ/WFyaAWiP1gyZUrc0ga/5+77ZJomdB9hGr3eXBFsZ
 Ga9Cx/+YBoYOsth7ClAkdt0i4MI+Zs4qMjOoI0FfGdNl0HgfzOD7zcf6aknqVcQUFsFC
 6CTgJUCfTsPf9a02o6AK8zmnR24O+ZRuKO3JJDRG4HlvXXRO6HiUL1EofKb04f3b4JpE
 LhnCS4N2/SqgVx0mQ0n5PMBrYTUTUrCqbbVuXjv9Hw4bAfxfzmwnXI5jTuPZhLxrRP2P
 JL/+xMkV1YtM06sUCki8cKHWB2kha6spAz1ZyE6dCzQRLHeE9Br8GZ6PZCZSXd0Ru3OL
 XG7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pxbOX+WW
Subject: [Buildroot] [PATCH 1/1] package/libidn2: bump to version 2.3.3
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

https://gitlab.com/libidn/libidn2/-/blob/v2.3.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn2/libidn2.hash | 2 +-
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index bc96d7e15a..919c9b18a5 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,5 +1,5 @@
 # Calculated locally after checking signature
-sha256  76940cd4e778e8093579a9d195b25fff5e936e9dc6242068528b437a76764f91  libidn2-2.3.2.tar.gz
+sha256  f3ac987522c00d33d44b323cae424e2cffcb4c63c6aa6cd1376edacbf1c36eb0  libidn2-2.3.3.tar.gz
 
 # Hash for license files:
 sha256  73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76  COPYING
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 0564692597..2dd27acde5 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.3.2
+LIBIDN2_VERSION = 2.3.3
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
