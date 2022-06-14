Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A3DCCA485
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F3FA60C31;
	Tue, 14 Jun 2022 16:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLIOE1x-l3x9; Tue, 14 Jun 2022 16:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5029B60A90;
	Tue, 14 Jun 2022 16:15:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 320D81BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2111283312
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVnyq3_qZC7G for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C64F832DB
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:15:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id s12so18183278ejx.3
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=apS59980fG/BJRmVFNoJb0Uh/ygRvxMSAXZnDYrc5Vs=;
 b=aTaGs2FSOTAZNxHD+lAbflCYqmjNUI97WWMUvaiMC9py/uU6AZZRc7UNoqAPfAYnek
 0EV1vet/TZX9NTYCyHL39M0dd/5W4yW5MYoV7+z0pleLlzh8RQW0l/mtcGWgQ5DDMlJR
 wh2eIDEFsIv1P0Q2mbPxcgqEuPaZFzMitE5WEl2AwvS8UQKnL7TVpnOmln6Wng09ncpU
 k+ajzd+VkHA2HOYInQl0B5n611cwNgX62VJ1FOae9Pu0d5uQZI3yUk9wc6ON9K6auhjl
 q9mWxUJ0Cn6zXfZkp9TekaK8aU0NUj5j8Eiil5f+CAlFoKc2z8E3wLMFoD7AnlA3VxmZ
 CW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=apS59980fG/BJRmVFNoJb0Uh/ygRvxMSAXZnDYrc5Vs=;
 b=AcyeoC4YgYXGdwM7DZK4WHVXl52FO0JPFfkORVKO6jLBWSSFV2Iqxnxt+tVEErhF7A
 QZUDizndy6q0GUBCqwjPdzsGtWxRkI0MBLfieRxjxVwKmGl2p3AmaWCmJVSepFDsJamX
 G9ZRW9TssOVFWc3ljIVzcE7eC1wJMwqYofZEDQDhRrnMnIW6FvahHzWYvlPWqN3TVv3I
 TWcvi6SqkWQ+D4xgcrTGp0z5rLFk+iD7yRdzCROfSK3RFK+wl5Hazkv54exMEG9hQhVJ
 /JPiUBRXleUH6Shvvk3Jh/Ka4xekViTBq4rd3bn+a53llrheKD6wdwPYl/ADMK5m+5U9
 dbBw==
X-Gm-Message-State: AOAM5303tr8QtmQB6liyhXzqwX3yJbC4veJbmJAVvpw5V86D/GG5sv6S
 LCK0uktkJAYPz8WQErhuU0/e3aXPc1ZVDg==
X-Google-Smtp-Source: ABdhPJxb16TkxzkORdcpVUr7gHWfWOcFhZTHeAttFv++sJluJKJLWjb9L0tAjUmb4xhXAE42ByuFaw==
X-Received: by 2002:a17:907:7f14:b0:70c:67d9:7758 with SMTP id
 qf20-20020a1709077f1400b0070c67d97758mr4989417ejc.195.1655223333073; 
 Tue, 14 Jun 2022 09:15:33 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 h20-20020a056402281400b0042dd05edeedsm7521950ede.17.2022.06.14.09.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 09:15:32 -0700 (PDT)
From: Ben Hutchings <ben.hutchings@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 18:15:09 +0200
Message-Id: <20220614161508.419275-1-ben.hutchings@mind.be>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/swupdate: Add upstream patch to fix
 build with uclibc
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with uclibc:

core/bootloader.c: In function 'register_bootloader':
core/bootloader.c:28:15: warning: implicit declaration of function 'reallocarray' [-Wimplicit-function-declaration]
   28 |  entry *tmp = reallocarray(available, num_available + 1, sizeof(entry));
      |               ^~~~~~~~~~~~
core/bootloader.c:28:15: warning: initialization of 'entry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
[...]
.../arm-buildroot-linux-uclibcgnueabi/bin/ld: core/built-in.o: in function `register_bootloader':
(.text.register_bootloader+0x2c): undefined reference to `reallocarray'

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 ...der.c-fix-build-without-reallocarray.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch

diff --git a/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch b/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch
new file mode 100644
index 0000000000..d90ae7906e
--- /dev/null
+++ b/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch
@@ -0,0 +1,35 @@
+From f30c4771e93cad7e77d7f2add94327865d226553 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 May 2022 14:53:35 +0200
+Subject: [PATCH] core/bootloader.c: fix build without reallocarray
+
+Use realloc instead of reallocarray to avoid the following build failure
+with uclibc raised since version 2022.05 and
+https://github.com/sbabic/swupdate/commit/b8897ed695e1cd954859142b14ec8546d2e7994a:
+
+microblaze-buildroot-linux-uclibc/bin/ld: core/built-in.o: in function `register_bootloader':
+(.text.register_bootloader+0x30): undefined reference to `reallocarray'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7208e8189b4a6f35aaa4ed7777ecdd37421a7c7f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Backported from: f30c4771e93cad7e77d7f2add94327865d226553
+Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
+---
+ core/bootloader.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/bootloader.c b/core/bootloader.c
+index f34cb414..5694d43d 100644
+--- a/core/bootloader.c
++++ b/core/bootloader.c
+@@ -25,7 +25,7 @@ static unsigned int num_available = 0;
+ 
+ int register_bootloader(const char *name, bootloader *bl)
+ {
+-	entry *tmp = reallocarray(available, num_available + 1, sizeof(entry));
++	entry *tmp = realloc(available, (num_available + 1) * sizeof(entry));
+ 	if (!tmp) {
+ 		return -ENOMEM;
+ 	}
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
