Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B35BC001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 17:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04EC6844E2;
	Fri, 28 Jul 2023 17:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04EC6844E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1KYah1WB_9b; Fri, 28 Jul 2023 17:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431EA844DF;
	Fri, 28 Jul 2023 17:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431EA844DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7B231BF239
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 17:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE9EB401C2
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 17:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE9EB401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7BileXvhOOKk for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 17:20:29 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8771440156
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 17:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8771440156
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EC57A4C036A
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:20:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56046)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPR8c-00050D-0X
 for buildroot@buildroot.org; Fri, 28 Jul 2023 19:20:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 19:20:26 +0200
Message-Id: <20230728172026.3337541-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690564826;
 bh=LkA2MF+OcwJ//NoTo78c3c5X2W7Tu640LY2VFG6EQrw=;
 h=From:To:Subject:Date:From;
 b=Z6KeCfAhzOA4R+Ud4hBiPZfgl5Z4fuSlxcOyHeR3/Mn+/IP2psQQ6ZDYvcHqJD6zP
 gFwvXkX4aUsMRl0UXmFpAvH9LjiffchWllcN5FB3x8B0TMOXLK8Syc5JGP4m0xPWBV
 tcD3AIOS+5YTgwqZjkhnLojqiP+kPA3LalKKVBQidA68zO5d2DhUJY9p2FBxrVo3SB
 h22CvjBQT6Wzbas07NYbQVFwg+hi5p9XQqh7ogHe2/h2BYXYE52FgtPpO5LzSXeukz
 tCS57e55LC57p3cbWczvNnpizY1An2uZ6919DSosW9QhIe7w3Un2HHAD3r7uGKC4TE
 mWLlyLNYMoYPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Z6KeCfAh
Subject: [Buildroot] [PATCH 1/1] package/php: force arm mode instead of
 Thumb mode
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

Fix the following build failure:
/tmp/ccqcLrVb.s:4053: Error: selected processor does not support `umlal r2,r1,r0,r3' in Thumb mode
/tmp/ccqcLrVb.s:4076: Error: selected processor does not support `umlal r0,r3,r1,r2' in Thumb mode
/tmp/ccqcLrVb.s:8644: Error: selected processor does not support `umlal r0,r3,r2,r4' in Thumb mode

Fixes:
http://autobuild.buildroot.net/results/1d09a0a58cbc1712416de746d57d4532df580673/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 6a2a6ae71b..68aeceb33e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -84,6 +84,13 @@ else
 PHP_CONF_ENV += ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=no
 endif
 
+# php has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `umlal r2,r1,r0,r3' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+PHP_CFLAGS += -marm
+endif
+
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),--enable-cli,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),--enable-cgi,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
