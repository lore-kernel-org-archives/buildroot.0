Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D62FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C38D41511;
	Sun,  9 Oct 2022 16:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C38D41511
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKB8lOz_i462; Sun,  9 Oct 2022 16:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D26C408C5;
	Sun,  9 Oct 2022 16:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D26C408C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12FE41BF36C
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 16:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E423741519
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 16:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E423741519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZXRWPH5V1Mt for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 16:00:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A250F414D1
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A250F414D1
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 16:00:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g1so13462542lfu.12
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 09:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WypWjclBW3MU7fWbZcGkrkWClcZNY0/wQyxmQItFEI=;
 b=P34bvpck07g7X1MF4Y1jrMwbTFAz3KV0D1GCmSHNMBtlNvhzb0/VpWuwugtrlsO4H/
 i04wAbZi8veX4b2X+kmDNp2yndTtKdpP8GK+1gawOOvFoV5hhY0ciyWMhnJJj7k+Od12
 j89HQ3fjTfstwCzEG2SE0awSD01Gd74qM+nYvbhoAE1J4dhyJY++ZsJC+HrlGbdVy3Ix
 XMdDXHupkrLvZaHButVvD5SuaCADiBW9uz2bETL2xI0JqLw6r32EBziDluapG19sGWlN
 6E515S/HlOqDSjVnmFvkMOdIpoIJ39ftsI5Zfg1NK/iv7HTUWCRdqAXE82cKGkFdPYJu
 IW3w==
X-Gm-Message-State: ACrzQf1yIw/jMajOzXDqzDqoxWxVigQZRBdj1zwzYnr1CgAIUQfXH8hI
 pDDKjSiqZ0DE4ieYAQFzZGxJwtY/Vts=
X-Google-Smtp-Source: AMsMyM7c3bwl+cY5FtOTAUh/aDW7gFZGu408yLWZo21HUR5qaXzm9lv3lTOq9+BJfF5a5S4zeNAuAg==
X-Received: by 2002:a19:dc54:0:b0:49f:53f3:9bcd with SMTP id
 f20-20020a19dc54000000b0049f53f39bcdmr5293060lfj.158.1665331202172; 
 Sun, 09 Oct 2022 09:00:02 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.09.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 09:00:01 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:37 +0200
Message-Id: <20221009155938.2041695-10-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WypWjclBW3MU7fWbZcGkrkWClcZNY0/wQyxmQItFEI=;
 b=fH0HR1z76Mo3P0xz1+EJEnS2SkMeKnFEngTZr+NfbO6vGgfc/m3PJR/swj0IFWHqHI
 J/7uFo+Rn1KH3NTBXHtOz51q2lxgiO2sGM4vq4nB+4MMlpdY5Bm3Lz/5RstaFQRO+MOo
 SW39n8t+TXglpNqH0ZIn3reEQMQV9zveKsc8Pc6gun84dwaR13t2M8cHwnvpawnkIsc0
 BOd8sCcVVSuLg5U25W8XwheCpR69SGj6ceuQf95prw8nA5r76ewRWCV25SCyE1I/SvOy
 QMyFgkix9jt7U0IfkwINwD5dPm+fvN6mU9rl6vYO8s8cEphmWW5g6P1E1sPbsw9//EL9
 RXwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fH0HR1z7
Subject: [Buildroot] [PATCH 9/9] package/s6-rc: bump to v0.5.3.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Summary of changes:

 - skalibs dependency bumped to 2.12.0.0.
 - execline dependency bumped to 2.9.0.0.
 - s6 dependency bumped to 2.11.1.0.
 - s6-rc-compile now reads service dependency information from the
   dependencies.d directory and bundle information from the contents.d
   directory, instead of the dependencies and contents flat files.
   The old format is still supported, but deprecated.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/s6-rc/s6-rc.hash | 4 ++--
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 8978d68ba6..0a84345e36 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  2a8d1cd455c05c8502b34517cfe79841aa46d08ad969076b37a15d3910617f89  s6-rc-0.5.2.2.tar.gz
-sha256  4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
+sha256  4f24a4966a4aa353d2bd1a8afca9b88c7b7bd29c46b3a1a7f5305686b9d6e038  s6-rc-0.5.3.2.tar.gz
+sha256  1898df1e8703bd9c1350d2ec3397880b9b4c1451038a9ce5e1c4b2e58622da39  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 05d7989735..85b047883b 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.5.2.2
+S6_RC_VERSION = 0.5.3.2
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
