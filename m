Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F097EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 06:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9A18322A;
	Thu, 27 Jul 2023 06:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D9A18322A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPiABKt1cdLU; Thu, 27 Jul 2023 06:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D63E830FB;
	Thu, 27 Jul 2023 06:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D63E830FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62BF81BF841
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 06:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C923403E5
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 06:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C923403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GLOjxuNEKYQ for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 06:54:21 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D78A401A1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 06:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D78A401A1
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12FB9A4C0824;
 Thu, 27 Jul 2023 08:54:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39128)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOut7-0003dW-2k;
 Thu, 27 Jul 2023 08:54:17 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 08:54:17 +0200
Message-Id: <20230727065417.347083-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690440858;
 bh=K0YoWy6xlZKKL5SvByiZUwxG5z7wlHUUwurGgAoCz/g=;
 h=From:To:Cc:Subject:Date:From;
 b=Zni0jF3IjfsV/NlAl2xSGfCaPofRrsH4fGmVp8HE9/hJs5/mFxfqJ3BrQ6BnqXJaM
 lZ+9A3zMBRBQq8OGBZ3VknylLwf5Hiy9TlCvnmHxKGLCnhVTM7g6jcE9fzXLbo4ioA
 bsYELFv07QTcxbcFL9/vEn4/d7jY/iw5UYNc5eaaALjxSUpkrtOfwshc6yRy8hX8la
 gSgkqTrHRtLnSYBjttsP3ekvMIiDImNbBGs5OngfDVdFGmYCNioxCm3o0SQ6zNnoP6
 hDP4fEwOkmnQrt5ZL7HVwdwQBRiNY8YSbPv6kr8jef+FTFDmOLbjM9Rp17uH71cHok
 pNk8L1XuXLBUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Zni0jF3I
Subject: [Buildroot] [PATCH 1/1] package/cairo: mutex support depends on NPTL
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

Fixes:
http://autobuild.buildroot.net/results/041/041ac8f0809a0f9415c545b7585cd197db08b55f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
The last bump of cairo took place in 2019 with commit
8d2a9d089a969909ad2de8acb67ee14ced03de28, the first build error of this
kind I could find dates back to Sep 2022:
http://autobuild.buildroot.net/results/8c5/8c547ec2e148ce3c4f230bb4b0d5c5b360d74dd5/

 package/cairo/cairo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index e8a704c7da..7bc8f92deb 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -26,7 +26,7 @@ ifeq ($(BR2_m68k_cf),y)
 CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
 CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
 endif
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
