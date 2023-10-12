Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463F0CDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7579616E2;
	Thu, 12 Oct 2023 10:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7579616E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMOKg-v2U4qF; Thu, 12 Oct 2023 10:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0120460E2F;
	Thu, 12 Oct 2023 10:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0120460E2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14C9C1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1FFE82269
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1FFE82269
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPT1VL8cvcGi for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:33:02 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3EF082252
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3EF082252
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso418002966b.1
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106780; x=1697711580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RC6MMqAKZlhl8xjotPNI+ZxVP7+GKixv1Eask4a6qkw=;
 b=YCDZX3jDik74CgtZ9YGKujrbuH7wBPtgUGnrss/nIHJXC7RFxUsyXK3DLczrmDB9Uk
 KIBdoLZXvhBeUvm27iM40mSpMhOjiVvWA6AwxCALotvPnn3D9oFXANBUM/XFS59KbKfG
 uxaYNB/ZnJLZbuzvIPdixnOy/tKCjHkDa0LpXBLFvTFv1bxIlRdASgxiJS39EGClaIz5
 ASb/TZzqd2SKUJx2512DzJ8OcrE3FdT0f3y/5JqOATbDNRviBgbSyxD1G4QGQx7/8qmq
 860t/IjfSIU5JvMlTW08ACmoq7sk/g4PtsCITE6O4DTayomM/NU8PS+cvbCnX6iO8ZWI
 1g+w==
X-Gm-Message-State: AOJu0YzbCxkJTo5JkWllqF6Z/lsxVcMZgO1AfT6Je6FWXTTrPRM+Lb0n
 1LZYZup0BKHbJR78MYW5oztKkF970rgYsufKPe3F3A==
X-Google-Smtp-Source: AGHT+IEtVacVAKBssE7bGor0HfIQqtmj4OiLZ4V1YJY8ISsIVUcX34FrMfNu99bm91bYB9LHqbZuFw==
X-Received: by 2002:a17:907:2d8c:b0:9ad:93c8:c483 with SMTP id
 gt12-20020a1709072d8c00b009ad93c8c483mr17657006ejc.2.1697106779880; 
 Thu, 12 Oct 2023 03:32:59 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:59 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:08 +0200
Message-ID: <20231012103210.2915871-12-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106780; x=1697711580;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RC6MMqAKZlhl8xjotPNI+ZxVP7+GKixv1Eask4a6qkw=;
 b=eGNxn1+Mc7PAaIkQLm2OzJ5O3Okq92V7IOYKDSzE+dOa6cMqwYOhCMZM14xciGu7sD
 LTQwbuE5ncyMxYquzX13ORjnruIL2rPVtAm7kqY/B3exaylvdmCYtsaRpokdjh/0YQqE
 Zp43MRkT7gujLBrHgWNO1hkJwGW6+H3r7sSwM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=eGNxn1+M
Subject: [Buildroot] [PATCH 11/12] package/iptables/selinux: Add buildroot
 iptables policy
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

This is a basic policy necessary for iptables to work properly in enforcing
mode without any denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                     | 1 +
 package/iptables/selinux/buildroot-iptables.fc | 0
 package/iptables/selinux/buildroot-iptables.if | 1 +
 package/iptables/selinux/buildroot-iptables.te | 5 +++++
 4 files changed, 7 insertions(+)
 create mode 100644 package/iptables/selinux/buildroot-iptables.fc
 create mode 100644 package/iptables/selinux/buildroot-iptables.if
 create mode 100644 package/iptables/selinux/buildroot-iptables.te

diff --git a/DEVELOPERS b/DEVELOPERS
index 05b4be1830..cfa0095969 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -40,6 +40,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/iptables/selinux/
 F:	package/network-manager/selinux/
 F:	package/openssh/selinux/
 F:	package/polkit/selinux/
diff --git a/package/iptables/selinux/buildroot-iptables.fc b/package/iptables/selinux/buildroot-iptables.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/iptables/selinux/buildroot-iptables.if b/package/iptables/selinux/buildroot-iptables.if
new file mode 100644
index 0000000000..cb7e08744e
--- /dev/null
+++ b/package/iptables/selinux/buildroot-iptables.if
@@ -0,0 +1 @@
+## <summary>Buildroot iptables rules</summary>
diff --git a/package/iptables/selinux/buildroot-iptables.te b/package/iptables/selinux/buildroot-iptables.te
new file mode 100644
index 0000000000..37107749ea
--- /dev/null
+++ b/package/iptables/selinux/buildroot-iptables.te
@@ -0,0 +1,5 @@
+policy_module(buildroot-iptables, 1.0.0)
+
+#============= iptables_t ==============
+allow iptables_t root_t:chr_file { read write };
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
