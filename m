Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665D7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 23:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 028148491E;
	Fri, 11 Mar 2022 23:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHKevsB00AWr; Fri, 11 Mar 2022 23:30:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12CA5848DE;
	Fri, 11 Mar 2022 23:30:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAFD1BF4E4
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 23:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39B8B60C05
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 23:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PV5-1alI-2sF for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 23:30:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AE9F60B59
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 23:30:53 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id d62so11860544iog.13
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 15:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KG4O+xUMNEQmBMGPJwlh0vUsUAWPhxfVH7r/W0x57Zo=;
 b=Eo/aa4ie0lGsCg8Eat2rSlfqyRdOQN04airEgHDeLbbJl/GHciQW/ee+txTCSaWJ5l
 0yqEO+aE3ycr5ezIXWO2tUQAm8xvGKYEIQWotH3/3xk5j0uVclJa1DXMqAgClUddX2bq
 NupYB0piQkj7GTvHxWoesOUaq997MedtxXXRk1JrKiJ+l+sknNlK0wubEnZN3ccTeIFD
 WLBEWs13oAj1Gn1KOk/FubTacciFK6/mMnzB/ZMA2u4DZw412BzD0iaBRFsas5q94pjg
 i0y7jnxp0C/ZtlFwmjTAxHIl3Lhp9ej3t1w0EtX7MJsVrse0p0pZQpE6HcFFfIyYwQSd
 ImKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KG4O+xUMNEQmBMGPJwlh0vUsUAWPhxfVH7r/W0x57Zo=;
 b=xAs4iOaIE0BMhKMyeqngHK3CKIHC8hf8HU6spmWaBIpKbod7k25nYE9FTII2SQXcw/
 fCMyN3ruvQx1yJgS26qMQVBcYiGPVk2+RCNMWQQDLIMBQ9A33bFzLq23dRAwfKjxbxRE
 DDAqlG0TMDSpRB1go8N/J6xbfcxg0kFsZ1GzNKrzftO0KcxKN9CiQlfU1LIZxxbwCKYS
 qaY3Cb5ik4GvKwJ61N4EDrOlYNCyNDvyiDuS0lpsQK9PqMpB/1fg7LDPAvBO/cCgLGyr
 92phvOpJCKFoiS7dDg++xHsKSfxqhoEV7Pv5sieAQpYjy2Fk6mSgo+pa4Ai5Xat4Jw/d
 pphA==
X-Gm-Message-State: AOAM532e5ibFWCebfg4TZWEpe2lrt4X2a8FNVPxeOrOpCsWIDAlFgzXC
 B6sxlMZX9L43YYGXrYiJzjARuHYIbuI=
X-Google-Smtp-Source: ABdhPJxbMhuW/QOERvUkFo2NK+f15QH4JJarCimawgR1MgZBdVyZ3n7Sk6mE1jJz9BoxyXCO+DVaEQ==
X-Received: by 2002:a05:6602:2d44:b0:648:c8a4:c6a with SMTP id
 d4-20020a0566022d4400b00648c8a40c6amr3208988iow.89.1647041452343; 
 Fri, 11 Mar 2022 15:30:52 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 s12-20020a056602168c00b00648a9d133f3sm3061798iow.25.2022.03.11.15.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 15:30:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 16:30:50 -0700
Message-Id: <20220311233050.4686-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.48
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

Set new x11-xfixes meson config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index a9d59663ae..e6fad56698 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  76291373f7ab271664df5b6a22b678ad57e485e25c73ee9c78e049a67b7886d2  pipewire-0.3.45.tar.bz2
+sha256  68bbf83b4c12bbcaef5d4bfb0dda86177583cf0abe0026efcfedd837b2e4926e  pipewire-0.3.48.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index fc521c86ac..80246cc8d0 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.45
+PIPEWIRE_VERSION = 0.3.48
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -136,6 +136,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dx11=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+PIPEWIRE_CONF_OPTS += -Dx11-xfixes=enabled
+PIPEWIRE_DEPENDENCIES += xlib_libXfixes
+else
+PIPEWIRE_CONF_OPTS += -Dx11-xfixes=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 PIPEWIRE_CONF_OPTS += -Dlibusb=enabled
 PIPEWIRE_DEPENDENCIES += libusb
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
