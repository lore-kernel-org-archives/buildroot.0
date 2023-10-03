Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB6DE75459
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 18:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FC5D41822;
	Tue,  3 Oct 2023 18:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC5D41822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yjFOa0cjImOW; Tue,  3 Oct 2023 18:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C7E41734;
	Tue,  3 Oct 2023 18:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C7E41734
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44DF81BF95F
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 18:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E4AE60F28
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 18:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E4AE60F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgbiQ5z4XFXC for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 18:56:09 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB50560BE5
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 18:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB50560BE5
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so12760685e9.1
 for <buildroot@buildroot.org>; Tue, 03 Oct 2023 11:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696359366; x=1696964166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XC3FfjupZIYV5dZ97ZmPsCQRS5GXB5D/NI9ugkW/aLc=;
 b=ZjsQ/pWZ9PhupKVqTCODfUJpN+IWY084nfSlFIGpepUBMZlW1kXOATuY3zLQ/9Sb/E
 p0fSveHTd6pQ/nN6GKbG0sgGcuanY233GWeMYCwdrbHhgfjuKEpwHCC+bXbvQaLoYHKU
 xiL93PupBka1MQ3dc/tUL4ZWKP0k4y/Er6aJEyEBNlRmyR/NootkB5tinfazQeZWTc2n
 cgxHZEYTVQCXU1zZRvnuqUk7Np1cCHaYyHyS3Fid391BUIQdF6QUk1Cn91O/C51mo5Zc
 4leWdV84BJ84xM/C3mISqMAXVopDmgt6yBOH+uWbZE4D/VB/pscpluhRXSXzgE5gubnL
 HxbQ==
X-Gm-Message-State: AOJu0YyTTSkBTePFGVT9oq3dVL2AjUFUIOFix9Y3pRx8Wsishy6ENlFd
 FkI1WxXLdP4QBHXy84L0yCjM0vvsVQk=
X-Google-Smtp-Source: AGHT+IHMlMNjhTmaUYnoKpMo6t0dPbYKAsik4FAj/uIjsv3tKyXQORkpJmGOdFlRtg6PsRpTIDasCA==
X-Received: by 2002:adf:f491:0:b0:321:6dc9:14d4 with SMTP id
 l17-20020adff491000000b003216dc914d4mr102225wro.19.1696359366036; 
 Tue, 03 Oct 2023 11:56:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m7-20020adff387000000b0032710f5584fsm2162306wro.25.2023.10.03.11.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 11:56:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 20:56:03 +0200
Message-Id: <20231003185603.233238-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696359366; x=1696964166; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XC3FfjupZIYV5dZ97ZmPsCQRS5GXB5D/NI9ugkW/aLc=;
 b=OZAD8ec/wsDQZZTA84BtMzQnnCt0gMJf8MfQJtXQ26CagGx4u9J0ZEaDB6mlj+dp8z
 L5S3q6rgqaZIDCb6oNSB/UJ8ZOvGAXyk914wa+s1iMzCZjYpmuE4vr7jzKYH9MAIHQdt
 Y2K91OEOIX/gCC5dj6ATw6r2LwVmUckkzFgo4YEvi5R+DJA7nCVXXd9h3F+H2xVGHAPZ
 IaZ4zQjBnaLtAb8Zfzg6tWZRasH+GEkws9de+ioresnoltoJhhLLVuS9gIvjnGnegkiR
 mjVbAgm+M+2apHy+k8iDL36ClP45BsV1saV9lFW1pOBDH/EPGY+F4yL2pX4qpeZDVwJC
 /UNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OZAD8ec/
Subject: [Buildroot] [PATCH 1/1] package/udpcast: bump to version 20230924
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

https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/BXBS6HOFXCMOF3LKCOVWXDPRD43S6B3Z

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/udpcast/udpcast.hash | 2 +-
 package/udpcast/udpcast.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
index 9ce91330fd..aca098d982 100644
--- a/package/udpcast/udpcast.hash
+++ b/package/udpcast/udpcast.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  a3cebee7a87ecf1bca0645f125be78fbd7b37846a4da82fecef96b92cc64d050  udpcast-20211207.tar.gz
+sha256  17b5cd8b1e54f7e2e53357ac02ee86e4198bf704096987a03a3b5c402a0ecea1  udpcast-20230924.tar.gz
 sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 4ea73e20c7..64a0bfbd37 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDPCAST_VERSION = 20211207
+UDPCAST_VERSION = 20230924
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
