Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD7BC0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 10:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385C960E65;
	Tue, 25 Jul 2023 10:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385C960E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ie6N-lFADyut; Tue, 25 Jul 2023 10:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE13F60F27;
	Tue, 25 Jul 2023 10:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE13F60F27
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BDED1BF59A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F24581D5A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F24581D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVkH7b6BNk6X for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 10:31:37 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8637F81CBA
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 10:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8637F81CBA
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fd190065a7so44601135e9.2
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 03:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690281095; x=1690885895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fq9+DFbkkx4wdLwz2KTnubvKMkXIFVyLDpSYmya4NsA=;
 b=Y/v2Bfg/Q88BjOCXPOA/3BvoyxElLPDHXKt1gM/VSiwRaKTHaM1MAxZFpq5i1N4sXu
 +BRABcR26FUVOBVsoM4Zg9ueTjTgSo0eCGzRmQ2JZtbRxqwl82Hosa4JJ6A4I8084Hs9
 o7AzzHIkRz2BSKLhDs7B4jhZOPyHnU8UuLyK5gLgznpPa/6xWMUQII//cUWByxRJsATn
 ItXwy+BqmfjJGloCTZ4L8iGNUQjZoe3KnIS7nTZbh1s5o4vmI6HGV50KxGc8mDZEA/+i
 KaoqJRPLlcCUjIZJxD6uHQGmuijAonNveKAczSNi9l55pbAGjr1Plmyh7qGvrZAOrAbm
 fGVA==
X-Gm-Message-State: ABy/qLZaRCUaSGg9g6VsIU22jmonwOrsEduybIaQSRz3GbjQqkYf8fT9
 8cQScvgkduqLdzA3bMSOFDto2H77V5w=
X-Google-Smtp-Source: APBJJlGoiFhIr4IYnt2TXWIQ68TfztVSz6cVHZZ/WZgB8zW6X6Kij0E6RPj9sljRRJ+3lOfny7YOYQ==
X-Received: by 2002:a7b:c459:0:b0:3fd:2e59:b84c with SMTP id
 l25-20020a7bc459000000b003fd2e59b84cmr7064302wmi.37.1690281095393; 
 Tue, 25 Jul 2023 03:31:35 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003fc06169abdsm12889384wmk.2.2023.07.25.03.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:31:35 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 25 Jul 2023 12:31:14 +0200
Message-Id: <20230725103114.941495-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690281095; x=1690885895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fq9+DFbkkx4wdLwz2KTnubvKMkXIFVyLDpSYmya4NsA=;
 b=s39xUeMA7VCX5v/Qnz6r/RDf02V76rrP1l7aKV3YLAtHWC5trkcKyisPZowvMxLPkm
 UCQ+2a64fT8IVWm3RTp/0bvEiaX5f/se6+ltTFAIZbSkdfM+R+2ceyVDjC/RLkb7lrBY
 1Eee0gaUwX75SDftGSoabNxSLqGl9UdujRlZHFmVrCGP+aiWbNT932OBHvwsVoSD3vRe
 y1/pnKrLcCnklomzjN0gzsGVUReDyyqo1vpA1lkFWv+vXsqHHUcdhSW3wVUmgnCiyGZ6
 QsXd8vlNXGBpOryoD5NDH5Dt1wyLkSWdrbvla9uJh34r8cRGTkBd6M3g5Q6gBdasSFGS
 lEaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=s39xUeMA
Subject: [Buildroot] [PATCH] package/libatomic_ops: bump to version 7.8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libatomic_ops/libatomic_ops.hash | 4 ++--
 package/libatomic_ops/libatomic_ops.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 32a0795a5..c6de93fb4 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b4b0072bdb6780e2331db4fadba7e423fde25c71b1f0eb04859cc1eba59c2c2c  libatomic_ops-7.6.14.tar.gz
-sha256  636c2bf07975765ab9aff17f7c9b6beb9540378f45b5a1b21691d14ea804f0ff  doc/LICENSING.txt
+sha256  68c5970b11297056c8e5c63a73f26621a8eb8c667a5fe9a2b3e3ff6c0fbb3177  libatomic_ops-7.8.0.tar.gz
+sha256  969294c9324b2d360ae2a08edd5ca6f9cd754cb71b71e56bee15d2f10bb10496  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 1b34d3b78..0c72b1725 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.6.14
+LIBATOMIC_OPS_VERSION = 7.8.0
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
@@ -15,7 +15,7 @@ LIBATOMIC_OPS_AUTORECONF = YES
 # by the GNU General Public License. These are put into a separate
 # library, libatomic_ops_gpl.a."
 LIBATOMIC_OPS_LICENSE = MIT (main library) / GPL-2.0+ (gpl extension)
-LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
+LIBATOMIC_OPS_LICENSE_FILES = COPYING LICENSE
 LIBATOMIC_OPS_CPE_ID_VENDOR = libatomic_ops_project
 
 LIBATOMIC_OPS_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
