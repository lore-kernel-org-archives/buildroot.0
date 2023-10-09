Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08B7CD610E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 17:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F2940556;
	Mon,  9 Oct 2023 17:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F2940556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y69bB-zl8W2n; Mon,  9 Oct 2023 17:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E72D7409E1;
	Mon,  9 Oct 2023 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E72D7409E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F31AB1BF2A1
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 17:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAEE74172F
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 17:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAEE74172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHgfV6Zqbpso for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 17:04:42 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70D1241725
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 17:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D1241725
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b95622c620so876345966b.0
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 10:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871080; x=1697475880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U+4lRSzjRavNypzKmSU5l5ILnOeC8yVJa/10U/BA6GU=;
 b=D2PW9oNlwztLzUT+sy8PRgewQ9GBSE/KTxBkU/vkpcdH4KB3V750oD9BjNsjouvLx/
 t8uwVxdUaAxAga+ZnHDxGxWjHHG3pNOD85pAEN+VzhrKlwx2OTKVtmQF9QpW286+WBhD
 tBHtGJchfpbaMMmcjoT2EtmsLv8jqsHG8wH+uR+5SQAnF6QvyUA+5NQDgYTAVY7mtnAb
 9t4kwh8nZlvYvHBhI4oRXHxTSb6zFpn8DR35QfV7Yt41HsedWindS7lhh+9nWVuPgbG9
 lhqD6uEyh8EY6q1QNypwMPJOEpIBGs6ZYMCwhHGxGTuJJViLCqYM2pbGwvO/yYMCjHdt
 bZCQ==
X-Gm-Message-State: AOJu0YzuoaxMcMp4iwXac1XEnTheJnBe4t/eGnFJgnwT2tgbGlD8gjde
 U/UJzjyFaKZ+wtGbIixcuLjmId/6RD/F7h5UVy7v4w==
X-Google-Smtp-Source: AGHT+IGYrFKzW8EJrtD2SqYp6avS5DqDcH23PNWx39JgpNoIzOCNKRHONpbwc72rKjgpkOnnY6ZYxg==
X-Received: by 2002:a17:906:32d5:b0:9ae:6388:e09b with SMTP id
 k21-20020a17090632d500b009ae6388e09bmr14990332ejk.40.1696871080064; 
 Mon, 09 Oct 2023 10:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 jp20-20020a170906f75400b0099bcb44493fsm7011066ejb.147.2023.10.09.10.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:04:39 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 19:04:27 +0200
Message-ID: <20231009170428.2836853-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696871080; x=1697475880;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U+4lRSzjRavNypzKmSU5l5ILnOeC8yVJa/10U/BA6GU=;
 b=CzLpqzZaFmkh6HUmZscagNcU6B3XXpfAuQ9MifSNm5OSVGJ5jegwWhzVZnRGg/jF80
 gY+fn2+w/AnY5MiI2O4eti54/eXZg1zkay69mInfPhfCWiTlsoW/hvyPCfgQJR/HApR2
 8pKx5FzRrWgI/os2W8shhZz06vP4Te3fZFAQs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CzLpqzZa
Subject: [Buildroot] [PATCH v4 1/2] package/refpolicy: bump version to
 2.20231002
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstream patch

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v3 -> v4: Drop upstream patch in this patch.

 ...ount-dbus-interface-must-be-optional.patch | 33 -------------------
 package/refpolicy/refpolicy.hash              |  2 +-
 package/refpolicy/refpolicy.mk                |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch

diff --git a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
deleted file mode 100644
index adec7d98d0..0000000000
--- a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6c6be65ccf0891391681d4662cc11f508c0f4aeb Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 24 Apr 2023 14:24:49 -0700
-Subject: [PATCH] mount: dbus interface must be optional
-
-If DBus isn't built, the build process fails due to mount.te always using a
-dbus interface even if the dbus module. Fix this by setting the dbus interface
-as optional.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Upstream: https://github.com/SELinuxProject/refpolicy/commit/207b09a656c2c3ac5c286d3f7eef085325e35408
----
- policy/modules/system/mount.te | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/policy/modules/system/mount.te b/policy/modules/system/mount.te
-index d028723..af84af0 100644
---- a/policy/modules/system/mount.te
-+++ b/policy/modules/system/mount.te
-@@ -145,7 +145,9 @@ selinux_getattr_fs(mount_t)
- 
- userdom_use_all_users_fds(mount_t)
- 
--dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
-+optional_policy(`
-+	dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
-+')
- 
- ifdef(`distro_redhat',`
- 	optional_policy(`
--- 
-2.40.0
-
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index a09e59c270..70d1acc9af 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  44f88e62c8efcef54d019b9ca077520d5993de580926bd7575788cfa78515396  refpolicy-2.20221101.tar.bz2
+sha256  c89cd3b2e5d99765cc24536fd8e76de83951ad23e05472350328b5a4f8bee410  refpolicy-2.20231002.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 8fea7cc254..fb1c213b84 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20221101
+REFPOLICY_VERSION = 2.20231002
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
