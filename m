Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF57C25B07
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 14:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BBCA8161D;
	Tue,  9 Aug 2022 14:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BBCA8161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwEgbCeqcCMU; Tue,  9 Aug 2022 14:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE4581495;
	Tue,  9 Aug 2022 14:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE4581495
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 269401BF2F2
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 14:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 001524032D
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 14:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001524032D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFOVEfalBrOQ for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 14:31:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B9640178
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6B9640178
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 14:31:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso677249wmq.1
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 07:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=w4anG+ZvoGXeoJGO6eFvmlN4YUA9lAXoCdTkHb4gFzA=;
 b=M61XvkpqpCwLGxj22OjMXr9LvVwn6a384i74uo1B6e0FHWmw8TY0ljVC4/SAu0ySh5
 h90PrSf6hQdpVO/55IHU4ksAsAMhUV/RXZ/SYnZ3N2zMQK3wxZnHK8NxTckyrs00GljF
 hYjVkmS9jJbBSpaAm8iSDW4b1hBRxYu9bX4N9utRj4ToqxxPOpnzxFwBU+lIXDpbhUwU
 JmEpbQgXsRTlOLoC0viA0MN14TXj9MmnlZl5zGHB89IuzRNATBsOFeQCLTpQeGA2V2jp
 DbuBehNjwwNrVEDfBmNF+GT46LrFqYQkXdwI8NqxmV+PY/F9EidmB52WhYGNgfoG71YN
 Mj7w==
X-Gm-Message-State: ACgBeo2Gx/PiSWdqCy7r/XZD0pq4gSEgP0s2nByJjHKrvXrs0DX3F4tV
 ZDfAA5AeVyaR4owSx4FTvbVziCZcaIw=
X-Google-Smtp-Source: AA6agR5K1PtiFSTn7Qa1Ajds0DhMC4qom7LRliiR1YcalLYLSShCwP/DOGzFL8OieXwNoUh5sugKaA==
X-Received: by 2002:a1c:7711:0:b0:3a5:2d3d:8e8a with SMTP id
 t17-20020a1c7711000000b003a52d3d8e8amr10189416wmi.80.1660055501537; 
 Tue, 09 Aug 2022 07:31:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002217aed23b4sm10584938wrw.12.2022.08.09.07.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:31:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 16:31:25 +0200
Message-Id: <20220809143126.1912662-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=w4anG+ZvoGXeoJGO6eFvmlN4YUA9lAXoCdTkHb4gFzA=;
 b=nip2FJMqiSauTW0Mj/YSdUBJ9hgrjdMeQqOhYqDS/LPDQm06wi0uKF7QyYp2boGAWx
 F7qep1NhHalwnUxABH9sJHLbBT4Q2F/dQxNbgcvA6ysc+aEHExWit3c7rPsyeS4f4fuh
 y1jXKf9R9Vj8a3563XOLJBJWK/0yGOByANPBoyixhY+1kdqk7LE6+6Bqfg1/HYtA0qAF
 uFdQH4pvPj4XLf0LQO478T35KO9RHVsHPhlel9yUc0g9oHUcdt1f0BfVzmqy5COxzTDB
 n3uoXeer1wZf9FCa5gN7H8ZgWb+RJEgwl4YA+lGLOLwL0f0DulWfAKpt2K5avAVvzkR2
 a5hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nip2FJMq
Subject: [Buildroot] [PATCH v3, 1/2] package/xenomai: rework custom handling
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop default value of BR2_PACKAGE_XENOMAI_REPOSITORY
- Add BR2_PACKAGE_XENOMAI_{CUSTOM_VERSION_VALUE,REPOSITORY_VERSION} to
  mimick what is done by other packages (e.g. barebox, u-boot)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Don't set default values and rework custom handling

Changes v1 -> v2:
 - Prepend v to version for custom git

 package/xenomai/Config.in | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index ec6d9e5d29..269b85b5ce 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -64,17 +64,29 @@ config BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 
 endchoice
 
+config BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE
+	string "Xenomai version"
+	depends on BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
+
 config BR2_PACKAGE_XENOMAI_REPOSITORY
 	string "URL of custom repository"
-	default "https://gitlab.denx.de/Xenomai/xenomai.git"
 	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 
+config BR2_PACKAGE_XENOMAI_REPOSITORY_VERSION
+	string "Custom repository version"
+	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
+	help
+	  Revision to use in the typical format used by Git, i.e a
+	  SHA1 or a tag.
+
 config BR2_PACKAGE_XENOMAI_VERSION
-	string "Custom Xenomai version" if \
-		!BR2_PACKAGE_XENOMAI_LATEST_VERSION && \
-		!BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+	string
 	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
+	default BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE \
+                if BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
 	default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+	default BR2_PACKAGE_XENOMAI_REPOSITORY_VERSION \
+		if BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 
 config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL
 	string "URL of custom tarball"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
