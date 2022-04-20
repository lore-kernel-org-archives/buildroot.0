Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30CDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 19:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8687460E77;
	Wed, 20 Apr 2022 19:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lCcQNmCxToz; Wed, 20 Apr 2022 19:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9338D60BEA;
	Wed, 20 Apr 2022 19:34:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0143A1BF418
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 19:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E35FB404F9
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 19:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Jm9WF587zup for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 19:34:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E423A4014E
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 19:34:44 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 125so2972428iov.10
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l78Bk1C4XC2FaatfkrNFDQJBujw8u0nT8WtW1EcgdOk=;
 b=YTeAM6OEJw3I+YOdMoP/m9Og0TOK+xCx1vL0x8z9i1yE77fIBN8YXTl165ifJPF9/Z
 T36iJHdd6ZlVR+BQY+veEqNtHerUwyoFuaZbQvTbW0MGLntJdaFup8OZ+ZTUxg+XJrDi
 1mcVqIvQXJiRsYS7wlypHZXFeHlDxKDH07IsJUAQS8vx/eRl8r7flnrUSqb+yXfV6hPa
 OX8JQ/3l/6DEXnXFPZhA+IRzjSB41tsktrX2HjZulZbELqUf7+TUY3zBMcDA/06Q1kW/
 /x43c2H/mFgX1QLI/Y8+a5Khb7OBBp7ziJfJLm6w2il+jddL0J68lXzjMr5ZXq7W8ahB
 xUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l78Bk1C4XC2FaatfkrNFDQJBujw8u0nT8WtW1EcgdOk=;
 b=6wN1YDvWKFD8b2r1b2nDQpqdZa5/qjzQCBlF6M2mseAIs493wm/CnfRXeOWimgrxOn
 nG+RwTHDVHcewt7VTx3+SWvm/2Me7IyllmZQbNaRf0HYCacKH1o+/bsDXOFuhIwVpgx/
 0EFVyRKNP/y8biRcNhAkcqt3jsgomkBbkHWgaopL+cB5cATQfcZ1panZd4NsZQFvtN1P
 PJyOSznEAo60zPPTRok5GLgeI+zNInakbaVtfv18L1rq/+skDOjx6uZJWAcGduQxBRHg
 GQQYa2A9x89KhoaSMB0GYS0Fw6gQTxkKibLXUcNF6Sz3SPVbOzgMkkiC2Oj7eoPK319Q
 qzOQ==
X-Gm-Message-State: AOAM531IKKZeFGVy5KwVldpUGlqYDXWvdL/+6YqK7YojT7UMFku1+mgF
 gJwO0AnaB4eNUDRgimF42QRD7zcDJeB/Tw==
X-Google-Smtp-Source: ABdhPJwifYjkuvSc+SQ9uUYvnAstr2lBKLbyqWZ8jIm+Y01EURMb/6Ujuo6Ro4Dx6IrsiHlS4hPMNw==
X-Received: by 2002:a02:224d:0:b0:321:370b:6d59 with SMTP id
 o74-20020a02224d000000b00321370b6d59mr11187152jao.104.1650483283541; 
 Wed, 20 Apr 2022 12:34:43 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 r12-20020a92d44c000000b002cc0b7b043asm7637761ilm.28.2022.04.20.12.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:34:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 13:34:34 -0600
Message-Id: <20220420193434.881088-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.50
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

Disable legacy-rtkit which we don't support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index e6fad56698..6f65a6b143 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  68bbf83b4c12bbcaef5d4bfb0dda86177583cf0abe0026efcfedd837b2e4926e  pipewire-0.3.48.tar.bz2
+sha256  68592ab5852c46ee3d743f429f9d6b6c82171fa37b4b3854eb0da62b08b49d14  pipewire-0.3.50.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 80246cc8d0..9d4dc45f02 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.48
+PIPEWIRE_VERSION = 0.3.50
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -29,6 +29,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvideotestsrc=enabled \
 	-Dvolume=enabled \
 	-Dsession-managers=[] \
+	-Dlegacy-rtkit=false \
 	-Dlibcanberra=disabled \
 	-Dlv2=disabled
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
