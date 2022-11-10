Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B409C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 10:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAE8540376;
	Thu, 10 Nov 2022 10:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAE8540376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ywFAFT2Jssu; Thu, 10 Nov 2022 10:14:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6535340481;
	Thu, 10 Nov 2022 10:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6535340481
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA5F81BF842
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8537B81BA9
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8537B81BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYCbosTC_C39 for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 10:13:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 651588195C
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 651588195C
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 10:13:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 186351814B9; Thu, 10 Nov 2022 11:13:55 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 11:13:15 +0100
Message-Id: <20221110101319.181388-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1668075235; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=wtdzqrNSVdYfkIQMMYD+Gb16EIzHvy+XfADxxw5qCQY=;
 b=i4Vk8KsV+M3sV5onfujI3NnBtcY8HnxYCpWh9hvSs6TflXlf8FmizuiWxSHEG/IHeJ5tZ8
 w5oI0M7XMXYDXHfm1XAB3f7JnxG78Rz2L433ir8FurDif4duEa8VH09UUGaGczTY3vU16b
 UGjIF04V5mm+ouUJu0JhtSlDq0i3Jzg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=i4Vk8KsV
Subject: [Buildroot] [PATCH] package/swupdate: add libubootenv as dependency
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

when using BR2_PER_PACKAGE_DIRECTORIES and configuring swupdate to
use buildroot the build fails because libubootenv is not a dependency.

Fixes:
bootloader/uboot.c:23:10: fatal error: libuboot.h: No such file or directory
   23 | #include <libuboot.h>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---

observed on buildroot 2022.08.1 so I guess older version might also need the fix.
CC: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index bfc161d490..ed0c1e56a8 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -81,6 +81,10 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
+SWUPDATE_DEPENDENCIES += libubootenv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
 SWUPDATE_DEPENDENCIES += liburiparser
 SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
