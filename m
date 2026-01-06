Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA71CE9D47
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B44817FF;
	Tue,  6 Jan 2026 15:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPEppy-VqkhA; Tue,  6 Jan 2026 15:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60062817FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767712240;
	bh=+qLZ+cdd5R3QzuC+EiIkwxKxx5hNICzDByzQOceCAvE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=B8KiL8dvsxmo4G0bdq3znwC2XXSeYqgwVM5ELHVH2/9wbsQ9HvQ6edFaDTyT+iusx
	 14LqPEdOSulryc8ep0UB9WGaoA9orQRzC0bYo5r8QyNMBcjEhsERbRqJsU1RCYYx+N
	 lQha/haJleAdVTWqOh8849bpy02vGq/3NLFllBgqYxq6CjEC2UGr2W8W3D/cLClgJp
	 wnOG6eGmJXhJ/VrZgKlF4HqMCIYRUo5ZX3ezqLGFEbJsmyvzu4qRKhUlPaaIvyxnAL
	 1GK88/u7yabQtI0HT7nSTpjxVU3o/aTxqGd6wRVzJOxYAH5MsAJvRjN/M8E7u85FDi
	 mJ0qxQ4xKumXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60062817FD;
	Tue,  6 Jan 2026 15:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F27A7249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D19CD815DB
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoKwG2sqOOwy for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9948780C77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9948780C77
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9948780C77
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:10:37 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64b58553449so1592049a12.1
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 07:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767712235; x=1768317035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gThhXBwLzhDAGJIwiDs4TzuhYbAyaWY3efFiT/iHDjk=;
 b=poJ4HB1m3dvk18NBf/7SBQlqNCofEwcWwOSL5zN678ePeXyfKk/vdub7a16B7R7Hba
 gIX3Ctt1+FNEv4vMFp+txEGlabA/JIOOZc286zWoGq0pYEGaUWJFwikg5lnhguvoQOC1
 b3duL4CoLt5N4COuNHebP68XFcqDHE8sgFaoNwH6ThQRLIHq1wtzmh+ZwtPYS2w3o84j
 flHwjpkzH6wiEdBM2BP3qqX9XZ9kuAQJUZ/gMi2EJ0NUdOrpUJSMxYMR9is2eyHbgBrk
 o1DXXa62gOp22LPkQkQKh8hpDZ7Kj6rpE2IX88698uvPDkXfbIGwvwUwyaq4vl3zaicC
 sHSg==
X-Gm-Message-State: AOJu0Ywy8cQwtWyJ7okIWRQeINKA7Z2tyojLK8oExTpFoMUSewTHKjD6
 Qw/a3SqnQN370Ohfm5IvYyHenljMSIAsiNkX5ncVUXv5WRTatMQQvgTUWrjodg==
X-Gm-Gg: AY/fxX7LOHA3DsuIYRTX82Suu4mdMxCe8ie4BDGR3qPSk61/GCtNgC0IQBpk7I+QQg3
 kUGhKKAGjX3XlOCdbJJl4POKyotigXaBwe4ig/BNiowst6ezP2Js4Ii2B+/XSsEZEPR7v6tcAL6
 YOI2o6W61erVCauFL+E1R7kHWgksqys5EExbcU1mAmVw9Zkk1Eunh1TUkKbQ5mQlXzz/Gs9ubkK
 4UqWfA213D0kw3TuBM4D9LQhW1rCgXjxHWeaHlbJM/H3KLTsW+tExB2gH9M9pzI59EIUF/4WJ7p
 fCvxPCM5S+sVrTJRsuLPPmJSF1HML6hm7HdLi03pZC9GrsgscYlTi+g9qRVX7vCHI2kfmMySlU3
 kR3Rvxu5gKMJOMqPDx22MjJBZ59bvFCJprUG58z/pS+BfUrOOOgCZnMYIAWZI+38aHf6b5lcDog
 HkTASCmUy7L2XF9MXqxCOIG/OTxhg=
X-Google-Smtp-Source: AGHT+IFzj7d0nI2c4zd0n++OquvJyQ+l8IZvs086WL8dNYz32kfzdBZ0UO2OegPanHVdf6MGSxscLQ==
X-Received: by 2002:a17:907:98d:b0:b76:3478:7d52 with SMTP id
 a640c23a62f3a-b8426bee23bmr339531466b.38.1767712234330; 
 Tue, 06 Jan 2026 07:10:34 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a56db21sm244908766b.71.2026.01.06.07.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 07:10:33 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Jan 2026 16:10:23 +0100
Message-Id: <20260106151022.29135-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767712235; x=1768317035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gThhXBwLzhDAGJIwiDs4TzuhYbAyaWY3efFiT/iHDjk=;
 b=kqFshGQyrbnCWIEI08a9M//W2sxi4ZMHiqLKDxfVxBvVt1CGmASemMZEa8PrYPeSKX
 ZSEGnEGzs0F9Fl1+KFESPXN3r/x1R1BWPldSNWP2Her7Xws/q2Xe2oG6dfxhXToW5CIK
 Tx9jgvHZb3l8GTxT4x+01NFSSKw8xeAqmJ+ojHSOC1b5IE7ecxAFVQ0A+UYot/buJ2wI
 Q+k/gYwNmLorlKUcw86cfAh1Bg15WCp3LIdRdqu2MPWfX2XOXPjJUSOyKK78COs8hTJL
 BLE/vj0ecDn71xTXr6kcLXwlcG2ba2p2OAyrarqCbSDdQ/seGICov7xirYpXi9Uz/5Zb
 hKlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kqFshGQy
Subject: [Buildroot] [PATCH v3] package/uboot-tools: use uboot host tool
 printinitialenv to extract env
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If u-boot is compiled with the LTO option, it is no longer possible to
use the script 'get_default_envs.sh'. The problem was already observed
and a solution available upstream u-boot since the commit 486aef08de09 [1].
This was first available in release v2023.04.

Now if the the new tool 'printinitialenv' is available it is used. The
tool is build with u-boot that is a dependency of this package.

[1] https://source.denx.de/u-boot/custodians/u-boot-tegra/-/commit/486aef08de091ca35386f32fe961a201c3cfa9d4

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v3:
    - fixed redirect (thanks Thomas)
v2:
    - used hint from Arnout to check for availibity of the new tool

 boot/uboot/uboot.mk                | 4 ++++
 package/uboot-tools/uboot-tools.mk | 9 +++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c92568a559..e613d015a9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -144,6 +144,10 @@ UBOOT_MAKE_TARGET += u-boot.stm32
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
+UBOOT_MAKE_TARGET += u-boot-initial-env
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
 UBOOT_MAKE_TARGET += u-boot-initial-env
 define UBOOT_INSTALL_UBOOT_INITIAL_ENV
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1925047ccd..69e03f40d8 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -154,10 +154,11 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
 ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
 UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
 define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-		$(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
-		$(UBOOT_SRCDIR) \
-		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
+	if [ -x $(UBOOT_SRCDIR)/tools/printinitialenv ]; then \
+		$(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE); \
+	else \
+		CROSS_COMPILE="$(TARGET_CROSS)" $(UBOOT_SRCDIR)/scripts/get_default_envs.sh > $(UBOOT_SRCDIR); \
+	fi
 endef
 endif # UBOOT_TOOLS_GENERATE_ENV_FILE
 endif # BR2_TARGET_UBOOT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
