Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB0ECDB47E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AF1860A77;
	Thu, 12 Oct 2023 10:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AF1860A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0vQe_U2NMHh; Thu, 12 Oct 2023 10:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9BFA6167F;
	Thu, 12 Oct 2023 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9BFA6167F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5231BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 519FC40611
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 519FC40611
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDV9TE99pvbF for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:33:05 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A350405AA
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A350405AA
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9b29186e20aso120491966b.2
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106782; x=1697711582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RgmBy3nwvPZbgZYpJ8ZZ8oiDtDYugsVmDqbIjpMUpu8=;
 b=EgjAm1wY9tQ2Pz6+QIjgyOqeBBlLPhm3Q8/Z5uIMduyXmlUhm4las1zqRuRYMyxbed
 +9ccjOyb5ZuoMDgyRKvxZulr6J8Pwe6LKGOYzqdxXHPolvXL7WKz7iLKx8nLz9VnEIot
 qRjDQH8xMHNauUs+z+y225kCTpiNt8b0UQN4JcEaXsKc/cSk7hVfqJcaPYJjTLdtvHPC
 Rd8E2qS2v+Fo/3y8Lb2b7rG+hnskco4iPtuKRtQpW4VNRYsEFlCTOj+cELBEEU+qS6wj
 2P+VBKSVSS7jIT4ZKfSXWjjy1JvPruf5ulng7RRWvuTRRBksoTAUUFAmi5bZ6/4nv7Kb
 L6Fg==
X-Gm-Message-State: AOJu0YzshbNRG64V9tnJjvGS+r2mvTN9IQf76qcd424RSiDR93+PCsmr
 ZsVA+VeKmxdmAckAVQ6HG/mPXatDthl24gqbBBML0g==
X-Google-Smtp-Source: AGHT+IFTA9CDVzTxOEUpZt9FXnzdWj7PH4Z8x9B2TedoMddPH/+NQiZWfOc7T8TRKo3vBF1auqWEvA==
X-Received: by 2002:a17:907:78d9:b0:9bb:a243:e6f1 with SMTP id
 kv25-20020a17090778d900b009bba243e6f1mr5613379ejc.0.1697106782666; 
 Thu, 12 Oct 2023 03:33:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:33:02 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:09 +0200
Message-ID: <20231012103210.2915871-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106782; x=1697711582;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgmBy3nwvPZbgZYpJ8ZZ8oiDtDYugsVmDqbIjpMUpu8=;
 b=oi2jfiElCGqxZ9D7OccTtTl3qJGgRMSlyLGFAjoUchWtb8HyWoxgBopiX/Q0KMDPiJ
 VwMfx5V3dzC8iv0hwxHlMjlE2ksJP61x7Qe1ySD/XrARHd+LAnV8Ohl5JTLs4QsKhmYk
 k0d1N/rGcznuOrBsiJanTbtLY/PVg5BEbdT50=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oi2jfiEl
Subject: [Buildroot] [PATCH 12/12] package/kmod/selinux: Add buildroot kmod
 policy
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

This is a basic policy necessary for kmod to work properly in enforcing mode
without any denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                             | 1 +
 package/kmod/selinux/buildroot-kmod.fc | 0
 package/kmod/selinux/buildroot-kmod.if | 1 +
 package/kmod/selinux/buildroot-kmod.te | 4 ++++
 4 files changed, 6 insertions(+)
 create mode 100644 package/kmod/selinux/buildroot-kmod.fc
 create mode 100644 package/kmod/selinux/buildroot-kmod.if
 create mode 100644 package/kmod/selinux/buildroot-kmod.te

diff --git a/DEVELOPERS b/DEVELOPERS
index cfa0095969..879aa96361 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -41,6 +41,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/iptables/selinux/
+F:	package/kmod/selinux/
 F:	package/network-manager/selinux/
 F:	package/openssh/selinux/
 F:	package/polkit/selinux/
diff --git a/package/kmod/selinux/buildroot-kmod.fc b/package/kmod/selinux/buildroot-kmod.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/kmod/selinux/buildroot-kmod.if b/package/kmod/selinux/buildroot-kmod.if
new file mode 100644
index 0000000000..fd978bf190
--- /dev/null
+++ b/package/kmod/selinux/buildroot-kmod.if
@@ -0,0 +1 @@
+## <summary>Buildroot kmod rules</summary>
diff --git a/package/kmod/selinux/buildroot-kmod.te b/package/kmod/selinux/buildroot-kmod.te
new file mode 100644
index 0000000000..c06b81345d
--- /dev/null
+++ b/package/kmod/selinux/buildroot-kmod.te
@@ -0,0 +1,4 @@
+policy_module(buildroot-kmod, 1.0.0)
+
+#============= kmod_t ==============
+allow kmod_t proc_t:filesystem getattr;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
