Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A518BC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 23:59:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBAE60FE8
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 23:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDBAE60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79262400E0;
	Wed, 18 Aug 2021 23:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M73A8CCsLL7K; Wed, 18 Aug 2021 23:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAB9840200;
	Wed, 18 Aug 2021 23:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2EB61BF215
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 23:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAF7480D82
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 23:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uzoQAlF_wzA for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 23:59:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10111.aruba.it (smtpcmd10111.aruba.it [62.149.156.111])
 by smtp1.osuosl.org (Postfix) with ESMTP id 393AC80D88
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 23:59:10 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.22.37])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GVSdm1LOrnyXHGVSemekLz; Thu, 19 Aug 2021 01:59:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629331148; bh=t6upcFVJVOBl3buQsVhlv0kUkrAJPY7PqNHpz1y32Ew=;
 h=From:To:Subject:Date:MIME-Version;
 b=KoKSkkgs+LIxFMxlRg3AlhBjsGAN8QueruKIlSABwtuS0foH8BKpDhPDszgnycTBz
 3KsKAMAbk0/eaJZqYjH/knQ47n8iFCv9Z8Ds4nAIytdiWmRepo9lJbypbDhkBj/Z2Z
 2RJnd8Ac5Pg7/d056ySu4CvFghBvWzTOs65PWOVHl4p1bQw7FenS0lWuY/HgjKPSn4
 vxqE0RUHqT04/CZgaDub0cipdSj3/5K2Oapq8F4U69kOlDWFt/vdqHp2tHYcwlFqNC
 3vkzYK2As1vkNXsQ99Sg9p9Gwq4U+yXTI9YMjAGaT/yZzlStW9KO3K31JSwepPD1FL
 6UNxqZvxBtHUg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 01:59:07 +0200
Message-Id: <20210818235907.906265-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAVo1CgbAvPrb5sN30QbFuctHcUc7T9N4F7lXO4TZ97BoRz6vShI84yU+83WTVfmzR0t4xYzgOVDqpGryABJV2gwqDyGWMGDWuaL8MT91PgMEsMcIR2Z
 BCI2X7Av+b5DiWUGJO22wFSc+yC+mBB2U7tMlAINQDJ1p68Dpui6u/tY/SNFHj28QhOjUbZZ/m28rvz8HOkhS7ufiCuC0o1p76pXUefLv6Cb7uEiBdGQc9hU
 qVY8TB1ZXmEks4wjpKEVcgRJe6uH9xFBrQmN7S6aL9tp8PNDnxC90no7JRYqvvWg
Subject: [Buildroot] [PATCH] package/openvmtools: fix time_t build failure
 on 32-bit platforms
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add upstream pending patch[1] to fix time_t on 32-bit platform.

[1]: https://github.com/vmware/open-vm-tools/pull/387

Fixes:
http://autobuild.buildroot.net/results/eb3dfe679536b578a0f16762312a96ada7162095/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...FromNtTimeNsec-aware-of-64-bit-time_.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch

diff --git a/package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch b/package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
new file mode 100644
index 0000000000..dbe2c29a2b
--- /dev/null
+++ b/package/openvmtools/0012-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
@@ -0,0 +1,80 @@
+From 3f0580f2546de8be7acf1bc78a55a257bc638ebe Mon Sep 17 00:00:00 2001
+From: Bartosz Brachaczek <b.brachaczek@gmail.com>
+Date: Tue, 12 Nov 2019 14:31:08 +0100
+Subject: [PATCH] Make HgfsConvertFromNtTimeNsec aware of 64-bit time_t on i386
+
+I verified that this function behaves as expected on x86_64, i386 with
+32-bit time_t, and i386 with 64-bit time_t for the following values of
+ntTtime:
+
+UNIX_EPOCH-1, UNIX_EPOCH, UNIX_EPOCH+1, UNIX_S32_MAX-1, UNIX_S32_MAX,
+UNIX_S32_MAX+1, UNIX_S32_MAX*2+1
+
+I did not verify whether the use of Div643264 is optimal, performance
+wise.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ lib/hgfs/hgfsUtil.c | 34 +++++++++++++++++++---------------
+ 1 file changed, 19 insertions(+), 15 deletions(-)
+
+diff --git a/lib/hgfs/hgfsUtil.c b/lib/hgfs/hgfsUtil.c
+index cc580ab8..49b10040 100644
+--- a/lib/hgfs/hgfsUtil.c
++++ b/lib/hgfs/hgfsUtil.c
+@@ -110,23 +110,21 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
+ 			  uint64 ntTime) // IN: Time in Windows NT format
+ {
+ #ifdef __i386__
+-   uint32 sec;
+-   uint32 nsec;
++   uint64 sec64;
++   uint32 sec32, nsec;
++#endif
+ 
+    ASSERT(unixTime);
+-   /* We assume that time_t is 32bit */
+-   ASSERT_ON_COMPILE(sizeof (unixTime->tv_sec) == 4);
+ 
+-   /* Cap NT time values that are outside of Unix time's range */
++   if (sizeof (unixTime->tv_sec) == 4) {
++      /* Cap NT time values that are outside of Unix time's range */
+ 
+-   if (ntTime >= UNIX_S32_MAX) {
+-      unixTime->tv_sec = 0x7FFFFFFF;
+-      unixTime->tv_nsec = 0;
+-      return 1;
++      if (ntTime >= UNIX_S32_MAX) {
++         unixTime->tv_sec = 0x7FFFFFFF;
++         unixTime->tv_nsec = 0;
++         return 1;
++      }
+    }
+-#else
+-   ASSERT(unixTime);
+-#endif
+ 
+    if (ntTime < UNIX_EPOCH) {
+       unixTime->tv_sec = 0;
+@@ -135,9 +133,15 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
+    }
+ 
+ #ifdef __i386__
+-   Div643232(ntTime - UNIX_EPOCH, 10000000, &sec, &nsec);
+-   unixTime->tv_sec = sec;
+-   unixTime->tv_nsec = nsec * 100;
++   if (sizeof (unixTime->tv_sec) == 4) {
++      Div643232(ntTime - UNIX_EPOCH, 10000000, &sec32, &nsec);
++      unixTime->tv_sec = sec32;
++      unixTime->tv_nsec = nsec * 100;
++   } else {
++      Div643264(ntTime - UNIX_EPOCH, 10000000, &sec64, &nsec);
++      unixTime->tv_sec = sec64;
++      unixTime->tv_nsec = nsec * 100;
++   }
+ #else
+    unixTime->tv_sec = (ntTime - UNIX_EPOCH) / 10000000;
+    unixTime->tv_nsec = ((ntTime - UNIX_EPOCH) % 10000000) * 100;
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
