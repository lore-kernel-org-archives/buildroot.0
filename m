Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E75CDB47E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F9306149E;
	Thu, 12 Oct 2023 10:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F9306149E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDAymNGRjDhM; Thu, 12 Oct 2023 10:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D202611FD;
	Thu, 12 Oct 2023 10:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D202611FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF8791BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7A74404F8
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7A74404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuwJ18W9ALnW for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:35 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70CB8404D1
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70CB8404D1
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b64b98656bso127161166b.0
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106752; x=1697711552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IoN4d84A5z5niylPar4x6Wpsrp1HpQhzLOE8Hdpv8RQ=;
 b=VPxtVsVpBkP8mPD/S/by+49RCfawKNi+ddLqQxSUw3OhrrHUobXTFYaFNx+vV7xYaK
 0K6LNZsjiCLvOPUNT2yH59RsyC7ZB4ecNlqEdGj+bFiPbXzCtYaNI6lHNZywB0VhmOGN
 cD3EFkxEh/bsI9ZZBIHyyTm+ldNgaPPZ9ybj/qP7S3D7/PocDrmwV4az2S19ormZuWGa
 wg2XmXvdlorRvPZbM9QpE+Fy3y3yZPOtHBwd1Z00IXBEMC9omtS8TKSO1qD7m6XtH3TR
 G8XRPqgaOzKhdLedOgZz3njgplfqaah9sf2+mCGrkyWVgmGeRfZLHpiLtWLoMuTGTPdV
 0Usw==
X-Gm-Message-State: AOJu0Yx5ayl3Nb9c8ROMHfKKvEGHowJ5ncPf0GfxBf8nGJlZPKx7YTDi
 ssNIgUlfwLd8YZOhuufKnq4+YYpCUSFECpazgJD3Jw==
X-Google-Smtp-Source: AGHT+IGZ3JKIWYFKasZoSPbHZcfZBymwiG1jok7zZO2O/ZQiJiG1/EhA3n2Tx41Z2vP9b0cjmrd2gg==
X-Received: by 2002:a17:906:538f:b0:9a1:fa4e:ca83 with SMTP id
 g15-20020a170906538f00b009a1fa4eca83mr23137836ejo.65.1697106752172; 
 Thu, 12 Oct 2023 03:32:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:31 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:00 +0200
Message-ID: <20231012103210.2915871-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106752; x=1697711552;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IoN4d84A5z5niylPar4x6Wpsrp1HpQhzLOE8Hdpv8RQ=;
 b=O0dw16iJkVTUe5J4FbnlT5ausW8WN4GEMSMHt/MoJh5DVHYxoiLnAF6c+LQeCAPZkH
 JHM0jspy15ZlgpoUO7lhyxiGAtZuiNTWcINBS0hO8XatzTN1rEoe9xpv4m7DgP9Uzo4U
 3Q5OctqxK1Yvk/xyM5uD5UdqQB6FoSo8DGcnE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O0dw16iJ
Subject: [Buildroot] [PATCH 03/12] package/sysvinit/selinux: Add buildroot
 sysvinit policy
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

This policy is required to run systems with sysvinit in enforcing mode without
denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                     | 1 +
 package/sysvinit/selinux/buildroot-sysvinit.fc | 0
 package/sysvinit/selinux/buildroot-sysvinit.if | 1 +
 package/sysvinit/selinux/buildroot-sysvinit.te | 8 ++++++++
 4 files changed, 10 insertions(+)
 create mode 100644 package/sysvinit/selinux/buildroot-sysvinit.fc
 create mode 100644 package/sysvinit/selinux/buildroot-sysvinit.if
 create mode 100644 package/sysvinit/selinux/buildroot-sysvinit.te

diff --git a/DEVELOPERS b/DEVELOPERS
index c206f5262f..36108715bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -39,6 +39,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/refpolicy/selinux/
+F:	package/sysvinit/selinux/
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/package/sysvinit/selinux/buildroot-sysvinit.fc b/package/sysvinit/selinux/buildroot-sysvinit.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/sysvinit/selinux/buildroot-sysvinit.if b/package/sysvinit/selinux/buildroot-sysvinit.if
new file mode 100644
index 0000000000..2b8195dfe3
--- /dev/null
+++ b/package/sysvinit/selinux/buildroot-sysvinit.if
@@ -0,0 +1 @@
+## <summary>Buildroot sysvinit rules</summary>
diff --git a/package/sysvinit/selinux/buildroot-sysvinit.te b/package/sysvinit/selinux/buildroot-sysvinit.te
new file mode 100644
index 0000000000..58c3e14580
--- /dev/null
+++ b/package/sysvinit/selinux/buildroot-sysvinit.te
@@ -0,0 +1,8 @@
+policy_module(buildroot-sysvinit, 1.0.0)
+
+#============= getty_t ==============
+allow getty_t tmpfs_t:dir { add_name write };
+allow getty_t tmpfs_t:file { create lock open read write };
+
+#============= local_login_t ==============
+allow local_login_t tmpfs_t:file { lock open read write };
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
