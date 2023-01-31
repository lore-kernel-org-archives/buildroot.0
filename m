Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC4CC636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 13:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0B2D402E4;
	Tue, 31 Jan 2023 13:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B2D402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dR0nPlXw_A-b; Tue, 31 Jan 2023 13:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8F8440329;
	Tue, 31 Jan 2023 13:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8F8440329
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83FF21BF3DF
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 13:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EF6940297
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 13:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EF6940297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7a60YjixsLWl for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 13:36:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FB7D40223
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FB7D40223
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 13:36:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a3so7530852wrt.6
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 05:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3/W/g6Sx3KY6pVS4FBaynMjuZ8895BH0ZB44z3tKZh8=;
 b=rxmFrz30Joc9Jx47kiFhpYrY8l0qz6ZcdiZCe+wk9NLrFMTONK5vWKwYvPUkY+gagI
 exgXoeuV7hEXerGpnikfxn7GfC6fs81H1ylp5lNvee7ssEiOLEs9Z1am30zy44pIMQs8
 3O4YX/cQ0Gf8/OMl6Xd67sYbMr3H0UaOGHCdeUF3s9ugxluutIn/fjrRwcHsaLVHFInt
 +8xAZX3bUrLD7adRqUz2OkfqWg+k1Ozz71aKOK/SFKm/WZkCkpDNghoIsOWjEU8pghcU
 yWAgR0U27NHdOfCF4ZASshWsvJkdb8obR0eX9yWFkFLtP0r447Mbz6qfmTn0fEsSICq8
 EHdg==
X-Gm-Message-State: AO0yUKWCMYJYUrO55aFl16tWARdSuqbEgLxkpjvlkeyOECwojGd3a94t
 jiPjUGEyuBbS+dp37QCEuZQnBybHcRewEA==
X-Google-Smtp-Source: AK7set+nbDpD8aRyuOWHcRiWiumFc499H4uyhgf9aJ0pVXSSq+mTKjpjm9i1NtULdNZo8mh3RyIhIw==
X-Received: by 2002:a5d:4cce:0:b0:2bf:b741:3e19 with SMTP id
 c14-20020a5d4cce000000b002bfb7413e19mr20857252wrt.25.1675172192969; 
 Tue, 31 Jan 2023 05:36:32 -0800 (PST)
Received: from goliat.wr25.org (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 a11-20020a5d4d4b000000b00289bdda07b7sm14587007wru.92.2023.01.31.05.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 05:36:32 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 14:36:26 +0100
Message-Id: <20230131133626.638374-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3/W/g6Sx3KY6pVS4FBaynMjuZ8895BH0ZB44z3tKZh8=;
 b=T++zU5P7XcJv0OQBFIboLPWH9qY6na/2qbAowc2CNjZD0ZWRIhCx6zPH0z671J7qLU
 JbhccDkFLHZK+kYMr7IPif+s/r/9T8ZGoyOUARTtnYdqPrBMGW7zefZz0T+/tvRv6D+A
 cVFrDzf6n1527X/IDwfYNDg46h+pOHulKqNXJkTdVvAMOR8qjaaLep09cRBqvBcDm7GK
 KWkCwilYAtk3bfxJf3OIEHPuVWc3qtmikb3xYJwkJkfgCy+h3JYkFKkpBDUXzGSZ4/Ej
 qiqZDP1O1dkIeAZiXJtZtpgoCfaG5t41w4+KbjoI5OaoSp8WwNUOyy8zFV2h2ETzdypX
 ww4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T++zU5P7
Subject: [Buildroot] [PATCH] package/libcamera-apps: fix overflow conversion
 error
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream commit:
https://github.com/raspberrypi/libcamera-apps/commit/a65682a97e19f96b86aeceb3ca3befb1687e3861

Fixes:
- http://autobuild.buildroot.net/results/758631a9fcd62835844f78914a36dfb579e7beba/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...ass-VIDIOC_QUERYCAP-as-unsigned-long.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch

diff --git a/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch b/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch
new file mode 100644
index 0000000000..2f4b6424a1
--- /dev/null
+++ b/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch
@@ -0,0 +1,34 @@
+From a65682a97e19f96b86aeceb3ca3befb1687e3861 Mon Sep 17 00:00:00 2001
+From: Marcus Folkesson <marcus.folkesson@gmail.com>
+Date: Tue, 31 Jan 2023 09:14:15 +0100
+Subject: [PATCH] core: pass VIDIOC_QUERYCAP as unsigned long
+
+VIDIOC_QUARYCAP is an unsigned long and should be passed as one.
+
+Get rid of the following error:
+core/libcamera_app.cpp:33:22: error: overflow in conversion from 'long unsigned int' to 'int' changes value from '2154321408' to '-2140645888' [-Werror=overflow]
+   33 |  int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+---
+ core/libcamera_app.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/core/libcamera_app.cpp b/core/libcamera_app.cpp
+index 04696fb..8cb6563 100644
+--- a/core/libcamera_app.cpp
++++ b/core/libcamera_app.cpp
+@@ -30,7 +30,9 @@ static void check_camera_stack()
+ 		return;
+ 
+ 	v4l2_capability caps;
+-	int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
++	unsigned long request = VIDIOC_QUERYCAP;
++
++	int ret = ioctl(fd, request, &caps);
+ 	close(fd);
+ 
+ 	if (ret < 0 || strcmp((char *)caps.driver, "bm2835 mmal"))
+-- 
+2.38.1
+
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
