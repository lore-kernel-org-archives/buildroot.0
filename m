Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85FBC001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 03:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 084C78412E;
	Sat, 29 Jul 2023 03:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 084C78412E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yT7kfc8dSAxt; Sat, 29 Jul 2023 03:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F3B84101;
	Sat, 29 Jul 2023 03:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F3B84101
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C10EE1BF356
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 03:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AA4D84101
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 03:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA4D84101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU3EVcnCWAqT for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 03:53:11 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DFF68405B
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 03:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DFF68405B
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-348cd210438so10836775ab.1
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690602790; x=1691207590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G8MgsDiw9oHscx4OwRWmosVM8exhwii2TgqV0PobBds=;
 b=Rh0aD4RpcHJIyVTsBEPXVeaIOrGDTDvIFU/v6FKM4LsFlDGBHRwoAvGuDmfytZ2z3U
 bq1N5+peVMFbFtesSN57VfdVAaQUy0v2Q/bXe5VhsBqwVrb0kne6MvEZL25DwUF+hY6h
 m0u5vFbWxgNPAmh2XhnrrWya+Vh8MCo+hYiGTLomX7f4r1p3gbEROtU7g7Rq8y8uK+0+
 EohWr1ZOfVXKCiObsa0q3LqrLputV+S0+7xD57r6pO6NeIXD50roLoJr94q/pXHsyO3+
 zB6wzlucB0iteqvkS0XQzH59KHKRJl2KFH6y6JVJSfEm7z+8xQAK3iUBjM7cobU2/B8X
 c/2g==
X-Gm-Message-State: ABy/qLaCttFr9QhHrrcAaLZ9F7X1gUrt9SpLenYwQ/iMcV/vS3Ko/WxS
 yPlyz/OHeSoTopRUKBnKp4Dg5ycfGb8=
X-Google-Smtp-Source: APBJJlHH5k25ddrpH8tEGVRbZITM7GQYqMqtHoIwsT92/QFqbN+CohoAckTri4g7AN02NCl+q40tVg==
X-Received: by 2002:a05:6e02:1ca2:b0:345:3378:4251 with SMTP id
 x2-20020a056e021ca200b0034533784251mr1778297ill.23.1690602790270; 
 Fri, 28 Jul 2023 20:53:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056638220d00b0042b47e8869bsm1549235jas.49.2023.07.28.20.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 20:53:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:53:08 -0600
Message-Id: <20230729035308.2475367-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690602790; x=1691207590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G8MgsDiw9oHscx4OwRWmosVM8exhwii2TgqV0PobBds=;
 b=gyhlSQr9H3l2Y8WYQcB2Sd4PD/NUHEcvXQvJuPL7NkvFLmlKlPz/CuN1D09PMy2veE
 O1dyXH5z4yk+zwDxTxi6OZw6bj6n3YeXE7MLE8K8LQOhgJJBVsEKfjTo2wM04zrutz+D
 navdS/HYtFA2DItRBDMZO7FM6wpU7Lt6wrZg/AeZbmmyggQX6PHabgJoXkhVlIFYz3oR
 ACjo3g8NFoVv9Ahs/6kLHzNIgHmftxNAR0SlC7ffzR+dcJ06TeZ5ai6Vhn43pwrR7ST8
 XylK24riwN80XcERitR7m3i0RoIKpOp0K3jcf5ikgREP9JS7p9u+MpTHskZcaAs8+xaM
 7sTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gyhlSQr9
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: bump to version 1.5.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/linux-pam/linux-pam.hash | 4 ++--
 package/linux-pam/linux-pam.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index 0be3433687..97acbd7adc 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,6 +1,6 @@
 # Locally computed hashes after checking signature at
-# https://github.com/linux-pam/linux-pam/releases/download/v1.5.2/Linux-PAM-1.5.2.tar.xz.asc
+# https://github.com/linux-pam/linux-pam/releases/download/v1.5.3/Linux-PAM-1.5.3.tar.xz.asc
 # signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
-sha256  e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d  Linux-PAM-1.5.2.tar.xz
+sha256  7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283  Linux-PAM-1.5.3.tar.xz
 # Locally computed
 sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 789dcf5c7b..21e5decb9c 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.5.2
+LINUX_PAM_VERSION = 1.5.3
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.xz
 LINUX_PAM_SITE = https://github.com/linux-pam/linux-pam/releases/download/v$(LINUX_PAM_VERSION)
 LINUX_PAM_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
