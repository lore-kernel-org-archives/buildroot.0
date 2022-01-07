Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8769BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 08:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EF4983145;
	Fri,  7 Jan 2022 08:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V67cB2FlZ_hF; Fri,  7 Jan 2022 08:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DC9681831;
	Fri,  7 Jan 2022 08:01:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 956E61BF861
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 08:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 824E842488
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 08:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItUp1Ag7frO6 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 08:01:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 315A3400E5
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 08:01:02 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id p65so6177013iof.3
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 00:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JD9q8Jh/qfjsUVRY9y5WQIKKge6mebtbACUOLIYfRgA=;
 b=dweE94yx5KbjF0KrbTefhAgjb7H8frm+3EGVvBLyf2PRH/WyQONFiyqqNe7jRiYpE3
 tq9LUkOszZbAFcqMHvWDLAzb8Ega6sO2xH4AkdjX+eIhLGYNPsH1DnZVbRdSVaFbQF5I
 5juwZA/i8WSNKyK5QLBj3+109hUE2Y7Ymqknx1kN+x0G++28GGUfjhQU7IRVo2c5SXgT
 hzj1Zl0tngnqdLtpYbKbGUdpsIl9b/DaGpSkEHQWT8rO77NfVE4BQ19Vv8F2IqyXC8ZH
 xCDF5NJpi6eMDCH/cR1yNDpE4ka/GJBoWiL8o73YgotfreH1WO+cvWkpc6a0R1yYa9yg
 t0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JD9q8Jh/qfjsUVRY9y5WQIKKge6mebtbACUOLIYfRgA=;
 b=xZyAyVYgaTDLabo9XegPR810Zmzz67yUKwv0ctvvRWbhSV2MyaB2XtBMYwERRJGrcm
 CXYUsVAu6HrzVbDZ93SMtkVokC65Ij8dw2jCKQcMsH0AG6wT88kSRGLXytf9ZouE17dR
 91VM7DWjT3wECcQ76pyZyr+yNuWglZ7voT7SXfBn6H6pUn/B6Kh85hXXxufgL90SpYMQ
 OhxouRhcYWuDE5lxiD15qFTx+Ot+cI58izR7ss30Wdffrwg2bHzWjosARyNuxxR6z8x8
 1E5291p5ESIoLFLl5bHFIcD9QRbXAy99NAjNCXoWc4S3oRPkC+gvUILoOTO7jsWnA9sp
 9fsQ==
X-Gm-Message-State: AOAM532SR/s3oQ6JZOR0fG/qd6DciWS8aAoXh45OSj5r+q574k+dW6dX
 vQKdSnP2/TflWQH2tErbmf1c9XlMlZc=
X-Google-Smtp-Source: ABdhPJyqrIazC8H2Oc/CBEIi2MPnoSjbpSOhGXv4tVs+GIO6Lj0xH9ffiWudjnvH5hTe+T8DarPwxg==
X-Received: by 2002:a5e:a705:: with SMTP id b5mr4429928iod.142.1641542461023; 
 Fri, 07 Jan 2022 00:01:01 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id d16sm2370893ila.51.2022.01.07.00.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 00:01:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 01:00:55 -0700
Message-Id: <20220107080055.4003907-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.43
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

Add new meson configuration options and optional dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index c41c0a3686..8464a56338 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b6a2eab8bda2f3cb87c3a0a714839696831ad27b5786674c4bd6c3776b9ebc97  pipewire-0.3.40.tar.bz2
+sha256  2e91f228ffb93494f2423956b930014de20e15639a03f3df4fca4ebf4bc51fc0  pipewire-0.3.43.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 7043745cc1..604d08f90d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.40
+PIPEWIRE_VERSION = 0.3.43
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -28,7 +28,8 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvideoconvert=enabled \
 	-Dvideotestsrc=enabled \
 	-Dvolume=enabled \
-	-Dsession-managers=[]
+	-Dsession-managers=[] \
+	-Dlv2=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -174,6 +175,13 @@ else
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PIPEWIRE_CONF_OPTS += -Draop=enabled
+PIPEWIRE_DEPENDENCIES += openssl
+else
+PIPEWIRE_CONF_OPTS += -Draop=disabled
+endif
+
 define PIPEWIRE_USERS
 	pipewire -1 pipewire -1 * - - audio,video PipeWire System Daemon
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
