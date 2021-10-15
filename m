Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99971C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:58:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B5461164
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20B5461164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7D9A40801;
	Fri, 15 Oct 2021 19:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJZzQsW7LNdc; Fri, 15 Oct 2021 19:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2034078F;
	Fri, 15 Oct 2021 19:58:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2A421BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9165760EEA
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnjMkSlHc4ZT for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:58:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A43960C1F
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:58:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso3155783wmb.3
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gi6Dw+rGvlOKnnAsaP3vjuNVYEfyrKLyV+umRKN4Rxw=;
 b=eIdvh7xBK69uLcTZYhuzXZ3yBnFpwDJA2j1CLbe7LaKPeslcPK9Fa17yTBxZG3PVpK
 sCVR6DZTRjZYhqHnvU4l84h/ldeR7I8oWvzwjhpiI2RBLDb3ZUbK8WfIJAJduoFc2ZbN
 8CRiVIpI1+2Xv2VtFhHtAASMuMbUYg+We8TIjcbPVy6bYb3hHTGphD4nx4FK+o0gV1wo
 /eh4yE5zmmywwQjTKd8lGDYLo0j5UI3pH3Olsbzc+8lzBzBOCLWvyTDFLToxfh3Idr3Y
 58NtkDiUZDL/ldODiAuFknV4xaLQnaABkj5Nn884zoJFsIf8hPJ90A7pclWvlZYAUpgK
 bFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gi6Dw+rGvlOKnnAsaP3vjuNVYEfyrKLyV+umRKN4Rxw=;
 b=c5NI+p+cwFgKkdXIYJLsHjQ9vHz6gbyMBmj8pQ1nok74Wi+ANJdFLHzHi7wlVMpzgc
 bF6EkQy8jU9oxrjOonwIsEsd1E4DzEJOvfPjfDnSphn4DigE3RNa/XE46bRNIPxx1335
 UdFude+vsLtdZN8HbTVOPrkte5yIeTjAWzzQmqm0w+DH5WTY2hhx/VQaQRsk7oLHK6It
 KSJ+cqd33oAUcZMaVFGxaRVGfuxG2P2y3skAmE0wXjp34UMjPa5A3FMWJmiKur4mTb/1
 2YOunfvxbnsR4wOwFBwofYnZiSfd5pDFG8LUibzpinnc4aYodZDUx5YfWJIe9tvQoev1
 AgNA==
X-Gm-Message-State: AOAM532ycuHe4QmhVHiYPrAysNmOD8RzxLepRC+6VQieUa/qlwi7bas9
 lT3W9WUj61+WpzceOPUuxpA1wtrK0Yw=
X-Google-Smtp-Source: ABdhPJzCDa2qa08jZ1nAJo7SKko9wNtLwf76g31ESkMNfzMVCQKl3NPrd4/m8hcdhZtWpQ0VouritA==
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr12042548wmq.154.1634327906653; 
 Fri, 15 Oct 2021 12:58:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id s14sm5600697wro.76.2021.10.15.12.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:58:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 21:57:12 +0200
Message-Id: <20211015195712.1548108-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cloop: bump to version 3.14.1.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cloop/cloop.hash | 8 ++++----
 package/cloop/cloop.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
index 7af1a9594d..eb922764bb 100644
--- a/package/cloop/cloop.hash
+++ b/package/cloop/cloop.hash
@@ -1,6 +1,6 @@
-# From http://snapshot.debian.org/archive/debian/20150503T155713Z/pool/main/c/cloop/cloop_3.14.1.2.dsc
-sha256	ac344225b3a5c4ddbb0d4b20cd4874798b51427b707b53e2ee9fbdada7497c95	cloop_3.14.1.2.tar.xz
+# From http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop/cloop_3.14.1.3.dsc
+sha256  e3079e70f9edae8ed1ac64694af08f6c7dc710ca65a56e4770dcb1325a293193  cloop_3.14.1.3.tar.xz
 
 # Hash for license files
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	advancecomp-1.15/COPYING
-sha256	1b1f89e94e131e259b9e334565c5c3500d4b8aa755b75c3f145ddcdff3b89124	README
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  advancecomp-1.15/COPYING
+sha256  1b1f89e94e131e259b9e334565c5c3500d4b8aa755b75c3f145ddcdff3b89124  README
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 046d98c862..f3c4954ead 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CLOOP_VERSION = 3.14.1.2
+CLOOP_VERSION = 3.14.1.3
 CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.xz
-CLOOP_SITE = http://snapshot.debian.org/archive/debian/20150503T155713Z/pool/main/c/cloop
+CLOOP_SITE = http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop
 CLOOP_LICENSE = GPL-2.0 (module), GPL-2.0+ (advancecomp)
 CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
