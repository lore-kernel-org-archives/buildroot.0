Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4811EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 18:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 308D682B84;
	Thu, 20 Jul 2023 18:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 308D682B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kyrdy371493P; Thu, 20 Jul 2023 18:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8280082B2F;
	Thu, 20 Jul 2023 18:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8280082B2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 572A01BF5AD
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 18:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DFB682B1E
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 18:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DFB682B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7aNpT0g_77M for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 18:46:10 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E33B82B2F
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 18:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E33B82B2F
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF8D7A4C032D
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:46:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34408)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMYf7-0000ro-1K
 for buildroot@buildroot.org; Thu, 20 Jul 2023 20:46:07 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 20:46:05 +0200
Message-Id: <20230720184605.1020881-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689878767;
 bh=28bxRtnT9DqUKXLCiC4aEogNCGppfG5NmC5txfhlZ9o=;
 h=From:To:Subject:Date:From;
 b=Q+IRNhtfu8VbdwsSYTrP6i0uApfWvvBKHwn6CVZwb1YKn1NElrwAXXMe9T1wRHlM8
 MERnxfRrfplfcwFTchCxtYo6v1d4OOa4eHn5eF+MeWLGPuluR54dmawdHyXK6Lghr3
 huYfLXL87UI4XEkJj6xkqZJXsBj69wZ2E6ipTAQK/pqjL9KKRPz7gWjm5xrtkiIuTJ
 piWnrJYxEaUrOTmC77ZHydTFgyyiAn+ayUv9b36M0Vj6kza3s2YEIGEQhBWUpkMLAJ
 m2NnIKAyVfKRe8+2g68CoogCQF1W/2thb5gugA7Xl8wIcSb1Xz4cfpqBemN9U9KkiB
 42+RxeqCbxGzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Q+IRNhtf
Subject: [Buildroot] [PATCH 1/1] package/pound: fix pcre2 detection
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

Without this fix configure finds the host version of pcre2-config:
checking for pcre2-config... /home/autobuild/autobuild/instance-3/output-1/host/bin/pcre2-config

Fixes:
http://autobuild.buildroot.net/results/1b9/1b98078a28b478018cf60bae35974cb4033e2af0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pound/pound.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 550da10513..7bd7eaef2a 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -18,6 +18,8 @@ POUND_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 POUND_CONF_OPTS += --enable-pcreposix=pcre2
+POUND_CONF_ENV += \
+	ac_cv_path_PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
 POUND_DEPENDENCIES += pcre2
 else ifeq ($(BR2_PACKAGE_PCRE),y)
 POUND_CONF_OPTS += --enable-pcreposix=pcre1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
