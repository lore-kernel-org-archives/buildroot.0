Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD4FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 20:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F9C84BA2;
	Mon, 24 Jan 2022 20:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CP4-25TC6u90; Mon, 24 Jan 2022 20:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 575E984B9A;
	Mon, 24 Jan 2022 20:16:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0DF41BF396
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 20:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D4EC84B9A
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 20:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q82v03HT1tf5 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 20:16:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 578A584B98
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 20:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643055389;
 bh=+zyikdkwvTJA+BW9JaOMQgk3iPPkR0MZuh6TNhMoBDg=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=CWp3fbYShcTt/sYnmiN/hPOUoa40SWpvqzDW9APReQ0grckvlZ7LO4erT3xMFDBEK
 foI3GH/5T2nH402fQ2yFLBZbFF7FbPjpK2VFT77xXmmlOCfp+M4OOeCA3uaRomGrF1
 sanRrTCcIZUvAxopX8as6U1vMbFN3pEALb2gklSw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.192]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mlw3X-1mTRYU0PcB-00j1Yj for <buildroot@buildroot.org>; Mon, 24 Jan 2022
 21:16:29 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 21:16:28 +0100
Message-Id: <20220124201628.11015-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:dmvgjp/VFp8MxPxk1DEWhdVOQt/S28VKdFTpw/LBKzY+M8s1DnD
 NqGXD3lHfAzArlND/XHqAE1UxI3id5vm0XdvwBG6lwZppiq96JajC+Es89Y6Lq4kRA6GIkV
 8OUmtaN9XDsAoRM4GNsHVgfWXb/Fom3DUTsX3Bo9K0RCqO+QDE50340tgJmwwcLc/fufIi6
 u/r9BBDnF5B07bboBc/VQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TtkWJWDiJTA=:eLxecPrKKCDspjci9geiSK
 GHe5Ycr8kBvhHI/96ezypc73yOgGPQY3BPN3Zq0jURsatiV8k/pZOCEcn6HJAo1OiueKHM2L1
 xhTcmNXnScnSO9iIRq/iytF84z2qDUUYZusmdZRjPIoV4jBT7YK8uoIy5FcRrX4NbSg9Xz72h
 NEGzzn/JXivQXDd0FQmWSQBFIcA9yn1LbHfEsHItAZbcAVBzq1K+AbB9E3RK6eHDysf8+OcAh
 P/hP88s0+LFzlduUVW2GND/pN1FmR42tKLr/gx7Hs0iylmw6iVRBmviBTTmthVQgXZi0Wzcy9
 yyWMEbtSWpKaG7TToLU0NbYN/QbP4YnIys+3Gg2QtxUoJRNTp8U4uYESczasOwTybCFipw/A8
 QMQwuQmBrYFV91yDKJynEr2sKVQSkm2Hcjg8b/FK5hvo2quCSyQfYm/M8Kr3IBIEHTw3URpA3
 639tXbC5vdZbAU01YSne9xQmPxyRWfatFMHHA1jp07ndluvYIPZFuLM07z7FPJCWQovuP433O
 lFe1SqTZhb9snhuXPG8VVkUeBCitlILsotTX9CoVZjy9IZAVbQMfwOXFhmXl1hq3DvdxBLzHl
 oLDb+eGMk+qmu46vhkXnUa1BtcLyNA53+yerZF7BiaRj4620BS36FL/QnRo4LSqUVgT0F+MAG
 0z/GDP4BGx/jzi/U10Up9E/yHKmC55ELQ4e51LgJkuX+OTWo4WaE2IVcIuP2igvL0MaogBIjt
 oRzdTwqntodOEg1W6WLWHJFdIYdAjBiEEcJRU3R4BMxb9WQXfib4QPH39I6m5XRl4V1vCMD1v
 DoNBKjYSbAiMhUkR05uRYsVKQ1OivXkntwJb/eHr4mU3qA9t18L2K84QBwpegT8C3xG+lEC9M
 PNU2cm8WrmRaqPVy8EAuh56ZIMJPdrmHmSprarkmDYTmAzRMxPgt16j8t/9osUCXPZzPBIg+e
 U2h1kEe8/83CYi0I4ghACvqxIZBY+cbFNMpEJiSIq+3SBD/PQDIwEMHiynS3Aq1p3GZ9mQGgS
 rs46C5MSoJiBPxdfqwLu/SA0OMhdaQHelSG2WQH9Ylf9hmowTK/cWLDcnpdI1vKX+d2UUfePV
 0WLiB/03l5T66I=
Subject: [Buildroot] [PATCH v1] package/util-linux: bump version to 2.37.3
 (fixes CVE-2021-3996, CVE-2021-3995)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://www.spinics.net/lists/util-linux-ng/msg17037.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index eafbe9254a..9c10a42dca 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
-sha256  6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9  util-linux-2.37.2.tar.xz
+sha256  590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776  util-linux-2.37.3.tar.xz
 # License files, locally calculated
 sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cf0fee409b..88d4984e2f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.37
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
