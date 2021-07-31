Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E090C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:01:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B473C60F00
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B473C60F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C61B4026D;
	Sat, 31 Jul 2021 08:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcoG8OFHCHHZ; Sat, 31 Jul 2021 08:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B3D040277;
	Sat, 31 Jul 2021 08:01:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A31271BF215
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92CD560773
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z8LHCcTxOkA5 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:01:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEB11605C6
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 08:01:02 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b7so14339880wri.8
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 01:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fNY4/6LvgvNGQR7pb5wcCusok5Cs5pCldJup24KEXI8=;
 b=AiMshC3/CcExRugDKmLR1xykxpneAWpjXltL0/t6Z62EAIk/rQtt7xbW2rAUfxgi+K
 vefyugnpLFejdpBqMe5eglsdZGZukiVpmKHIRqOj9p6JJVCWKtjZN8mbtRp15cpJ5Tuo
 A03oZoyhiI2WaiJCJzreGZKHABWW3SZrLTcwOQFg3nT0nsM2gQpQuBdSQyEUpRU3eMEF
 Bx7VR86eFBNXDQWLq97hPP5KTofO+EPUDei8cxZfQEvHFUmg1LtvNVZvDicBy2eEusJm
 lupbpo7uYKm1HoRj+yV8QNMM3NcFRU0HghSV0vKttJOTxFvYMcEjvcg7zz6AoWB5mIes
 9gLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fNY4/6LvgvNGQR7pb5wcCusok5Cs5pCldJup24KEXI8=;
 b=F1XUQRv0XWFTAY7WXmc2AP0MIzrZ5dTjkFE3ayKxL+KvdblVu77E8E9ICdxLFM2t/X
 TUluF6kgYvyPNOwEGtpSWYM4MlEY+Qt4RmThfEHU5lUrS4gcYRqjYUPUGnRbSnH3vps1
 fMIeQw4OkrnPCdlAeKAp2GFUURrgEXlI59n7FEIG9K6yB0VNBX4nfagHXoxqjzNpoIH1
 lerkw/++pHX23OmgyOPq7lqkj6lUi5/YB/T5QUB24R5kPTVUsMcTHoeMklg7DGlYUHzS
 KXz8mqTzBvAhkuQAEcbta7pbepkbqKlSKDtfJZJNzgjt7dXG7eWOPP808eUlTP7h21VZ
 yuXw==
X-Gm-Message-State: AOAM531UsyYCLijxP89AJsPljYvx1CE4XOOaqV6CmEK+KDJue6mqGgnR
 LWBMDzWnLo0uwg9gR5Lor21GYI1ngcxnQg==
X-Google-Smtp-Source: ABdhPJwXGuPzfBTR/DNSHINrN4XE0+jA+WiKaAh7B9k1vwcgJxF+lY0kkqof4RdFnhk4m9n4xy+HhQ==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr7080215wrs.341.1627718460556; 
 Sat, 31 Jul 2021 01:01:00 -0700 (PDT)
Received: from kali.home (pop.92-184-116-151.mobile.abo.orange.fr.
 [92.184.116.151])
 by smtp.gmail.com with ESMTPSA id j4sm3234179wmi.4.2021.07.31.01.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:00:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 10:00:51 +0200
Message-Id: <20210731080051.505781-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix uclibc build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix build failure with uclibc raised since bump to version 2.4.0 in
commit 196b29f3273035888d8743075be453649ad82e93

Fixes:
 - http://autobuild.buildroot.org/results/31e770a330158035e24b7b952bec0030138482b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ude-winpr-file.h-fix-build-on-uclibc.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch

diff --git a/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch b/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
new file mode 100644
index 0000000000..d8dfe13d1b
--- /dev/null
+++ b/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
@@ -0,0 +1,39 @@
+From 21036304f909eae9f7506f48703ba1c74724342b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Jul 2021 09:49:27 +0200
+Subject: [PATCH] winpr/include/winpr/file.h: fix build on uclibc
+
+Include stdio.h to fix the following build failure with uclibc raised
+since version 2.4.0 and
+https://github.com/FreeRDP/FreeRDP/commit/eb6777ea69b022c9e43a1576a2192a1cb807b1e6:
+
+In file included from /tmp/instance-0/output-1/build/freerdp-2.4.0/winpr/libwinpr/utils/lodepng/lodepng.c:30:
+/tmp/instance-0/output-1/build/freerdp-2.4.0/winpr/include/winpr/file.h:524:11: error: unknown type name 'FILE'
+ WINPR_API FILE* winpr_fopen(const char* path, const char* mode);
+           ^~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/31e770a330158035e24b7b952bec0030138482b7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/FreeRDP/FreeRDP/pull/7205]
+---
+ winpr/include/winpr/file.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/winpr/include/winpr/file.h b/winpr/include/winpr/file.h
+index 48a29f9f5..79c9b392c 100644
+--- a/winpr/include/winpr/file.h
++++ b/winpr/include/winpr/file.h
+@@ -30,6 +30,8 @@
+ 
+ #ifndef _WIN32
+ 
++#include <stdio.h>
++
+ #ifndef MAX_PATH
+ #define MAX_PATH 260
+ #endif
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
