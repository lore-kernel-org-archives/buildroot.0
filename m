Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BA7C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D58415FA;
	Mon, 15 Aug 2022 16:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D58415FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m96ggtlFvy5w; Mon, 15 Aug 2022 16:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55ED0414A1;
	Mon, 15 Aug 2022 16:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55ED0414A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A95951BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90F1760BAB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F1760BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f141pVAZYNEa for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:35:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84F8960B73
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84F8960B73
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:35:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e27so4956671wra.11
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lI3lxJctCIFx3CFokiUFd79AiFKRCooEWkbdLRBaea4=;
 b=2J7Ee2LlOXMaFqgOB+0HqGwLZVPTM7+/01ysS+12TQDeEA8dmXKpctHfnPffDDigIT
 A4q5ACO3ScXZhP+oo7TGWBpxO0qhr/zONLAMN2qUHNrrIzKXALzYZy7O6HJGfYkR4j4s
 gO0nohIDalkkHWFSlt3TxrTlvIsCDyJciI+wDkXlIzRJSVJz/LIhiDpbmwDtBi12NtY/
 3Ir/no36/5JtRWHA+gXVNwY0eo8iWwuBBJCpspNa67FLifthNpPUS7q8mkiKOY9bfnDG
 anFWUHz1daMWw2hS+cyI4TuikcTLZetzb0/xEId4Sqjh8Qt3/N4TqHWHraH4x2F/h70V
 kEHQ==
X-Gm-Message-State: ACgBeo2qk8eX8Q7pvMV9JdWaLYpG/NXmP2GGi08Nvb4j9TyWcxiVZzRl
 HCEft+xjtkAv0MdGeg3pDKWoAsrlHv0=
X-Google-Smtp-Source: AA6agR48snjYxNXyWxybJThNLZXwotY/JYlCvcSgqO+lJjLm2a2cqIzcTWHvcpuoa5UTzzon7+LJcA==
X-Received: by 2002:a05:6000:1a8b:b0:222:cac3:769a with SMTP id
 f11-20020a0560001a8b00b00222cac3769amr8846529wry.120.1660581299515; 
 Mon, 15 Aug 2022 09:34:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0016e6c61061147635.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:16e6:c610:6114:7635])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003a31fd05e0fsm17223092wms.2.2022.08.15.09.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 09:34:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 18:34:56 +0200
Message-Id: <20220815163456.31474-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lI3lxJctCIFx3CFokiUFd79AiFKRCooEWkbdLRBaea4=;
 b=gY9pPdXYLX9bj26EB9xNIHl8XZg+xMZcjYuWd9iLujXlX8AKsl0vfM51SpvGDS4csa
 iSigKD6u5ypaJ1j1jvotPzJ+MQXFfaSlH+JNrNTRg604CHHNBZg7LV1BvCOckBYLzDbq
 w+Je9Av9zYxcqJMsRsBynBHYu1r95C6dqQOYX9s96jzCExHFC1LiYDMeCL70y3HKmT/H
 Lmx8Ov9y5Tw+qvHdUkwRVMlDspHRycakGfdr1VnWVNfSvOWCg50j3ykUI0G2uk63uNtL
 XKZTLNE0WxcYNfcmoN1m7qk4CM9AM+2pofDnQnRXDuvIe+eIdDtMfWwbeTQHgQzJKV6Q
 KYwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gY9pPdXY
Subject: [Buildroot] [PATCH 1/1] package/lshw: fix NLS build
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

Fix the following NLS build failure:

In file included from hw.cc:5:
config.h:10:10: fatal error: libintl.h: No such file or directory
   10 | #include <libintl.h>
      |          ^~~~~~~~~~~

Strangely enough this build failure is only raised by the autobuilders
since bump to latest head in commit
72a009fa98a37825624f70dc2a1cf825a5999a0a. However,libintl.h is
unconditionally used since version B.02.15 and
https://github.com/lyonel/lshw/commit/792eba3da1c38a164ddde999d188b11bc0e5abb0
so the build failure can be reproduced even when
72a009fa98a37825624f70dc2a1cf825a5999a0a is reverted

Fixes:
 - http://autobuild.buildroot.org/results/09fbc4948650f8f756cb5a9ca4b5c687cd2edc6c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lshw/lshw.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index bf286647b6..c6c1ac671d 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -11,12 +11,18 @@ LSHW_LICENSE_FILES = COPYING
 
 LSHW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
+LSHW_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+LSHW_CFLAGS += -DNONLS
+endif
+
 LSHW_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
 	AR="$(TARGET_AR)" \
 	LANGUAGES= \
-	RPM_OPT_FLAGS="$(TARGET_CFLAGS)"
+	RPM_OPT_FLAGS="$(LSHW_CFLAGS)"
 
 LSHW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
