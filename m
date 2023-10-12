Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53910CDB47E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB0E60F13;
	Thu, 12 Oct 2023 10:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AB0E60F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kg2XAyv-XplD; Thu, 12 Oct 2023 10:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FBDB6165C;
	Thu, 12 Oct 2023 10:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FBDB6165C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82B031BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68D3D404B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D3D404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nYBhJQHg7W8 for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:55 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 405B140004
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 405B140004
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so125638566b.3
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106773; x=1697711573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y3drO7b1zjoCs7BLpelReJvUW0TCihSkiqv4DQDweo8=;
 b=rbBCip8gatCYaFeItbIP8CAegooMaQO1pwcdI+LPjUFuxSFbe8NmdPLwnZv4fGzCxP
 lblCEZDIdk1QkCVIRGvw6AWHuX+YEgVadDPXoOgUWUHY9h6pqjGz+aENG50hSTMMNF+Q
 WyDCB1eupXrMfIhEXpwrW8TF2/2yck+Qb5gVryu+jY7Ylkjc+eqJuM8hSPQAOsxF8yPR
 vuASU15bGwkx4SXXhVrfMLmMRI2jLY0xeIZPIBHqS8kFcSnownX84Ix4mcwO0Lp4Mr9h
 wNYFwAXqDqvoCpadxtw/rcnMMUMkVkkbXcq+7/jy3rZrS/xBEjbs23Wt0ffXBACTZ3j1
 yDOQ==
X-Gm-Message-State: AOJu0Ywmhk8BWMaNxcs0jBd7YOgGpbqQBf/4PyGtgVDxdOZm1hcrtB69
 FH7jGMIdSfE3hnwg1YriSoHOLWma7ORv8UdS5pMBEg==
X-Google-Smtp-Source: AGHT+IFN7AI1NENuMmxhAP/nYKpDV1cmTgA5yGepZUJHGTtlo15LrNPA9HCDSSUXky7fVA5fdWZVtw==
X-Received: by 2002:a17:906:209d:b0:9ba:246c:1fb6 with SMTP id
 29-20020a170906209d00b009ba246c1fb6mr9850495ejq.76.1697106773245; 
 Thu, 12 Oct 2023 03:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:52 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:07 +0200
Message-ID: <20231012103210.2915871-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106773; x=1697711573;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3drO7b1zjoCs7BLpelReJvUW0TCihSkiqv4DQDweo8=;
 b=CcmwOadyxsW/CuOgs2mwvBCyuhvDe9yAnTLnr5ZcFZLMHkhUVHsLWBz3iz6Rl6l2dV
 lDQims3ZgjW58sR7SOaJoSgPrlBRq3HPw+x4E1XDPdrE9/CvUh7eYvw2U+wBkL4fWIIY
 CyJXYyCh7rPTSGlcqQ/1lGF2+TQEmQOj1TN94=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CcmwOady
Subject: [Buildroot] [PATCH 10/12] package/network-manager/selinux: Add
 buildroot network-manager policy
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

This is a basic policy necessary for network-manager to work properly in
enforcing mode without any denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                                   | 1 +
 package/network-manager/selinux/buildroot-network-manager.fc | 0
 package/network-manager/selinux/buildroot-network-manager.if | 1 +
 package/network-manager/selinux/buildroot-network-manager.te | 4 ++++
 4 files changed, 6 insertions(+)
 create mode 100644 package/network-manager/selinux/buildroot-network-manager.fc
 create mode 100644 package/network-manager/selinux/buildroot-network-manager.if
 create mode 100644 package/network-manager/selinux/buildroot-network-manager.te

diff --git a/DEVELOPERS b/DEVELOPERS
index 695738c4a9..05b4be1830 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -40,6 +40,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/network-manager/selinux/
 F:	package/openssh/selinux/
 F:	package/polkit/selinux/
 F:	package/refpolicy/selinux/
diff --git a/package/network-manager/selinux/buildroot-network-manager.fc b/package/network-manager/selinux/buildroot-network-manager.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/network-manager/selinux/buildroot-network-manager.if b/package/network-manager/selinux/buildroot-network-manager.if
new file mode 100644
index 0000000000..2f33fa0b81
--- /dev/null
+++ b/package/network-manager/selinux/buildroot-network-manager.if
@@ -0,0 +1 @@
+## <summary>Buildroot network-manager rules</summary>
diff --git a/package/network-manager/selinux/buildroot-network-manager.te b/package/network-manager/selinux/buildroot-network-manager.te
new file mode 100644
index 0000000000..ce5180494c
--- /dev/null
+++ b/package/network-manager/selinux/buildroot-network-manager.te
@@ -0,0 +1,4 @@
+policy_module(buildroot-network-manager, 1.0.0)
+
+#============= NetworkManager_t ==============
+allow NetworkManager_t tmpfs_t:sock_file write;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
