Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2718BC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 21:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD17060805;
	Wed,  7 Aug 2024 21:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWsm9dwXN_Zo; Wed,  7 Aug 2024 21:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD1D608C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD1D608C5;
	Wed,  7 Aug 2024 21:07:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBFE51BF2CA
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B44A960805
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 21:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaZBCP0Q34DY for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 21:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BDAB606B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BDAB606B6
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BDAB606B6
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 21:07:05 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bns6sWRHxwy3rbns7sgu9B; Wed, 07 Aug 2024 23:07:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 23:07:02 +0200
Message-Id: <20240807210702.479178-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJBdXENxdF9xc56EI98l9lMXSIE0HG/E18huecwpQyPtb9Dx+gcDWb/ftOiZyTTTR2KbkyLzuJScID8CLatg/nsm7L9V5uQDNCezKoZRZ+Zp8ebHQjaU
 t93Z32wIo4JrREVgagSTbW/+Mfkx7/MvCPqT9I36Dez4bCvtJLU4V2OAmH0uLT3VIhpnh1RfDDDs25SRCU22MxT1FhYcJfy6qglSON2oUy0t5QWIlxu4+AKz
 EOTisPFFW8kWONIQ1lGppHNKqrCIjf+87GYY9hbQXQi4urwKOajPYVFQsbHrya0hP1FNsgTTEhMSm6y9jgim1g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1723064823; bh=jH5l3psBAzCfL20rX2Kv96fGTEjSrV9DnwFW3LH/Rq8=;
 h=From:To:Subject:Date:MIME-Version;
 b=YTDjAqZ9BHWF0pQa0ZnAm2tVgcGXPkxjAytX9yi7IoHmBadf03+av+u9Vb8cs/Lsk
 XZVvlgjvc2os2PRIuTokzF1Nk3AvrIoiehje6ww/LJbYmQ5tHVh11KeZcrGd7Pi7dS
 Qcw10uoc8fyZhkVpbyfTlkacFVV2P5udGi1ejlZRt2cBSM5eZVQ3oI+KqwXMR1/3Nh
 AJVXriudnB2kTnwOXSoMxbwnsXE+xAmjvwUAQ9k1uISjETGPm3XRwcuzeV+38Y4upV
 g41Mj9DsvNGezjSeRUIFYMebcDTF+lwc/UmIIrWxLr+2VKYrf6Wcm4Ztnw3j30oMXQ
 q27b+pnll6Cxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YTDjAqZ9
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.103
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index ae82e7eaa8..1370b6ad0d 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_102_1_RTM/src/SHA256SUMS
-sha256  54982d3587e41579c94f2036ba084438b073f8456bbd873b7a942c057e9737cc  nss-3.102.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_103_RTM/src/SHA256SUMS
+sha256  7b4ab657f772dc7520c46e8d481940b292dcfc6a4c90150a7c26672384cee962  nss-3.103.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0ebc49db21..06038c2e55 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.102.1
+LIBNSS_VERSION = 3.103
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
