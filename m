Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BBEC07E9D
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 08:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D96C81916;
	Thu, 29 Sep 2022 08:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D96C81916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEJ8py1iZWhL; Thu, 29 Sep 2022 08:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8CF6818D0;
	Thu, 29 Sep 2022 08:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8CF6818D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9231BF2FA
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 08:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F83241021
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 08:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F83241021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TokBqgfvfo_F for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 08:33:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5998B40338
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5998B40338
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 08:33:45 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id v1so375272ilq.1
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 01:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=0Rm6een0GvMUw1MnSjxQynWtBXKf//CTvQ4HOTKN6ew=;
 b=rs61TW4F++Kz5xc1spmIB01KlmKMnfskX1pxcRv5qyq2l495Iuxjspo9mQ90uXrVd1
 Gt5C7TthT7Q+FUJ95aKWFfgaYzNx1OIZTuHIUwq5vsKQnxAHJl00s+FaRcX4WUv3KnxE
 cWw2nsGTGEjkvfleVZSzeF/CeGPsNUBh/n5euaLFvLupLNP9kZhSv6e3DglzIab5F4Lu
 GkrcBsBoPZ/Jzwxk1K+cLorxphiUcM0tMISOpAii8nGKYMflnV7r2UMcN3Pwc0vs1ClG
 4qIXrkwmrmI9ndG+92TmviXnz+DjuI2522KQOG2CkNaj9jnHJPsHCTg/eOcdOesMG0pW
 6pIQ==
X-Gm-Message-State: ACrzQf1k7tQi2PdOYhKFKPYFM5zU8jfYLFX5siJPBdQdXkyZAvbMknkY
 /iQAdJI2Hv6ndH8WlFJwv6+yy2YgoVyypg==
X-Google-Smtp-Source: AMsMyM7RnZBX51vFyHiqXRPSBJq80j6/zD4PaTyNKGz15Rkzs3c1l19y76KXKLO8jJ7cAhyk3Bkigw==
X-Received: by 2002:a92:2802:0:b0:2f8:eb02:5c96 with SMTP id
 l2-20020a922802000000b002f8eb025c96mr986290ilf.225.1664440423956; 
 Thu, 29 Sep 2022 01:33:43 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o7-20020a056e02092700b002e8ea827aafsm1583382ilt.74.2022.09.29.01.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:33:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 02:33:41 -0600
Message-Id: <20220929083341.2485242-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=0Rm6een0GvMUw1MnSjxQynWtBXKf//CTvQ4HOTKN6ew=;
 b=ITdgEcWlLTM8Q62Nbzh4EZsTgHU7WZOreAhR3l9UMW1Nx45u9NmrVDuB/JmqT6yLyi
 TNtQ2uPZjUwo3ki+RXt7O1hw8hAWZcGCEtv+Rnwwz2WEJMPxsHwNT0F2wNuZpiNhdDYl
 fgrKsLoKRDNuo4CWnrNDzE1Pf6Ocx1cE+TzbdDs01eK2SoP2xRaBWyprJ3kvLoBgDIAX
 2ZuCEduVD7g163kvaOPF91HDJHkAx+1FrbNMZS7D6qvqBADdMnKXoFuCegUBgVxNAf+N
 lD3O73B52HwCyGD6mvJscdH2tZuAM86IuOwCyjXGaXIDlAgFFdjCqbMF7Pmmi7OJeabF
 6Fpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ITdgEcWl
Subject: [Buildroot] [PATCH 1/1] package/ser2net: bump to version 4.3.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index db493b28cb..50a2efdee8 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  3323783668b20016d79458e82327cff8  ser2net-4.3.7.tar.gz
-sha1  88c0542b3b5e8ce03bc99ace00b2e163382e726e  ser2net-4.3.7.tar.gz
+md5  73b4ccc7e9d89034f1a1a20a780b9da9  ser2net-4.3.8.tar.gz
+sha1  d1597d88d154489cb08bac69bb1772712d30cbcd  ser2net-4.3.8.tar.gz
 # Locally computed:
-sha256  542915e240ae8b5c7dcec8d1589e6067818532900d45cfef226cea9f0e671d13  ser2net-4.3.7.tar.gz
+sha256  e5620975523059a38709bb53c0567600adbbcb8011066a2d2fe1b4db9efe0ba3  ser2net-4.3.8.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 393d358033..679aaec29a 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.7
+SER2NET_VERSION = 4.3.8
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
