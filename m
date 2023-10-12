Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC030CDB482
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EEDE6151E;
	Thu, 12 Oct 2023 10:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EEDE6151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No8STDZRvdB4; Thu, 12 Oct 2023 10:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C571E60FC6;
	Thu, 12 Oct 2023 10:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C571E60FC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C40161BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8C9D61451
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C9D61451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXpeZCTgSWyU for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:51 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 068C060A81
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 068C060A81
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-991c786369cso128499766b.1
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106769; x=1697711569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xh3BO9ZdQYfwjlacnIuYMGzjpC5yoWVpEo40NbPndLc=;
 b=CuODqac/q+RsiAhs1S/2RRxeS+Tvyq3w9onu2F4beXY2YoHS9SXk30pgVx5GCBMjuw
 D83LhETVuSxAGPxR2ImXToHk2+WT+t+rwzurXM/akGniig4qlHnkm7hsF2mqKuG2X6Rs
 lAMIIQGGK7Hq+kbpmDepXPsVHpI7DNxNtgmYW9JErVEj/ruYFGoWmkCOmwNVXpUktmuy
 oXodEnLuPRa/MeX0bwvWuLLhWVupgYpXdKAqbQYuvV53cItv5r981HJJC4GUiexQ8jjP
 RAaiIpFvtbiC5UrZhdLA9NvqRhTLWJ5greW+XLI515gEbc8NFu5q+p82JN1sx9D5u5s2
 DBvA==
X-Gm-Message-State: AOJu0Yx+8Tn7Rjo+QvjKv2fgdCFh26zpZrhbnLmWoaaFYU63ZTkeGTAi
 r4p8F2UgccM0MW8Zhyk8jEVNwKJUAz5m5ATUlEoREQ==
X-Google-Smtp-Source: AGHT+IELW/6ueGCW9PTgdC68rLinO9lKRBPWb92bnFQgKcGpm5bcaqnH9ac/fDkTogSnRj+Ctnulog==
X-Received: by 2002:a17:906:2d2:b0:9b9:ed52:8230 with SMTP id
 18-20020a17090602d200b009b9ed528230mr17403771ejk.62.1697106768696; 
 Thu, 12 Oct 2023 03:32:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:48 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:06 +0200
Message-ID: <20231012103210.2915871-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106769; x=1697711569;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xh3BO9ZdQYfwjlacnIuYMGzjpC5yoWVpEo40NbPndLc=;
 b=jJQJrGd2ySIzkRMpnBQhzKHeUeyOdmYT0QzzF/RLAbpRAhmnEitaj1VXu0XuUkVIma
 NUrrqw8i86ASfVruXk5rYsYtJ7XDF6clA+TEmOJibBUtINk6Skn2l+2dJrtVa5TEJcIa
 8KCjvbKk/I4y5nwy8uSHrmGmbfXQedGahSiDk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jJQJrGd2
Subject: [Buildroot] [PATCH 09/12] package/acpid/selinux: Add buildroot
 acpid policy
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

This is a basic policy necessary for acpid to work properly in enforcing
mode without any denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                               |  1 +
 package/acpid/selinux/buildroot-acpid.fc |  0
 package/acpid/selinux/buildroot-acpid.if |  1 +
 package/acpid/selinux/buildroot-acpid.te | 10 ++++++++++
 4 files changed, 12 insertions(+)
 create mode 100644 package/acpid/selinux/buildroot-acpid.fc
 create mode 100644 package/acpid/selinux/buildroot-acpid.if
 create mode 100644 package/acpid/selinux/buildroot-acpid.te

diff --git a/DEVELOPERS b/DEVELOPERS
index 5082448b56..695738c4a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,6 +32,7 @@ F:	package/vulkan-loader/
 F:	package/vulkan-tools/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	package/acpid/selinux/
 F:	package/audit/selinux/
 F:	package/busybox/selinux/
 F:	package/depot-tools/
diff --git a/package/acpid/selinux/buildroot-acpid.fc b/package/acpid/selinux/buildroot-acpid.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/acpid/selinux/buildroot-acpid.if b/package/acpid/selinux/buildroot-acpid.if
new file mode 100644
index 0000000000..b2b568a823
--- /dev/null
+++ b/package/acpid/selinux/buildroot-acpid.if
@@ -0,0 +1 @@
+## <summary>Buildroot acpid rules</summary>
diff --git a/package/acpid/selinux/buildroot-acpid.te b/package/acpid/selinux/buildroot-acpid.te
new file mode 100644
index 0000000000..dd10e65c42
--- /dev/null
+++ b/package/acpid/selinux/buildroot-acpid.te
@@ -0,0 +1,10 @@
+policy_module(buildroot-acpid, 1.0.0)
+
+#============= acpid_t ==============
+allow acpid_t device_t:chr_file { read open write ioctl };
+allow acpid_t kernel_t:fd use;
+allow acpid_t root_t:chr_file { read write open ioctl };
+allow acpid_t tmpfs_t:dir { add_name write remove_name };
+allow acpid_t tmpfs_t:file { create open write unlink };
+allow acpid_t tmpfs_t:sock_file create;
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
