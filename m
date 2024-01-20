Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F63C47DAF
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 16:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAE938452A;
	Sat, 20 Jan 2024 16:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAE938452A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfBJDxjdTLWJ; Sat, 20 Jan 2024 16:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376CE8451C;
	Sat, 20 Jan 2024 16:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 376CE8451C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2A71BF400
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 16:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 244DF40A4A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 16:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 244DF40A4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZtLVr0tDmAPd for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 16:36:28 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E18AC40253
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 16:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E18AC40253
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40ea5653f6bso6817365e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 08:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705768585; x=1706373385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1dmkuvMcI9GsLK1dLkozBkyC61vSsd1QDwugbcL2AHs=;
 b=ovwBy4PWC6G5PIsY4tmo+Kbv+cmNBFKpBVQwFkiaQ8cn3HAuWOaTD7+7UWu8SbWA79
 BaYO+fCtxkZzG6rv88VfIGBJaznfOnRUWNZT8K/6H1a6cfCpQg0GEVa77fNPy1Q7FKcv
 TqAPvWssmSZz/fQq8EQqMAd6sfXYiHBl1z6RKrwmFNN6BKyffY4zx6tIb/Z9NFlEjeYk
 yuuX3skNCNhS8rVhX4MX1qgu1BR3plQhBvUnHDyHha70AgiWej0jjdoiQhfHD2Z4ug1T
 qYlpDqvENlzztTCrM+85/1BS+6cFNQIZquyPZP8RnXAZJl6A5N6qqHa235ntwMTV8RXY
 xQEw==
X-Gm-Message-State: AOJu0Ywnx0DjxY7A/i1CfSCanUD8UOi0oAqwa6kiwIuBFiXeYhyQ1I5Q
 Oq+ervVQ6xK00ad9sJnKV09cYygWgyDKqSmvykMrlVbKXHlIgQHkQcJ6UIBv
X-Google-Smtp-Source: AGHT+IFbOGjQWk0KypcVt5847gGnRSSPyUkKofpQlDXbNf4iNWvstmbP3hO+z1ql+ZcKV8ZzVP9jPw==
X-Received: by 2002:a05:600c:2242:b0:40d:3043:81e with SMTP id
 a2-20020a05600c224200b0040d3043081emr760377wmm.162.1705768584943; 
 Sat, 20 Jan 2024 08:36:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c470400b0040e45799541sm36782933wmo.15.2024.01.20.08.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 08:36:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 17:36:22 +0100
Message-ID: <20240120163622.261411-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705768585; x=1706373385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1dmkuvMcI9GsLK1dLkozBkyC61vSsd1QDwugbcL2AHs=;
 b=d6KlF32QSFmbbotJ57iffR04JdP/9WYV2l2L2vvw1SNxGAJ9/jwfp8SNP3ICKLJ+6d
 GUYMWiZ6cgDgifHJjuQPUwnYD9q0+ceMOMFQe025lkL8kDi+AeCO9jHY4U9YB8orisvo
 lgfNITXeUqxw9dP6QnpcGNG2vuMJjLSNbIJAuXirwXCKMUA6RkclJvkuqRM5Uvrqx1FM
 5EOofJdhIhSzVYhT/I6x1VboNIsx8QwDWEwHBFpSyhiiDjV2yIb9xfI5EUk7JfZWvFKq
 MS8Disan7h3PTFlzDySg8s6pKeRUohCIQEKbvySsuHfFAgvu7AzWgM2RKLXnB+K/pDlq
 LaMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d6KlF32Q
Subject: [Buildroot] [PATCH 1/1] package/zlog: disable -Werror
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

Set WARNINGS="" to disable -Werror and fix the following build failure
raised since bump to version 1.2.17 in commit
53779570e50307482d095ff6ef95582cac2a0165 and
https://github.com/HardySimpson/zlog/commit/b8d9634a1a9fb6c60ec2a23b0cb4b5e29e6e3502:

event.c: In function 'zlog_event_new':
event.c:94:72: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
   94 |         a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "%x", (unsigned int)a_event->tid);
      |                                                                        ^
cc1: all warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/21e9212dbb3d77108b45f755890a8e66b23d2407

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlog/zlog.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index ccf2576529..347f482211 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -12,8 +12,9 @@ ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
 define ZLOG_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		-C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE1) \
+		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		WARNINGS="" -C $(@D) all
 endef
 
 define ZLOG_INSTALL_STAGING_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
