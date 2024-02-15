Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7259C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D366E60FFC;
	Thu, 15 Feb 2024 19:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2biFwm64lik; Thu, 15 Feb 2024 19:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A81C060FF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A81C060FF1;
	Thu, 15 Feb 2024 19:34:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7061BF3EC
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 19:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4963B41EA0
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 19:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7uiNificVTI for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 19:34:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F135241E9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F135241E9A
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F135241E9A
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 19:34:15 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6e0d085cf59so898857b3a.2
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 11:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708025655; x=1708630455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZuT8ZolkgpixeZpq3WcIXbDqMDxfpKfrtIoAZ004KUg=;
 b=YJWENCuL2PJ7LyxLF8+kwj4GTJVF80DWD3LM6cGJPgYNq4fztp7FwcTdN4OnFP2yjY
 BHR6PyfIJGG+r7ouM6QK+3B0lB9nUnJ5EhiF7oudrlh5reH3nmDa8sYZwSfU8FmpH+ZT
 +siyXyiWX5gi6h78Sn8fSIKqLBRdCHuvVX6SZLpkN9FCR+oS2HZHRzFhzjNhZCHF8qPO
 V5Y620ADSfmTj5SW8DERLRTMhj4d28LBdKyD6K8uUppLrY5GfDqTP4DmhlVWbhqeBLtQ
 bBpRQ4UDRoTYT1CYiE8S934FWttZFZ0ibwNM6gr2FHe3kPG36OYLs+Qm+U6fUKbRTWSH
 TFXg==
X-Gm-Message-State: AOJu0YzjWTLu+GujdOr6xLavTkTPIv82q++G8uTHNNXJWSogHDsknhWH
 L/nKHg1fqvqf5Ot6R//Lvdk2A+pjuEkfFjRFCMapTnbViJ6XhRkZMEJ/pO55L/o=
X-Google-Smtp-Source: AGHT+IGyz0O2yuZhjiRS5/hxbTqxWzc40IvB3DMbgK1yaBZ6mfDQv+cmP1r9WolsC4mt94qIiIeqPw==
X-Received: by 2002:a05:6a00:6814:b0:6e1:158c:3f9a with SMTP id
 hq20-20020a056a00681400b006e1158c3f9amr2505196pfb.3.1708025654764; 
 Thu, 15 Feb 2024 11:34:14 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 t124-20020a628182000000b006e0472fd7d1sm1759995pfd.130.2024.02.15.11.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 11:34:14 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 11:32:06 -0800
Message-Id: <20240215193206.2884119-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708025655; x=1708630455; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuT8ZolkgpixeZpq3WcIXbDqMDxfpKfrtIoAZ004KUg=;
 b=aW9MFaBUT50nI/E03jMKJXTBjzI5MJHIYw3YQ/MU7ww5nqaR0ZJv3sHfMn9j6drjGA
 xmo9jw+VLx7M37ZfJUWwHOkEeXtKv8wpUCFWhseiTLcTXM32v4Ugn14rB/qUAeWi4I62
 F6fmRJdq4n5kf0slF0HpiKHj96a1Ubl00yGdf0PXirCIJA3en9PX0EjL9MZ3uBZ01maY
 1eWPfIBErqIj/mbkWU6vX7kzFpiap7Imkf3j9rFqiLaC8d4vVLnjq2d+14hiRJXDTTAW
 VOZGul6X7gvspdA7eo3xNA3DwkcqrvebNTjlub2hLcCFR+YvQRIJ6DMmXtoaAGx665RI
 Tlsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aW9MFaBU
Subject: [Buildroot] [PATCH 1/1] package/iptables: bump version to 1.8.10
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change Log : https://netfilter.org/projects/iptables/files/changes-iptables-1.8.10.txt

Build test results:
iptables.config
 BR2_PACKAGE_IPTABLES=y
 BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY=y
 BR2_PACKAGE_IPTABLES_NFTABLES=y

$ ./utils/test-pkg -c iptables.config iptables
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/iptables/iptables.hash | 2 +-
 package/iptables/iptables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index a908b9cbc1..be8b0df3d6 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  ef6639a43be8325a4f8ea68123ffac236cb696e8c78501b64e8106afb008c87f  iptables-1.8.9.tar.xz
+sha256  5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c  iptables-1.8.10.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 561c82ca0b..6712136962 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.9
+IPTABLES_VERSION = 1.8.10
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.xz
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
