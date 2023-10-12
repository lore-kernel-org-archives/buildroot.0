Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D2DCDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B98614A3;
	Thu, 12 Oct 2023 10:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16B98614A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dE7ly6jsKcw; Thu, 12 Oct 2023 10:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C86160A77;
	Thu, 12 Oct 2023 10:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C86160A77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A31FC1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA9460FE7
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA9460FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUiEj1qwX8AS for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:30 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90A9060E2F
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90A9060E2F
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so130668966b.3
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106748; x=1697711548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AEZUzilz3poSj08kISaboOesZhc2zEgZRSY/AToDpCc=;
 b=RZMxskeFEoGIcgtMi+vafyZ7igO+b+vtyWB4GfTAHYx+CuIT8FP6Vi6I/GZ3VNXUHL
 5vnVmjeiXypstq+HRWICgf91QIuMuY/HT/zWJJtRZdfj+dp/dkprCH1abmVtZMQ+jBQd
 3jp0FQ0GV4lhyIWqfVf8uVSUHh839PrrRi+TAU5weDJqV+zlJUJvMJRdkDtyYY1AOGFC
 yyj37mmpxz4nSeb/Yb8FvO7fKSewiq9UfM2AHv5znGBZ86T7Ar3ble1ozxsoV6QNVVWu
 9UKS1VGL1k84/eOwjcWtbWOp7yWDJmP5JFPpJfslx62sNKGfpnqozLet/wGIUGtv0hij
 M/Jg==
X-Gm-Message-State: AOJu0Yw+s4a1VAWb3Tz1b8Znei+Ve/BIqcTWOrkBPBEjTUY4Qzlfxl8y
 wvg0R75mFFDCOs9gzvfQ1ZzLH/sr4iV8S4Nv3SdSyQ==
X-Google-Smtp-Source: AGHT+IHuIqgtDdeiIeNH7br6Bq75lHzj1Zjs04cg+msvNK3jXCjoYFU5Ozobc/2Fl46XNcy1XyeRqg==
X-Received: by 2002:a17:906:10dc:b0:9ae:6ffd:be12 with SMTP id
 v28-20020a17090610dc00b009ae6ffdbe12mr23534098ejv.76.1697106748414; 
 Thu, 12 Oct 2023 03:32:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:28 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:31:59 +0200
Message-ID: <20231012103210.2915871-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106748; x=1697711548;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEZUzilz3poSj08kISaboOesZhc2zEgZRSY/AToDpCc=;
 b=kwUmwCaXQovcVeppN8B9Fbec+LHGyshkNQR5ZL72MHWkI874nqj1OkPeTJkQosh47S
 WVkYXmFs9aGcKaDp7vgNVvcjrArdOb9phOg9cb9HbN+cuU9gr8Aw/OaaaKSw9fHBAib0
 y3ndZKFfkaLcxoQ8AHu7vDaUfBfJuuSShwYY0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kwUmwCaX
Subject: [Buildroot] [PATCH 02/12] package/busybox/selinux: Add buildroot
 busybox policy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a minimal selinux policy required to run busybox in enforcing mode
without denials. It is based off of the applets that Buildroot selects by
default.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                   |  1 +
 package/busybox/selinux/buildroot-busybox.fc |  1 +
 package/busybox/selinux/buildroot-busybox.if |  1 +
 package/busybox/selinux/buildroot-busybox.te | 16 ++++++++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 package/busybox/selinux/buildroot-busybox.fc
 create mode 100644 package/busybox/selinux/buildroot-busybox.if
 create mode 100644 package/busybox/selinux/buildroot-busybox.te

diff --git a/DEVELOPERS b/DEVELOPERS
index e863d06535..c206f5262f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,6 +32,7 @@ F:	package/vulkan-loader/
 F:	package/vulkan-tools/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	package/busybox/selinux/
 F:	package/depot-tools/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
diff --git a/package/busybox/selinux/buildroot-busybox.fc b/package/busybox/selinux/buildroot-busybox.fc
new file mode 100644
index 0000000000..6785e466f3
--- /dev/null
+++ b/package/busybox/selinux/buildroot-busybox.fc
@@ -0,0 +1 @@
+/lib/libbusybox*	--	gen_context(system_u:object_r:lib_t,s0)
diff --git a/package/busybox/selinux/buildroot-busybox.if b/package/busybox/selinux/buildroot-busybox.if
new file mode 100644
index 0000000000..60ea4b190d
--- /dev/null
+++ b/package/busybox/selinux/buildroot-busybox.if
@@ -0,0 +1 @@
+## <summary>Buildroot busybox rules</summary>
diff --git a/package/busybox/selinux/buildroot-busybox.te b/package/busybox/selinux/buildroot-busybox.te
new file mode 100644
index 0000000000..e7d0f510b9
--- /dev/null
+++ b/package/busybox/selinux/buildroot-busybox.te
@@ -0,0 +1,16 @@
+policy_module(buildroot-busybox, 1.0.0)
+
+#============= init_tmpfs_t ==============
+allow init_tmpfs_t self:file { lock open read write };
+
+#============= getty_t ==============
+allow getty_t local_login_t:file { lock open read write };
+allow getty_t local_login_t:process { noatsecure rlimitinh siginh };
+allow getty_t security_t:filesystem getattr;
+allow getty_t selinux_config_t:dir search;
+
+#============= local_login_t ==============
+allow local_login_t device_t:chr_file { getattr setattr };
+allow local_login_t shadow_t:file { getattr open read };
+allow local_login_t sysadm_t:process { noatsecure siginh rlimitinh };
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
