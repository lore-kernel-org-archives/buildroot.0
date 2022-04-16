Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33177C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 14:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13CF81A24;
	Sat, 16 Apr 2022 14:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2tD8-TJaaSG; Sat, 16 Apr 2022 14:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA67E8186A;
	Sat, 16 Apr 2022 14:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2C51BF239
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 14:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31647417A2
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 14:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0bE4IC5jitd for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 14:59:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAD36417A1
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 14:59:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 m15-20020a7bca4f000000b0038fdc1394b1so5746502wml.2
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hbAuLqRgW5u+A7BxDzry8NwLt11VZzb4MFzYMXxOl4w=;
 b=fx+JQL6dFRURJOtxaYH1jr/ZGrBysCzWODxK4/lmVRKfJE8mkjeIBqw1nWEkzLY4nX
 hmgKdRtx1HYCHu67DukRxb9yE63yrcFpviS/3ICOHCaQRxqnaivl9gnQ/MYBnnezLrRp
 ql2hPDPUjiG8YKOpjna6uEOfpVGyAKm+UGRPA94VlaZhjsGcsE6O3+IknoGj2m8sG5Xb
 kpx4Ik4yHNDApHvGiMnrN3+FbjhMZN4vKpowuQh6uNK0raQ65+SKWTX9cvtxykntXEy+
 v4abRXqOO4EZj/JnTIPKIDgbcYl4KPm9oBwbFH24eRFaJydy44TmEMikA9ezjeuFNzYW
 /0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hbAuLqRgW5u+A7BxDzry8NwLt11VZzb4MFzYMXxOl4w=;
 b=fToPqDxjbJpirWIp47MZ9akCcy7MP6b98MEdKZSZxDvash/hLMJ2aq7m9EOBXhWU+S
 Gb0uHRtueZKXGv8rbBZTqMUTGYxmVoTNWDp8x+mAu0h/5xG1gSMyiWSBR0AZ8D+p3CQN
 Al4kfm+ZtzNxXck7t+OnMsrGrhkT8ElrmMfl+FOQM3uRIzDei/djeQzOJ4FgRNlNP0qv
 jvuNbQKPmsltO+ac8mKgehBdHfJlFVfn2dwyOOglXbfIIi/bJeIaeZqg0wk4bMtDMMda
 h6aBnueOAWiHrHkKbfxTmZUZm6J9/s2YiLJiCYM+vUeECe2ad0Xc2ML9WEroZ7QrmZ55
 oGAg==
X-Gm-Message-State: AOAM532XVGkGPzbI3E+0SBR2WS19Cl3ViQpwkXcFbCiz90NDtpZx4sR0
 6/6xnfF8TMZFGKuYqlgyoQp4jfB3foc=
X-Google-Smtp-Source: ABdhPJyIgdmQauKXwZII56+3xj4JiL2JzwfNh2zVvdQKNTUzkpzTemvNffbMTgHnHdwzELsI9yW8nQ==
X-Received: by 2002:a05:600c:35cf:b0:391:b474:272c with SMTP id
 r15-20020a05600c35cf00b00391b474272cmr3533073wmq.198.1650121151539; 
 Sat, 16 Apr 2022 07:59:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 7-20020adf8287000000b00207a864fbb5sm6231083wrc.103.2022.04.16.07.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 07:59:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 16:57:12 +0200
Message-Id: <20220416145712.1956653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix build without
 threads
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

Fix the following build failure without threads raised since bump to
version 4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
https://github.com/warmcat/libwebsockets/commit/8eca7e17f27c8588170c5fa5fa3e6b14eb90e35d:

In file included from /nvmedata/autobuild/instance-1/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-caps.c:28:
/nvmedata/autobuild/instance-1/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:68:11: fatal error: pthread.h: No such file or directory
   68 |  #include <pthread.h>
      |           ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5d011b65e530339eb3f4d06a08caabc6a73b403b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libwebsockets/libwebsockets.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index ea483bf58b..b05418e86d 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -21,9 +21,13 @@ LIBWEBSOCKETS_CONF_OPTS = \
 # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
 # amount of pthread mutex code is built into the library.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=1
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_MAX_SMP=1 \
+	-DLWS_WITH_SYS_SMD=OFF
 else
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_MAX_SMP= \
+	-DLWS_WITH_SYS_SMD=ON
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
