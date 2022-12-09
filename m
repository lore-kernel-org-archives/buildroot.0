Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A06EC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD1E611A4;
	Fri,  9 Dec 2022 17:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD1E611A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cPeZxWGioHgo; Fri,  9 Dec 2022 17:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31D9B61197;
	Fri,  9 Dec 2022 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31D9B61197
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA4A11BF5DD
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9477541296
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9477541296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nzZN7nQfC9ff for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:27:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CB2E40947
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CB2E40947
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:27:15 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id y2so226198ily.5
 for <buildroot@buildroot.org>; Fri, 09 Dec 2022 09:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bjhv6vhD94TS9Nk1Rd0GRmOFDxZAO6/IFJlJ2tIUf3c=;
 b=SyaIzTLBtic+FWTdMCozWLzSGptlLu4GYE6xbbVR24q2wbDXzD/cQBnx2dzHge+Rl2
 zvcGAXYJs/CcEmqQqNdEbbnB8/bl48OQOAtZSGm6KxTUZxuEDFRMKVlmJNqovRLBNPGl
 BRJwFxanwAiVkYU8F/mpIKstgrxCgHHMZoYaF9NpB06CElmWonWaTb/jKsSNA5JTBDRR
 HEa6lA2ArdcM7fN53EZjtJvqeHwT5Mz5JgbTZi3yXaSZWVnJYlUmbFsckNfqTk35qf3u
 jhOQLEfYsdRybNQIOcplKVL7Vc1P4UH/EHUyGfNID3O9iCTZBPyhqzsHZAc5CEO136O+
 EPhA==
X-Gm-Message-State: ANoB5pmB2h90zQmL/2DSwXzK0pyYsN7ifAG0XNfwjIz6AGvfdWjWeg69
 nqbsor59cQyTJwG8vKzO3YQ78Amr2izZY4i4
X-Google-Smtp-Source: AA0mqf5HK9m/OX2QVT9dzwV0qNSMrRh7Jj8m3RxdgzpTW2rpIIRg4EeU6IupzVLqYnrBMTznh6HrJQ==
X-Received: by 2002:a92:c5ac:0:b0:303:2770:4e75 with SMTP id
 r12-20020a92c5ac000000b0030327704e75mr3652432ilt.18.1670606834259; 
 Fri, 09 Dec 2022 09:27:14 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 h2-20020a92c082000000b002f916f15625sm616872ile.23.2022.12.09.09.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 09:27:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 10:27:12 -0700
Message-Id: <20221209172712.3928585-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bjhv6vhD94TS9Nk1Rd0GRmOFDxZAO6/IFJlJ2tIUf3c=;
 b=b5Hwu940/Ipe3qMMY0GjWy2JBRNQwr9mTvIgpcHcYRhIW8PVLShnvqzvBuHmcikEAy
 3JrwUC3xxhEhjxuyEl6YDHkRIUF3SmdcnRCLoA0XIAnq0qUfrGP3KjKzGP9bEv130dIV
 MVGFB6VO0iFkEBadEmfFMpK4IxBTPVB1L2gHQSenkOmOt8qWPBUyiNZndgj7aT9P+Flb
 JEwYX6MWFrhhJaG8nOgdaGWvwwqitt519OobSUnotQtmIfd9400uYMmK1nRMJ/KZcvDQ
 i06JK4OJV6A8WM5W4i9PhJ9g12yvMVpH/uEOBXyHkP79UJwGU2gZc2vGmbsJatGHhpu8
 +JXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b5Hwu940
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.62
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

Add support for new optional gsettings meson config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 4585534569..d8b5b0cc86 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8164eb53c9eafedfa22fe1adc4b8e38f3173c6f33695c735a17ed1a3d43c664e  pipewire-0.3.60.tar.bz2
+sha256  24b218cf3bb1fb279c8c489c14cc9ae483e1da7b4c8215b2ee5a5ee831bae94f  pipewire-0.3.62.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 9fef605878..6bcda0a93d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.60
+PIPEWIRE_VERSION = 0.3.62
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -166,6 +166,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dx11-xfixes=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+PIPEWIRE_CONF_OPTS += -Dgsettings=enabled
+PIPEWIRE_DEPENDENCIES += libglib2
+else
+PIPEWIRE_CONF_OPTS += -Dgsettings=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 PIPEWIRE_CONF_OPTS += -Dlibusb=enabled
 PIPEWIRE_DEPENDENCIES += libusb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
