Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D594DCDB484
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CFFA60A77;
	Thu, 12 Oct 2023 10:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CFFA60A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Eml9c3K1f3U; Thu, 12 Oct 2023 10:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 641D360F13;
	Thu, 12 Oct 2023 10:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 641D360F13
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD0A1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 625DD60A77
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 625DD60A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eF2gWVxzcN-w for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:48 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8193E608D8
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8193E608D8
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so125198366b.1
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106766; x=1697711566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2fsOPaQxcnve5taOW7LwelSj4IO6c7CxevgVGFqa7E=;
 b=by3aSWHxxtoskCFlN1JFtvFuHcX9Kx56RqNG4m+IZRZYyUJq/kDRfz6jx0W1U7nJ9E
 cB3Vz0brL3LUle5TAva00+7skY7y6C6QGfwtE917EtQlqERBtuL34GYRU+0+8pEaUvn0
 kfaxDxl67IE7GnYxwwZNaYRNNQMhG53IzbzgYR8m4DMJYGex3iv0Wv4mlHclIUay8S8o
 7yg4U2zFtAA4UxxKWVSw/aNUXxn9Ss5VHZDljtN6g66QvSiMuQzDKn54aXIpzjEkD/Bc
 hAMcyUPo8YI9QBi8Utywg/3mvK3XmJG/l4icaQ6dyZGjtNqD/jPYpQXoGFp81nFHx+kb
 OAjA==
X-Gm-Message-State: AOJu0YxWoJHNTFI0wOPR+6/NOEc4MX15d7Q2WIhjVA/+EOmh1ckUzSw9
 RslIrFpFbI2yeB/aHq1bbMrIk9hVJvhVwHDqc8BOAw==
X-Google-Smtp-Source: AGHT+IGFpMLZMLc00lvl8KxakyEqh2XRxV3TUQhx0x19nhe+T49+LjB++KpZD7gUNf1eLX96fp4EIg==
X-Received: by 2002:a17:906:76d0:b0:9ae:43be:e5f5 with SMTP id
 q16-20020a17090676d000b009ae43bee5f5mr21032753ejn.4.1697106766146; 
 Thu, 12 Oct 2023 03:32:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:45 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:05 +0200
Message-ID: <20231012103210.2915871-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106766; x=1697711566;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2fsOPaQxcnve5taOW7LwelSj4IO6c7CxevgVGFqa7E=;
 b=ZP2uDYf/97REFLgwMziCgHsy0A9qT1leB71OrYBa9jEFhUrVzQ1B7hSPNn7cVTlUeT
 xhPPFP1iPILK/A7tz+n5BmrbujPo9jUJEizkjn1y/vtn/Kcgn5LeK8+9Nyy1n3DZgSKq
 XEORY1JVb+OfRwzrtqcjVGQDkeYBdJ++alknU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZP2uDYf/
Subject: [Buildroot] [PATCH 08/12] package/restorecond/selinux: Add
 buildroot restorecond policy
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

This is a basic policy necessary for restorecond to work properly in enforcing
mode without any denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                          |  1 +
 .../restorecond/selinux/buildroot-restorecond.fc    |  0
 .../restorecond/selinux/buildroot-restorecond.if    |  1 +
 .../restorecond/selinux/buildroot-restorecond.te    | 13 +++++++++++++
 4 files changed, 15 insertions(+)
 create mode 100644 package/restorecond/selinux/buildroot-restorecond.fc
 create mode 100644 package/restorecond/selinux/buildroot-restorecond.if
 create mode 100644 package/restorecond/selinux/buildroot-restorecond.te

diff --git a/DEVELOPERS b/DEVELOPERS
index f7506da57a..5082448b56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -42,6 +42,7 @@ F:	package/flutter-sdk-bin/
 F:	package/openssh/selinux/
 F:	package/polkit/selinux/
 F:	package/refpolicy/selinux/
+F:	package/restorecond/selinux/
 F:	package/systemd/selinux/
 F:	package/sysvinit/selinux/
 F:	support/testing/tests/package/test_flutter.py
diff --git a/package/restorecond/selinux/buildroot-restorecond.fc b/package/restorecond/selinux/buildroot-restorecond.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/restorecond/selinux/buildroot-restorecond.if b/package/restorecond/selinux/buildroot-restorecond.if
new file mode 100644
index 0000000000..cec6d9d9a4
--- /dev/null
+++ b/package/restorecond/selinux/buildroot-restorecond.if
@@ -0,0 +1 @@
+## <summary>Buildroot restorecond rules</summary>
diff --git a/package/restorecond/selinux/buildroot-restorecond.te b/package/restorecond/selinux/buildroot-restorecond.te
new file mode 100644
index 0000000000..382e4c8f54
--- /dev/null
+++ b/package/restorecond/selinux/buildroot-restorecond.te
@@ -0,0 +1,13 @@
+policy_module(buildroot-restorecond, 1.0.0)
+
+#============= restorecond_t ==============
+allow restorecond_t device_t:chr_file { open read write };
+allow restorecond_t etc_t:dir watch;
+allow restorecond_t file_context_t:file { open read };
+allow restorecond_t selinux_config_t:file watch;
+allow restorecond_t tmpfs_t:dir { remove_name write watch };
+allow restorecond_t tmpfs_t:file { append getattr open lock read write unlink };
+allow restorecond_t user_home_dir_t:dir watch;
+allow restorecond_t var_log_t:dir watch;
+allow restorecond_t var_run_t:dir watch;
+allow restorecond_t var_t:dir watch;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
