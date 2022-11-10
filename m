Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A54AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 10:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A07064161F;
	Thu, 10 Nov 2022 10:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A07064161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luSh4Qqtd8ji; Thu, 10 Nov 2022 10:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 940F541605;
	Thu, 10 Nov 2022 10:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 940F541605
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92C261BF842
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E3674019B
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E3674019B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQs7wTYRn-Nx for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 10:23:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 851954010C
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 851954010C
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 10:23:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B0A1A1814B9; Thu, 10 Nov 2022 11:23:29 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 11:23:12 +0100
Message-Id: <20221110102313.182828-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1668075810; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ehYpO9QJxa9XSiG8qSnBZhHjAl2+nCl4ifHRE/OzSGg=;
 b=OtDzj8gOmQfACsOpNbQy3d8MtfDZBq9bx6vdx/XwcTTNJz8cCR0tnE5s/aSW/DlsrMNYjR
 55z6oRCiM97oaVC4GLEGzHxM91NYSKL2RMikI1kp+HbIc+1PjcX89dCu2PfnBc1x1GuHqT
 F6wdSJLoIRlqV46rF3aTiT/wh2nUUtY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=OtDzj8gO
Subject: [Buildroot] [PATCH v2] package/swupdate: add libubootenv as
 dependency
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
use uboot the build fails because libubootenv is not a dependency.

Fixes:
bootloader/uboot.c:23:10: fatal error: libuboot.h: No such file or directory
   23 | #include <libuboot.h>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---

v2:
 - exchange "buildroot" with "uboot" in the description

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
