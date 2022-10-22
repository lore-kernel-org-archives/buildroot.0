Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B472FC433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 20:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 168E44077D;
	Sat, 22 Oct 2022 20:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 168E44077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJTd_JgZb9Gf; Sat, 22 Oct 2022 20:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7ACB40863;
	Sat, 22 Oct 2022 20:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7ACB40863
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1224A1BF3BD
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEA594012D
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEA594012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7392Mx5--br for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 20:30:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 872134011B
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 872134011B
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 20:30:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o4so1591868wrq.6
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 13:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Dalduqe2dNVhMaxgk9s9T1n+3wtdW2Pe7zpFF3Qu0A=;
 b=BGq/NwQMsaQXadsxmRSERVZlU+kEzNT9LsOpVAD7uOqwVc3BPPVCSH9Bv4AsPr3K2s
 rHJKPbQ6Iw5cbziGU3NFWMSOBitEew39lENGtJIJhWFKrdE5ZfAWq0NcxkjJEpHAoepo
 lw2hbMfyvPUiPyPdepJY4GzIj1brtFBtpVvdejVQc2IwO/8k+Owc+dybh0Zns6UF3iSb
 rrnnplqkpQfZ6oggPkgPQA5V26aSPI41GoUfEhI52tPO2pgzk/rO1uVRyV+CAnoc0pYk
 q3tdLGOBNSp0NLQo9GiNRU9cPRzIV+tiCbaKcbrhUhyjDhQeVSCgouYpImXsDQl/f3NJ
 R6nQ==
X-Gm-Message-State: ACrzQf0UjXjvvYJsTI2MSx1hIqE/e6VV7m8EYKTNLfVWhD9NfoA29wdw
 xNskSXa5wWDnOv6AZqNhE9g7V9Qu3PM=
X-Google-Smtp-Source: AMsMyM7W5nxbI9jEt/4RXwkuhxjM6L8WOe1hnL2oJBVVtisn6y97AWRaBLqyU9dsIMPIcARmPy09hQ==
X-Received: by 2002:a5d:6d86:0:b0:22e:4049:441f with SMTP id
 l6-20020a5d6d86000000b0022e4049441fmr16490932wrs.198.1666470657174; 
 Sat, 22 Oct 2022 13:30:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003b4fe03c881sm3584836wms.48.2022.10.22.13.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 13:30:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 22:30:52 +0200
Message-Id: <20221022203052.129715-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Dalduqe2dNVhMaxgk9s9T1n+3wtdW2Pe7zpFF3Qu0A=;
 b=j5S61m3KhHq/sFkDCZQ1CrU/4FJpouIFIa7vk+fgsj9pf18dAHUWd1GfhAHNvQum+m
 kkfVItLBkL1utHL87VlhP9adTpwGoy953L+EpzdjTPo+yn0CKU7W9JiuJe98+l+976sx
 Q0pilI6xZiNW3RNBhplaSgoEc0EOzWL23R/3S357Rx6HjWusMM9D18lYlE/Kzvri7vUN
 Q0kd7U16jP7Um/gOv3Atadx0exLHVCjibR8D+S6w3T3T+Xa/EiDOstjHhYPUM35F4SO1
 Ill76R4SWR+wQKdftzdQZ4puQ/VGXkcICuBf3JnJD+4wRFbbg48tmFvjcZVz4aD/i5jI
 Hggg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j5S61m3K
Subject: [Buildroot] [PATCH 1/1] package/uftp: bump to version 5.0.1
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 5.0.1 - 8/2/2022
 - On very low speed transfers (<10Kbps) sessions would time out due to
   a very large interpacket transmission interval.  Fixed by putting a
   lower limit on the advertised GRTT of of the interpacket transmission
   interval.
 - Sending of ABORT messages on early shutdown would sometimes fail due
   to OpenSSL cleanup functions running before application cleanup.
   Changed the ordering of atexit() handlers to ensure OpenSSL cleanup
   happens last.
 - Fixed missing timestamp update when clients read CONG_CTRL messages
 - Fix to GRTT handling on server to ensure it doesn't fall below minumim.
 - Fixed bypassed checking of existing files on client for backup
 - Various logging fixes

https://sourceforge.net/projects/uftp-multicast/files/Changes.txt/download

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uftp/uftp.hash | 2 +-
 package/uftp/uftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
index aaebcad014..774981d162 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256  562f71ea5a24b615eb491f5744bad01e9c2e58244c1d6252d5ae98d320d308e0  uftp-5.0.tar.gz
+sha256  562f71ea5a24b615eb491f5744bad01e9c2e58244c1d6252d5ae98d320d308e0  uftp-5.0.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index 1c36cb0ce6..ce865c20ec 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTP_VERSION = 5.0
+UFTP_VERSION = 5.0.1
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
