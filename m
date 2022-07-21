Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2EAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 20:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75DE283FE4;
	Thu, 21 Jul 2022 20:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75DE283FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2um2221DnZsU; Thu, 21 Jul 2022 20:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B78083FC0;
	Thu, 21 Jul 2022 20:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B78083FC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 466691BF3D9
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 20:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BFF760AEC
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 20:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BFF760AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dkZU8UTdjFhg for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 20:37:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C85360A9F
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C85360A9F
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 20:37:00 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id u19so1407695ilk.7
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 13:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M3j8ckSW2aZoeSmFcytLNPPhW+E12mrBts0NfFHoVtQ=;
 b=o7Dmh69ZyLiU94ep0otOqn2x3mEIipb18M+gHZLUBOxBq3S2LD9iIhhjVUGCysQqBA
 7bdU9G8WK5xnutZ4rGEJfShnTE6XH+V4DFerCqDtffHZP1uYMOSU7wfaU3os+lRGjjdZ
 XMc73+Mf/UUHPQ9OiZz6e9AwpN6Soerydxbb+q12dmcP7yx3NXFw+Ir5fWxM6w8F0Dlb
 Rs9uVGbxDZbx3PDwyGYoXBjAO51CiYk0rIntmIAh5Jnl21jMJYZ9ctj1oh7Bo6TZ5t79
 IHHXXrfRV0eHl11sX1Wp8Teth8EyjLY2MFwG//uoTL8xsjb5FyW1XENaFaElywZ+arKK
 JtxQ==
X-Gm-Message-State: AJIora931zKuF7CJorfruLduJATidJNYOI/eaGXQGKWOLO73BYUBQ1La
 Fcr9xCcvOu0W/Auk41PC0oYIDDmUxhTROQ==
X-Google-Smtp-Source: AGRyM1ts1ule16VerIIPpowUfhr1Fkv06icyX9qTaDQpcJjz4CVvR4WzBaCYwqgQJfHotWLBX0VzWg==
X-Received: by 2002:a92:cd8b:0:b0:2dc:1733:9b96 with SMTP id
 r11-20020a92cd8b000000b002dc17339b96mr80067ilb.268.1658435819923; 
 Thu, 21 Jul 2022 13:36:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-222.hlrn.qwest.net.
 [71.218.105.222]) by smtp.gmail.com with ESMTPSA id
 s23-20020a02ad17000000b0033f42a99fafsm1195491jan.121.2022.07.21.13.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 13:36:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 14:36:58 -0600
Message-Id: <20220721203658.2311036-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M3j8ckSW2aZoeSmFcytLNPPhW+E12mrBts0NfFHoVtQ=;
 b=S2RTQiKxvYgXrrcdVCKL5nxUYeR7ljeuMdAGWKUnkIUd/TH/n3zuhUjy0kRY6Zdq+8
 6Fvnnk0gM7wRMmovWDFbTeapL1nxk+WSrWQOU42oZJ98l9r29cZQo6xbxv2nPijG/hLL
 gs5RnlRxyrS6U7hY2Qcsi2xqaQdRRVX14c+SfY1URGyGE2AUE8mnBeaXs3VCUEeEKVcv
 cvgdFwTD6uW5myb+Y5Q5gT3lUdg5RskXzw3Mxp31y9IO34qSEL5kAzZRBhkq82DqRg7I
 xMfpbnrnfLn1CQ6fizK4Z7KNXu57o1xZqGOZJo6iGcGhgy4QJWuBjYBVJklXAj+UZMMT
 VwCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S2RTQiKx
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.56
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

Disable new unsupported avb feature.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index a525c1b212..905608c3bf 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7b47d3a0c3ff2abf9551be6b35cdb4baafbd328290b05dbba2075a6d8cf14b89  pipewire-0.3.54.tar.bz2
+sha256  bb4662ee4f4036586905268354329228d763fc08d99ca8f0e8ec7e002e46b88d  pipewire-0.3.56.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index bdf99e5789..ecfb6c0ae2 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.54
+PIPEWIRE_VERSION = 0.3.56
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -31,6 +31,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvolume=enabled \
 	-Dsession-managers=[] \
 	-Dlegacy-rtkit=false \
+	-Davb=disabled \
 	-Dlibcanberra=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
