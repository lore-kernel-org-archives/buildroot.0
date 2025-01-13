Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D01E77188
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 00:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D8A812E5;
	Mon, 13 Jan 2025 00:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-X2V9XuyU8A; Mon, 13 Jan 2025 00:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC873812EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC873812EF;
	Mon, 13 Jan 2025 00:14:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 117D095D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6E1C812E5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81YV2Z9dxoPu for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 00:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07401812F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07401812F5
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07401812F5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 00:14:30 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21649a7bcdcso61243515ad.1
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 16:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736727270; x=1737332070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QuoKbCZTXi04Y1kdrSQcakbzTNpZD8T3u/wsgQ5yZuA=;
 b=fy+QOCaPcB4DFQDAMhWqEkDo5enb6ipeZDlbrSaWMU2cvqu8V2I0ID/hQzGMi6zKih
 Th6tkvak6HdeNisBg7RHhIvW7XrTGHgtRxawtUgnwlK9+NTy95KcibloMWgXSc2JstAO
 NBx8tnw8ONMB97bmaaV1HUUiIxX4cDYDRWEubp5nq3fcrJqFnOPHvqc3ojgzuH23u/Jk
 TcpI95yLdCi8D4IcqfaDvly/TkvLus1cLVw3n3uv1JeghczylKGag6FuD4QQRHF2h6eX
 afkY1rHBA45x7igdDNaPXg38DFvr94FvMX+0r9o/MvCGwnwimR8Ed4vse4wjsV+Ri2b/
 /q+g==
X-Gm-Message-State: AOJu0YzVLjzkRBBAAgJj59llNXdJ8uT4JLHdejLRIZWgTJRBHUBgT0XR
 S0ShsL7LAu/2AcjgYhXZF2c3HWQUma89VPvni8WOHCes3wqWWXZsWHd8Txei
X-Gm-Gg: ASbGncvogse5pXDBe9XzLhPqdG51GEdEfdE12D1+T+EdKtdrOivdovxOimhTGDAoi1S
 2UdE/0Ajm8654bziwgnW+hrGhvsmC1MzIL/vAYAJNTdctjGZHWDnyslGrYplML/LQJ4OfhstkcT
 hzmJcsFDXTkyNEkcpXyoCBCljlnDQ8GJzi1wAfGGYWxO/fADmlqPab1TzIwqkRexwUtJhVw2Pgg
 13dwW3+bAD+3RjMOzOufACgAGlgxNv+ooU8a/fooCW/mIxBTqhntTFECvyR5pu/vapMy81UX3lI
 d//ebmUil8HbItsaXVvxEmWbhSonyjssHjgr3w+Y
X-Google-Smtp-Source: AGHT+IE5DRtKwazkzQ54qE/4yH3kgQiQ1+GFqglN4yzqn7B+WnpYsXXGE1o5sKl6uXUINKpTZWgZew==
X-Received: by 2002:a05:6a00:2e09:b0:726:41e:b310 with SMTP id
 d2e1a72fcca58-72d21f673b9mr25839961b3a.12.1736727269877; 
 Sun, 12 Jan 2025 16:14:29 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d40568dccsm4788925b3a.47.2025.01.12.16.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 16:14:29 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Jan 2025 16:14:26 -0800
Message-Id: <20250113001426.771818-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736727270; x=1737332070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QuoKbCZTXi04Y1kdrSQcakbzTNpZD8T3u/wsgQ5yZuA=;
 b=jcLTY+OjZS7AivaCLZeVrNbLMyJx/Ve4lqmgD/pXp5djeAVNLB1Ep5JjBWrZW1oHsh
 aPCUGDQ4hTb8qLelrHmJhz1Cr2B1sst7sFrV+mdd8GUuBxf51cIohGCzcJZD2nJJXVSR
 onlNXarua0Wi1Wb0z5pWHlsU82gn6xM4ODTBDNWZXKHkz9hXfTc6TQvm1AoQx8G0HxP1
 UYVvsjZhOC7sB+4xn10Ssye8aX72TgM+e82gc9062Hi2ux+7rwISwWpmBgFBT+6aN5Ee
 AuZT3KvJnUJMCoOE9H6heT63d1HNoWtgQ/uWCkWV1Z026s39Xzl7P9rFVgbUmsq7y1EH
 rV+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jcLTY+Oj
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump version to 10.1.0
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
Cc: John Stile <johns@msli.com>, Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update.

Release notes:
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.1.0
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.10
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.9

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/dhcpcd/dhcpcd.hash | 6 +++---
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index d29f49fd28..34f6419bf7 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.8
-sha256  d8dddf9f971a8d9ff828f33d8fa9f6d9a892a4a1429d230e9efb2be97dd0e313  dhcpcd-10.0.8.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.1.0
+sha256  abc307c63853da3199baa5c1e15fd5ede9d68d068b2a59ca14c5a6768e9cc3b7  dhcpcd-10.1.0.tar.xz
 # Locally calculated
-sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
+sha256  224b37cd1ef1365bd2ac9eaec9f32fee94e85dd40f95461ebcb21e758357ac1f  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 48a418d4ad..3a4b0e10d7 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.0.8
+DHCPCD_VERSION = 10.1.0
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
