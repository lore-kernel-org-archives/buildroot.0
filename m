Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BD0CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 11:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE69140249;
	Sun, 24 Sep 2023 11:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE69140249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLiKCMtI1Q86; Sun, 24 Sep 2023 11:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B436440255;
	Sun, 24 Sep 2023 11:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B436440255
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B23A81BF33E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AF9740255
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF9740255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrBmNAOusyow for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 11:53:46 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C07D40249
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 11:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C07D40249
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4056ce55e7eso14059295e9.2
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 04:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695556424; x=1696161224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gMjSR1FEHWcZ+bS8jByWS1xGmMQXyn/xdYSuDJ0rjoY=;
 b=iU9J3UCcxrGYBbEjUTITWZ750I4qTny/RMfi3BNjeJJC3WGgXtrbABKqCWEF9Z6tmi
 Umn57o99u4Xugca4p8OxV5g+LrcE0hZmlTW9gH0DMDoZc2u0k9DhBjGi7oxy+fCrIHTg
 KDBvavjySa8d6rbKBlY8ZqqaxjXZCl9MUAzcNiJ/dSt89H/GWcxIkG59vYVyTwXDSQ1W
 1zw1m6Y2wfuLhm+PJDDs+IokC2xfLmeMa2q8hgdx1uU+nnpt5bEgX3A1uhpa7uAut+Eo
 PKiyIt8XQUV29FvGHG0gHawisnkn2XTZvIvW/nL4HmROSzKg8YBdqrwbMQEEpxWPHuIR
 umWQ==
X-Gm-Message-State: AOJu0Yz2tHIGjYfaCCPY7AiZHxpF1g1iRYI7OI7k9HO476RjPvPhv8YM
 vmhJ4t02tQhlIDYJWAKTRkJI6qz7Alk=
X-Google-Smtp-Source: AGHT+IFyKwVCHd4ZF7Qi/OHIr7vJ500TMInnhBGiDc48KeitkPl75VYmv6GdM/jW9p9xDec7gQQ5FA==
X-Received: by 2002:a1c:7713:0:b0:405:40c6:2ba4 with SMTP id
 t19-20020a1c7713000000b0040540c62ba4mr3555960wmi.5.1695556423609; 
 Sun, 24 Sep 2023 04:53:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f18-20020a7bc8d2000000b00401d8181f8bsm12255838wml.25.2023.09.24.04.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 04:53:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 13:53:40 +0200
Message-Id: <20230924115340.23213-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695556424; x=1696161224; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gMjSR1FEHWcZ+bS8jByWS1xGmMQXyn/xdYSuDJ0rjoY=;
 b=kQcaKhek8HBbqrJxT/fuNZ45/9kM8Ph8TJESR0q8DKFBoECJQ81V6R6VP/RzFK8HQg
 gqd0rwSD2H8Iza2ZQqaJto1uhkx3vLIjsQusmqEmM+G460uAnMzFET4zuRmU7i5rAwSx
 scyUnaHEX1Zi07qUAXZDC/tvUleTV/T5rjvaKJXD8Ssf2M20tfNcjGf0gka3Vxyilqp7
 XdSE2+0QXIEzofL3LAHxCtS8mzThD9B5liUPLmKa5B7Blj210ZFIBErTf53H2ytery5C
 aunQj4UMEhf8WbOKFaE6bcsKq1fHaxld1NIIHrcEIv+mWJmsqgR4LH6co/FyIeKFygWm
 BN4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kQcaKhek
Subject: [Buildroot] [PATCH 1/1] package/nmon: bump to version 16p
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

Small improvements to on-screen use only. CLI -B and GUI 'B' to toggle
boxes around stats. CLI -^ and '^' to change units for Disk I/O KB/s ->
MB/s -> GB/s. This happen temporarily too if the size of the statistic
will not fit on-scree. Code changed to ensure clean compile for GCC 12
which does extra checks but got confused by some perfectly good C code!
Note: updated makefile makefile

https://nmon.sourceforge.io/pmwiki.php?n=Site.CompilingNmon

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nmon/nmon.hash | 6 +++---
 package/nmon/nmon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
index 1d7226a4fe..fdee8824a1 100644
--- a/package/nmon/nmon.hash
+++ b/package/nmon/nmon.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/nmon/files/
-md5  a8172601fdc05f3bc58455cbd3f4475e  lmon16n.c
-sha1  024a3b56179838f0e04bf1706cc9ba56595301a8  lmon16n.c
+md5  a294567253cd49ccad66d5f56435ba9d  lmon16p.c
+sha1  90ec7cd38515323bc0a22ce1a34504e70e8f468f  lmon16p.c
 # Locally computed
-sha256  c0012cc2d925dee940c37ceae297abac64ba5a5c30e575e7418b04028613f5f2  lmon16n.c
+sha256  5dc6045f6725e3249a969918fae69663a1d669162087720babcdb90fce9e6b2a  lmon16p.c
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index 01371a8c74..4be19b1dcf 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMON_VERSION = 16n
+NMON_VERSION = 16p
 NMON_SITE = https://sourceforge.net/projects/nmon/files
 NMON_SOURCE = lmon$(NMON_VERSION).c
 NMON_LICENSE = GPL-3.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
