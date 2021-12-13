Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121CFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 18:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 948B340228;
	Mon, 13 Dec 2021 18:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWRhdWvJERun; Mon, 13 Dec 2021 18:07:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19254022A;
	Mon, 13 Dec 2021 18:07:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBE161BF3C2
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 18:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3B326059F
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 18:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LY8Cz-soE9nC for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 18:07:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D5BC6059C
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639418831;
 bh=eui8oigpMfq2bT5uTiA0/L0ibzBU7WTIAVLnaCh6frQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=RKlIwBmV6IhK4f7KXsNquqOl7n0otqqO+Hz/0LNZByPLvAX1mpaE6zlVeN/7SBQxt
 QbaBHVqZX9YYm6rfOJH5Y8JLxdu1xLW1SWYjQkbU70Bi6S1WjcurOF9J6j2xhCPeaP
 uZqEDZuEsAIOMgSJRBlwj/smfeb9W9YDcIMPK9Ho=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.61]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1mjPTS1ysr-00DYgj
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 19:07:11 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 19:07:10 +0100
Message-Id: <20211213180710.23890-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:RqYoaPMrVW/X2drLzOKbK+eU5elrYaVMe7ZoC7L9wKe/oOePviv
 VuAv1h4JvFUr3zxJYxlzOzOOV4VWq5+zdj5ohrcTDNlLgU270LavSrqURZ2gJeiNNe+/0I9
 nKI99D7ohRQaGWinVccTvfIUvILoNgChfoq7/qDt95RbzgdGcITBWlmmDAEQnVvGEOSeJlj
 uJbimEc6GqO6PSe8qMMgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FjA25UYA+yc=:fJIz1vFHxs+MEJi865J5lg
 BeNy/m+FdysIznLzpkmOXaQef91BMfoT41u0UM3R6e2ti8f/4efTpX0ay5ovE+gIOirhLi279
 1UNzX8ignk8PWY4pGixPueh81pAfONN0GJm/i+NxffxnooCXxCjBRJYKltDklv4CKRXtsCXHJ
 xG2AJivftszXIL7OrJxpkL6R5LKd1pfyHIqZ7PeqfyqgRrJQSCDSKLnxOfKVFiSRy5kbRNCZV
 vjfF/yMJOB2FXSWn1FiTZcKrqLUHdtn8gOm01hI/YyeKiDaKZxW9DXmDzbGplK6QrNz7tzG2y
 wdxijI495sA44fYck+XFwxr55apR1XPbDxXwbAyEV45M0gsyciWOr4eq8aYqSZke6073ncai+
 ou93hd4dKn2UO0VOv1HtOu1Yp3utQep7bPXGmPGp/gq8/X3Ya5xNX4jAD0guGpSfnCaYZiRKG
 0hwCbsKlypcIP7jFp5EP6TcASUxd5EVKvXheJG9tbyeyztyaqeUsZ7J2M3Ja1VIAbnEKgrF85
 dHkNR7j9SDAOy4yFYhJjVA9lbgKof/mS2nGN0kVSLAcsRRWxiwfrq/s0X4cDkDm2q0VHBKpgG
 In7NC2cE/RuotucTjF/mqlMx6uppV9/DmXaR1AlmYvl5rr8jHB0lC0WGu6tM+hEvZ/i23V85E
 GOXY7hPksAwgCJ971L2uz7z5Vidy36v8yiu5snOkAOQUnp3Yh16sfQKxgPxs8XRSmcDePbJbp
 Goo6OMFRev38vzA1CH6NHo/odc/+SJfMhkoCEILfXUQnCJ1koT5gI+X4uEKTqY/SSldkhmIkR
 ttX8x3gBzC7NFYW1iVzxvLtCLGko3Y/aEwAtJeJDhFflcdoBH+yF1RERFEohkPcx8tmAGU8DF
 3xR1L6m+XHpVQ5YuZIPxZxtynId88LIe1WRFiVZs785KaQ7beCSIo4/yV/a0aPDO9NmjG7kZm
 KWG0ybFjYvNnvYuw/OGM/SRjgV+LjMZ5isJX3FnS3uO4CnpsBGWgXrkYSqWlCZ1MpKqPUz3kT
 ZOkncfQOwknMLgJcWVQ3T22Mgdbh9fSS/N4bMUeSylmw4cazGLHImoohxJIeIWWcjscCyoLR3
 YGWR1ScyixDcrg=
Subject: [Buildroot] [PATCH v1] package/bcm2835: bump version to 1.71
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

- bump version to 1.71
- change home page and download URL to https

Changelog (since 1.71):

 - 1.71, Added SMI bus support, courtesy of Benoit Bouchez, including new
   functions: bcm2835_smi_begin(), bcm2835_smi_end(), bcm2835_smi_set_timing(),
   bcm2835_smi_write(), bcm2835_smi_read().

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bcm2835/Config.in    | 2 +-
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bcm2835/Config.in b/package/bcm2835/Config.in
index 4c3eb2cbfc..8c77a62a11 100644
--- a/package/bcm2835/Config.in
+++ b/package/bcm2835/Config.in
@@ -16,4 +16,4 @@ config BR2_PACKAGE_BCM2835
 	  the kernel drivers are doing, and potentially conflicting
 	  with them.
 
-	  http://www.airspayce.com/mikem/bcm2835
+	  https://www.airspayce.com/mikem/bcm2835
diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index c9f7acfd01..2cdc35fcee 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c062a8a1cf1dc1ba1ca3978451d2f668b66f7ce5548200a0f4a8bb2117b1b2c9  bcm2835-1.70.tar.gz
+sha256  564920d205977d7e2846e434947708455d468d3a952feca9faef643abd03a227  bcm2835-1.71.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index e9d7256f19..4870aa10ba 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.70
-BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
+BCM2835_VERSION = 1.71
+BCM2835_SITE = https://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
 BCM2835_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
