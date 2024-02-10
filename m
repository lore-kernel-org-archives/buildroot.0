Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0159C48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 21:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC02660602;
	Sat, 10 Feb 2024 21:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XGwHf3VpBVh; Sat, 10 Feb 2024 21:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7EE160625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7EE160625;
	Sat, 10 Feb 2024 21:50:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8574A1BF295
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C0FC4171C
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 21:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aR1FUiR99yfD for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 21:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DC584EBEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DC584EBEE
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DC584EBEE
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 21:25:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-410585542b3so16255405e9.2
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 13:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707600301; x=1708205101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JwCUt0c27v5gYHs2HMhGVY/ZzTu7tgFB9P0eLBTUnsg=;
 b=duXg84A5xZVamf8+L4ULLvIB0hORaujfnu1jVq5e2+S+RZZcIuZ0OzR01FD/NvQq43
 XZBU8bKxI4PsfczlxOnWT3vP4WFkfqOfVVcOBog/On/GnjGYiMlhFBVXGtvhoOHcaIRe
 u3uiwROKH9EYCR5uCy3PkARjYRbcAW7KprzugaB4XJq/+eAdgwmIg/unekcEr8yUcD0u
 VtFSFg1YGHyfHE4n+hp6b9Xn7+LKFv8tmHr8ll/KvGoXWokfEyYNjydO+beMzvMKlBfi
 w0c6138v6C0uP9Te+YcMdcpfPUwdeJry2e5qDbgZfgaCzIeAEeuBog9uj8ZpgA4SiOlz
 vvVA==
X-Gm-Message-State: AOJu0YyOX0Ja7PUe4fkrF4GTHR326NofNkDlGBb5ra4IR6VAIHh3mWmR
 v0J6u88EzNyoqdSTFwrODtsP2nWdNHrDmYzWNbPM0Ts9/jGkdQseyW//mAdm
X-Google-Smtp-Source: AGHT+IFAAYmcfMXav7cj0F72JO7a/d65/54gzyf43WFs/SiRLXEezFG9pf/9j5yrk8tT/HqVeIxbnQ==
X-Received: by 2002:a05:600c:3b9d:b0:410:8ab5:a509 with SMTP id
 n29-20020a05600c3b9d00b004108ab5a509mr1995513wms.13.1707600301193; 
 Sat, 10 Feb 2024 13:25:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWbDiuZEpPOxhmKiTiMkQnCyMDvm1nQ2s0RIMPVGFwAcYohg96NYxCLfm3E/4d7eB7KpBHqfRFrw1+jjMKvAXiSVGuCJeww/uRmlw==
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ba23-20020a0560001c1700b0033946c0f9e7sm2728962wrb.17.2024.02.10.13.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 13:25:00 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 22:24:56 +0100
Message-ID: <fbb9b2bbec96ec6c6b8f789e272ed61c0bc4f80a.1707600292.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707600292.git.yann.morin.1998@free.fr>
References: <cover.1707600292.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707600301; x=1708205101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwCUt0c27v5gYHs2HMhGVY/ZzTu7tgFB9P0eLBTUnsg=;
 b=naXJXjZtaKHABtQGZtYfUDCc4V5jI6RSgHYuya84M86f5VWMkB9HTB++gQCprwsUon
 SkVEY1CKa9sbPcsXM2rJWE2ubG6M40LD1UOZZCtHWSD/3AprlCKKShMWI51ph8OXi4qY
 eywpxgSgNwVvUCZj7ws9smxk4Ofk3OMYG/lutQQwKFKGLucp6nvVwmmwgXNOabuT63rv
 Gaw/Xa1imQMgVss+jK/PsdjRygsFd18FODqV0A93YueRG+g9EVTqA/DTvCvfA5+7RKIv
 xfNl54n0MytTSgjWi3v5PmxqLg3Ii7vAmdOEfvh9Ft/IndLl34Za3bIfcyYfeqBfgziE
 NGJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=naXJXjZt
Subject: [Buildroot] [PATCH 3/6 v2] doc/manual: indent the CVE example the
 same as the CVE list item
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 docs/manual/adding-packages-generic.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 76b037f436..935270a19c 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -503,7 +503,7 @@ not and can not work as people would expect it should:
   the package, or when the CVE for some reason does not affect the
   Buildroot package. A Makefile comment must always precede the
   addition of a CVE to this variable. Example:
-
++
 ----------------------
 # 0001-fix-cve-2020-12345.patch
 LIBFOO_IGNORE_CVES += CVE-2020-12345
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
