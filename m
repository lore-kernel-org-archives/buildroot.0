Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076C3C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 08:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8846441721;
	Tue,  7 Feb 2023 08:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8846441721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBSzCUNuk0vP; Tue,  7 Feb 2023 08:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D9BE41776;
	Tue,  7 Feb 2023 08:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9BE41776
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 051A91BF30B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E9B8195C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 08:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6E9B8195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPYm8IxMoI7S for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 08:55:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61738818C9
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61738818C9
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 08:55:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id jg8so1697537ejc.6
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 00:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dabsEFcwlDlOuZ0WHleCOlhMctgASHzGs51fgyomxdw=;
 b=eD7vZ8iPr6bkWpbGGtoixb1AOOfeEED/0Z0W671SF+oj18VwOheL5rFPuZNxQ5OptZ
 3c+7Mt8KZcB0ZzGj6DoIgB+uTOTURnK/13IyDY6NzkwApEqL5Pu+fV0sqrCV9Pc1lNg9
 4jzeoi+H5i3Xdc041oJd7jYUKWUA4+JXUSFeUlaCSlpRBixTt/oKNxT1DOlqs6VWFIBK
 ClGqDHoRmAgcDo57kBnjn0XASMhawTffp0svN4SXRWtbWXpNuuaOtp+cEE0170eij7sQ
 r4d0zXyix2FQ4y4oDaizQJO4xzG8eLRGMR0cdxvI2ifz6R/DawcdKCcptS/VzJbQi31a
 gdzw==
X-Gm-Message-State: AO0yUKUq3b25SAW93nmPqljYxB7GsitZiTHqKH3b5apa10Pvhh0Ovhvq
 SHugVU8BndHCi06h2WwIE1rpp3PlSs/D7w==
X-Google-Smtp-Source: AK7set9v0WvNrapJ3Leht/ChuOMKQrMeV1ZuK3QdHWsPsQG6Yg2WobCLLxwU9CsZlnDhbhYmCMRgIg==
X-Received: by 2002:a17:906:124f:b0:88a:a27c:c282 with SMTP id
 u15-20020a170906124f00b0088aa27cc282mr2502220eja.47.1675760098861; 
 Tue, 07 Feb 2023 00:54:58 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 g21-20020a1709061e1500b0087bd629e9e4sm6683815ejj.179.2023.02.07.00.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:54:58 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 09:54:45 +0100
Message-Id: <20230207085445.1651226-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dabsEFcwlDlOuZ0WHleCOlhMctgASHzGs51fgyomxdw=;
 b=S1QWYWG7pMAg7Car4Pwo86c8NKrYPKMSgTHhWftvm0vfVnbiRRVyemO4x0Xm0uhY7C
 B3RJ/FjgooLEHm/3xjovJPUdZuQiF5rCWC6fDjDOf2MIXtgH3kCXLXM48nkcoy9pvebI
 szC8x7AkiEQfN0pF6iAZRZqALH9wKBwIjIX5KPqnCsrSFyANQGu1hjKiLzuTJR9hUqoX
 iyKjK0gUQzb/g4pCLenwT5c92EEVTVXewtiD/PJ76SRpHCwQVtt5B9ldP4rrFDmoVWIf
 A1KT+LlzMF3QEOXKzOAParUeQe+C5v7Zb6Zpv9gpBTRbM9JtlIyxU/ctAxFM5xP7uvyC
 MZrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S1QWYWG7
Subject: [Buildroot] [PATCH] package/libcamera-apps: enable LIBAV only if
 libdrm is present
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

Since commit 35266e84043f880d7591e52b71a8c5b8d0e4717d, libcamera-apps
does enable LIBAV by default which depends on libdrm.

Fixes:
- http://autobuild.buildroot.net/results/548f2a3b353ce4693fb60d7fb1e06e02af22991c/

/home/buildroot/autobuild/run/instance-1/output-1/build/libcamera-apps-1.1.1/encoder/libav_encoder.cpp:13:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
   13 | #include <libdrm/drm_fourcc.h>
      |          ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera-apps/libcamera-apps.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 290ee9a026..385c65136e 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -25,8 +25,10 @@ LIBCAMERA_APPS_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 LIBCAMERA_APPS_DEPENDENCIES += libdrm
 LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=1
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
 else
 LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
